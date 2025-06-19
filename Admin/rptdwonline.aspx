<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" CodeFile="rptdwonline.aspx.cs" Inherits="Adminmain_rptdwonline" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

      
           <div class="card ">
              <div class="form-horizontal">
                            <div class="card-body">
              <h3> Downline Team</h3>

                         <div class="col-lg-2">
                    <asp:Button ID="btnExportToExcel" CssClass="btn btn-block  btn-dark" Text="Export To Excel" OnClick="btnExportToExcel_Click" runat="server" />
                </div>
                                        <div class="form-group row">
                <label class="col-lg-2 col-md-2 col-xs-6 ">Enter Distributor  </label>
        <div class="col-lg-6 col-md-3 col-xs-6"> 
                   <asp:TextBox ID="txtuname" runat="server" placeholder="Please Enter User Name For Search"  class="form-control" ></asp:TextBox>              
                  
                </div>
 <div class="col-lg-2 col-md-2 col-xs-6 ">
      
            <asp:Button ID="btnSeach" runat="server" Text="Search" CssClass="btn btn-block btn-danger"   OnClick="btnSeach_Click"/>

      </div>
</div>     <%--<div class="form-group row">
                <label class="col-lg-2 col-md-2 col-xs-6 ">Select Side </label>
    <div class="col-lg-3 col-md-3 col-xs-6">
      
           <asp:DropDownList runat="server" ID="drpside"  CssClass="form-control">
                  <asp:ListItem Value="0"> Select</asp:ListItem>
                                  <asp:ListItem Value="A">All</asp:ListItem>
                                  <asp:ListItem Value="L">Left</asp:ListItem>
                                  <asp:ListItem Value="R">Right</asp:ListItem>
                                
                                
                              </asp:DropDownList>
                
      
    </div>
                <label class="col-lg-2 col-md-2 col-xs-6 ">Select Account Status </label>
    <div class="col-lg-3 col-md-3 col-xs-6 ">
     
        
                 <asp:DropDownList runat="server" ID="drpstatus"  CssClass="form-control">
                                   <asp:ListItem Value="0"> Select</asp:ListItem>
                                  <asp:ListItem Value="3">All</asp:ListItem>
                                  <asp:ListItem Value="1">Paid</asp:ListItem>
                                  <asp:ListItem Value="2">Un-Paid</asp:ListItem>                              
                                
                          </asp:DropDownList>
                 
          
        </div>
 --%>
              <div class="form-group">
                        <div class="col-lg-12 col-md-12 col-xs-12 col-sm-12" style="overflow:auto;">
             
                <table id="example1" class="table table-bordered table-striped table-hover " >
<asp:Repeater ID="Repeater1" runat="server" >
                <HeaderTemplate>
                    <thead>
                <tr>
                    <th >#</th>
                  <th>Distibutor</th>
                    <th >Wallet</th>
                  <th>Sponsor</th>
                 <th>Amount</th>
                 <th>Level</th>
                 <%--<th>Account Status</th>--%>
                  
                  
                </tr>
                </thead>
                    </HeaderTemplate>
    <ItemTemplate>

                <tbody>
   
        <tr>
            <td> <%# Container.ItemIndex+1 %></td>
             
            <td> <%#Eval("username") %></td>
             <td> <%#Eval("Name") %></td>
               <td> <%#Eval("reffid") %></td>
               <td> <%#Eval("joinamount") %></td>
               <td> <%#Eval("LevelNo") %></td>
               <%--<td> <%#Eval("Status") %></td>--%>
           

        </tr>
   
         </tbody>
                     </ItemTemplate>

</asp:Repeater>
             <%--   <tfoot>
                <tr>
                       <th >#</th>
                 <th ></th>
                 
                  <th>Total</th>
                  <th>     </th>
                               <th><asp:Label ID="lbtotal" runat="server" Text=""></asp:Label>
  
                                   </th>
                   <th>     </th> 
                </tr>
                </tfoot>--%>
              </table>  
                
            </div>
               </div>     
<%--<div class="form-group row">
    <div class="col-lg-12" style="overflow:auto; ">
       
      
                  <asp:gridview ID="grdData" runat="server" AutoGenerateColumns="False" CellPadding="100" PageSize="50"  Font-Size="Large" CssClass="table table-bordered table-striped table-hover"

          GridLines="Both" Width="100%"   OnPageIndexChanging="grdData_PageIndexChanging"  >
           
            <columns>
             

<asp:TemplateField HeaderText="#">
                <ItemTemplate>
                    <%# Container.DataItemIndex + 1 %>
                </ItemTemplate>
                <ItemStyle Width="10%" />
</asp:TemplateField>
                <asp:boundfield DataField="username" HeaderText="Distibutor"></asp:boundfield>
                <asp:boundfield DataField="Name" HeaderText="Name"></asp:boundfield>
                <asp:boundfield DataField="reffid" HeaderText="SponsorID"></asp:boundfield>
                <asp:boundfield DataField="joinamount"  HeaderText="PurchasePackage"></asp:boundfield>
                <asp:boundfield DataField="LevelNo"  HeaderText="Level"></asp:boundfield>      
                <asp:boundfield DataField="Status" HeaderText="AccountStatus"></asp:boundfield>
               
            </columns>
          
           
        </asp:gridview>
       </div></div>--%>


                            </div>
               </div>
    </div>
         
</asp:Content>

