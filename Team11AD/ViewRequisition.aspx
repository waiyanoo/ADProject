<%@ Page Title="" Language="C#" MasterPageFile="~/DUser.Master" AutoEventWireup="true" CodeBehind="ViewRequisition.aspx.cs" Inherits="Team11AD.ViewRequisition" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
    Stationary Store Inventory System
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="bodytitle" runat="server">
    View Requisition
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="body" runat="server">
    <div class="panel-body">
        <div class="row">
            <div class="col-lg-12">
                <div class="form-group">
                    <asp:GridView ID="gvrequisition" runat="server" Width="100%" CssClass="table table-striped" AutoGenerateColumns="false" 
                        AllowPaging="true" PageSize="10" AllowSorting="true" OnSorting="gvrequisition_Sorting" OnRowDeleting="gvrequisition_RowDeleting" OnRowEditing="gvrequisition_RowEditing" 
                        OnPageIndexChanging="gvrequisition_PageChanging" PagerSettings-Mode="Numeric" PagerStyle-Font-Size="Large" PagerSettings-Position="Bottom" >
                        <Columns>
                            <asp:BoundField DataField="RequisitionID" HeaderText="Requisition Form Number" HeaderStyle-Width="200px" SortExpression="RequisitionID"/>
                            <asp:BoundField DataField="Date" HeaderText="Submitted Date" DataFormatString="{0: dd/MM/yyyy}" htmlencode="false" HeaderStyle-Width="150px"/>
                            <asp:BoundField DataField="UserID.Name" HeaderText="Submitted Employee" />
                            <asp:BoundField DataField="Status" HeaderText="Status" />
                            <asp:CommandField ShowEditButton="true" ButtonType="Button" ControlStyle-CssClass="btn btn-primary" HeaderStyle-Width="100px"/>
                            <asp:CommandField ShowDeleteButton="true" ButtonType="Button" ControlStyle-CssClass="btn btn-primary" DeleteText="Cancel" HeaderStyle-Width="100px"/>
                        </Columns>
                    </asp:GridView>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
