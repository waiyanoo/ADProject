<%@ Page Title="" Language="C#" MasterPageFile="~/SClerk.Master" AutoEventWireup="true" CodeBehind="ViewAllStock.aspx.cs" Inherits="Team11AD.ViewAllStock" %>
<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
    Stationary Store Inventory System
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="bodytitle" runat="server">
    View All Stock
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
                    <asp:GridView ID="gvitemcatalog" runat="server" CssClass="table table-responsive" AutoGenerateColumns="False" PageSize="20" AllowPaging="True" OnPageIndexChanging="gvitemcatalog_PageIndexChanging" GridLines="None">
                        <Columns>
                            <asp:TemplateField HeaderText="#">
                            <ItemTemplate>
                                <%# Container.DataItemIndex + 1 %>
                            </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="ItemID" HeaderText="Item ID" />
                            <asp:BoundField DataField="Description" HeaderText="Description" />
                            <asp:BoundField DataField="CurrentQty" HeaderText="Current Quantity" />
                            <asp:BoundField DataField="ReorderLevel" HeaderText="Reorder Level" />
                            <asp:BoundField DataField="ReorderQty" HeaderText="Reorder Quantity" />
                            <asp:BoundField DataField="UnitOfMeasure" HeaderText="Unit Of Measure" />
                            <asp:BoundField DataField="CategoryName" HeaderText="Category Name" />
                        </Columns>
                    </asp:GridView>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
