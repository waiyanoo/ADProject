<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="UpdateDepartment.aspx.cs" Inherits="Team11AD.UpdateDepartment" %>
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
                    <asp:TextBox ID="txtcname" runat="server" CssClass="form-control"></asp:TextBox>
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
                    <asp:DropDownList ID="ddcollection" runat="server" CssClass="form-control">
                        <asp:ListItem>Administration Building</asp:ListItem>
                        <asp:ListItem>Engineering School</asp:ListItem>
                        <asp:ListItem>Management School</asp:ListItem>
                        <asp:ListItem>Medical School</asp:ListItem>
                        <asp:ListItem>Science School</asp:ListItem>
                        <asp:ListItem>University Hospital</asp:ListItem>
                    </asp:DropDownList>
                </div>
                <div class="form-group">
                    <label>Collection Time :</label>
                    <asp:DropDownList ID="ddcollectiontime" runat="server" CssClass="form-control">
                        <asp:ListItem>9:30 AM</asp:ListItem>
                        <asp:ListItem>11:00 PM</asp:ListItem>
                    </asp:DropDownList>
                </div>
                <div class="form-group">
                    <label>Representative :</label>
                    <asp:TextBox ID="txtrep" runat="server" CssClass="form-control" TextMode="MultiLine"></asp:TextBox>
                </div>
                <div class="form-group" style="text-align:right">
                     <asp:Button ID="btnUpdate" runat="server" Text="Update" CssClass="btn btn-primary" OnClick="btnUpdate_Click"/>
                </div>
            </div>
            <div class="col-lg-6">  
            </div>
        </div>
    </div>
</asp:Content>