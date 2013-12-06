using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.UI;
using System.Web.UI.WebControls;
using Toolshed;
using Toolshed.DataModel;

namespace ToolshedWebServices
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (Request["type"] == "getworkordersforagent")
            {
                WorkOrderRepository repo = new WorkOrderRepository();
                List<WorkOrderModel> WorkOrders = repo.GetWorkOrdersForAgent(3);
                Response.Clear();
                var resp = new JavaScriptSerializer().Serialize(WorkOrders);
                Response.ContentType = "application/json; charset=utf-8";
                Response.Write(resp);
                Response.End();
            }

            if (Request["type"] == "completeworkorder")
            {
                WorkOrderRepository WORepo = new WorkOrderRepository();
                List<UsedSpare> spareParts = new List<UsedSpare>();
                UsedSpare sp1 = new UsedSpare { idSparePart = 2, Quantity = 30 };
                UsedSpare sp2 = new UsedSpare { idSparePart = 3, Quantity = 60 };
                spareParts.Add(sp1);
                spareParts.Add(sp2);
                List<int> operationsIds = new List<int>();
                operationsIds.Add(1);
                operationsIds.Add(2);
                operationsIds.Add(3);
                WORepo.AddServiceFileToWorkOrder(8, 3, DateTime.Now, DateTime.Now, "aaaa", spareParts, operationsIds);
            }
        }



    }
}