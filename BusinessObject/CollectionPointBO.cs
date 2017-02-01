using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
//Created by Ei Yadanar Kyaw
namespace BusinessObject
{
    public class CollectionPointBO
    {
        private string collectionPointName;
        private UserBO userID;

        public CollectionPointBO()
        {

        }
        public CollectionPointBO(string collectionPointName, UserBO userID)
        {
            this.collectionPointName = collectionPointName;
            this.userID = userID;
        }

        public string CollectionPointName
        {
            get
            {
                return collectionPointName;
            }

            set
            {
                collectionPointName = value;
            }
        }

        public UserBO UserID
        {
            get
            {
                return userID;
            }

            set
            {
                userID = value;
            }
        }
    }
}
