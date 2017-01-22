using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BusinessException
{
    public class NotFoundException : ApplicationException
    {
        public NotFoundException() : base() {
        }
        public NotFoundException(string g) : base(g) {
        }
    }
}
