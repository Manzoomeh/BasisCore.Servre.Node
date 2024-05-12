import CancellationToken from "../renderEngine/Cancellation/CancellationToken.js";
import RequestContext from "../renderEngine/Context/RequestContext.js";
import CommandUtil from "../test/command/CommandUtil.js";
import IRoutingRequest from "./IRoutingRequest.js";
import ServiceSettings from "./ServiceSettings.js";
import RequestBaseResponse from "./requestBaseResponse.js";
import RequestDebugContext from "./../renderEngine/Context/RequestDebugContext.js";
import RequestDebugMaxContext from "../renderEngine/Context/requestDebugMaxContext.js";
import DebugContext from "../renderEngine/Context/DebugContext.js";
import VoidContext from "../renderEngine/Context/VoidContext.js";

export default class Index1Response extends RequestBaseResponse {
  /**
   * @param {IRoutingRequest} request
   * @param {ServiceSettings} settings
   */
  constructor(request, settings) {
    super(request, settings);
  }

  /**
   *  @returns {Promise<[number,NodeJS.Dict<number | string | string[]>,*]>}
   */
  async getResultAsync(routingDataStep) {
    try {
      /**@type {DebugContext} */
      const requestDebugContext =
        this._request.query?.debug == "true" ||
        this._request.query?.debug == "1"
          ? new RequestDebugContext(
              "logs for request",
              this._request.request["request-id"],
              routingDataStep,
              this._request
            )
          : this._request.query?.debug == "2"
          ? new RequestDebugMaxContext(
              "logs for request",
              this._request.request["request-id"],
              routingDataStep,
              this._settings,
              this._request
            )
          : new VoidContext("nothing");
      //getIl
      const getIlStep = requestDebugContext.newStep("Get IL");
      let commandIl;
      let command;
      try {
        if (!this._request.cms.page_il) {
          //Update IL step
        }
        if (this._request.cms.il_call) {
          //Update IL step
        }

        const deserializeJsonStep = requestDebugContext.newStep(
          "De-serialize Command(s)"
        );
        try {
          commandIl = JSON.parse(this._request.cms.page_il);
          deserializeJsonStep.complete();
        } catch (error) {
          console.log(error);
          deserializeJsonStep.failed();
        }
        command = CommandUtil.createCommand(commandIl);
        getIlStep.complete();
      } catch (error) {
        console.log(error);
        getIlStep.failed();
      }
      requestDebugContext.addDebugInformation("");
      const context = new RequestContext(
        this._settings,
        this._request,
        requestDebugContext
      );
      context.cancellation = new CancellationToken();
      const result = await command.executeAsync(context);
      const renderResultList = [];
      await result.writeAsync(renderResultList, context.cancellation);
      await context.debugContext.writeAsync(
        renderResultList,
        context.cancellation
      );
      if (context.debugContext.tableCollection) {
       const tablesPromises = context.debugContext.tableCollection.map(async (table) => {
          table.writeAsync(renderResultList,context.cancellation);
        });
        await Promise.all(tablesPromises)
      }
      return [
        parseInt(this._request.webserver.headercode.split(" ")[0]),
        {
          ...{ "content-type": this._request.webserver.mime },
          ...(this._request.webserver.gzip === "true" && {
            "Content-Encoding": "gzip",
          }),
          ...this._request.http,
          ...(context._cookies &&
            Object.fromEntries(
              context._cookies.map((x) => x.toHttpHeaderField())
            )),
        },
        renderResultList.join(""),
      ];
    } catch (ex) {
      console.error(ex);
    }
  }
}
