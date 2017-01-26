<%@ Page Title="" Language="C#" MasterPageFile="~/SSupervisor.Master" AutoEventWireup="true" CodeBehind="ReportReOrder.aspx.cs" Inherits="Team11AD.ReportReOrder" %>

<%@ Register Assembly="Microsoft.ReportViewer.WebForms, Version=12.0.0.0, Culture=neutral, PublicKeyToken=89845dcd8080cc91" Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>
<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="bodytitle" runat="server">
    Reorder Report
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="body" runat="server">
    <div class="panel-body">
	    <div class="row">   
            <div class="col-lg-12">
                <asp:scriptmanager runat="server"></asp:scriptmanager>
                <rsweb:ReportViewer ID="rvOrder" runat="server" Font-Names="Verdana" Font-Size="8pt" Height="500px" WaitMessageFont-Names="Verdana" WaitMessageFont-Size="14pt" Width="1000px">
                    <LocalReport ReportPath="ROrder.rdlc">
                        <DataSources>
                            <rsweb:ReportDataSource DataSourceId="ObjectDataSource1" Name="OrderDs" />
                        </DataSources>
                    </LocalReport>
                </rsweb:ReportViewer>
                <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" TypeName="Team11AD.ReportDsTableAdapters."></asp:ObjectDataSource>
            </div>
        </div>
    </div>
</asp:Content>
