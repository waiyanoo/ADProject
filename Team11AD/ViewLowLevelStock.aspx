<%@ Page Title="" Language="C#" MasterPageFile="~/SClerk.Master" AutoEventWireup="true" CodeBehind="ViewLowLevelStock.aspx.cs" Inherits="Team11AD.ViewLowLevelStock" %>
<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
    stationary
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="bodytitle" runat="server">
    
    View Low Level Stock
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="body" runat="server">
    <div class="panel-body">
        <div class="row">
            <div class="col-lg-12">
                <div class="form-group">
                    <asp:GridView ID="grlowlevelitem" runat="server"></asp:GridView>
                </div>
            </div>
            
        </div>
    </div>
</asp:Content>
