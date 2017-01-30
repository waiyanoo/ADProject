<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="ViewLowLevelStock.aspx.cs" Inherits="Team11AD.ViewLowLevelStock" %>
<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
    Stationary Store Inventory System
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="bodytitle" runat="server">
    
    View Low Level Stock
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="body" runat="server">
   <div class="panel-body">
       <div class="row">
           <div class ="col-lg-2" style="text-align:right">
              <label>Supplier :</label> 
           </div>
           <div class="col-lg-4">
               <div class="form-group">
                    <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" CssClass="form-control"></asp:DropDownList>
                </div>
           </div>
       </div>
        <div class="row">
            <div class="col-lg-12">
                
                    <asp:GridView ID="grlowlevelitem" runat="server" CssClass="table table-striped" GridLines="None">
                        
                        <Columns>
                            <asp:TemplateField HeaderText="Check">
                                <ItemTemplate>
                                    <asp:CheckBox ID="CheckBox1" runat="server" />
                                </ItemTemplate>
                            </asp:TemplateField>
  
                        </Columns>
                        
                    </asp:GridView>
               <div class="form-group" style="text-align:right">
                    <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Make Order" CssClass="btn btn-primary"/>
                    
                </div>
            </div>
            
        </div>
    </div>
</asp:Content>
