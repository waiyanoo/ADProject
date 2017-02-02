<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="TrendAnalysis.aspx.cs" Inherits="Team11AD.Trend_Analysis" %>

<%@ Register Assembly="Microsoft.ReportViewer.WebForms, Version=12.0.0.0, Culture=neutral, PublicKeyToken=89845dcd8080cc91" Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>
<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
    Stationery Store Inventory System
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="bodytitle" runat="server">
    Trend Analysis
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="body" runat="server">
    <div class="panel-body">
        <div class="row">
            <div class="col-lg-3">
                <div class="form-group">
                    <label>First Month :</label>
                    <asp:TextBox ID="firstdate" runat="server" TextMode="Month" CssClass="form-control"></asp:TextBox>
                </div>
            </div>
            <div class="col-lg-3">
                <div class="form-group">
                    <label>Second Month :</label>
                    <asp:TextBox ID="seconddate" runat="server" TextMode="Month" CssClass="form-control"></asp:TextBox>
                </div>
            </div>
            <div class="col-lg-3">
                <div class="form-group">
                    <label>Third Month :</label>
                    <asp:TextBox ID="thirddate" runat="server" TextMode="Month" CssClass="form-control"></asp:TextBox>
                </div>
            </div>
        </div>
        <div class="row">
             <div class="col-lg-9" style="text-align:left">
                 <asp:CheckBoxList ID="cbkDepartment" runat="server">
                     <asp:ListItem Value="BIZM">Business Management Department</asp:ListItem>
                     <asp:ListItem Value="BIOL">Biology Department</asp:ListItem>
                     <asp:ListItem Value="COMM">Commerce Department</asp:ListItem>
                     <asp:ListItem Value="CPSC">Computer Science</asp:ListItem>
                     <asp:ListItem Value="ENGL">English Department</asp:ListItem>
                     <asp:ListItem Value="ENGR">Engineering Department</asp:ListItem>
                     <asp:ListItem Value="REGR">Registrar Department</asp:ListItem>

                 </asp:CheckBoxList>
             </div>
        </div>
        <div class="row">
            <div class="col-lg-3">
                <div class="form-group">
                    <label>Item Category :</label>
                    <asp:DropDownList ID="ddcategory" runat="server" CssClass="form-control" OnSelectedIndexChanged="ddcategory_SelectedIndexChanged" AutoPostBack="True"></asp:DropDownList>
                </div>
            </div>
            <div class="col-lg-3">
                <div class="form-group">
                    <label>Item Description :</label>
                    <asp:DropDownList ID="dditemdescription" runat="server" CssClass="form-control"></asp:DropDownList>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-9" style="text-align:right">
                <div class="form-group">
                    <asp:Label ID="Label1" ForeColor="Red" runat="server" Text=""></asp:Label>
                </div>

                <div class="form-group">
                    <asp:Button ID="Show" runat="server" Text="Show" CssClass="btn btn-primary" OnClick="Show_Click" />
                </div>
                
            </div>
        </div>
	    <div class="row">  
            <div class="col-lg-11">
                <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                <rsweb:ReportViewer ID="rvtrend" runat="server" Font-Names="Verdana" Font-Size="8pt" WaitMessageFont-Names="Verdana" Width="800px" Height="700px" WaitMessageFont-Size="14pt">
                    <LocalReport ReportPath="TrendAnalysis.rdlc">
                        <DataSources>
                            <rsweb:ReportDataSource DataSourceId="ObjectDataSource1" Name="TrendDS" />
                        </DataSources>
                    </LocalReport>
                </rsweb:ReportViewer>
                <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" TypeName="Team11AD.ReportDsTableAdapters."></asp:ObjectDataSource>
            </div>
            
        </div>
    </div>

</asp:Content>
