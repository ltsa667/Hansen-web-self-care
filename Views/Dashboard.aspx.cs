using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Mvc;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;
using PayTVWebSelfCare;

namespace PayTVWebSelfCare.Views
{
    public partial class Dashboard : System.Web.UI.Page
    {
        protected static string userEmail;
        protected static string userPassword;
        protected static string userPhone;
        protected static string userDOB;
        protected static string userPreferName;
        protected static string userBillingAddress;
        protected static string userServiceAddress;
        protected static string userPreferPayType;
        protected static string userCardNumber;
        protected static string userSecurityCode;
        protected static string userCardName;
        protected static string userAgeRange;
        protected static string userPreferTV;
        protected static string userPreferMovies;
        public SqlConnection GetConnection()
        {
            string myStr = ConfigurationManager.ConnectionStrings["DefaultConnection"].ToString();
            SqlConnection myConn = new SqlConnection(myStr);
            return myConn;
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                userEmail = _Default.userName;
                TextBox1.Text = userEmail;
                SqlConnection myConn = GetConnection();
                myConn.Open();
                string sqlStr = String.Format("select * from [User] where [Email] = '{0}';", userEmail);
                SqlCommand myCmd = new SqlCommand(sqlStr, myConn);
                SqlDataAdapter da = new SqlDataAdapter(myCmd);
                DataSet ds = new DataSet();
                da.Fill(ds);
                if (ds.Tables[0].Rows[0]["IsEmailConfirmed"].ToString() == "1")
                {
                    userPassword = ds.Tables[0].Rows[0]["Password"].ToString();
                    TextBox2.Text = userPassword;
                    userPhone = ds.Tables[0].Rows[0]["PhoneNumber"].ToString();
                    TextBox3.Text = userPhone;
                    userDOB = ds.Tables[0].Rows[0]["DateOfBirth"].ToString();
                    TextBox4.Text = userDOB;
                    userPreferName = ds.Tables[0].Rows[0]["LegalName"].ToString();
                    TextBox5.Text = userPreferName;
                    userBillingAddress = ds.Tables[0].Rows[0]["BillingAddress"].ToString();
                    TextBox6.Text = userBillingAddress;
                    userServiceAddress = ds.Tables[0].Rows[0]["ServiceAddress"].ToString();
                    TextBox7.Text = userServiceAddress;
                    userPreferPayType = ds.Tables[0].Rows[0]["PreferPayType"].ToString();
                    TextBox8.Text = userPreferPayType;
                    userCardNumber = ds.Tables[0].Rows[0]["CardNumber"].ToString();
                    TextBox9.Text = userCardNumber;
                    userSecurityCode = ds.Tables[0].Rows[0]["SecurityCode"].ToString();
                    TextBox10.Text = userSecurityCode;
                    userCardName = ds.Tables[0].Rows[0]["CardHolderName"].ToString();
                    TextBox11.Text = userCardName;
                    userPreferName = ds.Tables[0].Rows[0]["ExpireDate"].ToString();
                    TextBox15.Text = userPreferName;
                    userAgeRange = ds.Tables[0].Rows[0]["AgeRange"].ToString();
                    TextBox12.Text = userAgeRange;
                    userPreferTV = ds.Tables[0].Rows[0]["PreferTVChannel"].ToString();
                    TextBox13.Text = userPreferTV;
                    userPreferMovies = ds.Tables[0].Rows[0]["PreferMoviesType"].ToString();
                    TextBox14.Text = userPreferMovies;
                    da.Dispose();
                    ds.Dispose();
                    myConn.Close();
                }
                else
                {
                    Response.Write("<script>alert('Please confirmed your email.');</script>");
                    Response.Redirect("~/Default.aspx");
                }
            }
            catch
            {
                Response.Write("<script>alert('Please log in first');</script>");
                Response.Redirect("~/Default.aspx");
            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {

        }
    }
}