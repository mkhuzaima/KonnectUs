using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace KonnectUs.Controllers
{
    public class AccountController : ApiController
    {
        public Boolean Register(string email, string password)
        {
            try
            {
                var con = KonnectUs.Configuration.getInstance().getConnection();
                SqlCommand cmd = new SqlCommand($";", con);
                cmd.ExecuteNonQuery();
                //MessageBox.Show("Successfully Updated");

                return true;
            }
            catch (Exception ex)
            {
                return false;
            }
        }
    }
}
