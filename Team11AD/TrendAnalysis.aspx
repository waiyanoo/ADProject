<%@ Page Title="" Language="C#" MasterPageFile="~/SSupervisor.Master" AutoEventWireup="true" CodeBehind="TrendAnalysis.aspx.cs" Inherits="Team11AD.Trend_Analysis" %>
<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="bodytitle" runat="server">
    Trend Analysis
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="body" runat="server">
    <div class="panel-body">
	    <div class="row">  
            <div class="col-lg-1">
            </div>
            <div class="col-lg-5">
                <div class="form-group">
                    <label>Name :</label>
                    <asp:TextBox ID="txtname" runat="server" CssClass="form-control"></asp:TextBox>
                    <asp:TextBox ID="txtid" runat="server" Visible="False"></asp:TextBox>
                    <asp:TextBox ID="txtpk" runat="server" Visible="false"></asp:TextBox>
                </div>
                <div class="form-group">
                    <label>Contact Name :</label>
                    <asp:TextBox ID="txtcontactname" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
                <div class="form-group">
                    <label>Phone :</label>
                    <asp:TextBox ID="txtphone" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
                <div class="form-group">
                    <label>Fax :</label>
                    <asp:TextBox ID="txtfax" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
                <div class="form-group">
                    <label>Address :</label>
                    <asp:TextBox ID="txtaddress" runat="server" CssClass="form-control" TextMode="MultiLine"></asp:TextBox>
                </div>
                <div class="form-group">
                    <label>GST Number :</label>
                    <asp:TextBox ID="txtgst" runat="server" CssClass="form-control" TextMode="SingleLine"></asp:TextBox>
                </div>
                <div class="form-group" style="text-align:right">
                     <asp:Button ID="btnUpdate" runat="server" Text="Update" CssClass="btn btn-primary" OnClick="btnUpdate_Click"/>
                </div>
            </div>
            <div class="col-lg-6">  
            </div>
        </div>
    </div>

</asp:Content>
