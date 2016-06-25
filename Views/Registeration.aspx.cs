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
using System.Net;
using System.Net.Mail;
using System.Text;

namespace PayTVWebSelfCare.Views
{
    public partial class Registeration : System.Web.UI.Page
    {
        protected static string userEmail;
        protected static string userPassword;
        protected static string userPhone;
        protected static string userDOB;
        protected static string userLegalName;
        protected static string userBillingAddress;
        protected static string userServiceAddress;
        protected static string userPreferPayType;
        protected static string userCardNumber;
        protected static string userSecurityCode;
        protected static string userCardExpireDate;
        protected static string userCardName;
        protected static string userPackage;
        protected static string userDevices;
        protected static string userContractLength;
        protected static string userPackageStart = DateTime.Now.ToString();
        protected static string userTotalAmountOrigin = "Total Amount: $";
        protected static double userTotalAmount = 44.98;
        protected static bool isValidPassword = false;
        protected static bool isValidEmail = false;
        protected static bool isValidPhone1 = false;
        protected static bool isValidPhone2 = false;
        protected static bool isValidPhone3 = false;
        protected static bool isValidCardNum1 = false;
        protected static bool isValidCardNum2 = false;
        protected static bool isValidCardNum3 = false;
        protected static bool isValidCardNum4 = false;
        protected static bool isValidSecurityCode = false;
        public static string userName;
        public static string userActiveCode;
        public static bool isEmailConfirmed = false;
        NetworkCredential login;
        SmtpClient client;
        MailMessage msg;
        protected static string regexEmail = @"^([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$";
        protected static string regexPhone = @"^\+?(\d[\d-. ]+)?(\([\d-. ]+\))?[\d-. ]+\d$";


        public SqlConnection GetConnection()
        {
            string myStr = ConfigurationManager.ConnectionStrings["DefaultConnection"].ToString();
            SqlConnection myConn = new SqlConnection(myStr);
            return myConn;
        }
        public bool ValidatePassword(string password)
        {//Validate the password, at least one lower letter, one upper letter and one number, length within 8-15.
            const int MIN_LENGTH = 8;
            const int MAX_LENGTH = 15;

            if (password == null) throw new ArgumentNullException();

            bool meetsLengthRequirements = password.Length >= MIN_LENGTH && password.Length <= MAX_LENGTH;
            bool hasUpperCaseLetter = false;
            bool hasLowerCaseLetter = false;
            bool hasDecimalDigit = false;

            if (meetsLengthRequirements)
            {
                foreach (char c in password)
                {
                    if (char.IsUpper(c)) hasUpperCaseLetter = true;
                    else if (char.IsLower(c)) hasLowerCaseLetter = true;
                    else if (char.IsDigit(c)) hasDecimalDigit = true;
                }
            }

            isValidPassword = meetsLengthRequirements
                        && hasUpperCaseLetter
                        && hasLowerCaseLetter
                        && hasDecimalDigit
                        ;
            return isValidPassword;
        }

        public static bool ContainOnlyInt(string aString)
        {//To check if a string only contain interger. 
            bool onlyInt = true;
            foreach (char c in aString)
            {
                if (!char.IsDigit(c))
                {
                    onlyInt = false;
                    break;
                }
            }
            return onlyInt;
        }


        protected void Button1_Click(object sender, EventArgs e)
        {
            userEmail = EmailTxt.Text;
            userPassword = PwdTxt.Text;
            if (BillingCountry.SelectedValue == "New Zealand") { userPhone = PhoneCountryTxtNZ.Text + PhoneRegionTxtNZ.Text + PhoneTxtNZ.Text; }
            else if (BillingCountry.SelectedValue == "USA") { userPhone = PhoneStateTxtUSA.Text + PhoneCityTxtUSA.Text + PhoneTxtUSA.Text; }
            userPhone = PhoneCountryTxtNZ.Text + PhoneRegionTxtNZ.Text + PhoneTxtNZ.Text;
            userDOB = userDOB.ToString();
            userLegalName = FirstNameTxt.Text + " " + LastNameTxt.Text;
            userBillingAddress = BillingStreetTxt1.Text + " " + BillingStreetTxt2 + ", " + BillingSuburbTxt.Text + ", " + BillingCityTxt.Text + ", " + BillingCountry.SelectedItem.Text + ", " + BillingZipTxt.Text;
            userServiceAddress = userBillingAddress;
            //if (ServiceSameAsBilling.Checked == true) { userServiceAddress = userBillingAddress; }//If service address is emtpy
            //else { userServiceAddress = ServiceStreetTxt.Text + ", " + ServiceSuburbTxt.Text + ", " + ServiceCityTxt.Text + ", " + ServiceCountryTxt.Text + ", " + ServiceZipTxt.Text; }
            userPreferPayType = SelectPayType.SelectedItem.Text;
            userCardNumber = CardNumTxt1.Text + CardNumTxt2.Text + CardNumTxt3.Text + CardNumTxt4.Text;
            userSecurityCode = SecureCodeTxt.Text;
            userCardName = CardNameTxt.Text;
            userCardExpireDate = String.Format("{0} - {1} - {2}", CardExpireYear.SelectedValue, CardExpireMonth.SelectedValue, "01");
            userPackage = SelectPackage.SelectedItem.Text;
            if (Device1.Checked == true) { userDevices += Device1.Text; }
            if (Device2.Checked == true) { userDevices += Device2.Text; }
            if (Device3.Checked == true) { userDevices += Device3.Text; }
            userContractLength = SelectContract.SelectedItem.Text;
            userActiveCode = Guid.NewGuid().ToString().Substring(0, 8);
            string sqlStr = "";
            if (!isValidPassword || !isValidEmail || !isValidPhone1 || !isValidPhone2 || !isValidPhone3 || !isValidCardNum1 || !isValidCardNum2 || !isValidCardNum3 || !isValidCardNum4 || !isValidSecurityCode || userBillingAddress.Trim() == "")
            {
                Response.Write("<script>alert('Please fill in all the fields correctly!');</script>");//If user didn't finish any required field.
            }
            else
            {
                try
                {
                    bool isSucceed = false;
                    SqlConnection myConn = GetConnection();
                    myConn.Open();
                    sqlStr = String.Format("insert into [User]([Email], [Password], [PhoneNumber], [DateOfBirth], [LegalName], [BillingAddress], [ServiceAddress], [PreferPayType], [CardNumber], [SecurityCode], [CardHolderName], [ExpireDate], [AgeRange],[PreferTVChannel],[PreferMoviesType], [IsEmailConfirmed], [ActiveCode]) values('{0}', '{1}', '{2}', '{3}', '{4}', '{5}', '{6}', '{7}', '{8}', '{9}', '{10}', '{11}', '{12}', '{13}','{14}', 0, '{15}');", userEmail, userPassword, userPhone, userDOB, userLegalName, userBillingAddress, userServiceAddress, userPreferPayType, userCardNumber, userSecurityCode, userCardName, userCardExpireDate, userPackage, userDevices, userContractLength, userActiveCode);//Try to insert to database.
                    TextBox13.Text = sqlStr;
                    SqlTransaction sqlTrans = myConn.BeginTransaction();
                    SqlCommand myComm = new SqlCommand(sqlStr, myConn);
                    myComm.Transaction = sqlTrans;
                    try
                    {
                        myComm.ExecuteNonQuery();
                        sqlTrans.Commit();//If the transaction commited
                        isSucceed = true;

                    }
                    catch
                    {
                        isSucceed = false;//If sql exception raised, rollback.
                        sqlTrans.Rollback();
                    }
                    finally
                    {
                        if (isSucceed == true)
                        {
                            userName = userEmail;
                            sendMail(userEmail, userActiveCode);
                            Response.Redirect("~/RegisterSucceed.aspx");
                        }
                        else
                        {
                            Response.Write("<script>alert('Not succeed');</script>");
                        }

                        myConn.Close();
                    }
                }
                catch 
                {
                    Response.Write("<script>alert('" + sqlStr + "');</script>");
                }
            }
        }

        protected void TextBox1_TextChanged(object sender, EventArgs e) //Check if email is valid. 
        {
            RegexStringValidator emailValid = new RegexStringValidator(regexEmail);
            isValidEmail = false;
            try
            {
                emailValid.Validate(EmailTxt.Text);
                isValidEmail = true;

            }
            catch (ArgumentException)
            {
                isValidEmail = false;
            }
            if (isValidEmail == true)
            {
                SqlConnection myConn = GetConnection();
                myConn.Open();
                bool alreadyHaveAccount = false;
                string sqlStr = "select Email from [User];";
                SqlCommand myCmd = new SqlCommand(sqlStr, myConn);
                SqlDataAdapter da = new SqlDataAdapter(myCmd);
                DataSet ds = new DataSet();
                da.Fill(ds);
                for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
                {
                    if (String.Compare(EmailTxt.Text, ds.Tables[0].Rows[i]["Email"].ToString(), 0) == 0)
                    {
                        alreadyHaveAccount = true;
                    }
                }
                if (alreadyHaveAccount == true)
                {
                    EmailTxt.BorderColor = System.Drawing.Color.Red;
                    EmailHint.Text = "You already have an account!";
                    EmailHint.Visible = true;
                    EmailTxt.Focus();
                }
                else
                {
                    EmailTxt.BorderColor = System.Drawing.Color.Black;
                    EmailHint.Text = "";
                    EmailHint.Visible = false;
                }
                da.Dispose();
                ds.Dispose();
                myConn.Close();
            }
            else
            {
                EmailTxt.BorderColor = System.Drawing.Color.Red;
                EmailHint.Text = "Please enter a valid email!";
                EmailHint.Visible = true;
                EmailTxt.Focus();
            }
        }

        protected void TextBox2_TextChanged(object sender, EventArgs e)//Check if password is valid.
        {
            if (ValidatePassword(PwdTxt.Text))
            {
                this.PwdTxt.Attributes.Add("value", PwdTxt.Text);
                PwdTxt.BorderColor = System.Drawing.Color.Black;
            }
            else
            {
                PwdTxt.BorderColor = System.Drawing.Color.Red;
                PwdTxt.Focus();
            }
        }


        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (SelectPayType.SelectedItem.Value == "-1")
            {
                SelectPayType.BorderColor = System.Drawing.Color.Red;
                Label8.Visible = true;
                Label8.ForeColor = System.Drawing.Color.Red;
                Label8.Text = "Please select your prefer payment type.";

                SecurityCodeHint.Visible = false;

                CardNumLabel.Visible = false;
                SecureCodeLabel.Visible = false;
                CardNameLabel.Visible = false;
                CardNumTxt1.Visible = false;
                CardNumTxt2.Visible = false;
                CardNumTxt3.Visible = false;
                CardNumTxt4.Visible = false;
                SecureCodeTxt.Visible = false;
                CardNameTxt.Visible = false;
                CardExpireLabel.Visible = false;
                CardExpireYear.Visible = false;
                CardExpireMonth.Visible = false;
                SelectPayType.Focus();
            }
            else if (SelectPayType.SelectedItem.Value == "1")
            {
                SelectPayType.BorderColor = System.Drawing.Color.Black;
                Label8.Visible = false;
                SecurityCodeHint.Visible = true;
                CardNumLabel.Visible = true;
                SecureCodeLabel.Visible = true;
                CardNameLabel.Visible = true;
                CardNumTxt1.Visible = true;
                CardNumTxt2.Visible = true;
                CardNumTxt3.Visible = true;
                CardNumTxt4.Visible = true;
                SecureCodeTxt.Visible = true;
                CardNameTxt.Visible = true;
                CardExpireLabel.Visible = true;
                CardExpireYear.Visible = true;
                CardExpireMonth.Visible = true;
            }
        }

        protected void DropDownList2_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (SelectPackage.SelectedItem.Value == "1")
            {
                Device1.Checked = true;
                Device2.Checked = false;
                Device3.Checked = false;
                Device4.Checked = false;
                userTotalAmount = 29.99;
                TotalToPay.Text = userTotalAmountOrigin + userTotalAmount.ToString();
                PackageImage.ImageUrl = "~/Pictures/paytv1.jpg";
            }
            else if (SelectPackage.SelectedItem.Value == "2")
            {
                Device1.Checked = true;
                Device2.Checked = true;
                Device3.Checked = false;
                Device4.Checked = false;
                userTotalAmount = 44.98;
                TotalToPay.Text = userTotalAmountOrigin + userTotalAmount.ToString();
                PackageImage.ImageUrl = "~/Pictures/paytv2.jpg";
            }
            else if (SelectPackage.SelectedItem.Value == "3")
            {
                Device1.Checked = true;
                Device2.Checked = true;
                Device3.Checked = true;
                Device4.Checked = false;
                userTotalAmount = 64.97;
                TotalToPay.Text = userTotalAmountOrigin + userTotalAmount.ToString();
                PackageImage.ImageUrl = "~/Pictures/paytv3.jpg";
            }
            else if (SelectPackage.SelectedItem.Value == "4")
            {
                Device1.Checked = false;
                Device2.Checked = false;
                Device3.Checked = false;
                Device4.Checked = true;
                userTotalAmount = 69.99;
                TotalToPay.Text = userTotalAmountOrigin + userTotalAmount.ToString();
                PackageImage.ImageUrl = "~/Pictures/paytv3.jpg";
            }
            else if (SelectPackage.SelectedItem.Value == "5")
            {
                Device1.Checked = false;
                Device2.Checked = false;
                Device3.Checked = false;
                Device4.Checked = false;
                userTotalAmount = 0;
                TotalToPay.Text = userTotalAmountOrigin + userTotalAmount.ToString();
                PackageImage.ImageUrl = "~/Pictures/paytv3.jpg";
            }
            else if (SelectPackage.SelectedItem.Value == "6")
            {
                Device1.Checked = false;
                Device2.Checked = false;
                Device3.Checked = false;
                Device4.Checked = false;
                userTotalAmount = 0;
                TotalToPay.Text = userTotalAmountOrigin + userTotalAmount.ToString();
                PackageImage.ImageUrl = "~/Pictures/paytv3.jpg";
            }
        }

        protected void DropDownList4_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (SelectContract.SelectedItem.Value == "-1")
            {
                SelectContract.BorderColor = System.Drawing.Color.Red;
                SelectContract.Focus();
            }
            else
            {
                SelectContract.BorderColor = System.Drawing.Color.Black;
            }
        }



        protected void TextBox10_TextChanged(object sender, EventArgs e)
        {
            if (ContainOnlyInt(SecureCodeTxt.Text))
            {
                if (SecureCodeTxt.Text.Length == 3)
                {
                    isValidSecurityCode = true;
                }
            }
            else
            {
                isValidSecurityCode = false;
            }
            if (isValidSecurityCode == false)
            {
                SecureCodeTxt.BorderColor = System.Drawing.Color.Red;
                SecurityCodeHint.Text = "Please enter a valid security code.";
                SecurityCodeHint.ForeColor = System.Drawing.Color.Red;
                SecurityCodeHint.Visible = true;
            }
            else
            {
                SecureCodeTxt.BorderColor = System.Drawing.Color.Black;
                SecurityCodeHint.ForeColor = System.Drawing.Color.Black;
                SecurityCodeHint.Text = "";
                SecurityCodeHint.Visible = false;
            }
        }
        public void sendMail(string ToEmail, string activeCode)
        {
            login = new NetworkCredential("zzpchow@gmail.com", "zzp123456");
            client = new SmtpClient("smtp.gmail.com");
            client.Port = 587;
            client.EnableSsl = true;
            client.Credentials = login;
            msg = new MailMessage { From = new MailAddress("from@gmail.com", "Johnson Tester", Encoding.UTF8) };
            msg.To.Add(new MailAddress(ToEmail));
            msg.Subject = "Pay TV Web Self-Care Confirmation";
            msg.Body = "<a href='http://localhost:55944/RegisterConfirm.aspx?userActiveCode=" + activeCode + "&userEmail=" + ToEmail + "'>Validate</a>";
            msg.IsBodyHtml = true;
            msg.Priority = MailPriority.High;
            client.Send(msg);
        }

        protected void PhoneCountryTxt_TextChanged(object sender, EventArgs e)
        {
            if (!ContainOnlyInt(PhoneCountryTxtNZ.Text))
            {
                PhoneCountryTxtNZ.BorderColor = System.Drawing.Color.Red;
                isValidPhone1 = false;
            }
            else
            {
                PhoneCountryTxtNZ.BorderColor = System.Drawing.Color.Black;
                isValidPhone1 = true;
            }
        }

        protected void PhoneRegionTxt_TextChanged(object sender, EventArgs e)
        {
            if (!ContainOnlyInt(PhoneRegionTxtNZ.Text))
            {
                PhoneRegionTxtNZ.BorderColor = System.Drawing.Color.Red;
                isValidPhone2 = false;
            }
            else
            {
                PhoneRegionTxtNZ.BorderColor = System.Drawing.Color.Black;
                isValidPhone2 = true;
            }
        }

        protected void PhoneTxt_TextChanged(object sender, EventArgs e)
        {
            if (!ContainOnlyInt(PhoneTxtNZ.Text))
            {
                PhoneTxtNZ.BorderColor = System.Drawing.Color.Red;
                isValidPhone3 = false;
            }
            else
            {
                PhoneTxtNZ.BorderColor = System.Drawing.Color.Black;
                isValidPhone3 = true;
            }
        }

        protected void EmailConfirmTxt_TextChanged(object sender, EventArgs e)
        {
            if (EmailConfirmTxt.Text != EmailTxt.Text)
            {
                EmailConfirmTxt.BorderColor = System.Drawing.Color.Red;
                EmailConfirmHint.Text = "You must enter the same email address as above!";
                EmailConfirmHint.Visible = true;
            }
            else
            {
                EmailConfirmTxt.BorderColor = System.Drawing.Color.Black;
                EmailConfirmHint.Text = "";
                EmailConfirmHint.Visible = false;
            }
        }

        protected void PwdConfirmTxt_TextChanged(object sender, EventArgs e)
        {
            if (PwdConfirmTxt.Text != PwdTxt.Attributes["value"])
            {
                PwdConfirmTxt.BorderColor = System.Drawing.Color.Red;
                PwdConfirmHint.Text = "You must enter the same email address as above!";
                PwdConfirmHint.Visible = true;
            }
            else
            {
                this.PwdConfirmTxt.Attributes.Add("value", PwdConfirmTxt.Text);
                PwdConfirmTxt.BorderColor = System.Drawing.Color.Black;
                PwdConfirmHint.Text = "";
                PwdConfirmHint.Visible = false;
            }
        }

        protected void ServiceSameAsBilling_CheckedChanged(object sender, EventArgs e)
        {
            //if (ServiceSameAsBilling.Checked == true)
            //{
            //    ServiceStreetTxt.Visible = false;
            //    ServiceStreetLabel.Visible = false;
            //    ServiceSuburbTxt.Visible = false;
            //    ServiceSuburbLabel.Visible = false;
            //    ServiceCityTxt.Visible = false;
            //    ServiceCityLabel.Visible = false;
            //    ServiceCountryTxt.Visible = false;
            //    ServiceCountryLabel.Visible = false;
            //    ServiceZipTxt.Visible = false;
            //    ServiceZipLabel.Visible = false;
            //}
            //else {
            //    ServiceStreetTxt.Visible = true;
            //    ServiceStreetLabel.Visible = true;
            //    ServiceSuburbTxt.Visible = true;
            //    ServiceSuburbLabel.Visible = true;
            //    ServiceCityTxt.Visible = true;
            //    ServiceCityLabel.Visible = true;
            //    ServiceCountryTxt.Visible = true;
            //    ServiceCountryLabel.Visible = true;
            //    ServiceZipTxt.Visible = true;
            //    ServiceZipLabel.Visible = true;
            //}

        }

        protected void CardNumTxt1_TextChanged(object sender, EventArgs e)
        {
            if (CardNumTxt1.Text.Length == 4 && ContainOnlyInt(CardNumTxt1.Text))
            {
                CardNumTxt1.BorderColor = System.Drawing.Color.Black;
                isValidCardNum1 = true;
            }
            else
            {
                CardNumTxt1.BorderColor = System.Drawing.Color.Red;
                isValidCardNum1 = false;
            }
        }

        protected void CardNumTxt2_TextChanged(object sender, EventArgs e)
        {
            if (CardNumTxt2.Text.Length == 4 && ContainOnlyInt(CardNumTxt2.Text))
            {
                CardNumTxt2.BorderColor = System.Drawing.Color.Black;
                isValidCardNum2 = true;
            }
            else
            {
                CardNumTxt2.BorderColor = System.Drawing.Color.Red;
                isValidCardNum2 = false;
            }
        }

        protected void CardNumTxt3_TextChanged(object sender, EventArgs e)
        {
            if (CardNumTxt3.Text.Length == 4 && ContainOnlyInt(CardNumTxt3.Text))
            {
                CardNumTxt3.BorderColor = System.Drawing.Color.Black;
                isValidCardNum3 = true;
            }
            else
            {
                CardNumTxt3.BorderColor = System.Drawing.Color.Red;
                isValidCardNum3 = false;
            }
        }

        protected void CardNumTxt4_TextChanged(object sender, EventArgs e)
        {
            if (CardNumTxt4.Text.Length == 4 && ContainOnlyInt(CardNumTxt4.Text))
            {
                CardNumTxt4.BorderColor = System.Drawing.Color.Black;
                isValidCardNum4 = true;
            }
            else
            {
                CardNumTxt4.BorderColor = System.Drawing.Color.Red;
                isValidCardNum4 = false;
            }
        }

        protected void BillingCountry_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (BillingCountry.SelectedValue == "New Zealand")
            {
                PhoneCountryTxtNZ.Visible = true;
                PhoneRegionTxtNZ.Visible = true;
                PhoneTxtNZ.Visible = true;
                PhoneHintNZ.Visible = true;
                Label32.Visible = true;
                Label31.Visible = true;
                PhoneStateTxtUSA.Visible = false;
                PhoneCityTxtUSA.Visible = false;
                PhoneTxtUSA.Visible = false;
                Label33.Visible = false;
                Label34.Visible = false;
                Label35.Visible = false;
                PhoneHintUSA.Visible = false;
            }
            else if (BillingCountry.SelectedValue == "USA")
            {
                PhoneCountryTxtNZ.Visible = false;
                PhoneRegionTxtNZ.Visible = false;
                PhoneTxtNZ.Visible = false;
                PhoneHintNZ.Visible = false;
                Label32.Visible = false;
                Label31.Visible = false;
                PhoneStateTxtUSA.Visible = true;
                PhoneCityTxtUSA.Visible = true;
                PhoneTxtUSA.Visible = true;
                Label33.Visible = true;
                Label34.Visible = true;
                Label35.Visible = true;
                PhoneHintUSA.Visible = true;
            }
        }

        protected void TextBox14_TextChanged(object sender, EventArgs e)
        {

        }

        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void CardNameTxt_TextChanged(object sender, EventArgs e)
        {

        }

        protected void Device1_CheckedChanged(object sender, EventArgs e)
        {
            if (Device1.Checked == true)
            {
                userTotalAmount += 29.99;
            }
            else
            {
                userTotalAmount -= 29.99;
            }
            TotalToPay.Text = userTotalAmountOrigin + Math.Round(userTotalAmount, 2).ToString();
        }

        protected void Device2_CheckedChanged(object sender, EventArgs e)
        {
            if (Device2.Checked == true)
            {
                userTotalAmount += 14.99;
            }
            else
            {
                userTotalAmount -= 14.99;
            }
            TotalToPay.Text = userTotalAmountOrigin + Math.Round(userTotalAmount, 2).ToString();
        }

        protected void Device3_CheckedChanged(object sender, EventArgs e)
        {
            if (Device3.Checked == true)
            {
                userTotalAmount += 19.99;
            }
            else
            {
                userTotalAmount -= 19.99;
            }
            TotalToPay.Text = userTotalAmountOrigin + Math.Round(userTotalAmount, 2).ToString();
        }

        protected void Device4_CheckedChanged(object sender, EventArgs e)
        {
            if (Device4.Checked == true)
            {
                userTotalAmount += 69.99;
            }
            else
            {
                userTotalAmount -= 69.99;
            }
            TotalToPay.Text = userTotalAmountOrigin + Math.Round(userTotalAmount, 2).ToString();
        }

        protected void DropDownList1_SelectedIndexChanged1(object sender, EventArgs e)
        {

        }

        protected void PackageStartDate_TextChanged(object sender, EventArgs e)
        {
            if (DateTime.Parse(PackageStartDate.Text) > DateTime.Today)
            {
                PackageStartDate.Attributes.Add("value", PackageStartDate.Text);
                PackageStartDate.BorderColor = System.Drawing.Color.Black;
            }
            else {
                PackageStartDate.BorderColor = System.Drawing.Color.Red;
            }
        }
    }
}