using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace KonnectUs.Models
{
    public class Visit : Detail
    {
        public Doctor doctor { get; set; }
        public Clinic clinic { get; set; }

        //list of diseases
        public List<Disease> diseases { get; set; }

    }
}