<%@ Page Title="" Language="C#" MasterPageFile="~/Member/MasterPage.master" AutoEventWireup="true" CodeFile="direct.aspx.cs" Inherits="User_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
     
                      <div class="alert alert-danger alert-dismissible" id="danger"  runat="server"  visible="false">
              
                <h4><i class="icon fa fa-ban"></i> Alert!</h4>
            <asp:Label ID="lbdanger" runat="server" Text="There is  some thing wrong........."></asp:Label> 
              </div>

      <div class="row">
        <div class="col-lg-12">
     <div class="card">
            <div class="card-header">
              <h5 class="card-title">Referral List</h5>
                <asp:Label ID="lbname" runat="server" Text="" Visible="false"></asp:Label>
            </div>
            <!-- /.card-header -->
            <div class="card-body">
                <div style="overflow:auto; color:#000000;" >
<asp:gridview ID="grdData" runat="server" AutoGenerateColumns="False" CellPadding="10" PageSize="20"  Font-Size="Large" CssClass="table table-bordered "

          GridLines="Both" Width="100%" AllowPaging="True"   OnPageIndexChanging="grdData_PageIndexChanging"  >
           
            <columns>
             

<asp:TemplateField HeaderText="#">
                <ItemTemplate>
                    <%# Container.DataItemIndex + 1 %>
                </ItemTemplate>
                <ItemStyle Width="10%" />
</asp:TemplateField>
                <asp:boundfield DataField="username" HeaderText="UserName"></asp:boundfield>
                <asp:boundfield DataField="walletaddress" HeaderText="wallet"></asp:boundfield>
                <%--<asp:boundfield DataField="Mobile" HeaderText="Mobile"></asp:boundfield>--%>
            <%--    <asp:boundfield DataField="onside" HeaderText="Side"></asp:boundfield>--%>
                <asp:boundfield DataField="reffid" HeaderText="Sponser"></asp:boundfield>
                <asp:boundfield DataField="DateOFJOin" DataFormatString="{0:d}" HeaderText="DateOFJoining"></asp:boundfield>
                <asp:boundfield DataField="pack"  HeaderText="Package"></asp:boundfield>
                <%--<asp:boundfield DataField="Status" HeaderText="AccountStatus"></asp:boundfield>--%>
               
            </columns>
          
           
        </asp:gridview>
           
             </div>   
            
               
            </div>
            <!-- /.card-body -->
          </div>
          <!-- /.card -->
        </div>
        <!-- /.col -->
      </div>
    
   

    

<!-- page script -->
      
</asp:Content>



