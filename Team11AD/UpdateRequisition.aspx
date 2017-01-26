<%@ Page Title="" Language="C#" MasterPageFile="~/DUser.Master" AutoEventWireup="true" CodeBehind="UpdateRequisition.aspx.cs" Inherits="Team11AD.UpdateRequisition" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
    Stationary Store Inventory System
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="bodytitle" runat="server">
    Update Requisition
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="body" runat="server">
    <div class="panel-body">
        <div class="row">

            <div class="col-lg-4">
                <div class="form-group">
                    <label>Requisition Number :</label>
                    <asp:TextBox ID="txtrequisitionnumber" runat="server" CssClass="form-control" Enabled="False"></asp:TextBox>
                </div>
                <div class="form-group">
                    <label>Department Name :</label>
                    <asp:TextBox ID="txtdepartmentname" runat="server" CssClass="form-control" Enabled="False"></asp:TextBox>
                </div>
                <div class="form-group">
                    <label>Employee Name :</label>
                    <asp:TextBox ID="txtemployeename" runat="server" CssClass="form-control" Enabled="False"></asp:TextBox>
                </div>
            </div>

            <div class="col-lg-1"></div>
            <div class="col-lg-4">
                <div class="form-group">
                    <label>Item Category :</label> <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="dditemcategory" ForeColor="red" ErrorMessage="Please choose Stationery Category"></asp:RequiredFieldValidator>
                    <asp:DropDownList ID="dditemcategory" runat="server" CssClass="form-control" AutoPostBack="True" OnSelectedIndexChanged="dditemcategory_SelectedIndexChanged"></asp:DropDownList>
                </div>
                <div class="form-group">
                    <label>Item Description :</label> <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="dditemdescription" ForeColor="red" ErrorMessage="Please choose Stationery Item"></asp:RequiredFieldValidator>
                    <asp:DropDownList ID="dditemdescription" runat="server" CssClass="form-control"></asp:DropDownList>
                </div>
                <div class="form-group">
                    <label>Item Quantity :</label> <asp:RangeValidator ID="RangeValidator1" runat="server" ControlToValidate="txtitemqty" ForeColor="red" Type="Integer" MinimumValue="1" MaximumValue="1000" ErrorMessage="Please enter integer between 1 & 1000"></asp:RangeValidator>
                    <asp:TextBox ID="txtitemqty" runat="server" CssClass="form-control" AutoCompleteType="Disabled" />
                </div>
                <div class="form-group" style="text-align: right">
                    <asp:Button ID="btnadd" runat="server" Text="Add" CssClass="btn btn-primary" OnClick="btnadd_Click" />
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-9">
                <div class="form-group">
                    <asp:GridView ID="gvrequisitionitem" runat="server" Width="100%" CssClass="table table-striped" AutoGenerateColumns="false" ShowHeaderWhenEmpty="true" EmptyDataText="This Requisition has no Items yet" 
                        AllowPaging="true" PageSize="10" OnRowDeleting="gvrequisitionitem_RowDeleting" GridLines="None" 
                        OnPageIndexChanging="gvrequisitionitem_PageChanging" PagerSettings-Mode="NumericFirstLast" PagerStyle-Font-Size="Large" PagerSettings-Position="Bottom">
                        <Columns>
                            <asp:TemplateField HeaderText="#" HeaderStyle-Width="60px">
                                <ItemTemplate>
                                    <%# Container.DataItemIndex + 1 %>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="ItemID.ItemID" HeaderText="Item No" HeaderStyle-Width="150" />
                            <asp:BoundField DataField="ItemID.Description" HeaderText="Description"  />
                            <asp:TemplateField HeaderText="Qty" HeaderStyle-Width="50px" >
                                <ItemTemplate>
                                    <asp:TextBox ID="txtQty" runat="server" Text='<%# Bind("RequiredQty") %>' CssClass="text-right" Width="90px" AutoCompleteType="Disabled" ></asp:TextBox>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:CommandField ShowDeleteButton="true" ButtonType="Button" ControlStyle-CssClass="btn btn-primary" HeaderStyle-Width="100px" ItemStyle-HorizontalAlign="Center" />
                        </Columns>
                    </asp:GridView>
                </div>
                <div class="form-group" style="text-align: right">
                    <asp:Button ID="btnupdate" runat="server" Text="Update" CssClass="btn btn-primary" OnClick="btnupdate_Click" CausesValidation="false" />
                </div>

            </div>
            <div class="col-lg-3">
            </div>

        </div>
    </div>
</asp:Content>
