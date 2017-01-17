<%@ Page Title="" Language="C#" MasterPageFile="~/DUser.Master" AutoEventWireup="true" CodeBehind="test.aspx.cs" Inherits="Team11AD.test" %>
<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">Testing
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="bodytitle" runat="server">Home
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="body" runat="server">
    Home body Testing
    <asp:GridView ID="GridView1" runat="server" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
    </asp:GridView>
</asp:Content>
