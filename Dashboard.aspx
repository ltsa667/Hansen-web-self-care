<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="PayTVWebSelfCare.Views.Dashboard" Theme ="DashboardTheme" maintainScrollPositionOnPostBack ="true"%>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">  
    <meta name="layout" content="main"/>
    <script type="text/javascript" src="http://www.google.com/jsapi"></script>
    <script src="../js/jquery/jquery-1.8.2.min.js" type="text/javascript" ></script>
    <link href="../css/customize-template.css" type="text/css" media="screen, projection" rel="stylesheet" />
    </title>

    <style type="text/css">
        .auto-style1 {
            width: 22px;
            height: 22px;
        }
        .auto-style2 {
            width: 25px;
            height: 27px;
        }
        .auto-style3 {
            width: 23px;
            height: 23px;
        }
        .auto-style6 {
            width: 23px;
            height: 21px;
        }
        .auto-style10 {
            width: 80px;
            height: 51px;
        }
    </style>

</head>
<body>
        <div class="navbar navbar-fixed-top">
            <div class="navbar-inner">
                <div class="container">
                    <button class="btn btn-navbar" data-toggle="collapse" data-target="#app-nav-top-bar">
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a href="dashboard.html" class="brand"><i class="icon-leaf">TV Buddy</i></a>
                    <div id="app-nav-top-bar" class="nav-collapse">
                        <ul class="nav">
                            
                        <ul class="nav pull-right">
                            <li>
                                <a href="login.html">Logout</a>
                            </li>
                            
                        </ul>
                    </div>
                </div>
            </div>
        </div>

        <div id="body-container">
            <div id="body-content">
                
                    <div class="body-nav body-nav-horizontal body-nav-fixed">
                        <div class="container">
                            <ul>
                                <li>
                                    <a href="#">
                                        <i class="icon-dashboard icon-large"></i> MY ACCOUNT
                                    </a>
                                </li>
                                <li>
                                    <a href="#">
                                        <i class="icon-calendar icon-large"></i> SHOP
                                    </a>
                                </li>
                                <li>
                                    <a href="#">
                                        <i class="icon-map-marker icon-large"></i> SUPPORT
                                    </a>
                                </li>
                               
                            </ul>
                        </div>
                    </div>
                
                
        <section class="nav nav-page">
        <div class="container">
            <div class="row">
                <div class="span7">
                    <header class="page-header">
                        <h3>Hello, Henry!<br/>
                            <small>Welcome back to TV buddy! </small>
                        </h3>
                    </header>
                </div>
               
            </div>
        </div>
    </section>
    <section class="page container">
        <div class="row">
            <div class="span8">
                <div class="box">
                    <div class="box-header">
                        <i class="icon-bookmark"></i>
                        <h5>MY BILL</h5>
                    </div>
                    <div class="box-content">
                        <div class="btn-group-box">
                            <button class="auto-style10"><img src="https://cdn2.iconfinder.com/data/icons/windows-8-metro-style/128/dashboard.png" class="auto-style2"><br/>Dashboard</button>
                            <button class="auto-style10"><img src="https://servicedesk.nupis.de/helpLinePortal2/Images/EditUser.png" class="auto-style2"><br/>Profile</button>
                            <button class="auto-style10"><img src="https://cdn2.iconfinder.com/data/icons/financial-circle/512/budgetinvoice-128.png" class="auto-style3"><br/>Invoice</button>
                            <button class="auto-style10"><img src="https://cdn4.iconfinder.com/data/icons/simplicio/128x128/file_search.png" class="auto-style1"></img><br/>Search</button>
                            <button class="auto-style10"><img src="http://pluspolo.com/wp-content/uploads/2015/08/product.png" class="auto-style6"></img><br/>Products</button>
                            
                        </div>
                    </div>
                </div>
            </div>
            <div class="span8">
                <div class="blockoff-left">
                    <legend class="lead">
                        NEWS
                    </legend>
                    <p>
                        Watch Rugby!8PM! TONIGHT!
                    </p>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="span8">
                <div class="box pattern pattern-sandstone">
                    <div class="box-header">
                        <i class="icon-list"></i>
                        <h5>My detail</h5>
                        
<!--detail-->

<body>
    <form id="form1" runat="server">
    <div>
    <table style="width: 100%; height: 66px;">
        <tr>
            <td style="width: 355px">Email:</td>
            <td>
                <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td style="width: 355px">Password:</td>
            <td>
                <asp:TextBox ID="TextBox2" runat="server" TextMode="Password"></asp:TextBox>
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td style="width: 355px">Phone Number:</td>
            <td>
                <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td style="width: 355px">Date of Birth:</td>
            <td>
                <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td style="width: 355px">Legal Name:</td>
            <td>
                <asp:TextBox ID="TextBox5" runat="server"></asp:TextBox>
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td style="width: 355px">Billing Address</td>
            <td>
                <asp:TextBox ID="TextBox6" runat="server"></asp:TextBox>
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td style="width: 355px">ServiceAddress</td>
            <td>
                <asp:TextBox ID="TextBox7" runat="server"></asp:TextBox>
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td style="width: 355px">PreferPayType:</td>
            <td>
                <asp:TextBox ID="TextBox8" runat="server"></asp:TextBox>
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td style="width: 355px">Card Number:</td>
            <td>
                <asp:TextBox ID="TextBox9" runat="server"></asp:TextBox>
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td style="width: 355px">Security Code:</td>
            <td>
                <asp:TextBox ID="TextBox10" runat="server"></asp:TextBox>
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td style="width: 355px">Card Holder Name:</td>
            <td>
                <asp:TextBox ID="TextBox11" runat="server"></asp:TextBox>
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td style="width: 355px">Card Expire Dates:</td>
            <td>
                <asp:TextBox ID="TextBox15" runat="server"></asp:TextBox>
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td style="width: 355px">Package:</td>
            <td>
                <asp:TextBox ID="TextBox12" runat="server"></asp:TextBox>
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td style="width: 355px">Devices:</td>
            <td>
                <asp:TextBox ID="TextBox13" runat="server"></asp:TextBox>
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td style="width: 355px">ContractLength:</td>
            <td>
                <asp:TextBox ID="TextBox14" runat="server"></asp:TextBox>
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td style="width: 355px">&nbsp;</td>
            <td>
                <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="Register" />
            </td>
            <td>&nbsp;</td>
        </tr>
    </table>
    </div>
    </form>
     
            
            <div class="span16">
                <div class="row">
                    <div class="span8">
                        

<script type="text/javascript">
    google.load('visualization', '1', {'packages': ['corechart']});
    google.setOnLoadCallback(drawVisualization);
    
    function drawVisualization() {
        visualization_data = new google.visualization.DataTable();
        
        visualization_data.addColumn('string', 'Task');
        
        visualization_data.addColumn('number', 'Hours per Day');
        
        
        visualization_data.addRow(['Work', 11]);
        
        visualization_data.addRow(['Eat', 2]);
        
        visualization_data.addRow(['Commute', 2]);
        
        visualization_data.addRow(['Watch TV', 2]);
        
        visualization_data.addRow(['Sleep', 7]);
        
      
        visualization = new google.visualization.PieChart(document.getElementById('piechart'));

        



        
        
        visualization.draw(visualization_data, {title: 'My Daily Activities', height: 260});

        
    }
</script>


                        

<script type="text/javascript">
    google.load('visualization', '1', {'packages': ['corechart']});
    google.setOnLoadCallback(drawVisualization);
    
    function drawVisualization() {
        visualization_data = new google.visualization.DataTable();
        
        visualization_data.addColumn('string', 'Task');
        
        visualization_data.addColumn('number', 'Hours per Day');
        
        
        visualization_data.addRow(['Work', 11]);
        
        visualization_data.addRow(['Eat', 2]);
        
        visualization_data.addRow(['Commute', 2]);
        
        visualization_data.addRow(['Watch TV', 2]);
        
        visualization_data.addRow(['Sleep', 7]);
        
      
        visualization = new google.visualization.ColumnChart(document.getElementById('barchart'));

        



        
        
        visualization.draw(visualization_data, {title: 'My Daily Activities', height: 300});

        
    }
</script>


        <footer class="application-footer">
            <div class="container">
                <p>Color/widget</p>
                <div class="disclaimer">
                    <p>Copyright © 2016 HANSEN Network Limited Terms of Use Domestic Terms Privacy Statement</p>
                </div>
            </div>
        </footer>
        
        <script src="../js/bootstrap/bootstrap-transition.js" type="text/javascript" ></script>
        <script src="../js/bootstrap/bootstrap-alert.js" type="text/javascript" ></script>
        <script src="../js/bootstrap/bootstrap-modal.js" type="text/javascript" ></script>
        <script src="../js/bootstrap/bootstrap-dropdown.js" type="text/javascript" ></script>
        <script src="../js/bootstrap/bootstrap-scrollspy.js" type="text/javascript" ></script>
        <script src="../js/bootstrap/bootstrap-tab.js" type="text/javascript" ></script>
        <script src="../js/bootstrap/bootstrap-tooltip.js" type="text/javascript" ></script>
        <script src="../js/bootstrap/bootstrap-popover.js" type="text/javascript" ></script>
        <script src="../js/bootstrap/bootstrap-button.js" type="text/javascript" ></script>
        <script src="../js/bootstrap/bootstrap-collapse.js" type="text/javascript" ></script>
        <script src="../js/bootstrap/bootstrap-carousel.js" type="text/javascript" ></script>
        <script src="../js/bootstrap/bootstrap-typeahead.js" type="text/javascript" ></script>
        <script src="../js/bootstrap/bootstrap-affix.js" type="text/javascript" ></script>
        <script src="../js/bootstrap/bootstrap-datepicker.js" type="text/javascript" ></script>
        <script src="../js/jquery/jquery-tablesorter.js" type="text/javascript" ></script>
        <script src="../js/jquery/jquery-chosen.js" type="text/javascript" ></script>
        <script src="../js/jquery/virtual-tour.js" type="text/javascript" ></script>
        <script type="text/javascript">
        $(function() {
            $('#sample-table').tablesorter();
            $('#datepicker').datepicker();
            $(".chosen").chosen();
        });
    </script>

</body>
</html>
