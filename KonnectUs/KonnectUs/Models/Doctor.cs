using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace KonnectUs.Models
{
    public class Doctor : Person
    {
        public string speciality { get; set; }
        public int experience { get; set; }
        public DateTime startDate { get; set; }
        public bool isAvailable { get; set; }
        public float rating { get; set; }


    }
}