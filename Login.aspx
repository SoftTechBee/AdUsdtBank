<%@ Page Language="C#" AutoEventWireup="true" CodeFile="login.aspx.cs" Inherits="Login" %>

<!DOCTYPE html>

<html lang="en" class="light-style  customizer-hide" dir="ltr" data-theme="theme-default" data-assets-path="../Loginassets/" data-template="vertical-menu-template-free">

<head  runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0" />

    <title>Login | ADUSDT BANK</title>

    <meta name="description" content="Achieve new heights of SUCCESS in life Start your on BUSINESS" />
    <meta name="keywords" content=" ADUSDT BANK, businessADUSDT BANK, login ">
    <!-- Canonical SEO -->
    <link rel="canonical" href="https://themeselection.com/products/sneat-bootstrap-html-admin-template/">

   <link rel="icon" type="image/x-icon" href="../Loginassets/img/logo/favicon.png" />
    <!-- Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com/">
    <link rel="preconnect" href="https://fonts.gstatic.com/" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Public+Sans:ital,wght@0,300;0,400;0,500;0,600;0,700;1,300;1,400;1,500;1,600;1,700&amp;display=swap" rel="stylesheet">

    <!-- Icons. Uncomment required icon fonts -->
    <link rel="stylesheet" href="../Loginassets/vendor/fonts/boxicons.css" />

    <!-- Core CSS -->
    <link rel="stylesheet" href="../Loginassets/vendor/css/core.css" class="template-customizer-core-css" />
    <link rel="stylesheet" href="../Loginassets/vendor/css/theme-default.css" class="template-customizer-theme-css" />
    <link rel="stylesheet" href="../Loginassets/css/demo.css" />

    <!-- Vendors CSS -->
    <link rel="stylesheet" href="../Loginassets/vendor/libs/perfect-scrollbar/perfect-scrollbar.css" />

     <link rel="stylesheet" href="../Loginassets/vendor/css/pages/page-auth.css">
    <!-- Helpers -->
    <script src="../Loginassets/vendor/js/helpers.js"></script>
     <script src="../Loginassets/js/config.js"></script>
      <!-- Global site tag (gtag.js) - Google Analytics -->
    <script async="async" src="https://www.googletagmanager.com/gtag/js?id=GA_MEASUREMENT_ID"></script>
     <script>
         function toggler(e) {
             if (document.getElementById("showpassword").className == "bx bx-hide") {
                 document.getElementById("showpassword").className = "bx bx-show";
                 document.getElementById('txtPassword').type = "text";
             }
             else {
                 document.getElementById("showpassword").className = "bx bx-hide"
                 document.getElementById('txtPassword').type = "password";

             }
         }
    </script>
         <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
       <script src="https://cdnjs.cloudflare.com/ajax/libs/web3/1.6.1-rc.2/web3.min.js" 
integrity="sha512-KURAVUCRxZKDemghhiNqTnYzVPUtO3GYznBZRWRBT2GJJ5PmePAxfO7QMGCM8xUJ0QfrUYJDrtRJM4L4NOtfow==" 
crossorigin="anonymous" referrerpolicy="no-referrer"></script>
 <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	 <script type="text/javascript">

        


         async function Walletweb() {
            
             if (window.ethereum) {
                 try {
                     window.ethereum.request({ method: "eth_requestAccounts" }).then(function (address) {
                         window.userAddress = address[0];
                         var BNB_ac = window.userAddress;
                         $("#lbwallet").html(BNB_ac);
                        

                     });
                 } catch (error) {
                     if (error.code === 4001) { }
                     console.log(error);
                 }
             }

         }
       
         async function LoginWalletweb() {

          
                 try {
                    
                     var Wallet = $("#lbwallet").text();
                     //var PIN = $("#txtPIN").val();
                     //    alert(PIN);
                     //alert(Wallet);
                         $.ajax({
                             type: "POST",
                             url: "login.aspx/WalletBalance",
                             //data: "{'BNB_ac':'" + Wallet + "','PIN':'" + PIN + "'}",
                             data: "{'BNB_ac':'" + Wallet + "'}",
                             contentType: "application/json; charset=utf-8",
                             dataType: "json",
                             success: function (data) {

                                 var data = eval(data.d);
                                 if (data == "Invaild") {
                                     swal('', 'Wallet Not Exist', 'warning');
                                 }
                                 else {

                                     swal('', 'Login Success ', 'success');
                                     window.location.href = 'Member/Home.aspx';
                                 }
                             }
                         });

                    
                 } catch (error) {
                     if (error.code === 4001) { }
                     console.log(error);
                 }
             }





     </script>
    <script>
        $(window).on('load', function () {

            Walletweb();
        });
    </script>
</head>

<body id="top" data-theme-color="color-yellow" style="background-image:url('bg.jpg'); background-size:cover; background-position:center" >
    <form id="form1" runat="server">
  
 <!-- Content -->

    <div class="container-xxl" >
        <div class="authentication-wrapper authentication-basic container-p-y">
            <div class="authentication-inner">
                <!-- Register -->
                <div class="card" >
                   <div class="card-body" style=" -webkit-box-shadow: 0px 0px 10px 5px rgba(255,255,255,1); -moz-box-shadow: 0px 0px 10px 5px rgba(255,255,255,1); box-shadow: 0px 0px 10px 5px #000000; background:#ffffff">
                   
                        <!-- Logo -->
                        <div class="app-brand justify-content-center">
                            <a href="index.html" class="app-brand-link gap-2">
                                <span class="app-brand-logo demo ">

                                   <img src="Loginassets/img/logo/logo.png" width="20%" />

                                </span>
                               
                            </a>
                        </div>
                        <!-- /Logo -->
                        <%-- <h5 class="mb-2  text-black">ADUSDT BANK Project  </h5>
                        <hr />--%>
                        <div id="formAuthentication" class="mb-3" ">
                         
                             <asp:Label ID="lbmsg" Text="" CssClass="label label-danger" runat="server"></asp:Label>
                <div class="mb-1 row">
                                   <div class="col-md-12">
                                       <label  class="form-label text-black">USDTBEP-20</label>

                                       <asp:Label ID="lbwallet" CssClass="  form-control"  Text=""  placeholder="Your Wallet " runat="server"></asp:Label>

                                       </div>
                               </div>
                    <%-- <div class="mb-1 row">
                                   <div class="col-md-12">
                                       <label for="email" class="form-label text-black">Security PIN</label>

                                       <asp:TextBox ID="txtPIN" CssClass="  form-control"  Text=""  placeholder="Your PIN" runat="server"></asp:TextBox>

                                       </div>
                               </div>--%>
                             
                                 <div class="mb-1 mt-4">
                                     <center>
                              
                                <input type="button" id="login" onclick="script:LoginWalletweb();" class="btn btn-success text-black btn-sm btn-block fw-bold" value="Connect Wallet"/>
                            </center>
                                         </div>
                           
                            <%--<div class="mb-2">
                                <div class="input-group input-group-merge">
                                    <asp:TextBox ID="txtview" runat="server" CssClass="form-control" placeholder="Enter View ID"></asp:TextBox>
                                </div>
                            </div>

                            <div class="mb-3">
                                <asp:button runat="server" type="button" id="View" OnClick="btnview_Click" class="btn btn-success btn-block w-100" Text="View" />
                            </div>--%>
                            </div>
                        </div>

                     
                    </div>
                </div>
                <!-- /Register -->
            </div>
        </div>
   

    <!-- / Content -->
<%-- <div class="buy-now">
        <a href="index.html" target="_blank" class="btn btn-danger btn-buy-now">Back To V-DESK</a>
    </div>--%>

          </form>
    <!-- Core JS -->
    <!-- build:js assets/vendor/js/core.js -->
    <script src="../Loginassets/vendor/libs/jquery/jquery.js"></script>
    <script src="../Loginassets/vendor/libs/popper/popper.js"></script>
    <script src="../Loginassets/vendor/js/bootstrap.js"></script>
    <script src="../Loginassets/vendor/libs/perfect-scrollbar/perfect-scrollbar.js"></script>

    <script src="../Loginassets/vendor/js/menu.js"></script>
    <!-- endbuild -->
    <!-- Vendors JS -->
    <!-- Main JS -->
    <script src="../Loginassets/js/main.js"></script>

    <!-- Page JS -->
    <!-- Place this tag in your head or just before your close body tag. -->
    <script async defer src="../../../buttons.github.io/buttons.js"></script>
  
   
</body>
</html>
