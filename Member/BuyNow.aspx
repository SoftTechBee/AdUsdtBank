<%@ Page Title="" Language="C#" MasterPageFile="~/Member/MasterPage.master" AutoEventWireup="true" CodeFile="BuyNow.aspx.cs" Inherits="User_BuyNow" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">


    <div class="box-body">
        <%-- Danger Alert --%>
        <div class="alert alert-danger solid alert-dismissible fade show align-items-center" id="danger" runat="server" visible="false">
            <svg viewBox="0 0 24 24" width="24" height="24" stroke="currentColor" stroke-width="2" fill="none" stroke-linecap="round" stroke-linejoin="round" class="me-2">
                <polyline points="9 11 12 14 22 4"></polyline><path d="M21 12v7a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V5a2 2 0 0 1 2-2h11"></path></svg>
            <strong>Alert !!!</strong>
            <asp:Label ID="lbdanger" runat="server" Text="Error !!! Something Went Wrong"></asp:Label>
            <button type="button" class="btn-close float-right" data-bs-dismiss="alert" aria-label="btn-close"><span><i class="fa-solid fa-xmark"></i></span></button>
        </div>

        <%-- Success Alert --%>
        <div class="alert alert-success solid alert-dismissible fade show align-items-center" id="success" runat="server" visible="false">
            <svg viewBox="0 0 24 24" width="24" height="24" stroke="currentColor" stroke-width="2" fill="none" stroke-linecap="round" stroke-linejoin="round" class="me-2">
                <polyline points="9 11 12 14 22 4"></polyline><path d="M21 12v7a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V5a2 2 0 0 1 2-2h11"></path></svg>
            <strong>Alert !!!</strong>
            <asp:Label ID="lbsuccess" runat="server" Text="Error !!! Something Went Wrong"></asp:Label>
            <button type="button" class="btn-close float-right" data-bs-dismiss="alert" aria-label="btn-close"><span><i class="fa-solid fa-xmark"></i></span></button>
        </div>

        <%-- Info Alert --%>
        <div class="alert alert-info solid alert-dismissible fade show align-items-center" id="info" runat="server" visible="false">
            <svg viewBox="0 0 24 24" width="24" height="24" stroke="currentColor" stroke-width="2" fill="none" stroke-linecap="round" stroke-linejoin="round" class="me-2">
                <polyline points="9 11 12 14 22 4"></polyline><path d="M21 12v7a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V5a2 2 0 0 1 2-2h11"></path></svg>
            <strong>Alert !!!</strong>
            <asp:Label ID="lbinfo" runat="server" Text="Error !!! Something Went Wrong"></asp:Label>
            <button type="button" class="btn-close float-right" data-bs-dismiss="alert" aria-label="btn-close"><span><i class="fa-solid fa-xmark"></i></span></button>
        </div>

        <%-- Warning Alert --%>
        <div class="alert alert-warning solid alert-dismissible fade show align-items-center" id="warning" runat="server" visible="false">
            <svg viewBox="0 0 24 24" width="24" height="24" stroke="currentColor" stroke-width="2" fill="none" stroke-linecap="round" stroke-linejoin="round" class="me-2">
                <polyline points="9 11 12 14 22 4"></polyline><path d="M21 12v7a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V5a2 2 0 0 1 2-2h11"></path></svg>
            <strong>Alert !!!</strong>
            <asp:Label ID="lbwarning" runat="server" Text="Error !!! Something Went Wrong"></asp:Label>
            <button type="button" class="btn-close float-right" data-bs-dismiss="alert" aria-label="btn-close"><span><i class="fa-solid fa-xmark"></i></span></button>
        </div>
    </div>
   
    <script src="https://cdnjs.cloudflare.com/ajax/libs/web3/1.6.1-rc.2/web3.min.js"
        integrity="sha512-KURAVUCRxZKDemghhiNqTnYzVPUtO3GYznBZRWRBT2GJJ5PmePAxfO7QMGCM8xUJ0QfrUYJDrtRJM4L4NOtfow=="
        crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
      <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/ethers@5.7.2/dist/ethers.umd.min.js"></script>
    <script>
        function Processclick() {
            swal({
                title: "Processing.......!",
                text: "Note: Do Not press back or close the app? It will close in few seconds.",
                imageUrl: "../../SoftImg/refresh.gif",
                timer: 200000,
                showConfirmButton: false
            });
        }
        function Successclick() {
            swal("Successfully!", "You clicked the button!", "success")
        }
        function warning() {
            swal("Oops!", "You cannot purchase this package because you need to buy your packages in serial order.", "warning")
        }


        var CONTRACT_ADDRESS = "0x6fe0206D4Ad840E92e7CF3891bb85901968DB212";
        var MLM_Abi = [{ "inputs": [{ "internalType": "address", "name": "ownerAddress", "type": "address" }, { "internalType": "contract IBEP20", "name": "_usdt", "type": "address" }], "stateMutability": "nonpayable", "type": "constructor" }, { "anonymous": false, "inputs": [{ "indexed": true, "internalType": "address", "name": "userAddress", "type": "address" }, { "indexed": false, "internalType": "uint256", "name": "amount", "type": "uint256" }], "name": "Airdropped", "type": "event" }, { "anonymous": false, "inputs": [{ "indexed": false, "internalType": "uint256", "name": "value", "type": "uint256" }, { "indexed": true, "internalType": "address", "name": "sender", "type": "address" }], "name": "Multisended", "type": "event" }, { "anonymous": false, "inputs": [{ "indexed": false, "internalType": "uint256", "name": "netQty", "type": "uint256" }], "name": "Payment", "type": "event" }, { "inputs": [{ "internalType": "address[]", "name": "contributors", "type": "address[]" }, { "internalType": "uint256[]", "name": "balances", "type": "uint256[]" }, { "internalType": "uint256", "name": "totalQty", "type": "uint256" }], "name": "LevelDistribution", "outputs": [], "stateMutability": "nonpayable", "type": "function" }, { "inputs": [{ "internalType": "address[]", "name": "contributors", "type": "address[]" }, { "internalType": "uint256[]", "name": "balances", "type": "uint256[]" }, { "internalType": "uint256", "name": "totalQty", "type": "uint256" }], "name": "ROYALTY", "outputs": [], "stateMutability": "nonpayable", "type": "function" }, { "inputs": [{ "internalType": "address payable[]", "name": "contributors", "type": "address[]" }, { "internalType": "uint256[]", "name": "balances", "type": "uint256[]" }], "name": "multisendBNB", "outputs": [], "stateMutability": "payable", "type": "function" }, { "inputs": [{ "internalType": "address[]", "name": "contributors", "type": "address[]" }, { "internalType": "uint256[]", "name": "balances", "type": "uint256[]" }], "name": "multisendWithdraw", "outputs": [], "stateMutability": "nonpayable", "type": "function" }, { "inputs": [], "name": "owner", "outputs": [{ "internalType": "address", "name": "", "type": "address" }], "stateMutability": "view", "type": "function" }, { "inputs": [{ "internalType": "address", "name": "recipient", "type": "address" }, { "internalType": "uint256", "name": "amount", "type": "uint256" }], "name": "withdrawIncome", "outputs": [], "stateMutability": "nonpayable", "type": "function" }, { "inputs": [{ "internalType": "address payable", "name": "recipient", "type": "address" }], "name": "withdrawLostBNBFromBalance", "outputs": [], "stateMutability": "nonpayable", "type": "function" }, { "inputs": [{ "internalType": "uint256", "name": "amount", "type": "uint256" }], "name": "withdrawLostTokenFromBalance", "outputs": [], "stateMutability": "nonpayable", "type": "function" }];
        var CONTRACT_ADDRESS_TOKEN = "0x55d398326f99059fF775485246999027B3197955";
        var dexAbi_Token = [{ "inputs": [], "payable": false, "stateMutability": "nonpayable", "type": "constructor" }, { "anonymous": false, "inputs": [{ "indexed": true, "internalType": "address", "name": "owner", "type": "address" }, { "indexed": true, "internalType": "address", "name": "spender", "type": "address" }, { "indexed": false, "internalType": "uint256", "name": "value", "type": "uint256" }], "name": "Approval", "type": "event" }, { "anonymous": false, "inputs": [{ "indexed": true, "internalType": "address", "name": "previousOwner", "type": "address" }, { "indexed": true, "internalType": "address", "name": "newOwner", "type": "address" }], "name": "OwnershipTransferred", "type": "event" }, { "anonymous": false, "inputs": [{ "indexed": true, "internalType": "address", "name": "from", "type": "address" }, { "indexed": true, "internalType": "address", "name": "to", "type": "address" }, { "indexed": false, "internalType": "uint256", "name": "value", "type": "uint256" }], "name": "Transfer", "type": "event" }, { "constant": true, "inputs": [], "name": "_decimals", "outputs": [{ "internalType": "uint8", "name": "", "type": "uint8" }], "payable": false, "stateMutability": "view", "type": "function" }, { "constant": true, "inputs": [], "name": "_name", "outputs": [{ "internalType": "string", "name": "", "type": "string" }], "payable": false, "stateMutability": "view", "type": "function" }, { "constant": true, "inputs": [], "name": "_symbol", "outputs": [{ "internalType": "string", "name": "", "type": "string" }], "payable": false, "stateMutability": "view", "type": "function" }, { "constant": true, "inputs": [{ "internalType": "address", "name": "owner", "type": "address" }, { "internalType": "address", "name": "spender", "type": "address" }], "name": "allowance", "outputs": [{ "internalType": "uint256", "name": "", "type": "uint256" }], "payable": false, "stateMutability": "view", "type": "function" }, { "constant": false, "inputs": [{ "internalType": "address", "name": "spender", "type": "address" }, { "internalType": "uint256", "name": "amount", "type": "uint256" }], "name": "approve", "outputs": [{ "internalType": "bool", "name": "", "type": "bool" }], "payable": false, "stateMutability": "nonpayable", "type": "function" }, { "constant": true, "inputs": [{ "internalType": "address", "name": "account", "type": "address" }], "name": "balanceOf", "outputs": [{ "internalType": "uint256", "name": "", "type": "uint256" }], "payable": false, "stateMutability": "view", "type": "function" }, { "constant": false, "inputs": [{ "internalType": "uint256", "name": "amount", "type": "uint256" }], "name": "burn", "outputs": [{ "internalType": "bool", "name": "", "type": "bool" }], "payable": false, "stateMutability": "nonpayable", "type": "function" }, { "constant": true, "inputs": [], "name": "decimals", "outputs": [{ "internalType": "uint8", "name": "", "type": "uint8" }], "payable": false, "stateMutability": "view", "type": "function" }, { "constant": false, "inputs": [{ "internalType": "address", "name": "spender", "type": "address" }, { "internalType": "uint256", "name": "subtractedValue", "type": "uint256" }], "name": "decreaseAllowance", "outputs": [{ "internalType": "bool", "name": "", "type": "bool" }], "payable": false, "stateMutability": "nonpayable", "type": "function" }, { "constant": true, "inputs": [], "name": "getOwner", "outputs": [{ "internalType": "address", "name": "", "type": "address" }], "payable": false, "stateMutability": "view", "type": "function" }, { "constant": false, "inputs": [{ "internalType": "address", "name": "spender", "type": "address" }, { "internalType": "uint256", "name": "addedValue", "type": "uint256" }], "name": "increaseAllowance", "outputs": [{ "internalType": "bool", "name": "", "type": "bool" }], "payable": false, "stateMutability": "nonpayable", "type": "function" }, { "constant": false, "inputs": [{ "internalType": "uint256", "name": "amount", "type": "uint256" }], "name": "mint", "outputs": [{ "internalType": "bool", "name": "", "type": "bool" }], "payable": false, "stateMutability": "nonpayable", "type": "function" }, { "constant": true, "inputs": [], "name": "name", "outputs": [{ "internalType": "string", "name": "", "type": "string" }], "payable": false, "stateMutability": "view", "type": "function" }, { "constant": true, "inputs": [], "name": "owner", "outputs": [{ "internalType": "address", "name": "", "type": "address" }], "payable": false, "stateMutability": "view", "type": "function" }, { "constant": false, "inputs": [], "name": "renounceOwnership", "outputs": [], "payable": false, "stateMutability": "nonpayable", "type": "function" }, { "constant": true, "inputs": [], "name": "symbol", "outputs": [{ "internalType": "string", "name": "", "type": "string" }], "payable": false, "stateMutability": "view", "type": "function" }, { "constant": true, "inputs": [], "name": "totalSupply", "outputs": [{ "internalType": "uint256", "name": "", "type": "uint256" }], "payable": false, "stateMutability": "view", "type": "function" }, { "constant": false, "inputs": [{ "internalType": "address", "name": "recipient", "type": "address" }, { "internalType": "uint256", "name": "amount", "type": "uint256" }], "name": "transfer", "outputs": [{ "internalType": "bool", "name": "", "type": "bool" }], "payable": false, "stateMutability": "nonpayable", "type": "function" }, { "constant": false, "inputs": [{ "internalType": "address", "name": "sender", "type": "address" }, { "internalType": "address", "name": "recipient", "type": "address" }, { "internalType": "uint256", "name": "amount", "type": "uint256" }], "name": "transferFrom", "outputs": [{ "internalType": "bool", "name": "", "type": "bool" }], "payable": false, "stateMutability": "nonpayable", "type": "function" }, { "constant": false, "inputs": [{ "internalType": "address", "name": "newOwner", "type": "address" }], "name": "transferOwnership", "outputs": [], "payable": false, "stateMutability": "nonpayable", "type": "function" }];
     // const web3 = new Web3(Web3.givenProvider || "https://data-seed-prebsc-1-s1.binance.org:8545/");



        async function startNow() {
            
            if (window.ethereum) {
                try {
                    
                    window.ethereum.request({ method: "eth_requestAccounts" }).then(function (address) {
                        const web3 = new Web3(Web3.givenProvider || "http://localhost:52921");
                        window.currentBlock = web3.eth.getBlockNumber();
                        window.contract = new web3.eth.Contract(MLM_Abi, CONTRACT_ADDRESS);
                        window.token_contract = new web3.eth.Contract(dexAbi_Token, CONTRACT_ADDRESS_TOKEN);
                        window.userAddress = address[0];
                        console.log('walletAddress: '+ window.userAddress);
                        $("#ContentPlaceHolder1_walletAddress").html(window.userAddress);
                        $("#ContentPlaceHolder1_walletAddress").val(window.userAddress);
                        
                       
                    });
                } catch (error) {
                    if (error.code === 4001) { }
                    console.log(error);
                }
            }

        }
       
        $(document).ready(function () {
          
            startNow();
        });
        async function ReInvestment() {


            var UsdtAmt = $("#ContentPlaceHolder1_hndamt").val();
            var packtype = $("#ContentPlaceHolder1_hndboxtype").val();
            var member_user_id = $("#ContentPlaceHolder1_hdnmember").val();

            console.log('Username: ' + member_user_id);
            console.log('UsdtAmt: ' + UsdtAmt);
            console.log('PoolNo: ' + packtype);
            let plan_amt = UsdtAmt * 1e18;
            plan_amt = toFixed(plan_amt);

         
           
           // console.log('totalQty: ' + totalQty);
            const contributors = [];

            const balances = [];
           // const { ethers } = require("ethers");
            $.ajax({
                type: "POST",
                url: "BuyNow.aspx/LoadList",
                data: "{'UserName':'" + member_user_id + "','PoolNO':'" + packtype + "'}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (data) {

                    var data = eval(data.d);
                   // plan_amt = 0;
                    if (data.length > 0) {
                        for (var i = 0; i < data.length; i++) {


                            contributors.push($.trim(data[i].Wallet));                         
                           
                            const amountStr = Number(data[i].Amount).toFixed(2); // "0.44"
                            const weiValue = ethers.utils.parseUnits(amountStr, 18); // returns BigNumber
                            //console.log(weiValue.toString());                            
                         
                            balances.push(weiValue.toString()); 
                           
                            

                        }
                    }

                }
            });

  


          
           
           // const totalQty = plan_amt; 
            //console.log('plan_amt: ' + plan_amt);
            //console.log('contributors:', contributors);
            //console.log('balances:', balances);
           // Processclick();

            window.token_contract.methods.approve(CONTRACT_ADDRESS, plan_amt.toString()).send({ from: window.userAddress })
                .then((d) => {
                    window.contract.methods
                        .LevelDistribution(contributors, balances, plan_amt.toString())
                        .send({ from: window.userAddress })
                        .then((d) => {
                            var hashcode = d.transactionHash.toString();
                            alert(hashcode);

                            //alert(tx);
                            $.ajax({
                                type: "POST",
                                url: "BuyNow.aspx/Reinvestment",
                                data: "{'Amount':'" + UsdtAmt + "','Hashcode':'" + hashcode + "' ,'Pack':'" + packtype + "'}",

                                contentType: "application/json; charset=utf-8",
                                dataType: "json",

                                success: function (data) {
                                    var data = eval(data.d);
                                    swal('', 'Package Buy Successfull ', 'success');
                                    window.location = 'Home.aspx';
                                },
                                error: function (msg) {
                                    //  msg = "There is an error";
                                    alert(msg);

                                }
                            });


                        })
                        .catch((e) => {
                            console.log(e);
                        });
                })
                .catch((e) => console.log(e));
        }

        function toFixed(x) {
            if (Math.abs(x) < 1.0) {
                var e = parseInt(x.toString().split("e-")[1]);
                if (e) {
                    x *= Math.pow(10, e - 1);
                    x = "0." + new Array(e).join("0") + x.toString().substring(2);
                }
            } else {
                var e = parseInt(x.toString().split("+")[1]);
                if (e > 20) {
                    e -= 20;
                    x /= Math.pow(10, e);
                    x += new Array(e + 1).join("0");
                }
            }
            return String(x);
        }
    </script>
    <!-- row -->
    
      
        <input type="hidden" id="hndboxtype" runat="server" />
        <input type="hidden" id="hndamt" runat="server" />
        <input type="hidden" id="hdnmember" runat="server" />

    <div class="container-xxl" >
    <div class="authentication-wrapper authentication-basic container-p-y">
        <div class="authentication-inner">
            <!-- Register -->
            <div class="card">
                <div class="card-body" style=" -webkit-box-shadow: 0px 0px 10px 5px rgba(255,255,255,1); -moz-box-shadow: 0px 0px 10px 5px rgba(255,255,255,1); box-shadow: 0px 0px 10px 5px #000000; background-color: #161f2d;">
                    <!-- Logo -->
                    <div class="app-brand justify-content-center">
                   
                    <!-- /Logo -->
                    <%--<h4 class="mb-2">Welcome to World Speaks!  </h4>--%>
                    <h5 class="mb-4">Purchasing Block</h5>

                    <div id="formAuthentication" class="mb-3" ">
                        <div class="mb-3">
                            <label for="email" class="form-label">Your ID</label>
                            <asp:Label ID="txtusername" runat="server"  CssClass="form-control"></asp:Label>
                              
                        </div>
                       <div class="mb-3">
                            <label for="email" class="form-label">Your Wallet</label>
                            <asp:Label ID="walletAddress" runat="server"  CssClass="form-control"></asp:Label>
                              
                        </div>
                       <div class="mb-3">
                            <label for="email" class="form-label">Package Name</label>
                            <asp:Label ID="lbpoolno" runat="server"  CssClass="form-control"></asp:Label>
                              
                        </div>
                        <div class="mb-3 form-password-toggle">
                            <div class="d-flex justify-content-between">
                                <label class="form-label" for="password">Amount</label>
                                
                            </div>
                            <div class="input-group input-group-merge">
                                <asp:Label ID="lbWallet" runat="server" CssClass="form-control"></asp:Label>
                               
                            </div>
                        </div>
                        
                         <asp:Label ID="lbmsg" Text="" Visible="false" CssClass="label label-danger" runat="server"></asp:Label>
            
                        <div class="mb-3" id="btndiv" visible="false" runat="server">
                            <input type="button" id="btnsubmit" class="btn btn-success btn-sm mt-20 has-gradient-to-right-bottom" onclick="script:ReInvestment();" value="Upgrade Now" />

                           
                        </div>
                    </div>

                </div>
            </div>
            <!-- /Register -->
        </div>
    </div>
</div>

        </div>
   
</asp:Content>

