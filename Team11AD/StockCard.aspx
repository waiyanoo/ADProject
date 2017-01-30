<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="StockCard.aspx.cs" Inherits="Team11AD.StockCard" %>
<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
    Stationary Store Inventory System
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="bodytitle" runat="server">
    Stock Card
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="body" runat="server">
    <div class="panel-body">
        <div class="row">
            <div class="col-lg-4">
                <div class="form-group">
                    <label>Item Category :</label>
                    <asp:DropDownList ID="ddcategory" runat="server" CssClass="form-control" OnSelectedIndexChanged="ddcategory_SelectedIndexChanged" AutoPostBack="True"></asp:DropDownList>
                </div>
                <div class="form-group">
                    <label>Item Description :</label>
                    <asp:DropDownList ID="dditemdescription" runat="server" CssClass="form-control"></asp:DropDownList>
                </div>
                <div class="form-group" style="text-align:right">
                    <asp:Button ID="btnadd" runat="server" Text="Show" CssClass="btn btn-primary" OnClick="btnadd_Click"/>
                </div>
                
            </div>
        </div>
	    <div class="row">
            <div class="col-lg-10">
                <asp:GridView ID="gvstock" runat="server" CssClass="table table-striped" GridLines="None" AutoGenerateColumns="false">
                    <Columns>
                         <asp:BoundField DataField="TDate" HeaderText="Date" HeaderStyle-Width="200px" />
                        <asp:BoundField DataField="Description" HeaderText="Description" HeaderStyle-Width="400px" />
                        <asp:BoundField DataField="DQty" HeaderText="Quantity" HeaderStyle-Width="100px" />
                           
                    </Columns>
                </asp:GridView>
            </div>
	    </div>
    </div>
    
<style type="text/css">
    
    .GridPager a, .GridPager span
    {
        display: block;
        height: 20px;
        width: 15px;
        font-weight: bold;
        text-align: center;
        text-decoration: none;
    }
    .GridPager a
    {
        background-color: #ffffff;
        color: #969696;
        border: 1px solid #ddd;
    }
    .GridPager span
    {
        background-color: #A1DCF2;
        color: #000;
        border: 1px solid #3AC0F2;
    }
</style>

</asp:Content>
