using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace KonnectUs.Models
{
    public class Feedback
    {
        public Patient patient { get; set; }
        public Doctor doctor { get; set; }
        public int rating { get; set; }
        public string feedback { get; set; }
    }
}