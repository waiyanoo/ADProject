<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LogIn.aspx.cs" Inherits="Team11AD.LogIn" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta name="viewport" content="width=device-width, initial-scale=1"/>
    <title>Stationary Inventory Management System</title>

     <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"/>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <link href="../style/css/sb-admin.css" rel="stylesheet"/>
</head>
<body>
<form id="form1" runat="server">
    <div class="container">    
        <div id="loginbox" style="margin-top:50px;" class="mainbox col-md-6 col-md-offset-3 col-sm-8 col-sm-offset-2">                    
            <div class="panel panel-info" >
                <div class="panel-heading">
                    <div class="panel-title">Logic University</div>
                </div>     
                <div style="padding-top:30px" class="panel-body" >       
                    <div style="margin-bottom: 25px" class="input-group">
                        <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                        <asp:TextBox ID="txtusername" runat="server" CssClass="form-control" placeholder="Username"></asp:TextBox>                                    
                    </div>
                                
                    <div style="margin-bottom: 25px" class="input-group">
                        <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
                        <asp:TextBox ID="txtpassword" TextMode="Password" runat="server" CssClass="form-control" placeholder="Password"></asp:TextBox>
                        
                    </div>
                          <asp:Label ID="lblmessage" runat="server" Text="" ForeColor="#CC3300"></asp:Label>      
                    <div style="margin-top:10px" class="form-group">
                                <!-- Button -->
                        <div class="col-sm-12 controls" style="text-align:center">
                            <asp:Button ID="Button1" runat="server" Text="Login" CssClass="btn btn-success" OnClick="Button1_Click" />
                            
                        </div>
                    </div>
                </div>                     
            </div>  
        </div>
        
    </div>
</form>

</body>
</html>
