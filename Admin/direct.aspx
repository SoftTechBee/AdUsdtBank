<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" CodeFile="direct.aspx.cs" Inherits="Admin_DirectList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
                      <div class="alert alert-danger alert-dismissible" id="danger"  runat="server"  visible="false">
              
                <h4><i class="icon fa fa-ban"></i> Alert!</h4>
            <asp:Label ID="lbdanger" runat="server" Text="There is  some thing wrong........."></asp:Label> 
              </div>

                  <div class="row">
<div  class="col-lg-12">
           <div class="card ">
                            <div class="card-body">
              <h3> Direct Team</h3>
          <div class="form-group row">
                <label class="col-lg-2 col-md-2 col-xs-6 ">Enter UserName </label>
    <div class="ccol-lg-8 col-md-3 col-xs-6">
      
      
                <asp:TextBox ID="txtUname" class="form-control"  runat="server" placeholder="Enter UserName " ></asp:TextBox>
               
      
    </div>
                
                 <div class="col-lg-2 col-md-2 col-xs-6 ">
      
            <asp:Button ID="btnSeach" runat="server" Text="Search" CssClass="btn btn-block btn-danger"   OnClick="btnSeach_Click"/>

      </div>
</div>
<div class="form-group row">
    <div  class="col-lg-12" style="overflow:auto;">
              
            <!-- /.box-header -->
  
<asp:Repeater ID="Repeater1" runat="server">
    <HeaderTemplate>
   <table id="example1" class="table table-bordered table-striped table-hover " style="cellspacing:0;width:100%">
                <thead>
                <tr>
                  <tr>   <th >#</th>
                  <th >Sponsor Id</th>
                  <%--<th >Sponsor Name</th>--%>
                  <th>Username </th>
                  <th> Wallet</th>
                 <%--<th>Mobile</th>--%>
                  <%--<th>State</th>--%>
                  <th>Amount</th>
                  
                  
                  
                </tr>
                </thead>
                <tbody>
    </HeaderTemplate>
    <ItemTemplate>
        <tr>
            <td> <%#Container.ItemIndex+1 %> </td>
             <td> <%#Eval("reffid") %></td>
             <%--<td> <%#Eval("reffname") %></td>--%>
             <td> <%#Eval("username") %></td>
               <td> <%#Eval("position") %></td>
             <%--<td> <%#Eval("mobile") %></td>--%>
              <%--<td> <%#Eval("city") %></td>--%>
              <td> <%#Eval("JoinAmt") %></td>
        </tr>
    </ItemTemplate>
<FooterTemplate>

     </tbody>
                <tfoot>
                <tr>
                    <tr>   <th >#</th>
                  <th >Sponser Id</th>
                  <th>User Name</th>
                  <th>WalletAddress</th>
                  <th>Amount</th>
                  
                </tr>
                </tfoot>
              </table>
</FooterTemplate>
</asp:Repeater>
           
             </div>   
            
               </div>
                                </div>
               </div>
    
            </div>
            <!-- /.box-body -->
          </div>
          <!-- /.box -->
        </div>
        <!-- /.col -->
      </div>
      <!-- /.row -->
    </section>
    <!-- /.content -->

    

<!-- page script -->
      
</asp:Content>



