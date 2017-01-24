<%@ Page Title="" Language="C#" MasterPageFile="~/SClerk.Master" AutoEventWireup="true" CodeBehind="ViewRequisitionList.aspx.cs" Inherits="Team11AD.ViewRequisitionList" %>
<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
    Stationary Store Inventory System
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="bodytitle" runat="server">
    View Requisition List
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="body" runat="server">
    <div class="panel-body">
	    <div class="row">
            <div class="col-lg-12">
                <asp:GridView ID="gvrequisition" runat="server" CssClass="table table-striped" AutoGenerateColumns="false"  OnRowEditing ="gvrequisition_RowEditing">
                     <Columns>
                        <asp:BoundField DataField="RequsitionId" HeaderText="Requisition ID"/>
                        <asp:BoundField DataField="Date" HeaderText="Submitted Date"/>
                        <asp:BoundField DataField="Name" HeaderText="Submitted Employee"/>
                        <asp:BoundField DataField="Status" HeaderText="Status"/>
                        <asp:CommandField ShowEditButton="true" EditText="Details" ButtonType="Link" ControlStyle-CssClass="btn btn-primary" />
                    </Columns>
                </asp:GridView>
            </div>
        </div>
     </div>
</asp:Content>
