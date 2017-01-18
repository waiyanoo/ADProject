<%@ Page Title="" Language="C#" MasterPageFile="~/SClerk.Master" AutoEventWireup="true" CodeBehind="RequestAdjustment.aspx.cs" Inherits="Team11AD.RequestAdjustment" %>
<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="bodytitle" runat="server">
    Request Adjustment
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="body" runat="server">
    <div class="panel-body">
	    <div class="row"> 
            <div class="col-lg-4">
                <div class="form-group">
                    <label>Category :</label>
                    <asp:DropDownList ID="ddponumber" runat="server" CssClass="form-control"></asp:DropDownList>
                </div>
                <div class="form-group">
                    <label>Item Description :</label>
                    <asp:DropDownList ID="dditemdescription" runat="server" CssClass="form-control"></asp:DropDownList>
                </div>
                <div class="form-group">
                    <label>Adjustment Quantity:</label>
                    <asp:TextBox ID="txtdeliverydate" runat="server" CssClass="form-control">Date Need to find out</asp:TextBox>
                </div>
                <div class="form-group">
                    <label>Reason :</label>
                    <asp:TextBox ID="txtremark" runat="server" CssClass="form-control" TextMode="MultiLine"></asp:TextBox>
                </div>
                <div class="form-group">
                    <asp:Button ID="Button1" runat="server" Text="Button" CssClass="btn btn-primary"/>
                    
                </div>
                
            </div>
            <div class="col-lg-1"></div>
            <div class="col-lg-4"></div>
        </div>
        <div class="row">
            <div class="col-lg-9">
                <div class="form-group">
                    <asp:GridView ID="gvItemList" runat="server"></asp:GridView>
                </div>
            </div>
            <div class="col-lg-3">
            </div>

        </div>
    </div>
</asp:Content>
