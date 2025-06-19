<%@ Page Language="C#" AutoEventWireup="true" CodeFile="testlogin.aspx.cs" Inherits="Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
   <meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1" />
		<title> Coin98 Test Login | Financial Technology Login Page</title>

		<!-- Meta -->
		<meta name="description" content=" Coin98 Test Login | Financial Technology Login Page" />
		<meta name="author" content="ATG" />
		<link rel="shortcut icon" href="loginassets/images/favicon.png" />

		<!-- *************
			************ CSS Files *************
		************* -->
		<!-- Icomoon Font Icons css -->
		<link rel="stylesheet" href="loginassets/fonts/icomoon/style.css" />

		<!-- Main CSS -->
		<link rel="stylesheet" href="loginassets/css/main.min.css" />
</head>
<body  class="bg-one">
    <form id="form1" runat="server">
        <!-- Container start -->
		<div class="container">
			<div class="row justify-content-center">
				<div class="col-xl-4 col-lg-5 col-sm-6 col-12">
					<div  class="my-5">
						<div class="card p-md-4 p-sm-3">
							<div class="login-form p-2">
								<a href="index.html" class="mb-4 d-flex">
									<img src="loginassets/images/logo.png" style="width: 100% !important" class="img-fluid " alt="Bootstrap Gallery" />
								</a>
								<h3 class=" mb-4">Member Login</h3>
								<div class="mb-3">
									<label class="form-label">Your Username</label>
						  <asp:TextBox ID="txtUserName" CssClass="form-control" required="" placeholder="@username" runat="server"></asp:TextBox>

								</div>
								<div class="mb-3">
									<label class="form-label">Your Password</label>
									  <asp:TextBox ID="txtPassword" CssClass="form-control" type="password" required="" placeholder="*********" runat="server"></asp:TextBox>
								</div>
								<div class="d-flex align-items-center justify-content-between">
									<div class="form-check m-0">
										<%--<input class="form-check-input" type="checkbox" value="" id="rememberPassword" />
										<label class="form-check-label" for="rememberPassword">Remember</label>--%>
									</div>
									<a href="forgetpassword.aspx" class="text-primary text-decoration-underline">Lost password?</a>
								</div>
								<div class="d-grid py-3 mt-3">
                     <asp:Button ID="btnsignin" OnClick="btnLogin_Click"  CssClass="btn btn-lg btn-primary" runat="server" Text="LOGIN" />

									
								</div>
								
								<div class="text-center pt-4">
									<span>Not registered?</span>
									<a href="Signup.aspx" class="text-primary text-decoration-underline">
										SignUp</a>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- Container end -->
    </form>
</body>
</html>
