using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using KonnectUs.Models;

namespace KonnectUs.Controllers
{
    public class AccountAPIController : ApiController
    {
        [HttpPost]
        public bool Register(AccountViewModel model)
        {

            String query = $"select count(*) from Person where PhoneNumber like '{model.phoneNumber}';";

            try
            {
                var con = KonnectUs.Configuration.getInstance().getConnection();

                SqlCommand cmd = new SqlCommand(query, con);

                int frequency = (Int32)cmd.ExecuteScalar();

                if (frequency != 0)
                {
                    return false;
                }


                query = $"insert into Person (Name, PhoneNumber, Address, Gender, DateOfBirth, Password, CNIC) values('{model.name}', '{model.phoneNumber}', '{model.address}', {(model.isMale ? 1 : 0)}, '{model.dob}', '{model.password}', '{model.cnic}');";

                cmd = new SqlCommand(query, con);

                cmd.ExecuteNonQuery();
                
                
                return true;
            }
            catch (Exception ex)
            {
                return false;
            }
        }


        [HttpPost]
        public IHttpActionResult Login([FromBody] Credentials obj)
        {

            if (obj == null)
            {
                return NotFound();
            }
            string query = $"select id from Person where phoneNumber ='{obj.number}' and password = '{obj.password}'";
            var con = KonnectUs.Configuration.getInstance().getConnection();
            while (true)
            {
                try
                {
                    SqlCommand cmd = new SqlCommand(query, con);
                    SqlDataReader reader = cmd.ExecuteReader();

                    if (reader.HasRows)
                    {
                        reader.Read();
                        int id = reader.GetInt32(0);
                        return Ok(content: new { id });
                        //reader.Close();
                    }
                    else
                    {
                        return NotFound();
                        //reader.Close();
                    }
                }
                catch (Exception ex)
                {
                    //return -1;
                }
            }
        }

    }
}
