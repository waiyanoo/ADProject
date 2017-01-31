<%@ Page Title="" Language="C#" MasterPageFile="~/DepartmentHead.Master" AutoEventWireup="true" CodeBehind="DelegateAuthority.aspx.cs" Inherits="Team11AD.DelegateAuthority" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
    Stationary Store Inventory System
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="bodytitle" runat="server">
    Delegate Authority
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="body" runat="server">
    <div class="panel-body">
        <div class="row">
            <div class="col-lg-5">
                <div class="form-group">
                    <label>Department :</label>
                    <asp:TextBox ID="txtdept" runat="server" CssClass="form-control" Enabled="False"></asp:TextBox>
                </div>
                <div class="form-group">
                    <label>Department Head :</label>
                    <asp:TextBox ID="txtdepthead" runat="server" CssClass="form-control" Enabled="false"></asp:TextBox>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-5">
                <div class="form-group">
                    <label>Current Authorised Person to Approve Requisitions :</label>
                    <asp:TextBox ID="txtcurrentauthority" runat="server" CssClass="form-control" Enabled="false"></asp:TextBox>
                </div>
            </div>
            <div class="col-lg-3">
                <div class="form-group">
                    <label>Authorised from date :</label>
                    <asp:TextBox ID="txtcurrentfromdate" runat="server" CssClass="form-control" Enabled="false"></asp:TextBox>
                </div>
            </div>
            <div class="col-lg-3">
                <div class="form-group">
                    <label>Authorised to date :</label>
                    <asp:TextBox ID="txtcurrenttodate" runat="server" CssClass="form-control" Enabled="false"></asp:TextBox>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-5">
                <div class="form-group">
                    <label>Future Authorised Person to Approve Requisitions :</label>
                    <asp:TextBox ID="txtfutureauthority" runat="server" CssClass="form-control" Enabled="false"></asp:TextBox>
                </div>
            </div>
            <div class="col-lg-3">
                <div class="form-group">
                    <label>Authorised from date :</label>
                    <asp:TextBox ID="txtfuturefromdate" runat="server" CssClass="form-control" Enabled="false"></asp:TextBox>
                </div>
            </div>
            <div class="col-lg-3">
                <div class="form-group">
                    <label>Authorised to date :</label>
                    <asp:TextBox ID="txtfuturetodate" runat="server" CssClass="form-control" Enabled="false"></asp:TextBox>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-4">
                <div class="form-group">
                    <asp:Button ID="btncanceldelegation" runat="server" Text="Cancel Authority Delegation" Width="210px" CssClass="btn btn-primary" OnClick="btncanceldelegation_Click" CausesValidation="false" />
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-5">
                <div class="form-group">
                    <label>Choose employee to delegate Requisition Approval Authority :</label>
                    <asp:RequiredFieldValidator ID="rfvalidatoremployee" runat="server" ControlToValidate="ddemployee" ForeColor="Red" Display="Dynamic" ErrorMessage="</br>Choose Employee to delegate Requisition Approval Authority"></asp:RequiredFieldValidator>
                    <asp:DropDownList ID="ddemployee" runat="server" CssClass="form-control" AutoPostBack="False" AppendDataBoundItems="true">
                        <asp:ListItem Text="" Value="" />
                    </asp:DropDownList>
                </div>
            </div>
            <div class="col-lg-3">
                <div class="form-group">
                    <label>Authorised from date :</label>
                    <asp:RequiredFieldValidator ID="rfvalidatorstartdate" runat="server" ControlToValidate="txtstartdate" ForeColor="red" Display="Dynamic" ErrorMessage="</br>Please enter Start Date"></asp:RequiredFieldValidator>
                    <asp:CompareValidator ID="cvalidatorstartdate" runat="server" ControlToValidate="txtstartdate" Type="Date" Operator="GreaterThanEqual" ForeColor="Red" Display="Dynamic" ErrorMessage="Choose Start Date today or later"></asp:CompareValidator>
                    <asp:TextBox ID="txtstartdate" runat="server" CssClass="form-control" TextMode="Date"></asp:TextBox>
                </div>
            </div>
            <div class="col-lg-3">
                <div class="form-group">
                    <label>Authorised to date :</label>
                    <asp:RequiredFieldValidator ID="rfvalidatorenddate" runat="server" ControlToValidate="txtenddate" ForeColor="red" Display="Dynamic" ErrorMessage="<br/>Please enter End Date"></asp:RequiredFieldValidator>
                    <asp:CompareValidator ID="cvalidatorenddate" runat="server" ControlToValidate="txtenddate" ControlToCompare="txtstartdate" Operator="GreaterThanEqual" ForeColor="red" Display="Dynamic" ErrorMessage="<br/>End Date must be on or later than Start Date"></asp:CompareValidator>
                    <asp:TextBox ID="txtenddate" runat="server" CssClass="form-control" TextMode="Date"></asp:TextBox>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-4">
                <div class="form-group">
                    <asp:Button ID="btndelegate" runat="server" Text="Delegate Authority" Width="210px" CssClass="btn btn-primary" OnClick="btndelegate_Click" />
                </div>
            </div>
        </div>
    </div>
</asp:Content>
