import HostService from "./hostService.js";
import Request from "./../Models/request.js";
import Response from "./../Models/Response.js";
import RouterOptions from "./routerOptions.js";
import { ServiceSelectorPredicateOptions } from "../Models/model.js";

export default class RouterHostService extends HostService {
  /** @type {RouterOptions[]} */
  #routes;
  /**
   * @param {string} name
   * @param {ServiceSelectorPredicateOptions} options
   * @param {HostService[]} services
   */
  constructor(name, options, services) {
    super(name);
    this.#routes = [];
    options.Items.forEach((option) => {
      const service = services.find((x) => x.name == option.Service);
      if (service) {
        this.#routes.push(new RouterOptions(service, option));
      } else {
        console.log(`host service '${option.service}' not found!`);
      }
    });
  }

  /**
   * @param {Request} request
   * @param {BinaryContent[]} fileContents
   * @returns {Promise<Response>}
   */
  async processAsync(request, fileContents) {
    for (const route of this.#routes) {
      if (route.isMatch(request)) {
        return await route.service.processAsync(request, fileContents);
      }
    }
    throw new Error("Not suitable service found!");
  }
}
