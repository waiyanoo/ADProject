<%@ Page Title="" Language="C#" MasterPageFile="~/SClerk.Master" AutoEventWireup="true" CodeBehind="ViewItemCatalogue.aspx.cs" Inherits="Team11AD.ViewItemCatalogue" %>
<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="bodytitle" runat="server">
    View Item Catalogue
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="body" runat="server">
    <div class="panel-body">
	    <div class="row">
            <div class="col-lg-3" style="text-align:right">
                <label>Search Item Description :</label>
            </div>
            <div class="col-lg-4">
                <div class="form-group">
                    <asp:TextBox ID="txtsearch" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
            </div>
            <div class="col-lg-4">
                <asp:Button ID="btnsearch" runat="server" Text="Search" CssClass="btn btn-primary" />
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
                
            </div>
            <div class="col-lg-3">
            </div>
        </div>
    </div>
</asp:Content>
