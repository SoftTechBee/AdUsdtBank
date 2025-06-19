<%@ Page Title="" Language="C#" MasterPageFile="~/Member/MasterPage.master" AutoEventWireup="true" CodeFile="AutoWalletRechargeUSDT.aspx.cs" Inherits="Member_AutoWalletRechargeUSDT" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

          <script src="https://cdnjs.cloudflare.com/ajax/libs/web3/1.6.1-rc.2/web3.min.js"
        integrity="sha512-KURAVUCRxZKDemghhiNqTnYzVPUtO3GYznBZRWRBT2GJJ5PmePAxfO7QMGCM8xUJ0QfrUYJDrtRJM4L4NOtfow=="
        crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script>


        const web3 = new Web3(Web3.givenProvider || "https://data-seed-prebsc-1-s1.binance.org:8545/");

        var CONTRACT_ADDRESS_BUSD = "0x55d398326f99059fF775485246999027B3197955";
        var dexAbi_Token_Busd = [{ "inputs": [], "payable": false, "stateMutability": "nonpayable", "type": "constructor" }, { "anonymous": false, "inputs": [{ "indexed": true, "internalType": "address", "name": "owner", "type": "address" }, { "indexed": true, "internalType": "address", "name": "spender", "type": "address" }, { "indexed": false, "internalType": "uint256", "name": "value", "type": "uint256" }], "name": "Approval", "type": "event" }, { "anonymous": false, "inputs": [{ "indexed": true, "internalType": "address", "name": "previousOwner", "type": "address" }, { "indexed": true, "internalType": "address", "name": "newOwner", "type": "address" }], "name": "OwnershipTransferred", "type": "event" }, { "anonymous": false, "inputs": [{ "indexed": true, "internalType": "address", "name": "from", "type": "address" }, { "indexed": true, "internalType": "address", "name": "to", "type": "address" }, { "indexed": false, "internalType": "uint256", "name": "value", "type": "uint256" }], "name": "Transfer", "type": "event" }, { "constant": true, "inputs": [], "name": "_decimals", "outputs": [{ "internalType": "uint8", "name": "", "type": "uint8" }], "payable": false, "stateMutability": "view", "type": "function" }, { "constant": true, "inputs": [], "name": "_name", "outputs": [{ "internalType": "string", "name": "", "type": "string" }], "payable": false, "stateMutability": "view", "type": "function" }, { "constant": true, "inputs": [], "name": "_symbol", "outputs": [{ "internalType": "string", "name": "", "type": "string" }], "payable": false, "stateMutability": "view", "type": "function" }, { "constant": true, "inputs": [{ "internalType": "address", "name": "owner", "type": "address" }, { "internalType": "address", "name": "spender", "type": "address" }], "name": "allowance", "outputs": [{ "internalType": "uint256", "name": "", "type": "uint256" }], "payable": false, "stateMutability": "view", "type": "function" }, { "constant": false, "inputs": [{ "internalType": "address", "name": "spender", "type": "address" }, { "internalType": "uint256", "name": "amount", "type": "uint256" }], "name": "approve", "outputs": [{ "internalType": "bool", "name": "", "type": "bool" }], "payable": false, "stateMutability": "nonpayable", "type": "function" }, { "constant": true, "inputs": [{ "internalType": "address", "name": "account", "type": "address" }], "name": "balanceOf", "outputs": [{ "internalType": "uint256", "name": "", "type": "uint256" }], "payable": false, "stateMutability": "view", "type": "function" }, { "constant": false, "inputs": [{ "internalType": "uint256", "name": "amount", "type": "uint256" }], "name": "burn", "outputs": [{ "internalType": "bool", "name": "", "type": "bool" }], "payable": false, "stateMutability": "nonpayable", "type": "function" }, { "constant": true, "inputs": [], "name": "decimals", "outputs": [{ "internalType": "uint8", "name": "", "type": "uint8" }], "payable": false, "stateMutability": "view", "type": "function" }, { "constant": false, "inputs": [{ "internalType": "address", "name": "spender", "type": "address" }, { "internalType": "uint256", "name": "subtractedValue", "type": "uint256" }], "name": "decreaseAllowance", "outputs": [{ "internalType": "bool", "name": "", "type": "bool" }], "payable": false, "stateMutability": "nonpayable", "type": "function" }, { "constant": true, "inputs": [], "name": "getOwner", "outputs": [{ "internalType": "address", "name": "", "type": "address" }], "payable": false, "stateMutability": "view", "type": "function" }, { "constant": false, "inputs": [{ "internalType": "address", "name": "spender", "type": "address" }, { "internalType": "uint256", "name": "addedValue", "type": "uint256" }], "name": "increaseAllowance", "outputs": [{ "internalType": "bool", "name": "", "type": "bool" }], "payable": false, "stateMutability": "nonpayable", "type": "function" }, { "constant": false, "inputs": [{ "internalType": "uint256", "name": "amount", "type": "uint256" }], "name": "mint", "outputs": [{ "internalType": "bool", "name": "", "type": "bool" }], "payable": false, "stateMutability": "nonpayable", "type": "function" }, { "constant": true, "inputs": [], "name": "name", "outputs": [{ "internalType": "string", "name": "", "type": "string" }], "payable": false, "stateMutability": "view", "type": "function" }, { "constant": true, "inputs": [], "name": "owner", "outputs": [{ "internalType": "address", "name": "", "type": "address" }], "payable": false, "stateMutability": "view", "type": "function" }, { "constant": false, "inputs": [], "name": "renounceOwnership", "outputs": [], "payable": false, "stateMutability": "nonpayable", "type": "function" }, { "constant": true, "inputs": [], "name": "symbol", "outputs": [{ "internalType": "string", "name": "", "type": "string" }], "payable": false, "stateMutability": "view", "type": "function" }, { "constant": true, "inputs": [], "name": "totalSupply", "outputs": [{ "internalType": "uint256", "name": "", "type": "uint256" }], "payable": false, "stateMutability": "view", "type": "function" }, { "constant": false, "inputs": [{ "internalType": "address", "name": "recipient", "type": "address" }, { "internalType": "uint256", "name": "amount", "type": "uint256" }], "name": "transfer", "outputs": [{ "internalType": "bool", "name": "", "type": "bool" }], "payable": false, "stateMutability": "nonpayable", "type": "function" }, { "constant": false, "inputs": [{ "internalType": "address", "name": "sender", "type": "address" }, { "internalType": "address", "name": "recipient", "type": "address" }, { "internalType": "uint256", "name": "amount", "type": "uint256" }], "name": "transferFrom", "outputs": [{ "internalType": "bool", "name": "", "type": "bool" }], "payable": false, "stateMutability": "nonpayable", "type": "function" }, { "constant": false, "inputs": [{ "internalType": "address", "name": "newOwner", "type": "address" }], "name": "transferOwnership", "outputs": [], "payable": false, "stateMutability": "nonpayable", "type": "function" }];

        window.token_contract = new web3.eth.Contract(dexAbi_Token_Busd, CONTRACT_ADDRESS_BUSD);


        web3.eth.getChainId().then(chainId => {
            console.log('Current Chain ID:', chainId);
            const newChainId = 56; // BSC Testnet's chain ID
            web3.currentProvider.send(
                {
                    method: 'evm_setChainId',
                    params: [newChainId],
                    jsonrpc: '2.0',
                    id: Date.now(),
                },
                (error, response) => {
                    if (error) {
                        console.error('Error changing Chain ID:', error);
                    } else {
                        console.log('New Chain ID:', response.result);
                    }
                }
            );
        });

        async function startNow() {
            if (window.ethereum) {
                try {
                    const accounts = await window.ethereum.request({ method: "eth_requestAccounts" });
                    window.userAddress = accounts[0];
                    console.log("Wallet Address:", window.userAddress);
                    $("#ContentPlaceHolder1_lbaddress").text(window.userAddress);

                    // Ensure token_contract is initialized before this
                    window.TokenBalance = await window.token_contract.methods.balanceOf(window.userAddress).call();
                    const formattedBalance = window.TokenBalance / 1e18;
                    console.log("Token Balance:", formattedBalance);

                    $("#ContentPlaceHolder1_lbBalance").text(formattedBalance);
                } catch (error) {
                    if (error.code === 4001) {
                        console.log("User denied wallet connection");
                    } else {
                        console.error("Error:", error);
                    }
                }
            } else {
                alert("MetaMask not detected. Please install it.");
            }
        }

        //  setInterval('startNow()', 2000);
        $(function () {
            //  alert("hi");
            startNow();
        });
        async function TokenAPI() {



            if (window.ethereum) {
                try {

                    var amt = $("#ContentPlaceHolder1_txtamt").val();
                    var Balance = $("#ContentPlaceHolder1_lbBalance").text();

                    console.log("Token Balance : ", amt);

                   // alert(amt);
                    // alert(Balance);
                    if (parseInt(Balance) >= parseInt(amt) && parseInt(amt) >= 1) {

                        window.ethereum
                            .request({
                                method: "eth_requestAccounts"
                            })
                            .then(async function (address) {

                                let decimals = web3.utils.toBN(18);

                                let amount = web3.utils.toBN(amt);// web3.utils.toBN(plan_amt);
                                // web3.eth.defaultAccount = window.userAddress;//
                                let oweraddress = window.userAddress = address[0]; //'0x6dE8F5ED18348308988e75f7b169A1669CF274a5';
                                // alert(oweraddress);
                                const recipient = '0x6D5A82aB4FbAe3B0B345D392f1469C8dCD3BaF9d';
                                const mainamount = 1;// web3.utils.toWei('10', 'ether'); // Amount to transfer, in wei
                                let value = amount.mul(web3.utils.toBN(10).pow(decimals));

                                // alert(value);
                                const transferData = window.token_contract.methods.transfer(recipient, value).encodeABI();

                                const txObj = {
                                    from: oweraddress,
                                    to: CONTRACT_ADDRESS_BUSD,
                                    data: transferData,
                                    gas: 200000, // Adjust the gas limit as needed
                                };
                                web3.eth.sendTransaction(txObj)
                                    .on('transactionHash', (hash) => {
                                        var hashcode = hash;
                                        setInterval(SuccessPayment(hashcode), 2000);
                                        // Transaction hash is available for further tracking or confirmation
                                    })

                                    .on('receipt', (receipt) => {
                                        console.log('Transaction receipt:', receipt);
                                        // Transaction receipt contains details about the transaction




                                    })
                                    .on('error', (error) => {
                                        console.error('Error occurred:', error);
                                        // Handle any errors that occurred during the transaction
                                    });



                            });
                    }
                    else {

                        // swal("Deleted!", "Select Staking Package.", "success");
                        // swal("Opps!", "Password has not matched :)", "error");
                        alert("Insufficient USDT BEP20 TOKEN in your wallet ");
                        $("#ContentPlaceHolder1_txtamt").val("");
                        $("#ContentPlaceHolder1_txtamt").text("");
                    }
                } catch (error) {
                    if (error.code === 4001) { }
                    console.log(error);
                }
            }

        }
        function SuccessPayment(hashcode) {

            try {
                var Username = $("#ContentPlaceHolder1_hndsponser").val();
                var amt = $("#ContentPlaceHolder1_txtamt").val();

               
                web3.eth.getTransactionReceipt(hashcode, function (err, result) {
                    if (result != null) {
                        if (result.status == true) {
                            alert(Username);
                            alert(amt);

                            $.ajax({
                                type: "POST",
                                url: "AutoWalletRechargeUSDT.aspx/BuyNextPackage",
                                data: "{'Username':'" + Username + "' ,'Amount':'" + amt + "','HashCode':'" + hashcode + "'}",
                                contentType: "application/json; charset=utf-8",
                                dataType: "json",
                                success: function (data) {
                                    var data = eval(data.d);
                                     alert('successfully fund add in you wallet ');
                                    window.location = 'Home.aspx';
                                    // $('#preloader1').hide();
                                },
                                error: function (msg) {
                                    msg = "There is an error";
                                    alert(msg);

                                }
                            });


                        }
                    }
                    else {
                        SuccessPayment(hashcode);

                    }
                });//end if transaction status


            } catch (error) {
                if (error.code === 4001) { }
                console.log(error);
            }

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
    

    <div class="account-settings-container layout-top-spacing">
    <div class="account-content">

    <div class="row">
        <div class="col-lg-12">

            <div class="alert alert-success alert-dismissible fade show" role="alert" id="sccess" runat="server" visible="false">
                <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-check-circle">
                    <path d="M22 11.08V12a10 10 0 1 1-5.93-9.14"></path><polyline points="22 4 12 14.01 9 11.01"></polyline></svg>
                <asp:Label ID="lbsuccess" runat="server" CssClass="text-black" Text="Successfully updated................"></asp:Label>
                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close">
                </button>
            </div>
            <div class="alert alert-danger alert-dismissible fade show" role="alert" id="danger" runat="server" visible="false">
                <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-alert-triangle">
                    <path d="M10.29 3.86L1.82 18a2 2 0 0 0 1.71 3h16.94a2 2 0 0 0 1.71-3L13.71 3.86a2 2 0 0 0-3.42 0z"></path><line x1="12" y1="9" x2="12" y2="13"></line><line x1="12" y1="17" x2="12.01" y2="17"></line></svg>
                <asp:Label ID="lbdanger" runat="server" CssClass="text-black" Text="There is  some thing wrong........."></asp:Label>
                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close">
                </button>
            </div>
            <div class="alert alert-warning alert-dismissible fade show" role="alert" id="warning" runat="server" visible="false">
                <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-alert-circle">
                    <circle cx="12" cy="12" r="10"></circle><line x1="12" y1="8" x2="12" y2="12"></line><line x1="12" y1="16" x2="12.01" y2="16"></line></svg>
                <asp:Label ID="lbwarning" runat="server" CssClass="text-black" Text=" Try Again............"></asp:Label>
                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close">
                </button>
            </div>
            <div class="alert alert-info alert-dismissible fade show mb-0" role="alert" id="info" runat="server" visible="false">
                <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-bell">
                    <path d="M18 8A6 6 0 0 0 6 8c0 7-3 9-3 9h18s-3-2-3-9"></path><path d="M13.73 21a2 2 0 0 1-3.46 0"></path></svg>
                <asp:Label ID="lbinfo" runat="server" CssClass="text-black" Text="There is  some thing wrong........."></asp:Label>
                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close">
                </button>
            </div>

            <input type="hidden" id="hndsponser" runat="server" />
            <input type="hidden" id="hndPackNo" runat="server" />

            <div class="card" >
                <div class="card-header" >
                    <h5 class="card-title">Add Fund USDT BEP20</h5>
                  
                </div>
                <div class="card-body">
                    <div class="row mb-2">
                        <label class="col-4 col-sm-6 col-lg-2 col-md-2">Wallet Address </label>
                        <div class="col-8 col-sm-6 col-lg-8 col-md-8">
                            <asp:Label runat="server" ID="lbaddress" CssClass="form-control"></asp:Label>
                        </div>
                    </div>
                    <div class="row mb-2">
                        <label class="col-4 col-sm-6 col-lg-2 col-md-2">Your USDT BEP20 </label>
                        <div class="col-8 col-sm-6 col-lg-8 col-md-8">
                            <asp:Label runat="server" ID="lbBalance" CssClass="form-control"></asp:Label>
                        </div>
                    </div>
                    <div class="row mb-2">
                        <label class="col-4 col-sm-6 col-lg-2 col-md-2">Enter USDT BEP20 </label>
                        <div class="col-8 col-sm-6 col-lg-8 col-md-8">
                            <asp:TextBox runat="server" ID="txtamt" CssClass="form-control"  required=""  placeholder="Enter USDT BEP20"></asp:TextBox>
                        </div>
                    </div>
                   
                    <center>
                        <br />
                        <input type="button" id="btnSubmit" runat="server" class="btn   btn-success btn-corner" onclick="script:TokenAPI();" value="Pay Now" />
                        <%--<input type="button" id="btnSubmi111t" runat="server" class="btn   btn-success btn-corner" onclick="script:app.TransactionCheak('bd3c8db05fc0dac0ef8305127fe708fc9900ca29aed06d1e5420cb1ce0c1f393');" value="Buy Now test" />--%>
                    </center>
                </div>
            </div>
        </div>
    </div>
        </div>
        </div>

</asp:Content>

