<%@ Page Title="" Language="C#" MasterPageFile="~/SClerk.Master" AutoEventWireup="true" CodeBehind="DeliverOrder.aspx.cs" Inherits="Team11AD.DeliverOrder" %>
<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
    Stationary Store Inventory System
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="bodytitle" runat="server">
    Deliver Order
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="body" runat="server">
    <div class="panel-body">
	    <div class="row"> 
            <div class="col-lg-4">
                <div class="form-group">
                    <label>PO Number :</label>
                    <asp:DropDownList ID="ddponumber" runat="server" CssClass="form-control" AutoPostBack="True" OnSelectedIndexChanged="ddponumber_SelectedIndexChanged"></asp:DropDownList>
                </div>
                <div class="form-group">
                    <label>DO Number :</label>
                    <asp:RequiredFieldValidator id="RequiredFieldValidator1" runat="server"
                    ControlToValidate="txtdonumber" ErrorMessage="Delivery Code is a required field." ForeColor="Red">
                    </asp:RequiredFieldValidator>
                    
                    <asp:TextBox ID="txtdonumber" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
            </div>
            <div class="col-lg-1"></div>
            <div class="col-lg-4">
            </div>
        </div>
        <div class="row">
            <div class="col-lg-9">
                <div class="form-group">
                    <asp:GridView ID="GridView1" runat="server" CssClass="table table-responsive" AutoGenerateColumns="False" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
                        <Columns>
                            <asp:BoundField DataField="ItemID" HeaderText="Item ID" />
                            <asp:BoundField DataField="Qty" HeaderText="Quantity" />
                            <asp:BoundField DataField="Price" HeaderText="Price" />
                        </Columns>
                    </asp:GridView>
                </div>
                <div class="form-group" style="text-align:right">
                     <asp:Button ID="btnsubmit" runat="server" Text="Submit" CssClass="btn btn-primary" OnClick="btnsubmit_Click"/>
                </div>
                
            </div>
            <div class="col-lg-3">
            </div>
        </div>
    </div>
</asp:Content>
