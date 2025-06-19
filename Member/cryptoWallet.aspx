<%@ Page Title="" Language="C#" MasterPageFile="~/member/MasterPage.master" AutoEventWireup="true" CodeFile="cryptoWallet.aspx.cs" Inherits="User_cryptoWallet1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <!-- Content body -->

    <asp:ScriptManager runat="server"></asp:ScriptManager>
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




    <div class="alert alert-success alert-dismissible fade show" role="alert" id="sccess" runat="server" visible="false">
        <i class="uil uil-check me-2"></i>
        <asp:Label ID="lbsuccess" runat="server" Text="Successfully updated................"></asp:Label>
        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close">
        </button>
    </div>
    <div class="alert alert-danger alert-dismissible fade show" role="alert" id="danger" runat="server" visible="false">
        <i class="uil uil-exclamation-octagon me-2"></i>
        <asp:Label ID="lbdanger" runat="server" Text="There is  some thing wrong........."></asp:Label>
        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close">
        </button>
    </div>
    <div class="alert alert-warning alert-dismissible fade show" role="alert" id="warning" runat="server" visible="false">
        <i class="uil uil-exclamation-triangle me-2"></i>
        <asp:Label ID="lbwarning" runat="server" Text=" Try Again............"></asp:Label>
        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close">
        </button>
    </div>
    <div class="alert alert-info alert-dismissible fade show mb-0" role="alert" id="info" runat="server" visible="false">
        <i class="uil uil-question-circle me-2"></i>
        <asp:Label ID="lbinfo" runat="server" Text="ere is  some thing wrong........."></asp:Label>
        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close">
        </button>
    </div>




    <div class="card">
        <div class="form-horizontal">
            <div class="card-body">
                
                <h4 class="mb-0">Crypto Wallet Address </h4>
                <div class="row">



                    <div class="col-lg-10 col-sm-12">


                        <div class="form-horizontal">

                            <!----form start---->
                            <%--<div class=" form-group row">
                  <label class="control-label  col-lg-2">TRON-(TRC20) </label>
                             <div class="col-lg-10">
                  <asp:TextBox ID="txtTRX" runat="server"  class="form-control"  requred="" placeholder="Enter  TRON-(TRC20) Wallet"></asp:TextBox>              
                             
                </div>
                          
                </div>--%>
                            <br />

                            <div class=" form-group row">
                                <label class="control-label  col-lg-2">USDT-(BEP20) </label>
                                <div class="col-lg-10">
                                    <asp:TextBox ID="txtUSDT" runat="server" class="form-control" requred="" placeholder="Enter  USDT-(BEP20) Wallet"></asp:TextBox>

                                </div>

                            </div>
                            <br />
                            <%-- <div class=" form-group row">
                  <label class="control-label  col-lg-2">TRX Wallet </label>
                             <div class="col-lg-10">
                  <asp:TextBox ID="txtTRX" runat="server"  class="form-control"  requred="" placeholder="Enter  TRX Wallet"></asp:TextBox>              
                             
                </div>
                          
                </div>  <br />
               
                     <div class=" form-group row">
                  <label class="control-label  col-lg-2">USDT-(TRC20)  </label>
                             <div class="col-lg-10">
                  <asp:TextBox ID="txtUSDT" runat="server"  class="form-control"  requred="" placeholder="Enter  USDT TRC20 Wallet"></asp:TextBox>              
                             
                </div>
                          
                </div>
                <br />--%>
                            <%--<div class=" form-group row">
                  <label class="control-label  col-lg-2">RAISE BEP20 Wallet  </label>
                             <div class="col-lg-10">
                  <asp:TextBox ID="txtHHc" runat="server"  class="form-control"  requred="" placeholder="Enter  RAISE BEP20 Wallet "></asp:TextBox>              
                             
                </div>
                          
                </div>--%>
                            <br />
                            <%--<div class=" form-group row">
                  <label class="control-label  col-lg-2">DOGE COIN Wallet </label>
                             <div class="col-lg-4">
                  <asp:TextBox ID="txtDOge" runat="server"  class="form-control"  requred="" placeholder="Enter  DOGE COIN Wallet"></asp:TextBox>              
                             
                </div>
                          
                </div>--%>
                            <br />

                            <div class="box-footer">
                                <center>
                                    <asp:Button ID="bntsubmit" OnClick="bntsubmit_Click" runat="server" Text="Submit" Width="200px" CssClass=" btn btn-primary btn-flat btn-lg" />

                                    <%--<asp:Button ID="btncencel" runat="server" OnClick="btncencel_Click" Text="Cancel" Width="200px" CssClass="btn  btn-danger btn-lg btn-flat"  />  
                                    --%>
                                </center>
                            </div>
                        </div>
                    </div>

                </div>

            </div>


        </div>


    </div>
    </div>




</asp:Content>


