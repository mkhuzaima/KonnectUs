using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace KonnectUs.Models
{
    public class Disease
    {
        public int detailsId { get; set; }
        public Patient patient { get; set; }
        public string type { get; set; }
        public string name { get; set; }
        public string severityLevel { get; set; }
        public int ageLimit { get; set; }
    }
}