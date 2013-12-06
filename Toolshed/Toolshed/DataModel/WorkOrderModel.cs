using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Toolshed.DataModel
{
    [Serializable]
    public class WorkOrderModel
    {
        public int idWorkOrder { get; set; }
        public int idAgent { get; set; }
        public int idCustomerAdress { get; set; }
        public DateTime? StartTime { get; set; }
        public DateTime? EndTime { get; set; }
        public bool Approved { get; set; }
        public bool Sent { get; set; }
        public int Rating { get; set; }
        public bool Closed { get; set; }
        public List<ServiceFile> ServiceFiles {get;set;}
    }
}
