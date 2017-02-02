//Created by Ei Yadanar Kyaw

using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BusinessObject
{
    public class CollectionPointBO
    {
        //Declaring variables
        private string collectionPointName;
        private UserBO userID;

        public CollectionPointBO()
        {

        }

        //Declaring constructor
        public CollectionPointBO(string collectionPointName, UserBO userID)
        {
            this.collectionPointName = collectionPointName;
            this.userID = userID;
        }

        //Getters and Setters
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
