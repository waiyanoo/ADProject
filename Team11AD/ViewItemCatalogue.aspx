<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="ViewItemCatalogue.aspx.cs" Inherits="Team11AD.ViewItemCatalogue" %>
<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
    Stationary Store Inventory System
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
                <asp:Button ID="btnsearch" runat="server" Text="Search" CssClass="btn btn-primary" OnClick="btnsearch_Click" />
            </div>
        </div>
        <div class="row">
            <div class="col-lg-12">
                <div class="form-group">
                    <asp:GridView ID="gvitemcatalog" runat="server" CssClass="table table-responsive" AutoGenerateColumns="False" 
                        GridLines="None" PageSize="12" AllowPaging="True" OnPageIndexChanging="gvitemcatalog_PageIndexChanging">
                        <Columns>
                             <asp:TemplateField HeaderText="#">
                            <ItemTemplate>
                                <%# Container.DataItemIndex + 1 %>
                            </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="ItemID" HeaderText="Item ID" />
                            <asp:BoundField DataField="Description" HeaderText="Description" />
                            <asp:BoundField DataField="ReorderLevel" HeaderText="Reorder Level" />
                            <asp:BoundField DataField="ReorderQty" HeaderText="Reorder Quantity" />
                            <asp:BoundField DataField="UnitOfMeasure" HeaderText="Unit Of Measure" />
                            <asp:BoundField DataField="CategoryName" HeaderText="Category Name" />
                        </Columns>
                        <PagerStyle HorizontalAlign = "Right" CssClass = "GridPager" />
                    </asp:GridView>
                </div>
                
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
