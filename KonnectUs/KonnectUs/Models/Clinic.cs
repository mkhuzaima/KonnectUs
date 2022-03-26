using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace KonnectUs.Models
{
    public class Clinic
    {
        public Doctor doctor { get; set; }
        public string name { get; set; }
        public string address { get; set; }
        public DateTime startTime { get; set; }
        public DateTime startEnd { get; set; }
    }
}