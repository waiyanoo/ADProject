<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="SetCollectionPoint.aspx.cs" Inherits="Team11AD.SetCollectionPoint" %>
<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
    Stationery Store Inventory System
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="bodytitle" runat="server">
    Set Collection Point
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="body" runat="server">
    <div class="panel-body">
	    <div class="row">  
            <div class="col-lg-1">
            </div>
            <div class="col-lg-5">
                <div class="form-group">
                    <label>Collection Point :</label>
                    <asp:DropDownList ID="ddcPoint" runat="server" CssClass="form-control" DataTextField = "CollectionPoint" 
                        DataValueField = "CollectionPointName" AutoPostBack="True" >
                    </asp:DropDownList>
                    <asp:TextBox ID="txtid" runat="server" Visible="False"></asp:TextBox>
                    
                </div>
                <div class="form-group">
                    <label>Collection Time :</label>
                    <asp:DropDownList ID="ddcTime" runat="server" CssClass="form-control" DataTextField = "CollectionTime" 
                        DataValueField = "CollectionTime" AutoPostBack="True" >
                        <asp:ListItem>9:30 AM</asp:ListItem>
                        <asp:ListItem>11:00 AM</asp:ListItem>
                    </asp:DropDownList>
                </div>
                
                <div class="form-group" style="text-align:right">
                     <asp:Button ID="btnSet" runat="server" Text="Set" CssClass="btn btn-primary" OnClick="btnSet_Click" />
                </div>
            </div>
            <div class="col-lg-6">  
            </div>
        </div>
    </div>
</asp:Content>
