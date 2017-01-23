using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using BusinessObject;

namespace DataAccess
{
    public class UpdateRequisitionDA
    {
        //retrieves the department of the employee who raised the requisition with the parameter requisitionID
        public DepartmentBO getDepartment(String requisitionID)
        {
            DepartmentBO dBO = new DepartmentBO();
            using (LogicUniversityEntities context = new LogicUniversityEntities())
            {
                Requisition requisition = context.Requisitions.Where(x => x.RequisitionID == requisitionID).FirstOrDefault();
                Department department = requisition.User.Department;

                dBO.DepartmentName = department.DepartmentName;
            }
            return dBO;
        }

        //retrieves the employee who raised the requisition with the parameter requisitionID
        public UserBO getEmployee(String requisitionID)
        {
            UserBO uBO = new UserBO();
            using (LogicUniversityEntities context = new LogicUniversityEntities())
            {
                Requisition requisition = context.Requisitions.Where(x => x.RequisitionID == requisitionID).FirstOrDefault();
                User user = requisition.User;

                uBO.Name = user.Name;
            }
            return uBO;
        }

        //retrieves list of stationery categories
        public List<CategoryBO> getCategoryList()
        {
            List<CategoryBO> cList = new List<CategoryBO>();
            cList.Add(new CategoryBO(null));
            using (LogicUniversityEntities context = new LogicUniversityEntities())
            {
                List<Category> catList = context.Categories.ToList();
                foreach (Category c in catList)
                {
                    CategoryBO cBO = new CategoryBO();
                    cBO.CategoryName = c.CategoryName;
                    cList.Add(cBO);
                }
            }
            return cList;
        }

        //retrieves list of stationery items for the selected category
        public List<ItemBO> getItemList(CategoryBO cBO)
        {
            List<ItemBO> iList = new List<ItemBO>();
            iList.Add(new ItemBO());
            using (LogicUniversityEntities context = new LogicUniversityEntities())
            {
                List<Item> lst = context.Items.Where(x => x.Category.CategoryName == cBO.CategoryName).ToList();
                foreach (Item item in lst)
                {
                    //instantiate ItemBO object using values in entity Item object
                    String itemID = item.ItemID;
                    String description = item.Description;
                    int reorderLevel = (item.ReorderLevel == null) ? 0 : (int)item.ReorderLevel; //database column can be null
                    int reorderQty = (item.ReorderQty == null) ? 0 : (int)item.ReorderQty;
                    String unitOfMeasure = item.UnitOfMeasure;
                    int currentQty = (item.CurrentQty == null) ? 0 : (int)item.CurrentQty;
                    float price = (item.Price == null) ? 0 : (int)item.Price;
                    string bin = item.Bin;
                    CategoryBO categoryName = new CategoryBO(cBO.CategoryName);
                    ItemBO iBO = new ItemBO(itemID, description, reorderLevel, reorderQty, unitOfMeasure, currentQty, price, bin, categoryName);

                    iList.Add(iBO);
                }
            }
            return iList;
        }

        //adds one new RequisitionItem object into the context RequisitionItems collection
        public int addRequisitionItem(String requisitionID, String itemID, int requiredQty)
        {
            int createResult;
            using (LogicUniversityEntities context = new LogicUniversityEntities())
            {
                Requisition req = context.Requisitions.Where(x => x.RequisitionID == requisitionID).FirstOrDefault();
                Item item = context.Items.Where(x => x.ItemID == itemID).FirstOrDefault();

                RequisitionItem ri = new RequisitionItem();
                ri.RequisitionID = requisitionID;
                ri.Requisition = req;
                ri.ItemID = itemID;
                ri.Item = item;
                ri.RequiredQty = requiredQty;
                ri.FulfilledQty = 0;
                ri.FulfilledStatus = "UnFulfilled";
                ri.AllocatedQty = 0;

                context.RequisitionItems.Add(ri);
                createResult = context.SaveChanges();
            }
            return createResult;
        }

        //deletes one RequisitionItem object from context RequisitionItems collection
        public int deleteRequisitionItem(String requisitionID, String itemID)
        {
            int deleteResult = 0;
            using (LogicUniversityEntities context = new LogicUniversityEntities())
            {

                RequisitionItem ri = context.RequisitionItems.Where(x => x.RequisitionID == requisitionID && x.ItemID == itemID).FirstOrDefault();
                if (ri != null)
                {
                    context.RequisitionItems.Remove(ri);
                    deleteResult = context.SaveChanges();
                }
            }
            return deleteResult;
        }

        //finds each RequisitionItem object corressponding to each object in the passed-in list
        //updates their RequiredQty to the list object value
        public bool updateRequisitionItems(List<RequisitionItemBO> riList)
        {
            bool updateResult = false;
            using (LogicUniversityEntities context = new LogicUniversityEntities())
            {
                foreach(RequisitionItemBO riBO in riList)
                {
                    RequisitionItem ri = context.RequisitionItems.Where(x => x.RequisitionID == riBO.RequisitionID.RequisitionID && x.ItemID == riBO.ItemID.ItemID).FirstOrDefault();
                    if(ri != null)
                    {
                        ri.RequiredQty = riBO.RequiredQty;
                        context.SaveChanges();
                        updateResult = true;
                    }
                }
            }
                return updateResult;
        }

        //retrieves list of requisitionItems from database
        public List<RequisitionItemBO> getRequisitionItemList(String requisitionID)
        {
            List<RequisitionItemBO> riList = new List<RequisitionItemBO>();

            using (LogicUniversityEntities context = new LogicUniversityEntities())
            {
                //retrieve all objects from RequisitionItems which have the parameter requisitionID
                List<RequisitionItem> requisitionItemList = context.RequisitionItems.Where(x => x.RequisitionID == requisitionID).ToList();

                //loads a list of business objects to pass on to business layer
                foreach (RequisitionItem r in requisitionItemList)
                {
                    RequisitionItemBO riBO = new RequisitionItemBO();

                    RequisitionBO rBO = new RequisitionBO(); //attribute is object type
                    rBO.RequisitionID = r.RequisitionID;
                    riBO.RequisitionID = rBO;

                    ItemBO iBO = new ItemBO(); //attribute is object type
                    iBO.ItemID = r.Item.ItemID;
                    iBO.Description = r.Item.Description;
                    riBO.ItemID = iBO;

                    riBO.RequiredQty = (r.RequiredQty == null) ? 0 : (int)r.RequiredQty; //database column nullable

                    riList.Add(riBO);
                }
            }
            return riList;
        }


    }
}
