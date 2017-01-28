<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Error.aspx.cs" Inherits="Team11AD.Error" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <link href="http://netdna.bootstrapcdn.com/twitter-bootstrap/2.3.2/css/bootstrap-combined.min.css" rel="stylesheet"/>

    <style type="text/css">
          .center {text-align: center; margin-left: auto; margin-right: auto; margin-bottom: auto; margin-top: auto;}

    </style>
     <script src="http://code.jquery.com/jquery-1.11.1.min.js"></script>
    <script src="http://netdna.bootstrapcdn.com/twitter-bootstrap/2.3.2/js/bootstrap.min.js"></script>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
          <div class="row">
            <div class="span12">
              <div class="hero-unit center">
                  <h2>Error:</h2>
                        <p></p>
                        <asp:Label ID="FriendlyErrorMsg" runat="server" Text="Label" Font-Size="Large" style="color: red"></asp:Label>

                        <asp:Panel ID="DetailedErrorPanel" runat="server" Visible="false">
                            <p>&nbsp;</p>
                            <h4>Detailed Error:</h4>
                            <p>
                                <asp:Label ID="ErrorDetailedMsg" runat="server" Font-Size="Small" /><br />
                            </p>

                            <h4>Error Handler:</h4>
                            <p>
                                <asp:Label ID="ErrorHandler" runat="server" Font-Size="Small" /><br />
                            </p>

                            <h4>Detailed Error Message:</h4>
                            <p>
                                <asp:Label ID="InnerMessage" runat="server" Font-Size="Small" /><br />
                            </p>
                            <p>
                                <asp:Label ID="InnerTrace" runat="server"  />
                            </p>
                        </asp:Panel>
                  <a href="LogIn.aspx" class="btn btn-large btn-info"><i class="icon-home icon-white"></i> Take Me Home</a>
                </div> 
            </div>
          </div>
        </div>
    </form>

</body>
</html>
