<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" CodeFile="Home.aspx.cs" Inherits="Admin_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

				<div class="row invoice-card-row">
					<%--<div class="col-md-3 mb-3">
								<div class="card coin-card">
									<div class="card-body ">
										<h4 class="card-title" style="font-size:18px;"><b>Total Deposite</b></h4>
										<div class="d-flex align-items-center">
											
											<h2 class="fs-38"><asp:Label ID="lbTotalDeposite" runat="server" Text="0"></asp:Label></h2>
										</div>
									</div>
								</div>
							</div>--%>
					<%--<div class="col-md-3 mb-3">
								<div class="card coin-card">
									<div class="card-body ">
										<h4 class="card-title" style="font-size:18px;"><b>Available Fund</b></h4>
										<div class="d-flex align-items-center">
											
											<h2 class="fs-38"><asp:Label ID="lbavailablefund" runat="server" Text="0"></asp:Label></h2>
										</div>
									</div>
								</div>
							</div>--%>
				<%--<div class="col-md-3 mb-3">
								<div class="card coin-card">
									<div class="card-body ">
										<h4 class="card-title" style="font-size:18px;"><b>Success Withdraw</b></h4>
										<div class="d-flex align-items-center">
											
											<h2 class="fs-38"><asp:Label ID="lbTotalWithdrawal" runat="server" Text="0"></asp:Label></h2>
										</div>
									</div>
								</div>
							</div>--%>
				
				<%--<div class="col-md-3 mb-3">
								<div class="card coin-card">
									<div class="card-body ">
										<h4 class="card-title" style="font-size:18px;"><b>Company Balance</b></h4>
										<div class="d-flex align-items-center">
											
											<h2 class="fs-38"><asp:Label ID="lbCompanyNetBalance" runat="server" Text="0"></asp:Label></h2>
										</div>
									</div>
								</div>
							</div>--%>
				<%--<div class="col-md-3">
								<div class="card coin-card">
									<div class="card-body ">
										<h4 class="card-title" style="font-size:18px;"><b>Pending Withdraw</b></h4>
										<div class="d-flex align-items-center">
											
											<h2 class="fs-38"><asp:Label ID="lbpendingwithdraw" runat="server" Text="0"></asp:Label></h2>
										</div>
									</div>
								</div>
							</div>--%>
				
				
			
				
			
				
	
					<div class="col-md-3 mt-3">
								<div class="card coin-card">
									<div class="card-body ">
										<h4 class="card-title" style="font-size:18px;"><b>Total Member</b></h4>
										<div class="d-flex align-items-center">
											
											<h2 class="fs-38"><asp:Label ID="lbTotalMember" runat="server" Text="0"></asp:Label></h2>
										</div>
									</div>
								</div>
							</div>
				<%--<div class="col-md-3 mt-3">
								<div class="card coin-card">
									<div class="card-body ">
										<h4 class="card-title" style="font-size:18px;"><b>Active Member</b></h4>
										<div class="d-flex align-items-center">
											
											<h2 class="fs-38"><asp:Label ID="lbpaidmember" runat="server" Text="0"></asp:Label></h2>
										</div>
									</div>
								</div>
							</div>--%>
				
				<%--<div class="col-md-3 mt-3">
								<div class="card coin-card">
									<div class="card-body ">
										<h4 class="card-title" style="font-size:18px;"><b>Inactive Member</b></h4>
										<div class="d-flex align-items-center">
											
											<h2 class="fs-38"><asp:Label ID="lbfreemember" runat="server" Text="0"></asp:Label></h2>
										</div>
									</div>
								</div>
							</div>--%>
				<%--<div class="col-md-3 mt-3">
								<div class="card coin-card">
									<div class="card-body ">
										<h4 class="card-title" style="font-size:18px;"><b>Total Team Business</b></h4>
										<div class="d-flex align-items-center">
											
											<h2 class="fs-38"><asp:Label ID="lbteambusiness" runat="server" Text="0"></asp:Label></h2>
										</div>
									</div>
								</div>
							</div>--%>
						<div class="col-md-3 mt-3">
								<div class="card coin-card">
									<div class="card-body ">
										<h4 class="card-title" style="font-size:18px;"><b>Referral Income</b></h4>
										<div class="d-flex align-items-center">
											
											<h2 class="fs-38"><asp:Label ID="lbdirect" runat="server" Text="0"></asp:Label></h2>
										</div>
									</div>
								</div>
							</div>
                    <div class="col-md-3 mt-3">
                        <div class="card coin-card">
                            <div class="card-body ">
                                <h4 class="card-title" style="font-size: 18px;"><b>Upgrade Bonus</b></h4>
                                <div class="d-flex align-items-center">

                                    <h2 class="fs-38">
                                        <asp:Label ID="lbupgrade" runat="server" Text="0"></asp:Label></h2>
                                </div>
                            </div>
                        </div>
                    </div>
						
							<div class="col-md-3 mt-3">
								<div class="card coin-card">
									<div class="card-body ">
										<h4 class="card-title" style="font-size:18px;"><b>Level Income</b></h4>
										<div class="d-flex align-items-center">
											
											<h2 class="fs-38"><asp:Label ID="lblevelIncome" runat="server" Text="0"></asp:Label></h2>
										</div>
									</div>
								</div>
							</div>
							<div class="col-md-3 mt-3">
								<div class="card coin-card">
									<div class="card-body ">
										<h4 class="card-title" style="font-size:18px;"><b>Divident Income</b></h4>
										<div class="d-flex align-items-center">
											
											<h2 class="fs-38"> <asp:Label ID="lbdivident" runat="server" Text="0"></asp:Label></h2>
										</div>
									</div>
								</div>
							</div>
							<div class="col-md-3 mt-3">
								<div class="card coin-card">
									<div class="card-body ">
										<h4 class="card-title" style="font-size:18px;"><b>Royalty Income</b></h4>
										<div class="d-flex align-items-center">
											
											<h2 class="fs-38"><asp:Label ID="lbroyalty" runat="server" Text="0"></asp:Label></h2>
										</div>
									</div>
								</div>
							</div>
							<div class="col-md-3 mt-3">
								<div class="card coin-card">
									<div class="card-body ">
										<h4 class="card-title" style="font-size:18px;"><b>Reward Fund</b></h4>
										<div class="d-flex align-items-center">
											
											<h2 class="fs-38"><asp:Label ID="lbreward" runat="server" Text="0"></asp:Label></h2>
										</div>
									</div>
								</div>
							</div>
							<div class="col-md-3 mt-3">
								<div class="card coin-card">
									<div class="card-body ">
										<h4 class="card-title" style="font-size:18px;"><b>Hold Income</b></h4>
										<div class="d-flex align-items-center">
											
											<h2 class="fs-38"><asp:Label ID="lbHoldIncome" runat="server" Text="0"></asp:Label></h2>
										</div>
									</div>
								</div>
							</div>
					
					
						
								
				</div>
           
</asp:Content>

