import HostService from "./hostService.js";
import Request from "../Models/request.js";
import Response from "../Models/Response.js";
import sql from "mssql";

export default class SqlProxyHostService extends HostService {
  /** @type {string} */
  #connectionString;
  /**
   * @param {string} name
   * @param {string} connectionString
   * @param {HostServiceOptions} options
   */
  constructor(name, connectionString, options) {
    super(name, options);
    this.#connectionString = connectionString;
  }

  /**
   * @param {Request} request
   * @returns {sql.Table}
   */
  _convertToTable(request) {
    const retVal = new sql.Table();

    retVal.columns.add("ParamType", sql.VarChar(50));
    retVal.columns.add("ParamName", sql.VarChar(100));
    retVal.columns.add("ParamValue", sql.VarChar);

    for (const type in request) {
      const group = request[type];
      for (const name in group) {
        if (name === "query") {
          const query = group[name];
          for (const key in query) {
            retVal.rows.add(name, key, query[key].toString());
          }
        } else {
          retVal.rows.add(type, name, group[name].toString());
        }
      }
    }
    return retVal;
  }

  /**
   * @param {Request} request
   * @param {BinaryContent[]} fileContents
   * @returns {Promise<Response>}
   */
  async processAsync(request, fileContents) {
    try {
      await this._processUploadAsync(fileContents, request);
      const params = this._convertToTable(request);
      const pool = await sql.connect(this.#connectionString);
      const data = await pool
        .request()
        .input("params", params)
        .execute("[dbo].[cms]");
      const closeTask = pool.close();
      const result = {};
      data.recordset.forEach((row) => {
        if (!result[row.ParamType]) {
          result[row.ParamType] = {};
        }
        result[row.ParamType][row.ParamName] = row.ParamValue;
      });
      await closeTask;
      return this._createResponse({
        cms: result,
      });
    } catch (er) {
      console.error(er);
      throw er;
    }
  }
}
