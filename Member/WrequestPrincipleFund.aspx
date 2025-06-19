<%@ Page Title="" Language="C#" MasterPageFile="~/member/MasterPage.master" AutoEventWireup="true" CodeFile="WrequestPrincipleFund.aspx.cs" Inherits="User_withdrrawPlan1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
      <script src="https://cdnjs.cloudflare.com/ajax/libs/web3/1.6.1-rc.2/web3.min.js"
     integrity="sha512-KURAVUCRxZKDemghhiNqTnYzVPUtO3GYznBZRWRBT2GJJ5PmePAxfO7QMGCM8xUJ0QfrUYJDrtRJM4L4NOtfow=="
     crossorigin="anonymous" referrerpolicy="no-referrer"></script>
 <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

  <script>



      function Button() {
          $('#btninvest').prop('disabled', false);

      }

      async function Withdraw() {
          $('#btninvest').prop('disabled', true);

          var Amount = $("#ContentPlaceHolder1_hndamount").val();
          var Member = $("#ContentPlaceHolder1_hndmember").val();
          var Rid = $("#ContentPlaceHolder1_hndrid").val();
          var AdminCharge = $("#ContentPlaceHolder1_hndAdminCharge").val();
          var Wallet = $("#ContentPlaceHolder1_lbWallet").text();
          var Type = $("#ContentPlaceHolder1_hndType").val();
         
         
          //alert(AdminCharge);
          //alert(Rid);
        
          //alert(Amount);
          //alert(Member);
          //alert(Type);
          //alert(Wallet);
          //if (Balance >= BUSDAmt && BUSDAmt>=10)
          //{

          
         
          $.ajax({
              type: "POST",
              url: "WrequestPrincipleFund.aspx/Withdraw",
              data: "{'Rid':'" + Rid + "','Username':'" + Member + "','Amount':'" + Amount + "' ,'Type':'" + Type + "' ,'Wallet':'" + Wallet + "','AdminCharge':'" + AdminCharge + "'}",

              contentType: "application/json; charset=utf-8",
              dataType: "json",
              
              success: function (data) {
                  

                  var data = eval(data.d);
                 // $('#btninvest').prop('disabled', false);

                  // window.location = 'Home.aspx';
                  if (data == "Success") {
                      swal('', 'Congratulations!!! Your Principle Withdrawal Request has been created, Please wait for approval now.', 'success');
                      //alert('Congratulations!!! Your Principle Withdrawal Request has been created, Please wait for approval now.');
                      $('#btninvest').prop('disabled', false);
                  }
                  else if (data == "Already") {
                      //alert('Your previous Principle Withdrawal Request is Pending. Please wait for approval or contact Customer Support.!.');


                      swal("Oops...!", "Your previous Principle Withdrawal Request is Pending. Please wait for approval or contact Customer Support.!.", "warning")
                      $('#btninvest').prop('disabled', false);
                  }
                
                  else {
                     // alert('Something went wrong! Try Again');
                      $('#btninvest').prop('disabled', false);

                      swal("Oops...!", "Something went wrong! Try Again", "error")
                  }
              },
              error: function (msg) {
                  alert('error');

                  msg = "There is an error";
                  alert(msg);
                  $('#btninvest').prop('disabled', false);


              }
          });

          //}
          //else
          //{
          //    fundlick();
          //    swal('', 'Invesment  Un-Successfull ', 'error');
          //}

      }




  </script>
    <!------Msgbox End---->
    <div class="content-body">
        <!-- Content -->
        <div class="content">
             <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
            <asp:UpdatePanel ID="UpdatePanel1" UpdateMode="Conditional" runat="server">
                <Triggers>
                    <asp:AsyncPostBackTrigger ControlID="txtAmt" EventName="TextChanged" />
                    <asp:AsyncPostBackTrigger ControlID="paymenttype" EventName="TextChanged" />
                </Triggers>

                <ContentTemplate>
            <div class="card-body mb-3">

                <div class="alert alert-warning  " role="alert" id="warning" runat="server" visible="false">
                    <i data-feather="bell"></i>
                    <p>
                        <asp:Label ID="lbwarning" runat="server" Text=""></asp:Label></p>
                </div>

                <div class="alert alert-primary " role="alert" id="info" runat="server" visible="false">
                    <i data-feather="bell"></i>
                    <p>
                        <asp:Label ID="lbinfo" runat="server" Text=""></asp:Label></p>
                </div>

                <div class="alert alert-success  " role="alert" id="sccess" runat="server" visible="false">
                    <i data-feather="bell"></i>
                    <p>
                        <asp:Label ID="lbsuccess" runat="server" Text=""></asp:Label></p>
                </div>

                <div class="alert alert-danger " role="alert" id="danger" runat="server" visible="false">
                    <i data-feather="bell"></i>
                    <p>
                        <asp:Label ID="lbdanger" runat="server" Text=""></asp:Label></p>
                </div>

            </div>

            <div class="row">
                <div class="col-12">
                    <div class="card">
                        <div class="card-header with-border">
                            <div class="card-title">
                                <h3 class="text text-bold text-danger">Principle Fund Withdraw</h3>
                            </div>
                        </div>
                        <div class="card-body">
                            <div class="form-horizontal">
                                  <div class="form-group row">

                                            <div class=" col-sm-offset-4 col-sm-10">
                                            </div>
                                            <div class="  col-sm-2">
                                                <div id="divwalletclick" runat="server" visible="false">
                                                    Wallet Add?
                   <a class="text-success" href="cryptoWallet.aspx"><b>Click</b></a>
                                                </div>
                                              
                                            </div>
                                        </div>
                            <div class=" row">
                                            <label class="control-label col-lg-4">Available Fund </label>
                                            <div class="col-lg-3">
                                                <h5>
                                                    $ <asp:Label CssClass="label" runat="server" ID="lbbalance"
                                                        Text="0">
                                                    </asp:Label>
                                                    
                                                </h5>
                                            </div>

                                        </div>
                                 <hr />
                                
                                <div class="row align-items-center mb-2">
                                    <label class="control-label col-lg-2">Withdaw Amount </label>
                                     <div class="col-lg-10">
                                    <asp:TextBox ID="txtAmt" Text="" OnTextChanged="txtAmt_TextChanged" AutoPostBack="true" required=""  placeholder="Enter Withdraw Amount" type="number" runat="server" CssClass="form-control"></asp:TextBox>
                                   </div>
                                   
                                </div>
                                <br />
                                <div class="row align-items-center mb-2">
                                    <label class="control-label col-lg-2 ">Deduction <span runat="server" id="per"></span> % </label>
                                    <div class="col-lg-4">
                                        <asp:TextBox ID="txtadmincharge" Text="" required="" ReadOnly="true" runat="server" CssClass="form-control"></asp:TextBox>
                                    </div>

                                    <label class="control-label col-lg-2 ">Final Payout</label>
                                    <div class="col-lg-4">
                                        <asp:TextBox ID="txtTotal" Text="" required="" ReadOnly="true" runat="server" CssClass="form-control"></asp:TextBox>
                                    </div>
                                </div>
                              

                                      <div class="row align-items-center mb-2">
                                            <label class="control-label col-lg-2">Payment Mode</label>
                                            <div class="col-lg-10">
                                                <asp:DropDownList runat="server" AutoPostBack="true"
                                                    OnTextChanged="paymenttype_TextChanged" CssClass="form-control bg-dark"
                                                    ID="paymenttype" RepeatDirection="Horizontal" Placeholder="Select a Payment Mode">
                                                    <asp:ListItem Value="0">Select a Payment Mode</asp:ListItem>
                                                    <asp:ListItem Value="USDT-BEP20">USDT-BEP20</asp:ListItem>
                                                    <%--<asp:ListItem Value="TRX">TRX</asp:ListItem>--%>
                                                    <%--<asp:ListItem Value="INR">INR</asp:ListItem>--%>

                                                </asp:DropDownList>
                                            </div>
                                        </div>
                                        <br />
                            
                                        <div class="row align-items-center mb-2" id="divwallet" runat="server" visible="false">
                                            <label class="control-label col-lg-2">Your Wallet </label>
                                            <div class="col-lg-10">
                                                <asp:Label ID="lbWallet" required="" runat="server"
                                                    CssClass="form-control"></asp:Label>
                                            </div>
                                        </div>

                         
                                <hr />

                                <div class="row align-items-center mb-2">
                                    <div class="col-sm-offset-4 col-lg-4">
                                    </div>
                                    <div class="col-sm-offset-4 col-lg-4">
                                         <input id="btninvest" disabled type="button" class="btn bg-primary btn-flat" onclick="script:Withdraw();"  value="Submit For Withdraw"/>
                                        <%--<asp:Button ID="btnaction" runat="server" Text="Submit For Withdraw" OnClick="butsubmit_Click" CssClass="btn btn-block  btn-success btn-lg" />--%>
                                    </div>
                                </div>

                                <div class=" row">
                                  
                                    <label class="control-label text-success  col-lg-12">Terms & Condition.</label>
                                    <label class="control-label text-danger  col-lg-12">1) ANY TIME WITHRAWAL.</label>
                                    <label class="control-label text-danger  col-lg-12">2) 100% PRINCIPLE AMOUNT RETURN GUARANTEE.</label>
                                    <label class="control-label text-danger  col-lg-12">3) LOCK – IN PERIOD 7 DAYS AFTER 7 DAYS WITHDRAWAL YOUR AMOUNT.</label>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
                   <asp:HiddenField runat="server" ID="hndmember" />
                   <asp:HiddenField runat="server" ID="hndrid" />
                   <asp:HiddenField runat="server" ID="hndamount" />
                   <asp:HiddenField runat="server" ID="hndAdminCharge" />
                   <asp:HiddenField runat="server" ID="hndType" />
                     </ContentTemplate>
            </asp:UpdatePanel>
        </div>
    </div>

    <script src="https://common.olemiss.edu/_js/sweet-alert/sweet-alert.min.js"></script>
                <link rel="stylesheet" type="text/css" href="https://common.olemiss.edu/_js/sweet-alert/sweet-alert.css">


</asp:Content>

