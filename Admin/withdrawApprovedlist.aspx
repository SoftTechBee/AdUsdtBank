<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" CodeFile="withdrawApprovedlist.aspx.cs" EnableEventValidation="true" Inherits="Admin_withdrawApprovedlist" %>

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
                                    <h4 class="card-title">Approved  List  </h4>
                 <!----form start---->
                       <div class="form-group row">
                   
                   
<div class=" col-sm-offset-4 col-sm-10">
    </div>
 <div class="  col-sm-2">
                   <asp:Button ID="btnExportToExcel" CssClass="btn btn-block btn-success" Text="ExportToExcel" OnClick="btnExportToExcel_Click"  runat="server"/>
                </div>
                 </div>
                                     <div class="form-group row">
                 <div class="input-group input-group-xlg" style="margin-top:30px;">
           <asp:TextBox ID="txtsearch" CssClass="form-control" runat="server" placeholder="Enter Distributor"></asp:TextBox>
               
                    <span class="input-group-btn">
          <asp:Button ID="btnsearch" runat="server" Text="Go!"    OnClick="btnsearch_Click" CssClass="btn btn-info btn-flat btn-lg"  />
                    
                    </span>
              </div>
                 </div>
               </div>
              <div class="card-body">  
    <div class="form-group row" >
<div  class="col-lg-12"  style="overflow:auto;"> 
    <asp:Repeater ID="Repeater1" runat="server">
        <HeaderTemplate>
<table class="table table-bordered table-responsive table-hover" >
        <thead>
            <tr>
                  <th>#</th>
                  <th>Type</th>  
                  <th>Member</th>  
                 <th>Income TYPE</th>
                  <th>Name</th>                  
                  <th>Mobile</th>                  
                 
               
                
                <th>Amount</th>
                
                 <th>AdminCharge</th>
               <%--  <th>TDS</th>--%>
                  <th>Payout</th>
                  <%--<th>Final_Paid</th>--%>
                
                  <th>DateOfRequest</th>
                  <th>DateOfApproved</th>
                <%-- <th>Remark</th>--%>
               <%--    <th>Bit Coin Address</th>--%>
                          <%-- <th>Branch</th>
                           <th>IFSC</th>
                           <th>AccNo</th>
                           <th>AccHolder</th>--%>
                         <%--  <th>Paytm</th>
                           <th>PhonePay</th>
                           <th>GooglePay</th>--%>
                 <th>Status</th>
                  
                 <th>Wallet Address</th>
                
            </tr>
        </thead>
    <tbody>
        </HeaderTemplate>
         <ItemTemplate>
             <tr><td> <%#Container.ItemIndex+1 %> </td>
                   <td><%#Eval("packtype") %></td>
                 
                <td>  <asp:Label ID="lbuname" runat="server" Text='<%#Eval("username") %>'></asp:Label></td>
                   <td><%#Eval("incometype") %></td>
                <td>  <asp:Label ID="lbunme" runat="server" Text='<%#Eval("name") %>'></asp:Label></td>
                <td>  <asp:Label ID="lbumobilee" runat="server" Text='<%#Eval("mobile") %>'></asp:Label></td>
            
                  <td> <asp:Label ID="lbamt" runat="server" Text='<%#Eval("Amount") %>'></asp:Label></td>
                    
                  <td> <asp:Label ID="Label2" runat="server" Text='<%#Eval("AdminCharge") %>'></asp:Label></td>                   
       <%--           <td> <asp:Label ID="Label12" runat="server" Text='<%#Eval("TDS") %>'></asp:Label></td>                   --%>
                  <td> <asp:Label ID="Label1" runat="server" Text='<%#Eval("Payout") %>'></asp:Label></td>
                  <%--<td class="text-primary"><b><%#Eval("TDS") %>(<%#Eval("incometype") %>)</b> </td>--%> 
                  <td><%#DataBinder.Eval(Container.DataItem, "DOR", "{0:dd/MM/yyyy}")%></td>
                  <td><%#DataBinder.Eval(Container.DataItem, "DOA", "{0:dd/MM/yyyy}")%></td>
              <%--    <td><%#Eval("remark") %></td>--%>
                 <%--   <td><%#Eval("accountlink") %></td>--%>
                          <%-- <td><%#Eval("branchname") %></td>
                           <td><%#Eval("ifsc") %></td>
                           <td>'<%#Eval("accno") %></td>
                           <td><%#Eval("holdername") %></td> --%>
                          <%-- <td><%#Eval("paytm") %></td>
                           <td><%#Eval("phonepay") %></td>
                           <td><%#Eval("googlepay") %></td>--%>
                  <td><%#Eval("status") %></td>
                
                  <td><%#Eval("Wallet") %></td>
              
                 </tr>

         </ItemTemplate>
        <FooterTemplate>
            </tbody>
 </table>
        </FooterTemplate>
    </asp:Repeater>
    
   
</div>

    </div></div></div>
        </div>
        
</asp:Content>

