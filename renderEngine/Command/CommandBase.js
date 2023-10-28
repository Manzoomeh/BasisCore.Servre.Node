import ICommandResult from "../Models/ICommandResult.js";
import IContext from "../Context/IContext.js";
import IToken from "../Token/IToken.js";
import ExceptionResult from "../Models/ExceptionResult.js";
import RunTypes from "../Enums/RunTypes.js";
import VoidResult from "../Models/VoidResult.js";
import TokenUtil from "../Token/TokenUtil.js";
import CommandElement from "./CommandElement.js";
import ElementBase from "./ElementBase.js";

export default class CommandBase {
  /**@type {string} */
  core;
  /**@type {IToken} */
  name;
  /**@type {IToken} */
  if;
  /**@type {IToken} */
  runType;
  /**@type {IToken} */
  renderTo;
  /**@type {IToken} */
  renderType;
  /** @type {NodeJS.Dict<IToken>} */
  extraAttributes;

  /**
   * @param {object} commandIL
   */
  constructor(commandIL) {
    this.core = TokenUtil.getFiled(commandIL, "core");
    this.name = TokenUtil.getFiled(commandIL, "name");
    this.if = TokenUtil.getFiled(commandIL, "if");
    this.runType = TokenUtil.getFiled(commandIL, "runType");
    this.renderType = TokenUtil.getFiled(commandIL, "renderType");
    this.renderTo = TokenUtil.getFiled(commandIL, "renderTo");
    //TODO:Fill extra attribute
    this.extraAttributes = null;
    /**@type {NodeJS.Dict?} */
    const items = commandIL["extra-attribute"];
    if (items) {
      this.extraAttributes = {};
      Object.entries(items).map(
        (pair) =>
          (this.extraAttributes[pair[0]] = pair[1]
            ? TokenUtil.ToToken(pair[1])
            : ValueToken.Null)
      );
    }
  }

  /**
   * @param {IContext} context
   * @returns {Promise<ICommandResult>}
   */
  async executeAsync(context) {
    /** @type {ICommandResult?} */
    let retVal = null;
    try {
      const runType = await this._getRunTypeValueAsync(context);
      switch (runType) {
        case RunTypes.AtServer: {
          const ifValue = await this._getIfValueAsync(context);
          if (ifValue) {
            //TODO: create scope
            retVal = await this._executeCommandAsync(context);
          } else {
            retVal = VoidResult.result;
          }
          break;
        }
        case RunTypes.AtClient:
        case RunTypes.None: {
          break;
        }
        default: {
          retVal = VoidResult.result;
          break;
        }
      }
    } catch (ex) {
      console.error(ex);
      retVal = new ExceptionResult(ex, context);
      //TODO: log error
    }
    return retVal;
  }

  /**
   *
   * @param {IContext} context
   * @returns {Promise<RunTypes>}
   */
  async _getRunTypeValueAsync(context) {
    return (await this.runType.getValueAsync(context)) ?? RunTypes.AtServer;
  }

  /**
   *
   * @param {IContext} context
   * @returns {Promise<Boolean>}
   */
  async _getIfValueAsync(context) {
    let retVal = false;
    try {
      const value = await this.if.getValueAsync(context);
      if (value) {
        retVal = eval(value);
      } else {
        retVal = true;
      }
    } catch {}
    return retVal;
  }

  /**
   *
   * @param {IContext} context
   * @returns {Promise<ICommandResult>}
   */
  async _executeCommandAsync(context) {
    return Promise.resolve(
      new ExceptionResult(
        new Error("executeCommandAsync not implemented"),
        context
      )
    );
  }

  /**
   *
   * @param {IContext} context
   * @returns {Promise<CommandElement>}
   */
  async createHtmlElementAsync(context) {
    const retVal = new CommandElement("basis");
    await Promise.all([
      retVal.addAttributeIfExistAsync("core", this.core, context),
      retVal.addAttributeIfExistAsync("name", this.name, context),
      retVal.addAttributeIfExistAsync("if", this.if, context),
      retVal.addAttributeIfExistAsync("renderto", this.renderTo, context),
      retVal.addAttributeIfExistAsync("rendertype", this.renderType, context),
    ]);
    if (this.runType) {
      const runType = await this._getRunTypeValueAsync(context);
      if (runType != RunTypes.None) {
        retVal.addAttributeIfExistAsync("run", runType);
      }
    }

    return retVal;
  }
}