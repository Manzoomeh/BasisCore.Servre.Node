import LogContext from "./LogContext.js";
import Stopwatch from "../Models/StopWatch.js";
import { CancellationToken, Collection } from "mongodb";
import StringResult from "../Models/StringResult.js";
/**
 * @typedef {Object} Setting
 * @property {string} ParamType
 * @property {string} ParamKey
 * @property {string} ParamValue
 */

 /**
 * Represents a log entry.
 * @typedef {Object} Log
 * @property {string} dateTime 
 * @property {Debug} type 
 * @property {string} message 
 * @property {string} extraData 
 */
export default class DebugContext extends LogContext {
  /**@type {LogContext} */
  owner;
  /**@type {Log[]} */
  logs;
  /**@type {@boolean} */
  completed;
  /**@type {LogContext[]} */
  childCollection;
  /** @type {StringResult[]} */
  tableCollection;
  constructor(title, owner, routingData) {
    super(title, owner);
    this.owner = owner;
    this.logs = [];
    this.completed = false;
    this.steps = [];
    this.childCollection = [];
    this.stopWatch = new Stopwatch();
    this.tableCollection = [];
    this.addDebugInformation(
      "HTTP Request Information",this._convertHttpRequestSettingToArray(routingData)
    );
  }

  newContext(title) {
    return this.owner.newContext(title);
  }
  /**
   * @param {string} title
   * @returns {WaitStep}
   */
  newWait(title) {
    return this.owner.newWait(title);
  }
  /**
   *
   * @param {string} title
   * @returns {DebugStep}
   */
  newStep(title) {
    return this.owner.newStep(title);
  }
  /**
   *
   * @param {string[]} stream
   * @param {CancellationToken} cancellationToken
   */
  async writeAsync(stream, cancellationToken) {
    for (const info of this.infoCollection) {
      await info.writeAsync(stream, cancellationToken);
    }
    for (const child of this.childCollection) {
      await child.writeAsync(stream, cancellationToken);
    }
  }

  complete() {
    this.stopwatch.stop();
    this.completed = true;
  }

  failed() {
    if (this.completed) {
      this.stopwatch.stop();
    }
  }
  /**
   * @param {string} title
   * @param {NodeJS.Dict<string>} info
   * @returns {void}
   */
  addDebugInformation(title, info) {
    const information = Array.isArray(info)
      ? info
      : typeof info == "object"
      ? [info]
      : [{ content: info }];
    return this.tableCollection.push(
      new StringResult(this.#arrayToHtmlTableWithTitle(information,title))
    );
  }
  /**
   * @returns {StringResult[]}
   */
  get debugInfo() {
    return this.tableCollection;
  }
  /**
   * Convert an array of objects into an HTML table with a title row
   * @param {Array<Object>} data
   * @param {string} title
   * @returns {StringResult}
   */
  #arrayToHtmlTableWithTitle(data, title) {
    if (!Array.isArray(data) || data.length === 0) {
      return "";
    }
    const headers = Object.keys(data[0]);
    const headerRow =
      '<tr><th colspan="' + headers.length + '">' + title + "</th></tr>";
    const columnHeadersRow =
      "<tr>" + headers.map((header) => `<th>${header}</th>`).join("") + "</tr>";
    const bodyRows = data
      .map((row) => {
        const cells = headers
          .map((header) => `<td>${row[header]}</td>`)
          .join("");
        return `<tr>${cells}</tr>`;
      })
      .join("");
    const htmlTable = `<table>${headerRow}${columnHeadersRow}${bodyRows}</table>`;
    return new StringResult(htmlTable);
  }
  /**
   * @param {NodeJS.Dict} request
   * @returns {Setting[]}
   */
  _convertHttpRequestSettingToArray(request) {
    /**@type {Setting[]} */
    let resultArray = [];
    for (let ParamType of Object.keys(request)) {
      const innerObject = request[ParamType];
      for (let ParamKey of Object.keys(innerObject)) {
        let ParamValue = innerObject[ParamKey];
        resultArray.push({
          ParamType,
          ParamKey,
          ParamValue,
        });
      }
    }
    return resultArray
  }
  get tables() {
    return this.tableCollection;
  }
}
