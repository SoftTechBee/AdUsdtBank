<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" CodeFile="cryptoWallet.aspx.cs" Inherits="User_cryptoWallet1" %>

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


    <!-- start page title -->
    <div class="row">
        <div class="col-12">
            <div class="page-title-box d-flex align-items-center justify-content-between">
                <h4 class="TNC-0">Crypto Wallet Address </h4>

            </div>
        </div>
    </div>
    <!-- end page title -->



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
    <div class="alert alert-info alert-dismissible fade show TNC-0" role="alert" id="info" runat="server" visible="false">
        <i class="uil uil-question-circle me-2"></i>
        <asp:Label ID="lbinfo" runat="server" Text="ere is  some thing wrong........."></asp:Label>
        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close">
        </button>
    </div>


    <br />
    <div class="row">
        <div class="col-lg-12">

            <div class="input-group input-group-xxlg" style="margin-bottom: 30px;">
                <asp:TextBox ID="txtsearch" CssClass="form-control" runat="server" placeholder="Enter UserName"></asp:TextBox>

                <span class="input-group-btn">
                    <asp:Button ID="btnsearch" OnClick="btnsearch_Click" runat="server" Text="Go!" CssClass="btn btn-info btn-flat btn-lg" />

                </span>
            </div>
        </div>
    </div>

    <div class="card">
        <div class="form-horizontal">
            <div class="card-body">

                <div class="row">



                    <div class="col-lg-12 col-sm-10">


                        <div class="form-horizontal">

                            <!----form start---->
                            <div class=" form-group row">
                                <label class="control-label  col-lg-3">USDT (BEP-20) Address </label>
                                <div class="col-lg-9">
                                    <asp:TextBox ID="txtUsdtBep20" runat="server" class="form-control" requred="" placeholder="Enter  USDT (BEP20) Address"></asp:TextBox>

                                </div>

                            </div>
                            <br />
                           <div class=" form-group row d-none">
                                <label class="control-label  col-lg-3">USDT (TRC-20) Address </label>
                                <div class="col-lg-9">
                                    <asp:TextBox ID="txtUsdtTRC20" runat="server" class="form-control" requred="" placeholder="Enter  USDT (TRC20) Address"></asp:TextBox>

                                </div>

                            </div>
                            <br />
                            <br />

                            <div class="box-footer">
                                <center>
                                    <asp:Button ID="bntsubmit" OnClick="bntsubmit_Click" runat="server" Text="Update" Width="200px" CssClass=" btn bg-success btn-flat btn-lg" />

                                    <%--    <asp:Button ID="btncencel" runat="server" OnClick="btncencel_Click" Text="Cancel" Width="200px" CssClass="btn  btn-danger btn-lg btn-flat"  />  
                                    --%>
                                </center>
                            </div>
                        </div>
                    </div>

                </div>

            </div>


        </div>


    </div>



</asp:Content>


