import CancellationToken from "../../../renderEngine/Cancellation/CancellationToken.js";
import ContextBase from "../../../renderEngine/Context/ContextBase.js";
import ChartCommand from "../../../renderEngine/Command/Chart/ChartCommand.js";
import InlineSourceCommand from "../../../renderEngine/Command/Source/InlineSourceCommand.js";
import VoidContext from "../../../renderEngine/Context/VoidContext.js";

const context = new ContextBase(null, null, new VoidContext());
context.cancellation = new CancellationToken();

const il = {
  $type: "inlinesource",
  core: "inlinesource",
  name: "chart",
  Members: [
    {
      name: "data",
      preview: "true",
      content: `<row column="january"  y="3" /> 
        <row column="february"  y="1"  />
        <row column="march"  y="8"  />
        <row column="april"  y="6" />
        <row column="may"  y="7"  />
       <row column="june"  y="4" />`,
    },
  ],
};
const chartIl = {
  $type: "chart",
  core: "chart",
  "data-member-name": "chart.data",
  "layout-content": "<div>@child</div >",
  chartType: "bar",
  style_height: '800',
  group: "column",
  y: "y", grid: 'true', axisLabel: 'true',
  chartTitle: "chart title",
  chartStyle: {
    backgroundColor: "#ffffff",
    width: 800,
    height: 400,
    marginY: 40,
    marginX: 40,
    textColor: "blue",
  },
  hover: 'true',
};
const db = new InlineSourceCommand(il);
await db.executeAsync(context);
const chart = new ChartCommand(chartIl);
console.log(await chart.executeAsync(context));
