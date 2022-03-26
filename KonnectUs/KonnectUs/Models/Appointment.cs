using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace KonnectUs.Models
{
    public class Appointment
    {
        public int id { get; set; }
        public int clinicId { get; set; }
        public int numberOfHours { get; set; }
        public DateTime appointmentDate { get; set; }

    }
}