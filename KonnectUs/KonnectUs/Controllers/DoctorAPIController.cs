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
            Random random = new Random();

            List<Doctor> doctors = new List<Doctor>();
            for (int i = 0; i < 9; i++)
            {
                Doctor doctor = new Doctor();

                doctor.name = "Name " +(i+1);
                doctor.rating = (float)Math.Round(random.NextDouble() * 4 + 1, 1);

                if (String.IsNullOrEmpty(doctor.tagLine))
                {
                    doctor.tagLine = "If you want to see more details about me, then please click on \"Show More\"";
                }

                doctors.Add(doctor);
            }
            return doctors;
        }
    }
}
