<%@ Page Title="" Language="C#" MasterPageFile="~/DUser.Master" AutoEventWireup="true" CodeBehind="UpdateRequisition.aspx.cs" Inherits="Team11AD.UpdateRequisition" %>
<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
    Stationary Store Inventory System
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="bodytitle" runat="server">
    Update Requisition
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="body" runat="server">
    <div class="panel-body">
	    <div class="row">
            
            <div class="col-lg-4">
                <div class="form-group">
                    <label>Requisition Number :</label>
                    <asp:TextBox ID="txtrequisitionnumber" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
                <div class="form-group">
                    <label>Department Name :</label>
                    <asp:TextBox ID="txtdepartmentname" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
                <div class="form-group">
                    <label>Employee Name :</label>
                    <asp:TextBox ID="txtemployeename" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
                
            </div>
            <div class="col-lg-1"></div>
            <div class="col-lg-4">
                <div class="form-group">
                    <label>Item Category :</label>
                    <asp:DropDownList ID="dditemcategory" runat="server" CssClass="form-control"></asp:DropDownList>
                </div>
                <div class="form-group">
                    <label>Item Description :</label>
                    <asp:DropDownList ID="dditemdescritption" runat="server" CssClass="form-control"></asp:DropDownList>
                </div>
                <div class="form-group">
                    <label>Item Quantity :</label>
                    <asp:TextBox ID="txtitemqty" runat="server" CssClass="form-control"/>
                </div>
                <div class="form-group" style="text-align:right">
                    <asp:Button ID="btnadd" runat="server" Text="Add" CssClass="btn btn-primary"/>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-9">
                <div class="form-group">
                    <table style="width: 100%;" class="table table-bordered">
                            <tr>
                                <td>Need </td>
                                <td>to</td>
                                <td>Replace</td>
                            </tr>
                            <tr>
                                <td>&nbsp;</td>
                                <td>&nbsp;</td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td>&nbsp;</td>
                                <td>&nbsp;</td>
                                <td>&nbsp;</td>
                            </tr>
                        </table>
                </div>
                <div class="form-group" style="text-align:right">
                     <asp:Button ID="btnupdate" runat="server" Text="Update" CssClass="btn btn-primary"/>
                </div>
                
            </div>
            <div class="col-lg-3">
            </div>

        </div>
    </div>
</asp:Content>
