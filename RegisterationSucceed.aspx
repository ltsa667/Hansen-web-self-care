<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RegisterationSucceed.aspx.cs" Inherits="PayTVWebSelfCare.Views.RegisterationSucceed" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">

    <title></title> <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, minimum-scale=1.0, maximum-scale=1.0" />
  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css"/>

  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>

  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
   <style>
       .container {
           text-align: center;
           box-shadow: 4px 4px 8px 0 rgba(0, 0, 0, 0.2), 4px 6px 20px 0 rgba(0, 0, 0, 0.19);
       }
       .responsive-image {
          height: auto;
          width: 100%;
        }
       .auto-style1 {
           height: 104px;
           width: 89%;
       }
   </style>
</head>
    

<nav class="navbar navbar-inverse">
    <div class="container-fluid">
    <div class="navbar-header">
        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>                        
        </button>
    <a class="navbar-brand" href="#">Logo</a>
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
    <div class="container">
        <h1>&nbsp;</h1>
        <p>&nbsp;</p>
        <h1>Registration Summary</h1>
        <img src="http://s33.postimg.org/9msiumw4f/divider_arrow_FXIII_zpsafd4f4a2.png" alt="congratz" class="auto-style1"/><br />
        <h4> &nbsp;</h4>
        <h4> Registration success - Congratulations! </h4>
        <p> You have successfully completed your registration, please check your </p>
        <p> email as we have sent you the confirmation link.</p>
        <p> &nbsp;</p>
        <p> &nbsp;</p>
        <p> &nbsp;</p>
    <form id="form1" runat="server">
    <div style = "text-align:center">
        <script>
            alert('You have successfully registered, please confirm your email.');
        </script>
        <asp:Button ID="Button1" runat="server" Text="Continue" OnClick="Button1_Click" />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
    </div>
    </form>
    </div>

</body>
</html>
