﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using BusinessObject;

namespace DataAccess
{
    public class ViewRequisitionListDA
    {
        LogicUniversityEntities context = new LogicUniversityEntities();
        public List<ViewRequsitionListBO> FindAllRequisition(UserBO ubo)
        {
            //q1 select the department head's department name
            //the user id need to be changed into the current user id
            var department = from x in context.Users where x.UserID == ubo.UserID select x.Department;
            string s = department.ToString();
            DepartmentBO dbo = ubo.DepartmentID;

            var q2 = (from r in context.Requisitions
                      where
                        r.User.DepartmentID == dbo.DepartmentID &&
                        r.Status == "Pending"
                      select new
                      {
                          RID = r.RequisitionID,
                          date = r.Date,
                          name = r.User.Name,
                          status = r.Status
                      }).ToList();
            List<ViewRequsitionListBO> rlist = new List<ViewRequsitionListBO>();
            foreach(var data in q2)
            {
                ViewRequsitionListBO rbo = new ViewRequsitionListBO();
                rbo.RequsitionId = data.RID;
                rbo.Date = data.date.ToString();
                rbo.Name = data.name;
                rbo.Status = data.status;
                rlist.Add(rbo);
            }
            return rlist;
        }

        public List<ViewRequsitionListBO> FindDisbursementlist()
        {
            //q1 select the department head's department name
            //the user id need to be changed into the current user id
            

            var q2 = (from r in context.Requisitions
                      select new
                      {
                          RID = r.RequisitionID,
                          date = r.Date,
                          name = r.User.Name,
                          status = r.Status
                      }).ToList();
            List<ViewRequsitionListBO> rlist = new List<ViewRequsitionListBO>();
            foreach (var data in q2)
            {
                ViewRequsitionListBO rbo = new ViewRequsitionListBO();
                rbo.RequsitionId = data.RID;
                rbo.Date = data.date.ToString();
                rbo.Name = data.name;
                rbo.Status = data.status;
                rlist.Add(rbo);
            }
            return rlist;
        }
    }
}
