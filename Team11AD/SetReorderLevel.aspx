<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="SetReorderLevel.aspx.cs" Inherits="Team11AD.SetReorderLevel" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
    Stationary Store Inventory System
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="bodytitle" runat="server">
    Set Reorder Level & Quantity
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="body" runat="server">
    <div class="panel-body">
        <div class="row">
            <div class="col-lg-4">
                <div class="form-group">
                    <label>Category :</label><asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="ddcategory" ForeColor="red" ErrorMessage="Please choose Stationery Category"></asp:RequiredFieldValidator>
                    <asp:DropDownList ID="ddcategory" runat="server" CssClass="form-control" OnSelectedIndexChanged="ddcategory_SelectedIndexChanged" AutoPostBack="True"></asp:DropDownList>
                </div>
                <div class="form-group">
                    <label>Item Description :</label><asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="dditem" ForeColor="red" ErrorMessage="Please choose Stationery Item"></asp:RequiredFieldValidator>
                    <asp:DropDownList ID="dditem" runat="server" CssClass="form-control" AutoPostBack="True" OnSelectedIndexChanged="dditem_SelectedIndexChanged"></asp:DropDownList>
                </div>
                <div class="form-group">
                    <label>Unit of Measurment :</label>
                    <asp:TextBox ID="txtunit" runat="server" CssClass="form-control" Enabled="False"></asp:TextBox>
                </div>
                <div class="form-group"> 
                    <label>Reorder Level :</label><asp:RangeValidator ID="RangeValidator1" runat="server" ControlToValidate="txtreorderlevel" ForeColor="red" Type="Integer" MinimumValue="0" MaximumValue="1000" ErrorMessage="Please enter integer between 0 & 1000"></asp:RangeValidator>
                    <asp:TextBox ID="txtreorderlevel" runat="server" CssClass="form-control" AutoCompleteType="Disabled"></asp:TextBox>
                </div>
                <div class="form-group">
                    <label>Reorder Qty :</label> <asp:RangeValidator ID="RangeValidator2" runat="server" ControlToValidate="txtreorderqty" ForeColor="red" Type="Integer" MinimumValue="0" MaximumValue="1000" ErrorMessage="Please enter integer between 0 & 1000"></asp:RangeValidator>
                    <asp:TextBox ID="txtreorderqty" runat="server" CssClass="form-control" AutoCompleteType="Disabled"></asp:TextBox>
                </div>
                <div class="form-group">
                    <asp:Button ID="btnset" runat="server" Text="Set" CssClass="btn btn-primary" OnClick="btnset_Click" />
                </div>

            </div>
            <div class="col-lg-1"></div>
            <div class="col-lg-4">
            </div>
        </div>
    </div>
</asp:Content>
