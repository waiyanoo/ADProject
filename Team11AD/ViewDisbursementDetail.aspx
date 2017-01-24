<%@ Page Title="" Language="C#" MasterPageFile="~/SClerk.Master" AutoEventWireup="true" CodeBehind="ViewDisbursementDetail.aspx.cs" Inherits="Team11AD.ViewDisbursementDetail" %>
<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
Stationary Store Inventory System
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="bodytitle" runat="server">
    View Requisition Details 
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="body" runat="server">
    <div class="panel-body">
	    <div class="row">
            <div class="col-lg-5">
                <label>Requisition ID </label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;
                <asp:Label ID="RIDlable" runat="server" Text="Label"></asp:Label>
                <br />
                <br />
                <label>Employee Name </label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Label ID="EmployeeNamelable" runat="server" Text="Label"></asp:Label>
            </div>
            <div class="col-lg-10">
                <div class="form-group">
                    
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-1">
            </div>
            <div class="col-lg-8">
                <asp:GridView ID="gvrequisitiondetails" runat="server" CssClass="table table-striped" AutoGenerateColumns="false">
                     <Columns>
                        <asp:BoundField DataField="ItemId" HeaderText="Item ID"/>
                        <asp:BoundField DataField="ItemDescription" HeaderText="Item Description"/>
                        <asp:BoundField DataField="RequiredQty" HeaderText="Required Quantity"/>
                        <asp:BoundField DataField="FulfilledQty" HeaderText="Fulfilled Quantity"/>
                    </Columns>
                </asp:GridView>
            </div>
        </div>
    </div>
</asp:Content>
