<%@ Page Title="" Language="C#" MasterPageFile="~/SClerk.Master" AutoEventWireup="true" CodeBehind="RequestAdjustment.aspx.cs" Inherits="Team11AD.RequestAdjustment" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="bodytitle" runat="server">
    Request Adjustment
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="body" runat="server">
    <asp:ValidationSummary ID="ValidationSummary1" runat="server" />
    <div class="panel-body">
	    <div class="row"> 
            <div class="col-lg-4">
                <div class="form-group">
                    <label>Category :</label>
                    <asp:DropDownList ID="ddcategory" runat="server" CssClass="form-control" DataTextField = "CategoryName" 
                        DataValueField = "CategoryName" OnSelectedIndexChanged="ddcategory_SelectedIndexChanged1" AutoPostBack="True" >
                    </asp:DropDownList>
                     
                </div>
                <div class="form-group">
                    <label>Item Description :</label>
                    <asp:DropDownList ID="dditemdescription" runat="server" CssClass="form-control" DataTextField ="Description" DataValueField ="Description" AutoPostBack="False"></asp:DropDownList>
                </div>
                <div class="form-group">
                    <label>Adjustment Quantity:</label>
                    <asp:TextBox ID="txtqty" runat="server" CssClass="form-control"></asp:TextBox>
                    <asp:RequiredFieldValidator id="RequiredFieldValidator1" runat="server"
                        ControlToValidate="txtqty"
                        ErrorMessage="You need to enter quantity."
                        ForeColor="Red">
                    </asp:RequiredFieldValidator>
                    <asp:RangeValidator ID="RangeValidator1" runat="server"
                        ErrorMessage="RangeValidator" ControlToValidate="txtqty"
                        ForeColor="Red" Type="Integer"
                        MaximumValue="1000" MinimumValue="1">Invalid Entry. Only enter numbers
                    </asp:RangeValidator>
                    
                </div>
                <div class="form-group">
                    <label>Reason :</label>
                    <asp:TextBox ID="txtreason" runat="server" CssClass="form-control"  TextMode="MultiLine"></asp:TextBox>
                </div>
                <div class="form-group">
                    <asp:Button ID="btnAdd" runat="server" Text="Add" CssClass="btn btn-primary" OnClick="btnAdd_Click" />
                    
                </div>
                

                
            </div>
            <div class="col-lg-1"></div>
            <div class="col-lg-4"></div>
        </div>
        <div class="row">
            <div class="col-lg-9">
                <div class="form-group">
                    <asp:GridView ID="gvItemList" runat="server" CssClass="table table-striped"></asp:GridView>
                </div>
            </div>
            <div class="col-lg-3">
            </div>

        </div>
    </div>
</asp:Content>
