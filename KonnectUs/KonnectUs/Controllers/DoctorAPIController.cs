using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

using KonnectUs.Models;

namespace KonnectUs.Controllers
{
    public class DoctorAPIController : ApiController
    {
        //api/DoctorAPI/getHW
        [HttpGet]
        public string GetHW()
        {
            return "Hello world";
        }

        //api/DoctorAPI/getDoctor
        [HttpGet]
        public Doctor GetDoctor()
        {
            Doctor doctor = new Doctor();
            return doctor;
        }


        //api/DoctorAPI/getDoctors
        [HttpGet]
        public List<Doctor> GetDoctors()
        {
            List<Doctor> doctors = new List<Doctor>();
            for (int i = 0; i < 10; i++)
            {
                doctors.Add(new Doctor());
            }
            return doctors;
        }
    }
}
