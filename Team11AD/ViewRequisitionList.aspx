﻿<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="ViewRequisitionList.aspx.cs" Inherits="Team11AD.ViewRequisitionList" %>
<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
    Stationery Store Inventory System</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="bodytitle" runat="server">
    View Requisition List
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="body" runat="server">
    <div class="panel-body">
	    <div class="row">
            <div class="col-lg-12">
                <asp:GridView ID="gvrequisition" runat="server" CssClass="table table-striped" GridLines="None" AutoGenerateColumns="false"  OnRowEditing ="gvrequisition_RowEditing">
                     <Columns>
                         <asp:TemplateField HeaderText="#">
                        <ItemTemplate>
                            <%# Container.DataItemIndex + 1 %>
                        </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="RequsitionId" HeaderText="Requisition ID"/>
                        <asp:BoundField DataField="Date" HeaderText="Submitted Date"/>
                        <asp:BoundField DataField="Name" HeaderText="Submitted Employee"/>
                        <asp:BoundField DataField="Status" HeaderText="Status"/>
                        <asp:CommandField ShowEditButton="true" EditText="Details" ButtonType="Link" ControlStyle-CssClass="btn btn-primary" />
                    </Columns>
                </asp:GridView>
            </div>
        </div>
     </div>   
</asp:Content>
