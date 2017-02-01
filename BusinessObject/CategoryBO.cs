using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
//Created by Ei Yadanar Kyaw
namespace BusinessObject
{
    public class CategoryBO
    {
        private string categoryName;

        public CategoryBO(string categoryName)
        {
            this.CategoryName = categoryName;
        }

        public CategoryBO()
        {

        }

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
