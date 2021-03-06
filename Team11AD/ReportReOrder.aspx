﻿<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="ReportReOrder.aspx.cs" Inherits="Team11AD.ReportReOrder" %>

<%@ Register Assembly="Microsoft.ReportViewer.WebForms, Version=12.0.0.0, Culture=neutral, PublicKeyToken=89845dcd8080cc91" Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>
<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
    Stationery Inventory Management System
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="bodytitle" runat="server">
    Reorder Report
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="body" runat="server">
    <div class="panel-body">
        <div class="row">
            <div class="col-lg-3">
                <div class="form-group">
                    <label>Start Date :</label>
                    <asp:TextBox ID="startdate" runat="server" TextMode="Date" CssClass="form-control"></asp:TextBox>
                </div>
            
            </div>
            <div class="col-lg-3">
                <div class="form-group">
                    <label>End Date :</label>
                    <asp:TextBox ID="enddate" runat="server" TextMode="Date" CssClass="form-control"></asp:TextBox>
                </div>
            
            </div>
        </div>
            <div class="row">
            <div class="col-lg-4"><asp:Label ID="Label1" runat="server" Text="" ForeColor="#FF3300"></asp:Label></div>
            <div class="col-lg-2" style="text-align:right">
                <div class="form-group">
                    <asp:Button ID="btnSubmit" runat="server" Text="Show" OnClick="btnSubmit_Click" CssClass="btn btn-primary"/>
                </div>
            
            </div>
        </div>
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
