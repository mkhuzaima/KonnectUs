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
            String query = $"insert into Person (Name, PhoneNumber, Address, Gender, DateOfBirth, Password, CNIC) values('{model.name}', '{model.phoneNumber}', '{model.address}', {(model.isMale ? 1 : 0)}, '{model.dob}', '{model.password}', '{model.cnic}'); ";

            try
            {
                var con = KonnectUs.Configuration.getInstance().getConnection();

                SqlCommand cmd = new SqlCommand(query, con);

                cmd.ExecuteNonQuery();
                
                
                return true;
            }
            catch (Exception ex)
            {
                return false;
            }
        }

    }
}
