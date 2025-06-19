<%@ Page Title="" Language="C#" MasterPageFile="~/Member/MasterPage.master" AutoEventWireup="true" CodeFile="rptdwonline.aspx.cs" Inherits="User_rptdwonline" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
  
 
    <%--<div class=" container">--%>
        <div class="card">
            <div class="card-header">
              <h5 class="card-title">Downline Member Detail</h5>
                
            </div>
            <!-- /.card-header -->
            <div class="card-body">
    <div style="overflow:auto;color:#000000; ">
       
      <asp:gridview ID="grdData" runat="server" AutoGenerateColumns="False" CellPadding="10" PageSize="100"  Font-Size="Large" CssClass="table table-bordered  " 

          GridLines="Both" Width="100%" AllowPaging="True"   OnPageIndexChanging="grdData_PageIndexChanging"  >
           
            <columns>
             

<asp:TemplateField HeaderText="#">
                <ItemTemplate>
                    <%# Container.DataItemIndex + 1 %>
                </ItemTemplate>
                <ItemStyle Width="10%" />
</asp:TemplateField>
              <%--  <asp:boundfield DataField="level" HeaderText="LevelNo"></asp:boundfield>--%>
                <asp:boundfield DataField="username" HeaderText="UserName"></asp:boundfield>
                 <asp:boundfield DataField="reffid" HeaderText="Sponsor"></asp:boundfield>
                <asp:boundfield DataField="Upline" HeaderText="PlaceUnder"></asp:boundfield>
                <asp:boundfield DataField="Name" HeaderText="Wallet"></asp:boundfield>
               
                <asp:boundfield DataField="DateOFJoin" DataFormatString="{0:d}" HeaderText="DOA"></asp:boundfield>
                <%--<asp:boundfield DataField="Upline"  HeaderText="Upline"></asp:boundfield>--%>
             <%--   <asp:boundfield DataField="side"  HeaderText="Side"></asp:boundfield>--%>
               <%-- <asp:boundfield DataField="joinamount"  HeaderText="Amount"></asp:boundfield>
                <asp:boundfield DataField="Status" HeaderText="AccountStatus"></asp:boundfield>--%>
               
            </columns>
          
           
        </asp:gridview>
            
       </div></div></div>
       </div>
   <%-- </div>--%>
</asp:Content>

