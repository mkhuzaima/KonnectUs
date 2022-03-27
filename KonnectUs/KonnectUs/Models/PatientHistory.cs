using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace KonnectUs.Models
{
    public class PatientHistory : Detail
    {
        public int patientHistoryId { get; set; }

        //note
        public string detail { get; set; }

    }
}