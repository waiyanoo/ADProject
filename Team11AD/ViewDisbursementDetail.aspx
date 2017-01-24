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
            <div class="col-lg-3">
                <div class="form-group">
                    <label>Requisition ID :</label>
                </div>
                
                <div class="form-group">
                    <label>Employee Name :</label>
                </div>
                
               
                
            </div>
            <div class="col-lg-3">
               <div class="form-group">
                    <asp:Label ID="RIDlable" runat="server" Text="Label"></asp:Label>
                </div>
                <div class="form-group">
                    <asp:Label ID="EmployeeNamelable" runat="server" Text="Label"></asp:Label>
                </div>
            </div>
        </div>
        <div class="row">
            
            <div class="col-lg-10">
                <asp:GridView ID="gvrequisitiondetails" runat="server" CssClass="table table-striped" AutoGenerateColumns="false" GridLines="None">
                     <Columns>
                          <asp:TemplateField HeaderText="#">
                            <ItemTemplate>
                                <%# Container.DataItemIndex + 1 %>
                            </ItemTemplate>
                            </asp:TemplateField>
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
