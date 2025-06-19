<%@ Page Title="" Language="C#" MasterPageFile="~/Member/MasterPage.master" AutoEventWireup="true" CodeFile="Home.aspx.cs" Inherits="Member_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    
    <script src="../myjs/jquery.min.js"></script>
    <script src="../myjs/Home.js"></script>
    <section class="content">

        <div class="box">
            <div class="box-body">
                <h4>Announcement :</h4>
                <div class="position-relative">
                    <marquee onmouseover="this.stop()" onmouseout="this.start()">
                        <h6>

                            <asp:Label ID="lbhead" Font-Bold="true" Font-Size="Larger" Font-Underline="true" runat="server" Text='<%#Eval("tittle")%>'></asp:Label>
                            :
                            <asp:Label ID="lbnews" Font-Bold="true" Font-Size="Larger" runat="server" CssClass="text-success" Text='<%#Eval("news")%>'>
                            </asp:Label></h6>

                    </marquee>
                </div>
            </div>
        </div>



        <div class="box">
            <div class="box-body text-center">
                <h5 class="page-header">
                    <span >
                        <asp:Label ID="lbreffsidLeft" runat="server" Text="0"></asp:Label></span>
                    <span class="badge  text-success"> <a onclick="script: myFunction();" class="btn btn-soft-light border border-warning">Copy &nbsp <span class="glyphicon glyphicon-copy"></span>
                        </a></span>
                </h5>
            </div>
        </div>
       
       

        <div class="row">
            <div class="col-xl-12 col-12">
                <!-- Profile Image -->
                <div class="box">
                    <div class="box-body box-profile text-center">
                        <%--<img src="../SoftImg/user.jfif" alt="Avatar Image" class="rounded img-fluid mx-auto d-block max-w-100" />--%>
                       <span class="badge  text-success"> <a onclick="script: wallet();" class="btn btn-soft-light border border-warning">
                       <asp:Label ID="lbwallet" CssClass="text-warning" runat="server" Text="0"></asp:Label> </a></span>



                        <div class="row">
                            <div class="col-12">
                                <div class="media-list media-list-hover media-list-divided w-p100 mt-30">
                                    <ul class="list-inline">
                                        <li class="flexbox mb-2">
                                            <div>
                                                <span class="badge badge-dot badge-lg me-1" style="background-color: #fc4b6c"></span>
                                                <span>Sponsor ID</span>
                                            </div>
                                            <div>
                                                <asp:Label ID="lbSponsorId" CssClass="text-warning" runat="server" Text="0"></asp:Label></div>
                                        </li>



                                        <li class="flexbox mb-2">
                                            <div>
                                                <span class="badge badge-dot badge-lg me-1" style="background-color: #f77339"></span>
                                                <span>Joining Date</span>
                                            </div>
                                            <div>
                                                <asp:Label ID="lbdoa" CssClass="text-warning" runat="server" Text="0"></asp:Label></div>
                                        </li>
                                      <%--  <li class="flexbox mb-2">
                                            <div>
                                                <span class="badge badge-dot badge-lg me-1" style="background-color: #b200ff"></span>
                                                <span>Join Amount</span>
                                            </div>
                                            <div>
                                                <asp:Label ID="lbjoinamount" CssClass="text-warning" runat="server" Text="0"></asp:Label></div>
                                        </li>--%>

                                      <%--  <li class="flexbox mb-2">
                                            <div>
                                                <span class="badge badge-dot badge-lg me-1" style="background-color: #c031c6"></span>
                                                <span>Status</span>
                                            </div>
                                            <div>
                                                <asp:Label ID="lbstatus" CssClass="text-warning" runat="server" Text="0"></asp:Label></div>
                                        </li>--%>
                                        
                                        <li class="flexbox mb-2">
                                            <div>
                                                <span class="badge badge-dot badge-lg me-1" style="background-color: #ffb22b"></span>
                                                <span>Income Limit</span>
                                            </div>
                                            <div>
                                                <asp:Label ID="lblimit" CssClass="text-warning" runat="server" Text="0"></asp:Label></div>
                                        </li>
                                        <li class="flexbox mb-2">
                                            <div>
                                                <span class="badge badge-dot badge-lg me-1" style="background-color: #0e7471"></span>
                                                <span>Current Package</span>
                                            </div>
                                            <div>
                                                <asp:Label ID="lbpack" CssClass="text-warning" runat="server" Text="0"></asp:Label> ($<asp:Label ID="lbjoinamount" CssClass="text-warning" runat="server" Text="0"></asp:Label>)</div>
                                        </li>
                                    </ul>


                                </div>
                            </div>

                        </div>
                    </div>
                    <!-- /.box-body -->
                </div>
                <!-- /.box -->
            </div>
           
        </div>
        <div class="row">
         <%--  
            <div class="col-lg-6 col-md-6">
                <div class="box pull-up">
                    <div class="box-body justify-content-center">
                        <div class="media align-items-center p-0">
                            <div class="text-center">
                                <a href="#"><i class="cc SCOT me-5" title="SCOT"></i></a>
                            </div>
                            <div>
                                <h3 class="no-margin text-bold">
                                    <asp:Label ID="lbinvest" runat="server" Text="0.00"></asp:Label></h3>
                            </div>
                        </div>
                        <div class="flexbox align-items-center mt-5">
                            <div>
                                <h4 class="no-margin fw-600 text-warning">Investment</h4>
                            </div>

                        </div>
                    </div>

                </div>
            </div>--%>
     <div class="col-lg-12 col-md-12">
                <div class="box pull-up">
                    <div class="box-body justify-content-center">
                        <div class="media align-items-center p-0">
                            <div class="text-center">
                                <a href="#"><i class="cc SCOT me-5" title="SCOT"></i></a>
                            </div>
                            <div>
                                <h3 class="no-margin text-bold">
                                    <asp:Label ID="lbTotalIncome" runat="server" Text="0.00"></asp:Label></h3>
                            </div>
                        </div>
                        <div class="flexbox align-items-center mt-5">
                            <div>
                                <h4 class="no-margin fw-600 text-warning">Total Income</h4>
                            </div>

                        </div>
                    </div>

                </div>
            </div>
        
            
        </div>
        <div class="row">
            
          <div class="col-12 col-md-12 ">
            <div class="card card_bg" >
                <div class="card-body pt-4 pb-2 px-5">
                            <span style="font-weight: bold; font-size: 20px;">Packages</span>
                   
                    <hr />
                    <div class="row">

                        <ul class="col-12 col-lg-12 d-flex flex-wrap align-items-center justify-content-center " id="s1list">
                        </ul>
                      <%--  <div class="col-12 col-lg-12">
                            <center><a href="M4Page.aspx" class="btn mb-3" style="background: #ff0101; color: #fff;">View &nbsp<i class="fas fa-arrow-circle-right" style="rotate: -35deg;"></i></a></center>
                        </div>--%>
                    </div>
                </div>
            </div>
        </div>
            <div class="col-12">
                <div class="box">
                    <div class="box-body">
                        <div class="row">
                            <div class="col-md-6 col-12">
                                <div class="text-center">
                                    <h1 class="text-bold count">
                                        <asp:Label ID="lbteam" CssClass="text-warning" runat="server" Text="0"></asp:Label></h1>
                                    <hr class="w-50 my-5 mx-auto b-3 border-warning">
                                    <h5 class="mt-10">Total Member</h5>
                                </div>
                            </div>
                            <div class="col-md-6 col-12">
                                <div class="text-center">
                                    <h1 class="text-bold count">
                                        <asp:Label ID="lbdirectTeam" CssClass="text-warning" runat="server" Text="0"></asp:Label></h1>
                                    <hr class="w-50 my-5 mx-auto b-3 border-warning">
                                    <h5 class="mt-10">Direct Member</h5>
                                </div>
                            </div>
                         <%-- <div class="col-md-4 col-12">
                                <div class="text-center">
                                    <h1 class="text-bold count">
                                        <asp:Label ID="lbpoolTeam" CssClass="text-warning" runat="server" Text="0"></asp:Label></h1>
                                    <hr class="w-50 my-5 mx-auto b-3 border-warning">
                                    <h5 class="mt-10">Pool Member</h5>
                                </div>
                            </div>--%>
                         
                        </div>
                    </div>
                    <!-- /.box-body -->
                </div>
            </div>
        </div>
       
        <div class="row">
            <div class="col-lg-4 col-md-6">
                <div class="box pull-up">
                    <div class="box-body">
                        <div class="media align-items-center p-0">
                            <div class="text-center">
                                <a href="#"><i class="cc USDT me-5" title="USDT"></i></a>
                            </div>
                            <div>
                                <h3 class="no-margin text-bold">
                                    <asp:Label ID="lbdirect" runat="server" Text="0.00"></asp:Label></h3>
                            </div>
                        </div>
                        <div class="flexbox align-items-center mt-5">
                            <div>
                                <h4 class="no-margin fw-600 text-warning">Refferal Income</h4>
                            </div>

                        </div>
                    </div>

                </div>
            </div>
            <div class="col-lg-4 col-md-6">
                <div class="box pull-up">
                    <div class="box-body justify-content-center">
                        <div class="media align-items-center p-0">
                            <div class="text-center">
                                <a href="#"><i class="cc USDT me-5" title="USDT"></i></a>
                            </div>
                            <div>
                                <h3 class="no-margin text-bold">
                                    <asp:Label ID="lbupgrade" runat="server" Text="0.00"></asp:Label></h3>
                            </div>
                        </div>
                        <div class="flexbox align-items-center mt-5">
                            <div>
                                <h4 class="no-margin fw-600 text-warning">Upgrade Bonus</h4>
                            </div>

                        </div>
                    </div>

                </div>
            </div>
            <div class="col-lg-4 col-md-6">
                <div class="box pull-up">
                    <div class="box-body">
                        <div class="media align-items-center p-0">
                            <div class="text-center">
                                <a href="#"><i class="cc USDT me-5" title="USDT"></i></a>
                            </div>
                            <div>
                                <h3 class="no-margin text-bold">
                                    <asp:Label ID="lblevelincome" runat="server" Text="0.00"></asp:Label></h3>
                            </div>
                        </div>
                        <div class="flexbox align-items-center mt-5">
                            <div>
                                <h4 class="no-margin fw-600 text-warning">Level Income</h4>
                            </div>

                        </div>
                    </div>

                </div>
            </div>
            <div class="col-lg-4 col-md-6">
                <div class="box pull-up">
                    <div class="box-body">
                        <div class="media align-items-center p-0">
                            <div class="text-center">
                                <a href="#"><i class="cc USDT me-5" title="USDT"></i></a>
                            </div>
                            <div>
                                <h3 class="no-margin text-bold">
                                    <asp:Label ID="lbdivident" runat="server" Text="0"></asp:Label></h3>
                            </div>
                        </div>
                        <div class="flexbox align-items-center mt-5">
                            <div>
                                <h4 class="no-margin fw-600 text-warning">Divident Bonus</h4>
                            </div>

                        </div>
                    </div>

                </div>
            </div>
            <div class="col-lg-4 col-md-6">
                <div class="box pull-up">
                    <div class="box-body">
                        <div class="media align-items-center p-0">
                            <div class="text-center">
                                <a href="#"><i class="cc USDT me-5" title="USDT"></i></a>
                            </div>
                            <div>
                                <h3 class="no-margin text-bold">
                                    <asp:Label ID="lbroyalty" runat="server" Text="0"></asp:Label></h3>
                            </div>
                        </div>
                        <div class="flexbox align-items-center mt-5">
                            <div>
                                <h4 class="no-margin fw-600 text-warning">Royalty Income</h4>
                            </div>

                        </div>
                    </div>

                </div>
            </div>
            <div class="col-lg-4 col-md-6">
                <div class="box pull-up">
                    <div class="box-body">
                        <div class="media align-items-center p-0">
                            <div class="text-center">
                                <a href="#"><i class="cc USDT me-5" title="USDT"></i></a>
                            </div>
                            <div>
                                <h3 class="no-margin text-bold">
                                    <asp:Label ID="lbreward" runat="server" Text="0"></asp:Label></h3>
                            </div>
                        </div>
                        <div class="flexbox align-items-center mt-5">
                            <div>
                                <h4 class="no-margin fw-600 text-warning">Reward Fund</h4>
                            </div>

                        </div>
                    </div>

                </div>
            </div>
           <%-- <div class="col-lg-4 col-md-6">
                <div class="box pull-up">
                    <div class="box-body">
                        <div class="media align-items-center p-0">
                            <div class="text-center">
                                <a href="#"><i class="cc USDT me-5" title="USDT"></i></a>
                            </div>
                            <div>
                                <h3 class="no-margin text-bold">
                                    <asp:Label ID="lbHoldIncome" runat="server" Text="0"></asp:Label></h3>
                            </div>
                        </div>
                        <div class="flexbox align-items-center mt-5">
                            <div>
                                <h4 class="no-margin fw-600 text-warning">Hold Income</h4>
                            </div>

                        </div>
                    </div>

                </div>
            </div>
       <div class="col-lg-4 col-md-6">
                <div class="box pull-up">
                    <div class="box-body">
                        <div class="media align-items-center p-0">
                            <div class="text-center">
                                <a href="#"><i class="cc USDT me-5" title="USDT"></i></a>
                            </div>
                            <div>
                                <h3 class="no-margin text-bold">
                                    <asp:Label ID="lbReleaseIncome" runat="server" Text="0"></asp:Label></h3>
                            </div>
                        </div>
                        <div class="flexbox align-items-center mt-5">
                            <div>
                                <h4 class="no-margin fw-600 text-warning">Release Income</h4>
                            </div>

                        </div>
                    </div>

                </div>
            </div>--%>
            <div class="col-lg-4 col-md-6">
                <div class="box pull-up">
                    <div class="box-body">
                        <div class="media align-items-center p-0">
                            <div class="text-center">
                                <a href="#"><i class="cc USDT me-5" title="USDT"></i></a>
                            </div>
                            <div>
                                <h3 class="no-margin text-bold">
                                    <asp:Label ID="lbavlHoldIncome" runat="server" Text="0"></asp:Label></h3>
                            </div>
                        </div>
                        <div class="flexbox align-items-center mt-5">
                            <div>
                                <h4 class="no-margin fw-600 text-warning"> Hold Income</h4>
                            </div>

                        </div>
                    </div>

                </div>
            </div>
           <%-- <div class="col-lg-6 col-md-6">
                <div class="box box-body pull-up">
                    <div class="d-flex justify-content-between">
                        <div class="media align-items-center p-0">
                            <div class="text-center">
                                <a href="#"><i class="cc NEO me-5" title="NEO"></i></a>
                            </div>
                            <div>
                                <h6 class="no-margin text-bold">Direct Business</h6>

                            </div>
                        </div>
                        <div>
                            <div class="mt-10">
                                <h4 class="no-margin text-warning text-bold">$
                                    <asp:Label ID="lbdirectbusiness" runat="server" Text="0.00"></asp:Label></h4>
                            </div>

                        </div>
                    </div>
                </div>
            </div>--%>
          <%--  <div class="col-lg-6 col-md-6">
                <div class="box box-body pull-up">
                    <div class="d-flex justify-content-between">
                        <div class="media align-items-center p-0">
                            <div class="text-center">
                                <a href="#"><i class="cc NEO me-5" title="NEO"></i></a>
                            </div>
                            <div>
                                <h6 class="no-margin text-bold">Team Business</h6>

                            </div>
                        </div>
                        <div>
                            <div class="mt-10">
                                <h4 class="no-margin text-warning text-bold">$
                                    <asp:Label ID="lbTeambusiness" runat="server" Text="0.00"></asp:Label></h4>
                            </div>

                        </div>
                    </div>
                </div>
            </div>--%>
        </div>
        <script type="text/javascript">
            function myFunction() {
                var copyText = document.getElementById('ContentPlaceHolder1_myInput');
                if (copyText) {
                    // Select the text inside the input field
                    copyText.select();
                    copyText.setSelectionRange(0, 99999); // For mobile devices

                    // Use the Clipboard API to copy text
                    navigator.clipboard.writeText(copyText.value).then(function () {
                        swal("Copied", "Copied: " + copyText.value, "success");
                    }).catch(function (error) {
                        swal("Oops", "Failed to copy text: " + error, "error");
                    });
                } else {
                    swal("Oops", "Input element not found!", "error");
                }
            }
      function wallet() {
          var copyText = document.getElementById('ContentPlaceHolder1_wallet');
                if (copyText) {
                    // Select the text inside the input field
                    copyText.select();
                    copyText.setSelectionRange(0, 99999); // For mobile devices

                    // Use the Clipboard API to copy text
                    navigator.clipboard.writeText(copyText.value).then(function () {
                        swal("Copied", "Copied: " + copyText.value, "success");
                    }).catch(function (error) {
                        swal("Oops", "Failed to copy text: " + error, "error");
                    });
                } else {
                    swal("Oops", "Input element not found!", "error");
                }
            }
        </script>
        
    <div class="container blockBuy" style="margin-left: inherit;">
    </div>

    <script src="../Dash/Scripts/jquery-3.3.1.min.js"></script>
    <script src="../Dash/Scripts/jquery.validate.js"></script>
    <script src="../Dash/Scripts/jquery.validate.unobtrusive.js"></script>
        <script src="https://common.olemiss.edu/_js/sweet-alert/sweet-alert.min.js"></script>
        <link rel="stylesheet" type="text/css" href="https://common.olemiss.edu/_js/sweet-alert/sweet-alert.css">
            <input type="text" name="link" id="wallet" runat="server" value="" class="d-none">
            <input type="text" name="link" id="myInput" runat="server" value="" class="d-none">

    </section>
</asp:Content>

