using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using BusinessObject;
using DataAccess;

namespace BusinessLogic
{
    public class UpdateRequisitionBL
    {
        //instantiate DataAccess object
        UpdateRequisitionDA urda = new UpdateRequisitionDA();
        
        //just passing along instructions to data layer
        public List<RequisitionItemBO> getRequisitionItemList(String requisitionID)
        {
            List<RequisitionItemBO> riList = urda.getRequisitionItemList(requisitionID);
            return riList;
        }

        //just passing along instructions to data layer
        public DepartmentBO getDepartment(String requisitionID)
        {
            DepartmentBO dBO = urda.getDepartment(requisitionID);
            return dBO;
        }

        //just passing along instructions to data layer
        public UserBO getEmployee(String requisitionID)
        {
            UserBO uBO = urda.getEmployee(requisitionID);
            return uBO;
        }

        //just passing along instructions to data layer
        public List<CategoryBO> getCategoryList()
        {
            List<CategoryBO> cList = urda.getCategoryList();
            return cList;
        }

        //just passing along instructions to data layer
        public List<ItemBO> getItemList(CategoryBO cBO)
        {
            List<ItemBO> iList = urda.getItemList(cBO);
            return iList;
        }

        //just passing along instructions to data layer
        public int addRequisitionItem(String requisitionID, String itemID, int requiredQty)
        {
            return urda.addRequisitionItem(requisitionID, itemID, requiredQty);
        }

        //just passing along instructions to data layer
        public int deleteRequisitionItem(String requisitionID, String itemID)
        {
            return urda.deleteRequisitionItem(requisitionID, itemID);
        }

        //just passing along instructions to data layer
        public bool updateRequisitionItems(List<RequisitionItemBO> riList)
        {
            return urda.updateRequisitionItems(riList);
        }

    }
}
