<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="ViewSupplier.aspx.cs" Inherits="Team11AD.ViewSupplier" %>
<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
    Stationary Store Inventory System
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="bodytitle" runat="server">
    View Supplier
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="body" runat="server">
     <div class="panel-body">
	    <div class="row">

            <div class="col-lg-12">
                <div class="form-group">
                    <asp:HyperLink ID="HyperLink1" NavigateUrl="AddSupplier.aspx" CssClass="btn btn-primary" runat="server">Add New</asp:HyperLink>
                </div>
                <asp:GridView ID="gvsupplier" runat="server" CssClass="table table-striped" AutoGenerateColumns="false" OnRowEditing="gvsupplier_RowEditing" GridLines="None">
                     <Columns>
                         <asp:TemplateField HeaderText="#">
                        <ItemTemplate>
                            <%# Container.DataItemIndex + 1 %>
                        </ItemTemplate>
                        </asp:TemplateField>
                       <asp:BoundField DataField="SupplierID" HeaderText="Supplier ID" />
                        <asp:BoundField DataField="SupplierName" HeaderText="Name"  />
                        <asp:BoundField DataField="ContactName" HeaderText="Contact" />
                        <asp:BoundField DataField="Phone" HeaderText="Phone" />
                        <asp:BoundField DataField="Fax" HeaderText="Fax" />
                        <asp:BoundField DataField="Address" HeaderText="Address" />
                        <asp:BoundField DataField="GSTNo" HeaderText="GSTNo" />
                        <asp:CommandField ShowEditButton="true" ButtonType="Link" ControlStyle-CssClass="btn btn-primary" />
                    </Columns>
                </asp:GridView>
            </div>
            
            
        </div>
     </div>
</asp:Content>
