using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Toolshed.DataModel;

namespace Toolshed
{
    public class WorkOrderRepository
    {
        public List<WorkOrderModel> GetWorkOrdersForAgent(int AgentID)
        {
            using (MagaziaSculeEntities db = new MagaziaSculeEntities())
            {
                List<WorkOrderModel> workOrders = db.WorkOrder.Where(x => x.idAgent == AgentID && x.Closed == false).ToList().Select(x=>ToWorkOrderModel(x)).ToList();
                return workOrders;                
            }
        }

        public RepositoryResponse<bool> AddServiceFileToWorkOrder(int WorkOrderId, int MachineId, DateTime StartTime, DateTime EndTime, string Comment, List<UsedSpare> spareParts, List<int> OperationsIds)
        {
            return null;
            using (MagaziaSculeEntities db = new MagaziaSculeEntities())
            {
                var WorkOrder = db.WorkOrder.First(x => x.idWorkOrder == WorkOrderId);
                ServiceFile ServiceFile = new ServiceFile();
                ServiceFile.idMachine = MachineId;
                ServiceFile.StartTime = StartTime;
                ServiceFile.EndTime = EndTime;
                ServiceFile.Comment = Comment;
                foreach (var SparePart in spareParts)
                {                     
                    ServiceFile.UsedSpare.Add(SparePart);
                    db.SaveChanges();
                }

                foreach (int OperationId in OperationsIds)
                {
                    ServiceOperation SO = new ServiceOperation();
                    SO.idOperation = OperationId;
                    ServiceFile.ServiceOperation.Add(SO);
                    db.SaveChanges();
                }
                WorkOrder.ServiceFile.Add(ServiceFile);
                db.SaveChanges();
                return new RepositoryResponse<bool>(ResultStatus.OK, "Ok", true);
            }
        }

        public WorkOrderModel ToWorkOrderModel(WorkOrder wo)
        {
            WorkOrderModel woModel = new WorkOrderModel();
            woModel.idWorkOrder = wo.idWorkOrder;
            woModel.idAgent = wo.idAgent.GetValueOrDefault(0);
            woModel.idCustomerAdress = wo.idCustomerAdress.GetValueOrDefault(0);
            woModel.StartTime = wo.StartTime;
            woModel.EndTime = wo.EndTime;
            woModel.Approved = wo.Approved;
            woModel.Sent = wo.Sent;
            woModel.Rating = wo.Rating.GetValueOrDefault(0);
            woModel.Closed = wo.Closed;
            woModel.ServiceFiles = new List<ServiceFile>();
            return woModel;
        }
    }
}
