<%@ Page Title="" Language="C#" MasterPageFile="~/Member/MasterPage.master" AutoEventWireup="true" CodeFile="WalletRecharge.aspx.cs" Inherits="User_WalletRecharge" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
  
            <script type="text/javascript">

                function myFunction() {

                    var copyText = document.getElementById('ctl00_ContentPlaceHolder1_myInput');
                    copyText.select();
                    copyText.setSelectionRange(0, 99999); /*For mobile devices*/
                    /* Copy the text inside the text field */
                    document.execCommand("copy");
                    /* Alert the copied text */

                    alert("Copied the Wallet: " + copyText.value);

                }
     


            </script>
            <!-- Content -->
            <style type="text/css">
                #ContentPlaceHolder1_bntsubmit {
                    border-radius: 25px;
                }

                #ContentPlaceHolder1_btncencel {
                    border-radius: 25px;
                }
            </style>

            <style>
                .TxtBoxError {
                    border: 1px solid red;
                    width: 250px;
                    height: 30px;
                }
            </style>
            <script type="text/javascript">
                function Validate() {

                    var isChecked = false;

                    //if (document.getElementById("ContentPlaceHolder1_drpAmt").value == "Select") {
                    //    document.getElementById("ContentPlaceHolder1_drpAmt").className = "TxtBoxError";

                    //}
                    //else {

                    //    document.getElementById("ContentPlaceHolder1_drpAmt").className = "form-control";
                    //    isChecked = true;
                    //}
                    if (document.getElementById("ContentPlaceHolder1_DrpPaymentMode").value == "Select") {
                        document.getElementById("ContentPlaceHolder1_DrpPaymentMode").className = "TxtBoxError";

                    }
                    else {

                        document.getElementById("ContentPlaceHolder1_DrpPaymentMode").className = "form-control";
                        isChecked = true;
                    }

                    return isChecked;
                }
            </script>
         

         
            <!------Msgbox End---->
            <div class="card-body">

                <div class="alert alert-danger alert-dismissible" id="danger" runat="server" visible="false">

                    <h4><i class="icon fa fa-ban"></i>Alert!</h4>
                    <asp:Label ID="lbdanger" runat="server" Text="There is  some thing wrong........."></asp:Label>
                </div>
                <div class="alert alert-info alert-dismissible" id="info" runat="server" visible="false">

                    <h4><i class="icon fa fa-info"></i>Alert!</h4>
                    <asp:Label ID="lbinfo" runat="server" Text="ere is  some thing wrong........."></asp:Label>

                </div>
                <div class="alert alert-warning alert-dismissible" id="warning" runat="server" visible="false">

                    <h4><i class="icon fa fa-warning"></i>Alert!</h4>
                    <asp:Label ID="lbwarning" runat="server" Text=" Try Again............"></asp:Label>

                </div>
                <div class="alert alert-success alert-dismissible" id="sccess" runat="server" visible="false">

                    <h4><i class="icon fa fa-check"></i>Alert!</h4>
                    <asp:Label ID="lbsuccess" runat="server" Text="Successfully updated................"></asp:Label>
                </div>

            </div>


            <div class="row">

                <div class="col-lg-12">
                    <div class="card ">
                     
                        <!----form start---->
                        <div class="form-horizontal">
                            <div class="card-body">

                                       <h4 class="mb-2">TopUp (Manual)</h4>

                                <div class="mb-3 row">

                                    <label class="control-label  col-sm-4">Enter Deposit Amount</label>
                                    <div class="col-lg-8">
                                        <asp:TextBox ID="txtAmount" runat="server" CssClass=" form-control" Placeholder="Enter Deposit Amount" required=""></asp:TextBox>
                                    </div>

                                </div>
                                <asp:ScriptManager runat="server"></asp:ScriptManager>
                                <asp:UpdatePanel ID="UpdatePanel1" UpdateMode="Conditional" runat="server">
                                    <Triggers>

                                        <asp:AsyncPostBackTrigger ControlID="drpPaymentMode" EventName="SelectedIndexChanged" />

                                    </Triggers>
                                    <ContentTemplate>
                                           <div class=" row  mb-3">
                        <label class="control-label  col-lg-4">Payment Mode</label>
                        <div class="col-lg-8">
                            <asp:DropDownList runat="server" ID="drpPaymentMode" DataTextField="PaymentMode" DataValueField="PaymentMode" OnSelectedIndexChanged="drpbankname_SelectedIndexChanged" AutoPostBack="true" CssClass="form-control"></asp:DropDownList>
                        </div>
                    </div>
                                         <div id="div1" runat="server" visible="false" class=" row align-items-center mb-3">
                        <asp:Label ID="lbqr" runat="server" CssClass="control-label   col-lg-4">QR CODE</asp:Label>
                        <div class="col-sm-8">
                            <img src="loo1aa.png" id="Img1" runat="server" style="width: 50%;" />
                        </div>
                    </div>

                    <div id="divupi" runat="server" visible="false" class=" row  mb-3 ">
                        <asp:Label ID="lbpaymentmode" runat="server" CssClass="control-label  col-lg-4"></asp:Label>
                        <div class="col-lg-8" style="display: flex">
                            <asp:Label ID="UPIID" ReadOnly="true" CssClass="form-control" runat="server"></asp:Label>
                            <%--<span class="input-group-text show-pass border-warning">
                                <i id="showpassword" onclick="script: myFunction();" class=" bi bi-printer text-danger"></i>
                            </span>--%>
                            
                        </div>
                    </div>

                    <asp:HiddenField runat="server" ID="hndqr" />
                                       
            <input type="text" name="link" id="myInput" runat="server" value="" style="opacity: 0;">
                                       

                                        <div class="mb-3 row">

                                            <label class="control-label  col-sm-4">TXID/HASHCODE</label>
                                            <div class="col-lg-8">
                                                <asp:TextBox ID="txtremark" runat="server" Placeholder="Enter Deposit Transaction TXID/HASH" CssClass="form-control"></asp:TextBox>
                                            </div>



                                        </div>
                                    </ContentTemplate>
                                </asp:UpdatePanel>

                                <div class="mb-3 row">
                                    <label class="control-label col-sm-4">Upload  Reciept </label>
                                    <div class="col-sm-4">
                                        <asp:FileUpload ID="FileUpload1" runat="server" ClientIDMode="Static" onchange="this.form.submit()" />
                                    </div>

                                </div>

                                <div class="mb-3 row">
                                    <div class="col-lg-8">
                                        <asp:Image ID="Image1" runat="server" ImageUrl="~/SoftImg/NoImage.jpeg" Width="20%" />
                                        <input type="hidden" runat="server" id="hndurl" />
                                        <input type="hidden" runat="server" id="hndID" />
                                    </div>
                                </div>



                            </div>

                            <div class="card-footer">
                                <center>
                                    <asp:Button ID="bntsubmit" OnClick="bntsubmit_Click" OnClientClick="return Validate();" runat="server" Text="Confirm" Width="200px" CssClass=" btn bg-success text-white" />
                                </center>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </div>

</asp:Content>
