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
            <div class="col-lg-4">

                <div class="form-group">
                    <label>Department :</label>
                    <asp:TextBox ID="txtdept" runat="server" CssClass="form-control" Enabled="False"></asp:TextBox>
                </div>
                <div class="form-group">
                    <label>Department Head :</label>
                    <asp:TextBox ID="txtdepthead" runat="server" CssClass="form-control" Enabled="false"></asp:TextBox>
                </div>

                <div class="form-group">
                    <label>Current Authorised Person to Approve Requisitions :</label>
                    <asp:TextBox ID="txtcurrentauthority" runat="server" CssClass="form-control" Enabled="false"></asp:TextBox>
                </div>
                <div class="form-group">
                    <label>Authorised from date :</label>
                    <asp:TextBox ID="txtcurrentfromdate" runat="server" CssClass="form-control" Enabled="false"></asp:TextBox>
                </div>
                <div class="form-group">
                    <label>Authorised to date :</label>
                    <asp:TextBox ID="txtcurrenttodate" runat="server" CssClass="form-control" Enabled="false"></asp:TextBox>
                </div>

                <div class="form-group">
                    <label>Future Authorised Person to Approve Requisitions :</label>
                    <asp:TextBox ID="txtfutureauthority" runat="server" CssClass="form-control" Enabled="false"></asp:TextBox>
                </div>
                <div class="form-group">
                    <label>Authorised from date :</label>
                    <asp:TextBox ID="txtfuturefromdate" runat="server" CssClass="form-control" Enabled="false"></asp:TextBox>
                </div>
                <div class="form-group">
                    <label>Authorised to date :</label>
                    <asp:TextBox ID="txtfuturetodate" runat="server" CssClass="form-control" Enabled="false"></asp:TextBox>
                </div>

                <div class="form-group">
                    <asp:Button ID="btncanceldelegation" runat="server" Text="Cancel Authority Delegation" CssClass="btn btn-primary" OnClick="btncanceldelegation_Click" />
                </div>

                <div class="form-group">
                    <label>Choose employee to delegate Requisition Approval Authority :</label>
                    <asp:DropDownList ID="ddemployee" runat="server" CssClass="form-control" AutoPostBack="True" AppendDataBoundItems="true">
                        <asp:ListItem Text="" Value="" />
                    </asp:DropDownList>
                </div>
                
                <div class="form-group">
                    <label>Authorised from date :</label>
                    <asp:TextBox ID="txtstartdate" runat="server" CssClass="form-control" ></asp:TextBox>
                </div>
                <div class="form-group">
                    <asp:Calendar ID="calstartdate" runat="server" OnSelectionChanged="calstartdate_SelectionChanged"></asp:Calendar>
                </div>
                
                <div class="form-group">
                    <label>Authorised to date :</label>
                    <asp:TextBox ID="txtenddate" runat="server" CssClass="form-control" ></asp:TextBox>
                </div>
                <div class="form-group">
                    <asp:TextBox ID="TextBox1" TextMode="Date" runat="server"></asp:TextBox>
                    <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToValidate="TextBox1" ValueToCompare="<%# DateTime.Today %>" Operator="GreaterThanEqual" ErrorMessage="CompareValidator"></asp:CompareValidator>
                    <asp:Calendar ID="calenddate" runat="server" OnSelectionChanged="calenddate_SelectionChanged"></asp:Calendar>
                </div>

                <div class="form-group">
                    <asp:Button ID="btnsubmit" runat="server" Text="Submit" CssClass="btn btn-primary" OnClick="btnsubmit_Click" />
                </div>
            </div>
            <div class="col-lg-1"></div>
            <div class="col-lg-4">
            </div>
        </div>
    </div>
</asp:Content>
