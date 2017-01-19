<%@ Page Title="" Language="C#" MasterPageFile="~/SClerk.Master" AutoEventWireup="true" CodeBehind="UpdateDepartment.aspx.cs" Inherits="Team11AD.UpdateDepartment" %>
<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
    Stationary Store Inventory System
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="bodytitle" runat="server">
    Update Department
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="body" runat="server">
    <div class="panel-body">
	    <div class="row"> 
            <div class="col-lg-1">
            </div>
            <div class="col-lg-5">
                 <div class="form-group">
                    <label>Department ID :</label>
                    <asp:TextBox ID="txtdid" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
                <div class="form-group">
                    <label>Department Name :</label>
                    <asp:TextBox ID="txtname" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
                 <div class="form-group">
                    <label>Contact Name :</label>
                    <asp:TextBox ID="tctcname" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
                 <div class="form-group">
                    <label>Phone :</label>
                    <asp:TextBox ID="txtphone" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
                 <div class="form-group">
                    <label>Fax :</label>
                    <asp:TextBox ID="txtfax" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
                <div class="form-group">
                    <label>Head's Name :</label>
                    <asp:TextBox ID="txthname" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
                <div class="form-group">
                    <label>Collection Point :</label>
                    <asp:TextBox ID="txtcpoint" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
                <div class="form-group">
                    <label>Collection Time :</label>
                    <asp:TextBox ID="txtctime" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
                <div class="form-group">
                    <label>Representative :</label>
                    <asp:TextBox ID="txtrep" runat="server" CssClass="form-control" TextMode="MultiLine"></asp:TextBox>
                </div>
                <div class="form-group" style="text-align:right">
                     <asp:Button ID="btnUpdate" runat="server" Text="Update" CssClass="btn btn-primary"/>
                </div>
            </div>
            <div class="col-lg-6">  
            </div>
        </div>
    </div>
</asp:Content>