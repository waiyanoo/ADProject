<%@ Page Title="" Language="C#" MasterPageFile="~/SClerk.Master" AutoEventWireup="true" CodeBehind="AddDepartment.aspx.cs" Inherits="Team11AD.Add_Department" %>
<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
    Stationary Store Inventory System
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="bodytitle" runat="server">
    New Department
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="body" runat="server">
    <div class="panel-body">
	    <div class="row"> 
            <div class="col-lg-1">
            </div>
            <div class="col-lg-5">
                <div class="form-group">
                    <label>Department ID :</label>
                    <asp:TextBox ID="txtid" runat="server" CssClass="form-control"></asp:TextBox>
                    <asp:RequiredFieldValidator id="RequiredFieldValidator1" runat="server"
                    ControlToValidate="txtid"
     ErrorMessage="ID is a required field."
   ForeColor="Red">
                </asp:RequiredFieldValidator>
                </div>

                <div class="form-group">
                    <label>Department Name :</label>
                    <asp:TextBox ID="txtdname" runat="server" CssClass="form-control"></asp:TextBox>
                    <asp:RequiredFieldValidator id="RequiredFieldValidator2" runat="server"
                    ControlToValidate="txtdname"
     ErrorMessage="Departname is a required field."
   ForeColor="Red">
                </asp:RequiredFieldValidator>
                </div>
                <div class="form-group">
                    <label>Contact Name :</label>
                    <asp:TextBox ID="txtcname" runat="server" CssClass="form-control"></asp:TextBox>
                      <asp:RequiredFieldValidator id="RequiredFieldValidator3" runat="server"
                    ControlToValidate="txtcname"
     ErrorMessage="Contact Name is a required field."
   ForeColor="Red">
                </asp:RequiredFieldValidator>
                </div>

                <div class="form-group">
                    <label>Head's Name :</label>
                    <asp:TextBox ID="txthname" runat="server" CssClass="form-control"></asp:TextBox>
                     <asp:RequiredFieldValidator id="RequiredFieldValidator4" runat="server"
                    ControlToValidate="txthname"
     ErrorMessage="Head's Name is a required field."
   ForeColor="Red">
                </asp:RequiredFieldValidator>
                </div>

                 <div class="form-group">
                    <label>Phone :</label>
                    <asp:TextBox ID="txtphone" runat="server" CssClass="form-control"></asp:TextBox>
                     <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server"
ErrorMessage="RegularExpressionValidator" ControlToValidate="txtphone"
ValidationExpression="[1-9]{7}" 
ForeColor="Red">Enter a 7 digit phone number</asp:RegularExpressionValidator>
                </div>

                <div class="form-group">
                    <label>Fax :</label>
                    <asp:TextBox ID="txtfax" runat="server" CssClass="form-control"></asp:TextBox>
                     <asp:RequiredFieldValidator id="RequiredFieldValidator6" runat="server"
                    ControlToValidate="txtfax"
     ErrorMessage="Fax is a required field."
   ForeColor="Red">
                </asp:RequiredFieldValidator>
                </div>

                <div class="form-group">
                    <label>Collection Point :</label>
                    <asp:TextBox ID="txtcpoint" runat="server" CssClass="form-control"></asp:TextBox>
                     <asp:RequiredFieldValidator id="RequiredFieldValidator7" runat="server"
                    ControlToValidate="txtcpoint"
     ErrorMessage="Collection Point is a required field."
   ForeColor="Red">
                </asp:RequiredFieldValidator>
                </div>
                <div class="form-group">
                    <label>Collection Time :</label>
                    <asp:TextBox ID="txtctime" runat="server" CssClass="form-control"></asp:TextBox>
                     <asp:RequiredFieldValidator id="RequiredFieldValidator8" runat="server"
                    ControlToValidate="txtctime"
     ErrorMessage="Collection Time is a required field."
     ForeColor="Red">
                </asp:RequiredFieldValidator>
                </div>
                <div class="form-group">
                    <label>Representative :</label>
                    <asp:TextBox ID="txtrep" runat="server" CssClass="form-control" TextMode="MultiLine"></asp:TextBox>
                     <asp:RequiredFieldValidator id="RequiredFieldValidator9" runat="server"
                    ControlToValidate="txtrep"
     ErrorMessage="Representative is a required field."
     ForeColor="Red">
                </asp:RequiredFieldValidator>
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
