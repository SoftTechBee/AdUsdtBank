<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" CodeFile="withdrawPendingList.aspx.cs" EnableEventValidation="true" Inherits="Admin_withdrawPendingList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
   
       
        
         <div class="alert alert-danger alert-dismissible" id="danger"  runat="server"  visible="false">
                
                <h4><i class="icon fa fa-ban"></i> Alert!</h4>
            <asp:Label ID="lbdanger" runat="server" Text="There is  some thing wrong........."></asp:Label> 
              </div>
              <div class="alert alert-info alert-dismissible" id="info" runat="server"  visible="false">
                
                <h4><i class="icon fa fa-info"></i> Alert!</h4>
               <asp:Label ID="lbinfo" runat="server" Text="ere is  some thing wrong........."></asp:Label>  
             
              </div>
              <div class="alert alert-warning alert-dismissible" id="warning" runat="server"  visible="false">
                
                <h4><i class="icon fa fa-warning"></i> Alert!</h4>
               <asp:Label ID="lbwarning" runat="server" Text=" Try Again............"></asp:Label> 
            
              </div>
              <div class="alert alert-success alert-dismissible" id="sccess" runat="server" visible="false" >
                
                <h4><i class="icon fa fa-check"></i> Alert!</h4>
                  <asp:Label ID="lbsuccess" runat="server" Text="Successfully updated................"></asp:Label>  
              </div>
   <div class="card">
                            <div class="form-horizontal">
                                <div class="card-body">
                                    <h4 class="card-title">Withdraw Payment Request List  </h4>
                 <!----form start---->
                      
                                     <div class="form-group row">
                 <div class="input-group input-group-xlg" ">
           <asp:TextBox ID="txtsearch" CssClass="form-control" runat="server" placeholder="Enter Distributor"></asp:TextBox>
               
                    <span class="input-group-btn">
          <asp:Button ID="btnsearch" runat="server" Text="Go!"    OnClick="btnsearch_Click" CssClass="btn btn-info btn-flat btn-lg"  />
                    
                    </span>
              </div>
                 </div>
               </div>
             <div class="card-body">
     <div class="form-group row" style="overflow:auto;">
                 
                    <div class="col-sm-12" >
                          <table class="table table-bordered table-hover " >
      
            <tr>
                  <th>#</th>
                  <th>Member</th>                  
                 <th>MODE</th>
                 <%--<th>PLAN_TYPE</th>--%>
               
                 <th>Amount</th>
                
                 <th>AdminCharge</th>
              <%--   <th>TDS</th>--%>
                  <th>Payout</th>
                  <%--<th>Final_Paid</th>--%>
                
                  <th>DateOfRequest</th>
                <%-- <th>Remark</th>--%>
                   <th>Wallet Address</th>
                        <%--   <th>Branch</th>
                           <th>IFSC</th>
                           <th>AccNo</th>
                           <th>AccHolder</th>--%>
                         <%--  <th>Paytm</th>
                           <th>PhonePay</th>
                           <th>GooglePay</th>--%>
                 <th>Status</th>
                 
                
                <th>Approved</th>
                <th>Cencel</th>
            </tr>
       
   
    <asp:Repeater ID="Repeater1" runat="server" OnItemCommand="Repeater1_ItemCommand">
      
         <ItemTemplate>
             <tr><td> <%#Container.ItemIndex+1 %> </td>
                  <td>
                 <asp:Label ID="lbuname" runat="server" Text='<%#Eval("username") %>'></asp:Label></td>
              <td><asp:Label ID="lbIncomeType" runat="server" Text='<%#Eval("PackType") %>'></asp:Label></td>
              <%--<td><asp:Label ID="lbType" runat="server" Text='<%#Eval("IncomeType") %>'></asp:Label></td>--%>
               
                  <td> <asp:Label ID="lbamt" runat="server" Text='<%#Eval("Amount") %>'></asp:Label></td>
                    
                  <td> <asp:Label ID="Label2" runat="server" Text='<%#Eval("AdminCharge") %>'></asp:Label></td>                   
                
                  <td> <asp:Label ID="lbPayout" runat="server" Text='<%#Eval("Payout") %>'></asp:Label></td>
                  <%--<td class="text-primary"><b><%#Eval("TDS") %></b> </td>--%>     
                  <td><%#DataBinder.Eval(Container.DataItem, "DOR", "{0:dd/MM/yyyy}")%></td>
                <%--  <td><%#Eval("remark") %></td>--%>
                  <td> <asp:Label ID="lbwallet" runat="server" Text='<%#Eval("Wallet") %>'></asp:Label></td>
                         <%--  <td><%#Eval("branchname") %></td>
                           <td><%#Eval("ifsc") %></td>
                           <td>'<%#Eval("accno") %></td>
                           <td><%#Eval("holdername") %></td> --%>
                          <%-- <td><%#Eval("paytm") %></td>
                           <td><%#Eval("phonepay") %></td>
                           <td><%#Eval("googlepay") %></td>--%>
                  <td><%#Eval("status") %></td>
                    <td> <asp:Button ID="Button1" runat="server" Text="Approved" CssClass="btn  btn-block  btn-warning" CommandArgument='<%#Eval("Rid") %>' CommandName="Click" /> </td>
              <td> <asp:Button ID="Button2" runat="server" Text="Cencel" CssClass="btn  btn-block  btn-danger" CommandArgument='<%#Eval("Rid") %>' CommandName="delete" /> </td>
          
                 </tr>

         </ItemTemplate>
      
    </asp:Repeater>
    
 </table>
</div>

    </div></div></div>
        </div>
</asp:Content>

