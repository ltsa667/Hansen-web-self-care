using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PayTVWebSelfCare
{
    public partial class _Default : Page
    {
        public static string userName;
        public static string userPassword;
        protected static bool isAuthen = false;
        public SqlConnection GetConnection()
        {
            string myStr = ConfigurationManager.ConnectionStrings["DefaultConnection"].ToString();
            SqlConnection myConn = new SqlConnection(myStr);
            return myConn;
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            this.UnobtrusiveValidationMode = System.Web.UI.UnobtrusiveValidationMode.None;
        }
        private void Login1_LoggedIn()
        {
            Response.Write("<script>alert('Welcome!');</script>");
            Response.Redirect("~/Index.aspx");
        }
        protected void Login1_Authenticate(object sender, AuthenticateEventArgs e)
        {



        }




        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Views/Register.aspx");
        }



        protected void TextBox1_TextChanged(object sender, EventArgs e)
        {

        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            SqlConnection myConn = GetConnection();
            myConn.Open();
            string sqlStr = "select * from [User];";
            SqlCommand myCmd = new SqlCommand(sqlStr, myConn);
            SqlDataAdapter da = new SqlDataAdapter(myCmd);
            DataSet ds = new DataSet();
            da.Fill(ds);

            userName = UserName.Text;
            userPassword = UserPassword.Text;

            for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
            {
                if (String.Compare(ds.Tables[0].Rows[i]["Email"].ToString(), userName, 0) == 0)
                {
                    if (String.Compare(ds.Tables[0].Rows[i]["Password"].ToString(), userPassword, 0) == 0)
                    {
                        isAuthen = true;
                        break;
                    }
                }
            }
            if (isAuthen == true)
            {
                Response.Redirect("~/Views/Dashboard.aspx");
            }
            else
            {
                Response.Write("<script>alert('Login fail! Incorrect User Name or Password!');</script>");
            }
            da.Dispose();
            ds.Dispose();
            myConn.Close();
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Views/xRegister.aspx");
        }
    }
}