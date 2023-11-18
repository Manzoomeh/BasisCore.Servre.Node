import GroupCommand from "../../renderEngine/Command/Collection/GroupCommand.js";
import CommandBase from "../../renderEngine/Command/CommandBase.js";
import PrintCommand from "../../renderEngine/Command/PrintCommand.js";
import DbSource from "../../renderEngine/Command/Source/DbSource.js";
import InlineSourceCommand from "../../renderEngine/Command/Source/InlineSourceCommand.js";
import TreeCommand from "../../renderEngine/Command/TreeCommand.js";
import ViewCommand from "../../renderEngine/Command/ViewCommand.js";

export default class CommandUtil {
  /**
   * @param {Object} commandIl
   * @returns {CommandBase}
   */
  static createCommand(commandIl) {
    //TODO:must be better with dic of ctor
    /** @type {CommandBase?} */
    let retVal = null;
    switch (commandIl.$type) {
      case "print": {
        retVal = new PrintCommand(commandIl);
        break;
      }
      case "group": {
        retVal = new GroupCommand(commandIl);
        break;
      }
      case "dbsource": {
        retVal = new DbSource(commandIl);
        break;
      }
      case "inlinesource": {
        retVal = new InlineSourceCommand(commandIl);
        break;
      }
      case "tree": {
        retVal = new TreeCommand(commandIl);
        break;
      }
      case "view": {
        retVal = new ViewCommand(commandIl);
        break;
      }
      case "list": {
        retVal = new ViewCommand(commandIl);
        break;
      }
    }
    return retVal;
  }
}