using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Dekhlo.Entity
{
    public class DarbhangaPortal
    {



        public int Id { get; set; }
        public string Title { get; set; }
        public string Description { get; set; }
        public string Images_Path{ get; set; }
        public DateTime Created_Date { get; set; }
        public DateTime Modified_Date { get; set; }
        public string Created_By{ get; set; }
        public string Modified_By{ get; set; }
    }
}
