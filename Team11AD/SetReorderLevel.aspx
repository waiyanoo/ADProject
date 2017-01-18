﻿<%@ Page Title="" Language="C#" MasterPageFile="~/SClerk.Master" AutoEventWireup="true" CodeBehind="SetReorderLevel.aspx.cs" Inherits="Team11AD.SetReorderLevel" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="bodytitle" runat="server">
    Set Reorder Level & Quantity
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="body" runat="server">
    <div class="panel-body">
        <div class="row">
            <div class="col-lg-4">
                <div class="form-group">
                    <label>Category :</label>
                    <asp:DropDownList ID="ddcategory" runat="server" CssClass="form-control" OnSelectedIndexChanged="ddcategory_SelectedIndexChanged"></asp:DropDownList>
                </div>
                <div class="form-group">
                    <label>Item Description :</label>
                    <asp:DropDownList ID="dditem" runat="server" CssClass="form-control"></asp:DropDownList>
                </div>
                <div class="form-group">
                    <label>Unit of Measurment :</label>
                    <asp:TextBox ID="txtunit" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
                <div class="form-group">
                    <label>Reorder Level :</label>
                    <asp:TextBox ID="txtreorderlevel" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
                <div class="form-group">
                    <label>Reorder Qty :</label>
                    <asp:TextBox ID="txtreorderqty" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
                <div class="form-group">
                    <asp:Button ID="btnset" runat="server" Text="Set" CssClass="btn btn-primary" />
                </div>

            </div>
            <div class="col-lg-1"></div>
            <div class="col-lg-4">
            </div>
        </div>
    </div>
</asp:Content>
