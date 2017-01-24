<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LogIn.aspx.cs" Inherits="Team11AD.LogIn" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
     <link href="../style/css/bootstrap.min.css" rel="stylesheet"/>
    <link href="../style/css/sb-admin.css" rel="stylesheet"/>
</head>
<body>
    <form id="form1" runat="server">
    <div id="wrapper">

        <!-- Navigation -->
        <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="index.html">Stationary Store Inventory System</a>
            </div>
            <!-- Top Menu Items -->
            <ul class="nav navbar-right top-nav">
                <li>
                    <a href="#" data-toggle="dropdown">Contact Us</a>
                </li>
				 <li>
                    <a href="#" data-toggle="dropdown">About</a>
                </li>
            </ul> 
        </nav>
        </div> 
         <div class="container">
        <div class="row">
            <div class="col-lg-4">

            </div>
            <div class="col-lg-4">
                <h2 class="form-signin-heading">Please sign in</h2>
                <label for="inputEmail" class="sr-only">Email address</label>
                <asp:TextBox ID="txtusername" runat="server" CssClass="form-control"></asp:TextBox>
        
                <label for="inputPassword" class="sr-only">Password</label>
                <asp:TextBox ID="txtpassword" TextMode="Password" runat="server" CssClass="form-control"></asp:TextBox>
        
                <button class="btn btn-lg btn-primary btn-block" type="submit">Sign in</button>
            </div>
            <div class="col-lg-4">

            </div>
        </div>

    </div>
   
        
            
        

    <!-- /container -->
    </form>
    <!-- jQuery -->
    <script src="../style/js/jquery.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="../style/js/bootstrap.min.js"></script>
</body>
</html>
