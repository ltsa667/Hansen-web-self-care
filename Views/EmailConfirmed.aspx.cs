using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PayTVWebSelfCare.Views
{
    public partial class EmailConfirmed : System.Web.UI.Page
    {
        protected static string userEmail;
        protected static string userActiveCode;
        public SqlConnection GetConnection()
        {
            string myStr = ConfigurationManager.ConnectionStrings["DefaultConnection"].ToString();
            SqlConnection myConn = new SqlConnection(myStr);
            return myConn;
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            userEmail = Request["userEmail"].ToString();
            userActiveCode = Request["userActiveCode"].ToString();
            SqlConnection myConn = GetConnection();
            myConn.Open();
            string sqlStr = String.Format("select [ActiveCode] from [User] where [Email] = '{0}'", userEmail);
            SqlCommand myCmd = new SqlCommand(sqlStr, myConn);
            SqlDataAdapter da = new SqlDataAdapter(myCmd);
            DataSet ds = new DataSet();
            da.Fill(ds);
            if (ds.Tables[0].Rows[0]["ActiveCode"].ToString() == userActiveCode)
            {
                string confirm = String.Format("update [User] set [IsEmailConfirmed] = 1 where [Email] = '{0}';", userEmail);
                SqlCommand myComm = new SqlCommand(confirm, myConn);
                myComm.ExecuteNonQuery();
                Response.Write("<script> alert('Congraduation! You have confirmed your email address!');</script>");

            }
            else
            {
                Response.Write(" <script> alert('Your active code is expired!');</script>");
            }
            da.Dispose();
            ds.Dispose();
            myConn.Close();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Default.aspx");
        }
    }
}