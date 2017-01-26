<%@ Page Title="" Language="C#" MasterPageFile="~/SClerk.Master" AutoEventWireup="true" CodeBehind="PurchaseOrder.aspx.cs" Inherits="Team11AD.PurchaseOrder" %>
<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
    Stationary Store Inventory System
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="bodytitle" runat="server">
    Purchase Order
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="body" runat="server">
   <div class="panel-body">
	    <div class="row">
            
        <div class="col-lg-4">
                <div class="form-group">
                    <label>Order Date :</label>
                    <asp:TextBox ID="txtorderdate" runat="server" CssClass="form-control">Date Need to find out</asp:TextBox>
                </div>
                <div class="form-group">
                    <label>Supplier :</label>
                    <asp:TextBox ID="txtsupplier" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
                
            </div>
            <div class="col-lg-1"></div>
            <div class="col-lg-4">
                
            </div>
        </div>
        <div class="row">
            <div class="col-lg-9">
                <div class="form-group">
                    <asp:GridView ID="ordergridview" OnSelectedIndexChanged ="Page_Load" GridLines="None" CssClass="table table-striped" autogeneratecolumns ="False" runat="server">
                        <Columns>
                            <asp:BoundField DataField="Sequence" HeaderText="#" />
                            <asp:BoundField DataField="Itemno" HeaderText="Item No" />
                            <asp:BoundField DataField="Description" HeaderText="Description" />
                            <asp:BoundField DataField="Recommended_reorder_qty" HeaderText="Recommended Reorder Qty" />
                            <asp:TemplateField  HeaderText="Order Qty">
                                <ItemTemplate>
                                    <asp:TextBox ID="textbox1" OnTextChanged ="Page_Load" runat="server" />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="Price" HeaderText="Price" />
                        </Columns>
                    </asp:GridView>
                </div>
                <div class="form-group" style="text-align:right">
                     <asp:Button ID="btnorder" runat="server" Text="Order" CssClass="btn btn-primary" OnClick="btnorder_Click"/>
                </div>
                
            </div>
            <div class="col-lg-3">
            </div>

        </div>
    </div>
</asp:Content>
