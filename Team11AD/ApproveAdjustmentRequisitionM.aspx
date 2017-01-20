<%@ Page Title="" Language="C#" MasterPageFile="~/SClerk.Master" AutoEventWireup="true" CodeBehind="ApproveAdjustmentRequisitionM.aspx.cs" Inherits="Team11AD.ApproveAdjustmentRequisitionM" %>
<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
    Stationary Store Inventory System
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="bodytitle" runat="server">
    Approve Adjustment Requisition(Above $200)
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="body" runat="server">
    <div class="panel-body">
	    <div class="row"> 
            <div class="col-lg-4">
                <div class="form-group">
                    <label>Adjustment Request Number :</label>
                    <asp:DropDownList ID="ddrequestno" runat="server" CssClass="form-control" DataTextField = "VoucherNo" 
                        DataValueField = "VoucherNo"  AutoPostBack="True" OnSelectedIndexChanged="ddrequestno_SelectedIndexChanged" >
                    </asp:DropDownList>
                     
                </div>
            </div>
	    </div>
    </div>
</asp:Content>