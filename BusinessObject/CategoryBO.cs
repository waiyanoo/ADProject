//Created by Ei Yadanar Kyaw

using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BusinessObject
{
    public class CategoryBO
    {
        //Declaring variable
        private string categoryName;

        //Declaring constructor
        public CategoryBO(string categoryName)
        {
            this.CategoryName = categoryName;
        }

        public CategoryBO()
        {

        }

        //Getter and Setter
        public string CategoryName
        {
            get
            {
                return categoryName;
            }

            set
            {
                categoryName = value;
            }
        }
    }
}
