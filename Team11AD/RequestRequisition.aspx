<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="RequestRequisition.aspx.cs" Inherits="Team11AD.View.RequestRequisition" %>
<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
    Stationary Store Inventory System
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="bodytitle" runat="server">
    Request Requisition
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="body" runat="server">
    <div class="panel-body">
	    <div class="row">
            
            <div class="col-lg-9"></div>
            
            <div class="col-lg-4">
                <div class="form-group">
                    <label>Item Category :</label>
                    <asp:DropDownList ID="ddcategory" runat="server" CssClass="form-control" OnSelectedIndexChanged="ddcategory_SelectedIndexChanged" AutoPostBack="True"></asp:DropDownList>
                </div>
                <div class="form-group">
                    <label>Item Description :</label>
                    <asp:DropDownList ID="dditemdescription" runat="server" CssClass="form-control"></asp:DropDownList>
                </div>
                <div class="form-group">
                    <label>Item Quantity :</label><asp:Label ID="lblqty" runat="server" ForeColor="Red" Text=""></asp:Label>
                    <asp:TextBox ID="txtqty" runat="server" CssClass="form-control"/>
                </div>
                <div class="form-group" style="text-align:right">
                    <asp:Button ID="btnadd" runat="server" Text="Add" CssClass="btn btn-primary" OnClick="btnadd_Click"/>
                </div>
                
            </div>
            
        </div>
        <div class="row">
            <div class="col-lg-9">
                <div class="form-group">
                    <asp:GridView ID="gvitemlist" runat="server" CssClass="table table-striped" GridLines="None" OnRowDeleting="gvitemlist_RowDeleting">
                        <Columns>
                            <asp:CommandField DeleteText="Remove" ShowDeleteButton="true" ButtonType="Link"/>
                        </Columns>
                    </asp:GridView>
                    
                </div>
                <div class="form-group" style="text-align:right">
                     <asp:Button ID="btnsend" runat="server" Text="Send Request" CssClass="btn btn-primary" OnClick="btnsend_Click"/>
                </div>
                
            </div>
            <div class="col-lg-3">
            </div>

        </div>
    </div>
</asp:Content>
