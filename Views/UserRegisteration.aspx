<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UserRegisteration.aspx.cs" Inherits="PayTVWebSelfCare.Views.UserRegisteration" Theme ="RegisterTheme"%>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">

    <title></title> <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, minimum-scale=1.0, maximum-scale=1.0" />
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script><script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
 
 
</head>

<nav class="navbar navbar-inverse">
    <div class="container-fluid">
    <div class="navbar-header">
        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>                        
        </button>
    <a class="navbar-brand" href="#">My TV</a>
    </div>

    <div class="collapse navbar-collapse" id="myNavbar">
        <ul class="nav navbar-nav">
            <li class="active"><a href="#">What's on</a></li>
            <li><a href="#">Shop</a></li>
            <li><a href="#">Support</a></li>
            <li><a href="#">My Account</a></li>
        </ul>
    </div>
</nav>	

<body>
    <!--left column space-->
    <div class="col span_1_of_3">
    </div>

    <!--middle content of the page-->
    <div class="col span_2_of_3">
        <form id="msform" runat="server">
        <h1>
            <img src="https://cdn2.iconfinder.com/data/icons/windows-8-metro-style/512/handshake.png" alt="icon" class="auto-style1"/>
            Welcome to my TV!</h1>
        <!-- multistep form -->
            <asp:ScriptManager ID="ScriptManager1" runat="server" EnablePartialRendering ="true" ></asp:ScriptManager>
	    <!-- progressbar -->
            <div class="container">
            <ul id="progressbar">
                <li class="active">Select Package</li> 
                <li>Personal Detail</li>
                <li>Payment Detail</li>
	        </ul>
            </div>
        <!-- fieldsets -->
            <!-- first step of selecting a package-->
            <div id="main">
            <fieldset runat="server">
                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                    <div class="firststep"> 
                        &nbsp;<asp:Label ID="SelectPackageLabel" runat="server" Text="Select Package: *"></asp:Label>
		                &nbsp;
		                <asp:DropDownList ID="SelectPackage" runat="server" OnSelectedIndexChanged="DropDownList2_SelectedIndexChanged" AutoPostBack="True">
                        <asp:ListItem Text ="TV standard" Value ="2" />
                        <asp:ListItem Text="TV basic" Value ="1"/>
                        <asp:ListItem Text ="TV premium" Value ="3" />
                        </asp:DropDownList>
                       
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                       <asp:Image ID="PackageImage" runat="server" width="50%" height="20%" ImageUrl ="~/Pictures/paytv2.jpg"/>


                        &nbsp;&nbsp;<br />
                        <hr/>
                     
                        <asp:Label ID="SelectDeviceLabel" runat="server" Text="Devices: *"></asp:Label>
                        <br />
                        <asp:CheckBox ID="Device1" runat="server" Text="Set Top Box/$29.99" Checked="True" Width="25%" Height="10px"/>
                        <ajaxToolkit:HoverMenuExtender ID="Device1_HoverMenuExtender" runat="server" BehaviorID="Device1_HoverMenuExtender" DynamicServicePath="" TargetControlID="Device1" PopupControlID="Image1">
                        </ajaxToolkit:HoverMenuExtender>
                        &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;
                        <asp:CheckBox ID="Device2" runat="server" Text="Smart card/$14.99" Checked="True" Width="25%" />
                        <ajaxToolkit:HoverMenuExtender ID="Device2_HoverMenuExtender" runat="server" BehaviorID="Device2_HoverMenuExtender" DynamicServicePath="" TargetControlID="Device2" PopupControlID="Image2">
                        </ajaxToolkit:HoverMenuExtender>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:CheckBox ID="Device3" runat="server" Text="Dish/$19.99" Width="25%" />
                        <ajaxToolkit:HoverMenuExtender ID="Device3_HoverMenuExtender" runat="server" BehaviorID="Device3_HoverMenuExtender" DynamicServicePath="" TargetControlID="Device3" PopupControlID="Image3">
                        </ajaxToolkit:HoverMenuExtender>
                        <asp:CheckBox ID="Device4" runat="server" />
                        <br />
                        <asp:Label ID="DeviceHint" runat="server" Text="We have preselected devices according to the package you have
chosen. If you already have the devices, please tick off the box."></asp:Label>  
                        <hr />
                   
                        <asp:Label ID="SelectContractLabel" runat="server" Text="Contract Length: *"></asp:Label>
		                &nbsp;<asp:DropDownList ID="SelectContract" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DropDownList4_SelectedIndexChanged">
                            <asp:ListItem Text="12 months" Value="2" />
                            <asp:ListItem Text="6 months" Value="1" />
                            <asp:ListItem Text="18 months" Value="3" />
                            <asp:ListItem Text="24 months" Value="4" />
                        </asp:DropDownList>
                        <hr />
                    <asp:Label ID="PackageStartLabel" runat="server" Text="Package Start Date: *"></asp:Label>
                        &nbsp;
                        <asp:TextBox ID="PackageStartDate" runat="server" Height="20px" TextMode="Date" Width="300px"></asp:TextBox>
                <hr />
                    
                    </div>
                        </ContentTemplate></asp:UpdatePanel>
		                <input type="button" name="next" class="next action-button" value="Next" />
	          </fieldset>
            
              <!-- second step of filling in personal details-->
              <fieldset runat="server">
                <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                <ContentTemplate>
                <div class="secondstep">
                     Title: *&nbsp;<asp:DropDownList ID="DropDownList1" runat="server" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged1">
                        <asp:ListItem>Please select</asp:ListItem>
                        <asp:ListItem>Mr.</asp:ListItem>
                        <asp:ListItem>Mrs.</asp:ListItem>
                        <asp:ListItem>Miss.</asp:ListItem>
                        <asp:ListItem>Ms.</asp:ListItem>
                        <asp:ListItem>Dr.</asp:ListItem>
                    </asp:DropDownList>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Label ID="FirstNameLabel" runat="server" Text="First Name: *"></asp:Label>
                    &nbsp;
                    <asp:TextBox runat="server" BorderColor="Black" ForeColor="Black" Width="20%" Height="20px" ID="FirstNameTxt"></asp:TextBox>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Label ID="LastNameLabel" runat="server" Text="Last Name: *"></asp:Label>
                    &nbsp;<asp:TextBox runat="server" BorderColor="Black" ForeColor="Black" Width="20%" Height="20px" ID="LastNameTxt"></asp:TextBox>
                    &nbsp;<hr />
                    <asp:Label ID="EmailLabel" runat="server" Text="Email: *"></asp:Label>
                    &nbsp;<asp:TextBox ID="EmailTxt" runat="server" AutoPostBack="True" BorderColor="Black" ForeColor="Black" OnTextChanged="TextBox1_TextChanged" TextMode="Email" Width="30%" Height="20px" placeholder="Example: test@gmail.com"></asp:TextBox>
                    &nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Label ID="EmailConfrimLabel" runat="server" Text="Confirm Email: *"></asp:Label>
                    &nbsp;<asp:TextBox ID="EmailConfirmTxt" runat="server" AutoPostBack="True" BorderColor="Black" ForeColor="Black" TextMode="Email" Width="30%" Height="20px" OnTextChanged="EmailConfirmTxt_TextChanged"></asp:TextBox>
                    <asp:Label ID="EmailConfirmHint" runat="server"></asp:Label>
                    <br />
                    <asp:Label ID="EmailHint" runat="server"></asp:Label>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <br />
                    <hr />
                    <asp:Label ID="PwdLabel" runat="server" Text="Password: *"></asp:Label>
                    &nbsp;&nbsp;&nbsp;
                    <asp:TextBox ID="PwdTxt" runat="server" AutoPostBack="True" BorderColor="Black" ForeColor="Black" OnTextChanged="TextBox2_TextChanged" TextMode="Password" ViewStateMode="Enabled" Width="30%" Height="20px" placeholder="At least 1 uppercase letter, 1 lowercase letter and 1 number. Length: 8 to 15" ToolTip="At least 1 uppercase letter, 1 lowercase letter and 1 number. Length: 8 to 15"></asp:TextBox>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Label ID="PwdConfirmLabel" runat="server" Text="Confirm Password: *"></asp:Label>
                    &nbsp;<asp:TextBox ID="PwdConfirmTxt" runat="server" AutoPostBack="True" BorderColor="Black" ForeColor="Black" TextMode="Password" ViewStateMode="Enabled" Width="30%" Height="20px" OnTextChanged="PwdConfirmTxt_TextChanged"></asp:TextBox>
                    <asp:Label ID="PwdConfirmHint" runat="server"></asp:Label>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="PwdHint" runat="server"></asp:Label>
                     &nbsp;<br />
                    <hr />
                    <asp:Label ID="Label24" runat="server" Text="Date of Birth: *"></asp:Label>
                      &nbsp;&nbsp;<asp:TextBox ID="UserDOB" runat="server" Height="20px" TextMode="Date" Width="300px"></asp:TextBox>
                    <%--<ajaxToolkit:ComboBox ID="ComboBox4" runat="server" Height="20px">
                    </ajaxToolkit:ComboBox>
                    <ajaxToolkit:ComboBox ID="ComboBox5" runat="server" Height="20px">
                    </ajaxToolkit:ComboBox>
                    <ajaxToolkit:ComboBox ID="ComboBox6" runat="server" Height="20px">
                    </ajaxToolkit:ComboBox>--%>
                    <hr />
                    <asp:Label ID="BillingAddressLabel" runat="server" Text="Billing Address: *"></asp:Label>
                    <br />
                    <asp:Label ID="BillingStreetLabel" runat="server" Text="Street: "></asp:Label>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:TextBox ID="BillingStreetTxt1" runat="server" BorderColor="Black" Height="20px" Width="30%"></asp:TextBox>
                    &nbsp;&nbsp;&nbsp;<asp:TextBox ID="BillingStreetTxt2" runat="server" BorderColor="Black" Height="20px" Width="25%"></asp:TextBox>
&nbsp;<asp:Label ID="BillingSuburbLabel" runat="server" Text="Suburb: "></asp:Label>
                    <asp:TextBox ID="BillingSuburbTxt" runat="server" BorderColor="Black" Height="20px" Width="25%"></asp:TextBox>
                    <br />
                    <asp:Label ID="BillingCityLabel" runat="server" Text="City: "></asp:Label>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:TextBox ID="BillingCityTxt" runat="server" BorderColor="Black" Height="20px" Width="30%"></asp:TextBox>
                    &nbsp;&nbsp;&nbsp;
                    <asp:Label ID="BillingCountryLabel" runat="server" Text="Country: "></asp:Label>
                    &nbsp;<asp:DropDownList ID="BillingCountry" runat="server" AutoPostBack="True" Height="20px" OnSelectedIndexChanged="BillingCountry_SelectedIndexChanged">
                        <asp:ListItem Text="New Zealand" Value ="New Zealand"/>
                    <asp:ListItem Text="USA" Value ="USA"/>
                    </asp:DropDownList>
                    &nbsp;
                    <asp:Label ID="BillingZipLabel" runat="server" Text="Zip Code: "></asp:Label>
                    <asp:TextBox ID="BillingZipTxt" runat="server" BorderColor="Black" Height="20px" Width="20%"></asp:TextBox>
                    <br />
                <hr />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <br />
                    &nbsp;<asp:Label ID="PhoneLabel" runat="server" Text="Phone Number: *"></asp:Label>
                    &nbsp;<asp:TextBox ID="PhoneCountryTxtNZ" runat="server" BorderColor="Black" OnTextChanged="PhoneCountryTxt_TextChanged" Width="6%" Height="20px"></asp:TextBox>
                    <asp:Label ID="Label32" runat="server" Text=" - " Height="20px"></asp:Label>
                    <asp:TextBox ID="PhoneRegionTxtNZ" runat="server" BorderColor="Black" OnTextChanged="PhoneRegionTxt_TextChanged" Width="6%" Height="20px"></asp:TextBox>
                    <asp:Label ID="Label31" runat="server" Text=" - " Height="20px"></asp:Label>
                    <asp:TextBox ID="PhoneTxtNZ" runat="server" BorderColor="Black" OnTextChanged="PhoneTxt_TextChanged" Height="20px" Width="20%"></asp:TextBox>
                    &nbsp;&nbsp;<asp:Label ID="PhoneHintNZ" runat="server">Example: 0064 - 21 - 9999999</asp:Label>
                     &nbsp;<asp:Label ID="Label33" runat="server" Height="20px" Text=" ( " Visible="False"></asp:Label>
                    <asp:TextBox ID="PhoneStateTxtUSA" runat="server" BorderColor="Black" Height="20px" OnTextChanged="PhoneCountryTxt_TextChanged" Visible="False" Width="6%"></asp:TextBox>
                    <asp:Label ID="Label34" runat="server" Height="20px" Text=" ) " Visible="False"></asp:Label>
                    <asp:TextBox ID="PhoneCityTxtUSA" runat="server" BorderColor="Black" Height="20px" OnTextChanged="PhoneCountryTxt_TextChanged" Visible="False" Width="6%"></asp:TextBox>
                    <asp:Label ID="Label35" runat="server" Height="20px" Text=" - "></asp:Label>
                    <asp:TextBox ID="PhoneTxtUSA" runat="server" BorderColor="Black" Height="20px" OnTextChanged="PhoneTxt_TextChanged" Visible="False" Width="155px"></asp:TextBox>
                    &nbsp;<asp:Label ID="PhoneHintUSA" runat="server" Visible="False">Example: (541) 754-3010</asp:Label>
                    &nbsp;<hr />
                    </div>
                    
                    </ContentTemplate></asp:UpdatePanel>
		            <input type="button" name="previous" class="previous action-button" value="Previous" />
		            <input type="button" name="next" class="next action-button" value="Next" />
	            </fieldset>
                <!-- third step of filling in payment details-->
                <fieldset runat="server">
                    <asp:UpdatePanel ID="UpdatePanel3" runat="server">
                    <ContentTemplate>
                    <div class="thirdstep"> 
		                <asp:Label ID="Label28" runat="server" Text="Prefer Payment Type: *"></asp:Label>
		                <asp:DropDownList ID="SelectPayType" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
                        <asp:ListItem Text="Select a type" Value ="-1"/>
                        <asp:ListItem Text="Credit Card" Value ="1"/>
                        </asp:DropDownList>
                        <asp:Label ID="Label8" runat="server"></asp:Label>
                        <hr />
                        <asp:Label ID="CardNumLabel" runat="server" Text="Card Number: *" Visible="False"></asp:Label>
                        &nbsp;<asp:TextBox ID="CardNumTxt1" runat="server" BorderColor="Black" Visible="False" AutoPostBack="True" OnTextChanged="CardNumTxt1_TextChanged" Width="10%" Height="20px" ForeColor="Black" MaxLength="4"></asp:TextBox>
                        &nbsp;<asp:TextBox ID="CardNumTxt2" runat="server" BorderColor="Black" Visible="False" AutoPostBack="True" OnTextChanged="CardNumTxt2_TextChanged" Width="10%" Height="20px" ForeColor="Black" MaxLength="4"></asp:TextBox>
                        &nbsp;<asp:TextBox ID="CardNumTxt3" runat="server" BorderColor="Black" Visible="False" AutoPostBack="True" OnTextChanged="CardNumTxt3_TextChanged" Width="10%" Height="20px" ForeColor="Black" MaxLength="4"></asp:TextBox>
                        &nbsp;<asp:TextBox ID="CardNumTxt4" runat="server" BorderColor="Black" Visible="False" AutoPostBack="True" OnTextChanged="CardNumTxt4_TextChanged" Width="10%" Height="20px" ForeColor="Black" MaxLength="4"></asp:TextBox>
                        &nbsp;<hr />
                        <asp:Label ID="SecureCodeLabel" runat="server" Text="Security Code: *" Visible="False"></asp:Label>
                        &nbsp;<asp:TextBox ID="SecureCodeTxt" runat="server" AutoPostBack="True" BorderColor="Black" ForeColor="Black" Height="20px" OnTextChanged="TextBox10_TextChanged" Visible="False" Width="10%" placeholder="3 digit numbers at the back of your card" ToolTip="3 digit numbers at the back of your card9" MaxLength="3"></asp:TextBox>
                        <asp:Label ID="SecurityCodeHint" runat="server" Visible="False"></asp:Label>
                        &nbsp;&nbsp;&nbsp;
                        <asp:Label ID="CardNameLabel" runat="server" Text="Card Holder Name: *" Visible="False"></asp:Label>
                        &nbsp;<asp:TextBox ID="CardNameTxt" runat="server" BorderColor="Black" ForeColor="Black" Height="20px" Visible="False" Width="25%"></asp:TextBox>
                        <hr />
                        <asp:Label ID="CardExpireLabel" runat="server" Text="Card Expiry Date: *" Visible="False"></asp:Label>
                        &nbsp;<asp:DropDownList ID="CardExpireYear" runat="server" AutoPostBack="True" Visible="False">
                    <asp:ListItem Text="2016" Value ="2016"/>
                    <asp:ListItem Text="2017" Value ="2017"/>
                    <asp:ListItem Text="2018" Value ="2018"/>
                    <asp:ListItem Text="2019" Value ="2019"/>
                    <asp:ListItem Text="2020" Value ="2020"/>
                    <asp:ListItem Text="2021" Value ="2021"/>
                </asp:DropDownList>
                <asp:DropDownList ID="CardExpireMonth" runat="server" AutoPostBack="True" Visible="False">
                    <asp:ListItem Text="Jan" Value ="01"/>
                    <asp:ListItem Text="Feb" Value ="02"/>
                    <asp:ListItem Text="Mar" Value ="03"/>
                    <asp:ListItem Text="Apr" Value ="04"/>
                    <asp:ListItem Text="May" Value ="05"/>
                    <asp:ListItem Text="Jun" Value ="06"/>
                    <asp:ListItem Text="Jul" Value ="07"/>
                    <asp:ListItem Text="Aug" Value ="08"/>
                    <asp:ListItem Text="Sep" Value ="09"/>
                    <asp:ListItem Text="Oct" Value ="10"/>
                    <asp:ListItem Text="Nov" Value ="11"/>
                    <asp:ListItem Text="Dec" Value ="12"/>
                </asp:DropDownList>
                <hr />
                        <asp:TextBox ID="TextBox13" runat="server"></asp:TextBox>

                    </div>
                    </ContentTemplate></asp:UpdatePanel>
		            <input type="button" name="previous" class="previous action-button" value="Previous" />
                    <br />
                    <asp:Button ID="RegisterButton" runat="server" OnClick="Button1_Click" Text="Register"  BackColor="#4968BE" CssClass="glyphicon-sort" color="white" Width="15%" Height="40px" />            
	            </fieldset>
                </div>
               <!-- jQuery -->
                   <script src="http://thecodeplayer.com/uploads/js/jquery-1.9.1.min.js" type="text/javascript"></script>
               <!-- jQuery easing plugin -->
                   <script src="http://thecodeplayer.com/uploads/js/jquery.easing.min.js" type="text/javascript"></script>
                   <script>
                    //jQuery time
                    var current_fs, next_fs, previous_fs; //fieldsets
                    var left, opacity, scale; //fieldset properties which we will animate
                    var animating; //flag to prevent quick multi-click glitches
                    $(".next").click(function () {
                        if (animating) return false;
                        animating = true;

                        current_fs = $(this).parent();
                        next_fs = $(this).parent().next();

                        //activate next step on progressbar using the index of next_fs
                        $("#progressbar li").eq($("fieldset").index(next_fs)).addClass("active");

                        //show the next fieldset
                        next_fs.show();
                        //hide the current fieldset with style
                        current_fs.animate({ opacity: 0 }, {
                            step: function (now, mx) {
                                //as the opacity of current_fs reduces to 0 - stored in "now"
                                //1. scale current_fs down to 80%
                                scale = 1 - (1 - now) * 0.2;
                                //2. bring next_fs from the right(50%)
                                left = (now * 50) + "%";
                                //3. increase opacity of next_fs to 1 as it moves in
                                opacity = 1 - now;
                                current_fs.css({ 'transform': 'scale(' + scale + ')' });
                                next_fs.css({ 'left': left, 'opacity': opacity });
                            },
                            duration: 800,
                            complete: function () {
                                current_fs.hide();
                                animating = false;
                            },
                            //this comes from the custom easing plugin
                            easing: 'easeInOutBack'
                        });
                    });

                    $(".previous").click(function () {
                        if (animating) return false;
                        animating = true;

                        current_fs = $(this).parent();
                        previous_fs = $(this).parent().prev();

                        //de-activate current step on progressbar
                        $("#progressbar li").eq($("fieldset").index(current_fs)).removeClass("active");

                        //show the previous fieldset
                        previous_fs.show();
                        //hide the current fieldset with style
                        current_fs.animate({ opacity: 0 }, {
                            step: function (now, mx) {
                                //as the opacity of current_fs reduces to 0 - stored in "now"
                                //1. scale previous_fs from 80% to 100%
                                scale = 0.8 + (1 - now) * 0.2;
                                //2. take current_fs to the right(50%) - from 0%
                                left = ((1 - now) * 50) + "%";
                                //3. increase opacity of previous_fs to 1 as it moves in
                                opacity = 1 - now;
                                current_fs.css({ 'left': left });
                                previous_fs.css({ 'transform': 'scale(' + scale + ')', 'opacity': opacity });
                            },
                            duration: 800,
                            complete: function () {
                                current_fs.hide();
                                animating = false;
                            },
                            //this comes from the custom easing plugin
                            easing: 'easeInOutBack'
                        });
                    });

                    $(".submit").click(function () {
                        return false;
                    })
                    </script>
                </form>
            <!--right column space-->
            <div class="col span_3_of_3">
	        </div>             
        </div>
</body>
</html>