<%@ Page Title="" Language="C#" MasterPageFile="~/SClerk.Master" AutoEventWireup="true" CodeBehind="AddSupplier.aspx.cs" Inherits="Team11AD.AddSupplier" %>
<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
    Stationary Store Inventory System
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="bodytitle" runat="server">
    New Supplier
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="body" runat="server">
    <div class="panel-body">
	    <div class="row"> 
            <div class="col-lg-1">
            </div>
            <div class="col-lg-5">
                <div class="form-group">
                    <label>Supplier Code :</label> <asp:RequiredFieldValidator id="RequiredFieldValidator1" runat="server"
                    ControlToValidate="txtcode"
     ErrorMessage="Supplier Code is a required field."
   ForeColor="Red">
                </asp:RequiredFieldValidator>
                    <asp:TextBox ID="txtcode" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
                <div class="form-group">
                    <label>Name :</label><asp:RequiredFieldValidator id="RequiredFieldValidator7" runat="server"
                    ControlToValidate="txtname"
     ErrorMessage="Name is a required field."
     ForeColor="Red">
                </asp:RequiredFieldValidator>
                    <asp:TextBox ID="txtname" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
                <div class="form-group">
                    <label>Contact Name :</label><asp:RequiredFieldValidator id="RequiredFieldValidator8" runat="server"
                    ControlToValidate="txtcontactname"
      ErrorMessage="Contact Name is a required field."
      ForeColor="Red">
                </asp:RequiredFieldValidator>
                    <asp:TextBox ID="txtcontactname" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
                <div class="form-group">
                    <label>Phone :</label><asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server"
ErrorMessage="RegularExpressionValidator" ControlToValidate="txtphone"
ValidationExpression="[1-9]{7}" 
ForeColor="Red">Enter a 7 digit phone number</asp:RegularExpressionValidator>
                    <asp:TextBox ID="txtphone" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
                <div class="form-group">
                    <label>Fax :</label> <asp:RequiredFieldValidator id="RequiredFieldValidator9" runat="server"
                    ControlToValidate="txtfax"
      ErrorMessage="Fax is a required field."
   ForeColor="Red">
                </asp:RequiredFieldValidator>
                
                    <asp:TextBox ID="txtfax" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
                <div class="form-group">
                    <label>Address :</label><asp:RequiredFieldValidator id="RequiredFieldValidator10" runat="server"
                    ControlToValidate="txtaddress"
      ErrorMessage="Address is a required field."
   ForeColor="Red">
                </asp:RequiredFieldValidator>
                    <asp:TextBox ID="txtaddress" runat="server" CssClass="form-control" TextMode="MultiLine"></asp:TextBox>
                </div>
                <div class="form-group">
                    <label>GST Number :</label><asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server"
                    ErrorMessage="RegularExpressionValidator" ControlToValidate="txtgst"
                    ValidationExpression="[A-Z]{2}-\d{7}-\d{1}" 
                    ForeColor="Red">Enter a valid GST Number</asp:RegularExpressionValidator>
                    <asp:TextBox ID="txtgst" runat="server" CssClass="form-control" TextMode="SingleLine"></asp:TextBox>
                </div>
                <div class="form-group" style="text-align:right">
                     <asp:Button ID="btnSave" runat="server" Text="Save" CssClass="btn btn-primary" OnClick="btnSave_Click"/>
                </div>
            
            </div>
            <div class="col-lg-6">  
  
            </div>
        </div>
    </div>
</asp:Content>
