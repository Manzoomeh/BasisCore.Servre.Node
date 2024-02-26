import http from "http";
import busboy from "busboy";
import { StatusCodes } from "http-status-codes";
import HttpHostEndPoint from "./HttpHostEndPoint.js";
import { HostService } from "../services/hostServices.js";
import BinaryContent from "../fileStreamer/Models/BinaryContent.js";

export default class NonSecureHttpHostEndPoint extends HttpHostEndPoint {
  /** @type {HostService} */
  #service;

  /**
   *
   * @param {string} ip
   * @param {number} port
   * @param {HostService} service
   */
  constructor(ip, port, service) {
    super(ip, port);
    this.#service = service;
  }

  _createServer() {
    return http.createServer(async (req, res) => {
      try {
        /** @type {Request} */
        let cms = null;
        this._handleContentTypes(req, res, async () => {
          const createCmsAndCreateResponseAsync = async () => {
            console.log(req.json)
            cms = await this._createCmsObjectAsync(
              req.url,
              req.method,
              req.headers,
              req.formFields,
              req.jsonHeaders,
              req.socket,
              req.json
            );
            const result = await this.#service.processAsync(
              cms,
              req.fileContents
            );
            const [code, headers, body] = await result.getResultAsync();
            res.writeHead(code, headers);
            res.end(body);
          };
          await createCmsAndCreateResponseAsync();
        });
      } catch (ex) {
        console.error(ex);
        res.writeHead(StatusCodes.INTERNAL_SERVER_ERROR);
        res.end(ex.toString());
      }
    });
  }
}
