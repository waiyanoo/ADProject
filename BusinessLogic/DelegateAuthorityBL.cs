using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using BusinessObject;
using DataAccess;

namespace BusinessLogic
{
    public class DelegateAuthorityBL
    {
        //instantiate data access object
        DelegateAuthorityDA dada = new DelegateAuthorityDA();

        public DepartmentBO getDepartmentByUserID(String userID)
        {
            return dada.getDepartmentByUserID(userID);
        }

        public UserBO getDeptHead(DepartmentBO dBO)
        {
            return dada.getDeptHead(dBO);
        }

        //returns the employee (including Department Head) who currently has the authority to approve requisitions
        public UserBO getCurrentAuthority(DepartmentBO dBO)
        {
            //default authorised person is Department Head
            UserBO currentAuthority = dada.getDeptHead(dBO);

            List<UserBO> uList = dada.getDeptEmployeeList(dBO);

            foreach(UserBO uBO in uList)
            {
                if(uBO.Enddate != null && uBO.Enddate != default(DateTime))
                {
                    //today is before the employee end date; end date is the day until when he has authority
                    if(DateTime.Compare(DateTime.Today, (DateTime)uBO.Enddate) <= 0)
                    {
                        if (uBO.Startdate != null && uBO.Startdate != default(DateTime))
                        {
                            //today is after the employee start date; start date is the day from when he has authority
                            if (DateTime.Compare(DateTime.Today, (DateTime)uBO.Startdate) >= 0)
                            {
                                //authorised person that is NOT Department Head is found
                                currentAuthority = uBO;
                                break;
                            }
                        }
                    }
                }
            }
            return currentAuthority;
         }

        //returns the employee (Department Head possible) who is going to be the next authorised person to approve  
        //requisitions after the current authorised person
        public UserBO getFutureAuthority(DepartmentBO dBO)
        {
            UserBO currentAuthority = getCurrentAuthority(dBO);
            DateTime nextStartDate = currentAuthority.Enddate.AddDays(1);
            
            List<UserBO> uList = dada.getDeptEmployeeList(dBO);

            //if futureAuthority exists, he must have startDate = the day after the currentAuthority's endDate
            //if currentAuthority = deptHead & his endDate set to default(DateTime) aka infinity, no futureAuthority will be found
            UserBO futureAuthority = uList.Where(x => x.Startdate == nextStartDate).FirstOrDefault();

            return futureAuthority; //if no futureAuthority, return value will be null
        }

        //filter out manager from the list of department employees, before passing on list
        public List<UserBO> getDeptEmployeeXHeadList(DepartmentBO dBO)
        {
            List<UserBO> uList = dada.getDeptEmployeeList(dBO);
            UserBO head = null;
            foreach (UserBO uBO in uList)
            {
                if(uBO.RoleName.RoleName == "Department Head")
                {
                    head = uBO;
                }
            }
            if (head != null)
            {
                uList.Remove(head);
            }
            return uList;
        }

        //btncanceldelegation_Click will call this method. 
        //clears all delegated employees other than department head; sets currentAuthority to deptHead
        public int cancelDelegation(DepartmentBO dBO)
        {
            int writeResult = 0;
            UserBO currentAuthority = getCurrentAuthority(dBO);
            UserBO futureAuthority = getFutureAuthority(dBO);
            UserBO deptHead = dada.getDeptHead(dBO);

            //3 possible scenarios here
            if (currentAuthority.UserID != deptHead.UserID) //scenario 1: currentAuthority = staff & futureAuthority = deptHead
            {
                currentAuthority.Startdate = default(DateTime);
                currentAuthority.Enddate = default(DateTime);
                deptHead.Startdate = DateTime.Today;
                deptHead.Enddate = default(DateTime);
                writeResult = dada.setStartEndDates(currentAuthority, deptHead);
            }
            else if(futureAuthority != null) //scenario 2: currentAuthority = deptHead & futureAuthority = staff
            {
                deptHead.Enddate = default(DateTime);
                futureAuthority.Startdate = default(DateTime);
                futureAuthority.Enddate = default(DateTime);
                writeResult = dada.setStartEndDates(deptHead, futureAuthority);
            }
            else //scenario 3: currentAuthority = deptHead & futureAuthority = nobody
            {
                throw new NoFutureAuthorityException();
            }

            return writeResult;
        }

        //Delegates requisition approval authority for that department to an employee who becomes futureAuthority
        //pre-condition (1) for this method: the currentAuthority must be Department Head
        //pre-condition (2) for this method: there must be currently no futureAuthority; DeptHead must cancel current delegation before assigning new futureAuthority
        public int delegateAuthority(DepartmentBO dBO, UserBO futureAuthority)
        {
            int writeResult = 0;
            UserBO currentAuthority = getCurrentAuthority(dBO);
            UserBO deptHead = dada.getDeptHead(dBO);

            //checks pre-condition (1): if currentAuthority is not DepartmentHead, will exit method
            if (currentAuthority.UserID != deptHead.UserID)
            {
                throw new DeptHeadNotCurrentAuthorityException();
            }
            //checks pre-condition (2): if futureAuthority already exists, will exit method
            if (getFutureAuthority(dBO) != null)
            {
                throw new FutureAuthorityAlreadyExistException();
            }

            //Sets the currentAuthority (deptHead) Enddate to 1 day before futureAuthority Startdate
            //Sets the currentAuthority Startdate to 1 day after futureAuthority Enddate
            //Note: deptHead's Enddate is always before Startdate 
            currentAuthority.Enddate = futureAuthority.Startdate.AddDays(-1);
            currentAuthority.Startdate = futureAuthority.Enddate.AddDays(1);
            writeResult = dada.setStartEndDates(currentAuthority, futureAuthority);

            return writeResult;
        }

    }

    public class DeptHeadNotCurrentAuthorityException : ApplicationException
    {
        public DeptHeadNotCurrentAuthorityException() : base()
        {

        }
        public DeptHeadNotCurrentAuthorityException(string msg) : base(msg)
        {

        }
    }

    public class NoFutureAuthorityException : ApplicationException
    {
        public NoFutureAuthorityException() : base()
        {

        }
        public NoFutureAuthorityException(string msg) : base(msg)
        {

        }
    }

    public class FutureAuthorityAlreadyExistException : ApplicationException
    {
        public FutureAuthorityAlreadyExistException() : base()
        {

        }
        public FutureAuthorityAlreadyExistException(string msg) : base(msg)
        {

        }
    }
}
