<%@ Page Title="" Language="C#" MasterPageFile="~/SClerk.Master" AutoEventWireup="true" CodeBehind="ViewDepartment.aspx.cs" Inherits="Team11AD.ViewDepartment" %>
<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
    Stationary Store Inventory System
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="bodytitle" runat="server">
    View Department
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="body" runat="server">
    <div class="panel-body">
        <div class="row">
            <div class="col-lg-12">
               <div class="form-group">
                    <asp:HyperLink ID="HyperLink1" NavigateUrl="AddDepartment.aspx" CssClass="btn btn-primary" runat="server">Add New</asp:HyperLink>
                </div>
               <asp:GridView ID="gvdepartment" runat="server" CssClass="table table-striped" AutoGenerateColumns="False" OnSelectedIndexChanged="gvdepartment_SelectedIndexChanged" OnRowEditing="gvdepartment_RowEditing" GridLines="None">
                   <Columns>
                       <asp:TemplateField HeaderText="#">
                        <ItemTemplate>
                            <%# Container.DataItemIndex + 1 %>
                        </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="DepartmentID" HeaderText="Department ID" />
                        <asp:BoundField DataField="DepartmentName" HeaderText="Department Name" />
                       <asp:BoundField DataField="ContactName" HeaderText="Contact Name" />
                       <asp:BoundField DataField="Phone" HeaderText="Phone" />
                       <asp:BoundField DataField="Fax" HeaderText="Fax" />
                       <asp:BoundField DataField="CollectionPointName" HeaderText="Collection Point" />
                       <asp:BoundField DataField="CollectionTime" HeaderText="Collection Time" />
                       <asp:BoundField DataField="Representative" HeaderText="Representative" />

                        <asp:CommandField ShowEditButton="true" ButtonType="Link" ControlStyle-CssClass="btn btn-primary" />
                   
                   </Columns>
                </asp:GridView>  
            </div>
        </div>
    </div>
</asp:Content>
