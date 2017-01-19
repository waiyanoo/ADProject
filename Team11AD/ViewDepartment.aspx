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
           <asp:GridView ID="gvdepartment" runat="server" CssClass="table table-striped" AutoGenerateColumns="False" OnSelectedIndexChanged="gvdepartment_SelectedIndexChanged" OnRowEditing="gvdepartment_RowEditing" OnRowDeleting="gvdepartment_RowDeleting" >
               <Columns>
                    <asp:BoundField DataField="DepartmentID" HeaderText="Department ID" />
                    <asp:BoundField DataField="DepartmentName" HeaderText="Department Name" />
                   <asp:BoundField DataField="ContactName" HeaderText="Contact Name" />
                   <asp:BoundField DataField="Phone" HeaderText="Phone" />
                   <asp:BoundField DataField="Fax" HeaderText="Fax" />
                   <asp:BoundField DataField="HeadName" HeaderText="Head Name" />
                   <asp:BoundField DataField="CollectionPoint" HeaderText="Collection Point" />
                   <asp:BoundField DataField="CollectionTime" HeaderText="Collection Time" />
                   <asp:BoundField DataField="Representative" HeaderText="Representative" />

                    <asp:CommandField ShowEditButton="true" ButtonType="Link" ControlStyle-CssClass="btn btn-primary" />
                    <asp:CommandField ShowDeleteButton="true" ButtonType="Link" ControlStyle-CssClass="btn btn-primary" />
               </Columns>
            </asp:GridView>  
         
        </div>
    </div>
</asp:Content>
