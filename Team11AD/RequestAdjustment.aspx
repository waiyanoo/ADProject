﻿<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="RequestAdjustment.aspx.cs" Inherits="Team11AD.RequestAdjustment" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
    Stationery Store Inventory System
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="bodytitle" runat="server">
    Request Adjustment Voucher
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="body" runat="server">
    <div class="panel-body">
	    <div class="row"> 
            <div class="col-lg-4">
                <div class="form-group">
                    <label>Category :<asp:Label ID="lblcat" ForeColor="Red" runat="server" Text=""></asp:Label>
                    </label>
                    <asp:DropDownList ID="ddcategory" runat="server" CssClass="form-control" DataTextField = "CategoryName" 
                        DataValueField = "CategoryName" OnSelectedIndexChanged="ddcategory_SelectedIndexChanged1" AutoPostBack="True" >
                    </asp:DropDownList>
                     
                </div>
                <div class="form-group">
                    <label>Item Description :<asp:Label ID="lbldesc" ForeColor="Red" runat="server" Text=""></asp:Label>
                    </label>
                    &nbsp;<asp:DropDownList ID="dditemdescription" runat="server" CssClass="form-control" DataTextField ="Description" DataValueField ="Description" AutoPostBack="False"></asp:DropDownList>
                </div>
                <div class="form-group">
                    <label>Adjustment Quantity:</label><asp:Label ID="lblqty" runat="server" ForeColor="Red" Text=""></asp:Label>
                    <asp:TextBox ID="txtqty" runat="server" CssClass="form-control"></asp:TextBox>
                    
                </div>
                <div class="form-group">
                    <label>Reason :</label>
                    <asp:TextBox ID="txtreason" runat="server" CssClass="form-control"  TextMode="MultiLine"></asp:TextBox>
                </div>
                <div class="form-group" style="text-align:right">
                    <asp:Button ID="btnAdd" runat="server" Text="Add" CssClass="btn btn-primary" OnClick="btnAdd_Click" />     
                </div>
                
            </div>
            <div class="col-lg-1"></div>
            <div class="col-lg-4"></div>
        </div>
        <div class="row">
            <div class="col-lg-9">
                <div class="form-group">
                    <asp:GridView ID="gvItemList" runat="server" CssClass="table table-striped" GridLines="None" OnRowDeleting="gvItemList_RowDeleting">
                        <Columns>
                            <asp:CommandField ShowDeleteButton="true" DeleteText="Remove" ButtonType="Link"/>
                        </Columns>
                    </asp:GridView>
                </div>
                <div class="form-group" style="text-align:right">
                    <asp:Button ID="btnSubmit" runat="server" Text="Submit" CssClass="btn btn-primary" OnClick="btnSubmit_Click" />     
                </div>

            </div>
            <div class="col-lg-3">
            </div>

        </div>
    </div>
</asp:Content>
