<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="PayTVWebSelfCare._Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <title>Bootstrap Example</title>

  <meta charset="utf-8"/>

  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>

  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css"/>

  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>

  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>

  <style>

        #container2 {
        overflow:hidden;
        position:relative;
        width:90%;
        min-width:800px;
        margin-bottom:20px;
        margin-top:20px;
        margin-left:auto;
        margin-right:auto;
        }
.leftimage {
     width:600px;
     height:100px;
        }
        .righttext {    
        float:right;
        }

    /*right_column*/
    .right_column {
        display: inline-block;
        float: left;
        position: absolute;
    }


    /* slider */
      .carousel-inner > .item > img,
      .carousel-inner > .item > a > img {
          width: 85%;
          margin-left:7.5%;
      }
    /* Remove the navbar's default margin-bottom and rounded borders */ 



    .navbar {

      margin-bottom: 0;

      border-radius: 0;

    }



    h1 {

        text-align: center;

    }



    .register_button {

        margin-left: 43.5%;

    }


    .textbox {
        display: inline-block;
        float: right;
    }


/*  SECTIONS  */

.section {

	clear: both;

	padding: 0px;

	margin: 0px;

}



/*  COLUMN SETUP  */

.col {

	display: block;

	float:left;

	margin: 1% 0 1% 1.6%;

}

.col:first-child { margin-left: 0; }


/* reister button position*/
.LoginMessage {
    position: relative;
}

/*  GROUPING  */

.group:before,

.group:after { content:""; display:table; }

.group:after { clear:both;}

.group { zoom:1; /* For IE 6/7 */ }

/*  GRID OF THREE  */

.span_3_of_3 { width: 10%; }

.span_2_of_3 { width: 80%; }

.span_1_of_3 { width: 10%; }

          col span_2_of_3 {
              box-shadow: 10px 10px 5px #888888;
          }





          .auto-style3 {
              margin-bottom: 25;
          }

          .auto-style4 {
              height: 27px;
              margin-bottom: 25;
              width: 45px;
          }

          .auto-style6 {
              height: 28px;
              width: 20px;
              margin-bottom: 25;
          }

          .auto-style7 {
              height: 43px;
              margin-bottom: 25;
              width: 45px;
          }





          .auto-style11 {
              width: 80%;
              margin-right: 51px;
              height: 134px;
          }





          .auto-style12 {
              height: 41px;
              width: 32px;
          }

                    



          .auto-style22 {
              width: 32px;
          }

          .auto-style23 {
              height: 41px;
              width: 45px;
          }





          .auto-style24 {
              width: 77%;
          }

/*  GO FULL WIDTH BELOW 480 PIXELS */

      @media only screen and (max-width: 480px) {

          .col {
              margin: 1% 1% 1% 1%;
          }

          .slider {
              width: 120%;
          }


          .span_3_of_3, .span_2_of_3, .span_1_of_3 {
              width: 120%;
          }

          body {
              font-size: 100%;
          }


      }


      .auto-style30 {
          position: absolute;
          bottom: 10px;
          left: 50%;
          z-index: 15;
          width: 60%;
          text-align: center;
          list-style-type: none;
          height: 20px;
          margin-left: -30%;
          padding-left: 0;
      }


      .auto-style31 {
          height: 43px;
          width: 20px;
      }
      .auto-style32 {
          height: 43px;
          width: 32px;
      }


      .auto-style33 {
          height: 41px;
          width: 20px;
      }


      </style>

</asp:Content>













<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">






<div class="section group">

	<div class="col span_1_of_3">

	

	</div>


	<div class="col span_2_of_3" style="width: 80%" >

	   
      <h1>Sign up for exciting programs!</h1>

<div class="container">
  <br>

    <div class="slider">

  <div id="myCarousel" class="carousel slide" data-ride="carousel">
    <!-- Indicators -->
    <ol class="auto-style30">
      <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
      <li data-target="#myCarousel" data-slide-to="1"></li>
      <li data-target="#myCarousel" data-slide-to="2"></li>
      <li data-target="#myCarousel" data-slide-to="3"></li>
    </ol>

    <!-- Wrapper for slides -->
    <div class="carousel-inner" role="listbox">
      <div class="item active">
        <img src="http://s33.postimg.org/8zm6w3vsf/image.jpg" alt="Chania" height="200" class="auto-style24" />
      </div>

      <div class="item">
        <img src="http://s33.postimg.org/b6of3txb3/image.jpg" alt="Chania" width="280" height="200"/>
      </div>
    
      <div class="item">
        <img src="http://s33.postimg.org/fytop2f33/image.jpg" alt="Flower" width="280" height="200"/>
      </div>

      <div class="item">
        <img src="http://s33.postimg.org/hddce73kv/image.jpg" alt="Flower" width="280" height="200"/>
      </div>
    </div>

    <!-- Left and right controls -->
  <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
    <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
    <span class="sr-only">Previous</span>
  </a>
  <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
    <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
    <span class="sr-only">Next</span>
  </a>
</div>
  </div>
    </div>    
        <hr />
        <div class="LoginMessage">
            <center>
    <asp:Button ID="RegisterButton" runat="server" Text="Register now!" OnClick="Button1_Click" Width="134px" Height="37px" />
            </center>
    </div>    
       &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;    
       <hr /> 
        

       
        <div id="container2" style="white-space:nowrap">
    </div>
           

        <div id="texts" style="display:inline; white-space:nowrap;"> 
         <table class="auto-style11">
        
            <tr>

                <div class="large-12 columns">

                <td class="auto-style23">Username/Email: </td>


                <td class="auto-style33">

                    <asp:TextBox ID="UserName" runat="server" Width="220px" CssClass="col-xs-offset-0"></asp:TextBox>

                </td>

                <td class="auto-style12">&nbsp;</td>

                </div>

            </tr>

            <tr>
                <div class="large-12 columns">

                <td class="auto-style7">Password:</td>

                <td class="auto-style31">

                    <asp:TextBox ID="UserPassword" runat="server" TextMode="Password" Width="220px" CssClass="auto-style3"></asp:TextBox>

                </td>

                <td class="auto-style32"></td>

                 </div>

            </tr>

            <tr>

                <div class="large-12 columns">

                <td class="auto-style4">&nbsp;</td>

                    
                <td class="auto-style6">
                    

                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Button ID="LoginButton" runat="server" OnClick="Button2_Click" Text="Login" Height="37px" Width="110px" />

                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

                &nbsp;

                </td>

                    

                <td class="auto-style22">

                    &nbsp;</td>
                        
                      </tr>
        </table>
    </div>
       </div>
 </div>
    </div>
    
    &nbsp;<div class="col span_3_of_3">

	    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

	</div>

    </asp:Content>