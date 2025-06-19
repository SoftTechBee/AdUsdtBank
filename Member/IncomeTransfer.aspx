<%@ Page Title="" Language="C#" MasterPageFile="~/member/MasterPage.master" AutoEventWireup="true" CodeFile="IncomeTransfer.aspx.cs" Inherits="User_FundTransfer" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
      
    <!------Msgbox End---->
     <div class="box-body">
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
            </div>
    <!-----Alert End----->
<script type="text/javascript">
        function Validate() {
            // alert('');
             var isChecked = false;

           
             if (document.getElementById("ContentPlaceHolder1_drpPackage").value == "Select") {
                 document.getElementById("ContentPlaceHolder1_drpPackage").className = "TxtBoxError";
                 isChecked = false;
             }
             else {

                 document.getElementById("ContentPlaceHolder1_drpPackage").className = "form-control";
                 isChecked = true;
             }
             if (document.getElementById("ContentPlaceHolder1_txtOTP").value != "")
             {
                 document.getElementById("ContentPlaceHolder1_txtOTP").className = "form-control";   
                 isChecked = false;
             }
             else {

                 document.getElementById("ContentPlaceHolder1_txtOTP").className = "form-control";               
                 isChecked = true;
             }
             return isChecked;
             
         }
</script>
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

          <div class="row">
<div  class="col-lg-12">
           <div class="card ">
                            <div class="card-body">

              <h3 class="text text-bold text-danger mb-2">  Income Transfer  </h3>
                                   
                                <div class=" form-group row">
                                            <label class="control-label col-lg-3">Income Type</label>
                                            <div class="col-lg-4">
                                                <asp:DropDownList runat="server" ID="drpIncomeType" AutoPostBack="true" OnTextChanged="drpIncomeType_TextChanged" CssClass="form-control" RepeatDirection="Horizontal">
                                                    <asp:ListItem Value="0">------ Select ------</asp:ListItem>
                                                    <asp:ListItem Value="DIRECT">Direct Income</asp:ListItem>
                                                    <asp:ListItem Value="OTHER">Other Income</asp:ListItem>
                                                    <%--<asp:ListItem Value="LEVEL-ROI">AI Robot Level Program</asp:ListItem>--%>
                                                </asp:DropDownList>
                                            </div>

                                            <label class="control-label col-lg-2">Available Income </label>
                                            <div class="col-lg-3">
                                                <h5>
                                                    <asp:Label CssClass="text-primary" runat="server" ID="lbIncome" Text="0"></asp:Label><i style="font-size: 10px"> USDT</i></h5>
                                            </div>
                                        </div>
                                        <br />

                       <%--<div class="mb-3 row">
                          <label class="control-label col-sm-3">Available Income  </label>
                          <div class="col-sm-6">
                     
              <h3> <asp:Label ID="txtbalance" runat="server" Text="0"></asp:Label></h3>

            
                          </div>
                           </div>--%>
                        <div class="mb-3 row">
                          <label class="control-label col-sm-3"> Member </label>
                          <div class="col-sm-6">
                             
                          <asp:Label ID="lbActiveMember"  runat="server"  CssClass="control-label"></asp:Label>
                          </div>
                          </div>
                                

                     <div class="mb-3 row">
                          <label class="control-label col-sm-3">Enter Transfer Member ID </label>
                          <div class="col-sm-6">
                             
                          <asp:Textbox ID="txtTransid"  required=""  AutoPostBack="true" OnTextChanged="txtTransid_TextChanged" runat="server"  CssClass="form-control" placeholder="Enter Transfer Member"></asp:Textbox>
                            <asp:Label ID="lbTransname"  runat="server"  CssClass="control-label"></asp:Label>
                        
                          </div>
                          </div>
                          <div class="mb-3 row">
                          <label class="control-label col-sm-3">Enter Transfer Income amount </label>
                          <div class="col-sm-6">
                             
                          <asp:Textbox ID="txtAMount"   required="" runat="server" OnTextChanged="txtAMount_TextChanged" AutoPostBack="true"  CssClass="form-control" placeholder="Enter Transfer amount"></asp:Textbox>
                    </div>
                              </div>
                                          <div class="form-group row">
                                              
                         <label class="control-label col-lg-3 ">Admin Fee(10%) </label>     

                        <div class="col-lg-6">
                         <asp:TextBox ID="txtadmincharge" Text="" required="" ReadOnly="true" runat="server" CssClass="form-control"></asp:TextBox>
                         </div>
                         </div>
                               <div class="form-group row">
                           <label class="control-label col-lg-3">Final Fund Transfer  </label>     

                        <div class="col-lg-6">
                         <asp:TextBox ID="txtfinal" Text="" required=""  placeholder="Enter Transfer amount" runat="server" CssClass="form-control"></asp:TextBox>
                         </div>
                            
                          </div>
                                              
                       <div class=" mb-3 row">
                           
                  <label class="control-label  col-lg-3">Enter  Transaction Password<span  class="text text-danger ">*</span></label>
                             <div class="col-lg-6">
                   <asp:TextBox ID="txttransPassword" runat="server" required="" TextMode="Password"   class="form-control" placeholder="Enter  Transaction Password"></asp:TextBox>              
                </div>
                          
                </div>
                                        
                                    
                     <div class="mb-3 row">
                       
                   <div class=" col-sm-4">

</div>                  <div class=" col-sm-4">

   <asp:Button ID="btnaction" runat="server" Text="Transfer"  OnClick="butsubmit_Click" Width="200px" CssClass=" btn bg-success btn-flat btn-lg" />
               
        </div>
                  </div>
                   
          </div>
          <!-- /.box -->
                    
                      </div>

              
              
                 </div>         
            
             
             
   </div>


   <%--</ContentTemplate>
         </asp:UpdatePanel>--%>



</asp:Content>

