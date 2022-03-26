using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace KonnectUs.Models
{
    public class Person
    {
        public int id { get; set; }
        public string name { get; set; }
        public string phoneNumber { get; set; }
        public string address { get; set; }
        public string gender { get; set; }
        public DateTime dob { get; set; }
        public string cnic { get; set; }
        public string password { get; set; }


    }
}