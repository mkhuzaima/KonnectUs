using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;


namespace KonnectUs
{
    public class Configuration
    {
        const string BASE_URL = "http://localhost:60677/";
        String ConnectionStr = @"Data Source=(local);Initial Catalog=KonnectUs;Integrated Security=True";
        SqlConnection con;
        private static Configuration _instance;
        public static Configuration getInstance()
        {
            if (_instance == null)
                _instance = new Configuration();
            return _instance;
        }
        private Configuration()
        {
            con = new SqlConnection(ConnectionStr);
            con.Open();
        }
        public SqlConnection getConnection()
        {
            return con;
        }

        public string getBaseUrl()
        {
            return BASE_URL;
        }
    }
}






