using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace KonnectUs.Models
{
    public class Detail
    {
        public DateTime dateTime { get; set; }
        public Patient patient { get; set; }
        //public Doctor doctor { get; set; }
        //public List<Disease> diseases { get; set; }
    }
}