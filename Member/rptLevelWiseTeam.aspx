<%@ Page Title="" Language="C#" MasterPageFile="~/Member/MasterPage.master" AutoEventWireup="true" CodeFile="rptLevelWiseTeam.aspx.cs" Inherits="User_rptLevelWiseTeam" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
  
        
            <div class="alert alert-danger alert-dismissible" id="danger"  runat="server"  visible="false">
              
                <h4><i class="icon fa fa-ban"></i> Alert!</h4>
            <asp:Label ID="lbdanger" runat="server" Text="There is  some thing wrong........."></asp:Label> 
              </div>
      <div class="row">
        <div class="col-lg-12">
     <div class="card">
            <div class="card-header">
              <h5 class="card-title"> Level Wise Team  </h5>
                
            </div>
            <!-- /.card-header -->
            <div class="card-body" >
             <div class=" form-horizontal">
         
               
                    <div class="form-group">
                        <div class="col-lg-12 col-md-12 col-xs-12 col-sm-12" style="overflow:auto;">
           
                  
                <asp:gridview ID="grdData" runat="server" 

AutoGenerateColumns="False" CellPadding="10" PageSize="15"  Font-Size="Large" CssClass="table table-bordered "

          GridLines="Both" Width="100%" AllowPaging="True"

            OnPageIndexChanging="grdData_PageIndexChanging"  ShowFooter="true">
           
            <columns>
             

<%--<asp:TemplateField HeaderText="#">
    <HeaderStyle CssClass="header-yellow-border" />
                <ItemTemplate>
                      
                    <%# Container.DataItemIndex + 1 %>
                </ItemTemplate>
                <ItemStyle Width="10%" />
</asp:TemplateField>--%>
                <asp:boundfield DataField="levelno" HeaderText="Level">
                      <HeaderStyle CssClass="header-yellow-border" />
                </asp:boundfield>
                <asp:boundfield DataField="TragetMember"  HeaderText="TargetTeam">
                      <HeaderStyle CssClass="header-yellow-border" />
                </asp:boundfield>
                <asp:boundfield DataField="AchiveTeam"  HeaderText="AchiveTeam">
                      <HeaderStyle CssClass="header-yellow-border" />
                </asp:boundfield>
             
              
            </columns>
          
           
        </asp:gridview>
            
               
            </div>
                        </div>
                 </div>
                
               
            </div>
            <!-- /.card-body -->
          </div>
          <!-- /.card -->
        </div>
        <!-- /.col -->
      </div>
     
      <!-- /.row -->

    

<!-- page script -->
      
</asp:Content>

