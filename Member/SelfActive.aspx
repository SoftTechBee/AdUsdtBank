<%@ Page Title="" Language="C#" MasterPageFile="~/Member/MasterPage.master" AutoEventWireup="true" CodeFile="SelfActive.aspx.cs" Inherits="User_Default" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
      
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
                    window.ethereum
                        .request({
                            method: "eth_requestAccounts"
                        })
                        .then(async function (address) {
                            window.userAddress = address[0];
                            console.log(window.userAddress);
                            window.TokenBalance = await window.token_contract.methods.balanceOf(window.userAddress).call();
                            console.log("Token Balance : ", TokenBalance / 1e18);
                            //  $("#tokenbalance").val(TokenBalance);
                            $("#ContentPlaceHolder1_lbaddress").text(window.userAddress);
                            $("#ContentPlaceHolder1_lbBalance").text(TokenBalance / 1e18);
                            var btn = document.getElementById('<%= btnSubmit.ClientID %>');
                            btn.disabled = false;
                            btn.value = 'Pay Now';
                        });
                } catch (error) {
                    if (error.code === 4001) { }
                    console.log(error);
                }
            }
            // setUp();
        }
        //  setInterval('startNow()', 2000);
        $(function () {
            //  alert("hi");
            var btn = document.getElementById('<%= btnSubmit.ClientID %>');

            btn.disabled = true;
            btn.value = 'Loading…';
            startNow();
           
        });
        async function TokenAPI() {
           
           

            if (window.ethereum) {
                try {
                    var btn = document.getElementById('<%= btnSubmit.ClientID %>');
                    btn.disabled = true;
                    btn.value = 'Processing…';
                    var amt = parseInt($("#ContentPlaceHolder1_txtAmt").val());
                    var Packid = $("#ContentPlaceHolder1_hndPackid").val();
                    var Balance = $("#ContentPlaceHolder1_lbBalance").text();
                 

                    console.log("Pay Amt : ", amt);
                    console.log("Your Balance : ", Balance);
              
                    console.log("Packid : ", Packid);

                 
                        if (parseInt(Balance) >= parseInt(amt)) {

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
                            btn.disabled = false;
                            btn.value = 'Pay Again';

                            swal("Oops...!", "Balance is less then to require amount,Please Add Fund! Check Minimum And Maxmum Amount", "warning")
                        }
               
                   
                } catch (error) {
                    if (error.code === 4001) { }
                    console.log(error);
                }
            }

        }
        function SuccessPayment(hashcode) {

            try {
                var PackType = $("#ContentPlaceHolder1_hndPackType").val();
                var Username = $("#ContentPlaceHolder1_hndsponser").val();
                
                var amt =$("#ContentPlaceHolder1_txtAmt").val();
                var btn = document.getElementById('<%= btnSubmit.ClientID %>');
                console.log("PackType : ", PackType);
                console.log("Username : ", Username);
                console.log("amt : ", amt);
                web3.eth.getTransactionReceipt(hashcode, function (err, result) {
                    if (result != null) {
                        if (result.status == true) {
                            

                            $.ajax({
                                type: "POST",
                                url: "SelfActive.aspx/BuyNextPackage",
                                data: "{'Username':'" + Username + "' ,'Amount':'" + amt + "','HashCode':'" + hashcode + "','PackType':'" + PackType + "'}",
                                contentType: "application/json; charset=utf-8",
                                dataType: "json",
                                success: function (data) {
                                    var data = eval(data.d);
                                    //alert(data);

                                    if (data == "Success") {
                                        swal("Succesfully", "Packages Purchased successfully!", "success")

                                        btn.disabled = true;
                                        btn.value = 'Purchased';
                                    }
                                    else if (data == "Already") {
                                        swal("Oops...!", "HashCode Already Exists Try Again!", "warning")
                                        btn.value = 'Buy Now';
                                    }
                                    else {
                                        swal("Oops...!", "Something went wrong! Try Again", "error")
                                        btn.value = 'Buy Now';
                                    }
                                 
                                },
                                error: function (msg) {
                                    swal("Oops...!", "Something went wrong! Try Again", "error")
                                    

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
                        <div class="row">
                            <div class="col-12">
                                <div class="page-title-box d-flex align-items-center justify-content-between">
                                    <h4 class="mb-0">Payment Here </h4>                                 

                                </div>
                            </div>
                        </div>
                <br />
                        <!-- end page title -->
    <!------Msgbox End---->
     <div class="card-body">
              <div class="alert alert-danger alert-dismissible" id="danger"  runat="server"  visible="false">
              
            <asp:Label ID="lbdanger" runat="server" Text="There is  some thing wrong........."></asp:Label> 
              </div>
              <div class="alert alert-info alert-dismissible" id="info" runat="server"  visible="false">
              
               <asp:Label ID="lbinfo" runat="server" Text="ere is  some thing wrong........."></asp:Label>  
             
              </div>
              <div class="alert alert-warning alert-dismissible" id="warning" runat="server"  visible="false">
              
               <asp:Label ID="lbwarning" runat="server" Text=" Try Again............"></asp:Label> 
            
              </div>
              <div class="alert alert-success alert-dismissible" id="sccess" runat="server" visible="false" >
              
                  <asp:Label ID="lbsuccess" runat="server" Text="Successfully updated................"></asp:Label>  
              </div>
            </div>
    <!-----Alert End----->


    
      <div class="row">
             
        <div class="col-lg-12">
          <div class="card">
            <%--  <div class="card-header with-border">
                  
              </div>--%>
              <div class="card-body">
                  <div class="form-horizontal">
                       <div class="mb-3 row">
                       
              
                  
                           </div>
                       <div class="mb-3 row">
                         
        <label class="control-label col-sm-2"> Your Wallet </label>
                         <div class="col-sm-7">
                      
              <asp:Label ID="lbaddress" CssClass="text-warning fw-bold form-control"  runat="server" Text="0"></asp:Label>
 
             
            </div>
                            <label class="control-label col-sm-2"> Your USDT </label>
                         <div class="col-sm-1">
                      
               <asp:Label ID="lbBalance" runat="server" CssClass="text-warning fw-bold form-control"   Text="0"></asp:Label> 
 
             
            </div>
            </div>
                         <div class=" row form-group">
                         <label class="control-label col-sm-2">Member ID </label>
                           <div class="col-sm-4">
                         <asp:TextBox ID="lbActiveMember" runat="server" ReadOnly="true" CssClass=" form-control"  ></asp:TextBox>
                             
                          </div>
                             <label class="control-label col-sm-2">Package Name </label>
                          <div class="col-sm-4">

                         <asp:TextBox ID="txtpackage" runat="server" ReadOnly="true" CssClass=" form-control"  ></asp:TextBox>
                              
                         
                      </div>
                          </div>
                    
                   
                <div class="mb-3 form-group row">
                        
                       <label class="control-label col-sm-2">Amount($) </label>
                          <div class="col-sm-10">

                              
                         
                         <asp:TextBox ID="txtAmt" runat="server" ReadOnly="true" placeholder="Enter invest Amount"  CssClass=" form-control" ></asp:TextBox>
                      </div>
                      </div>
                
                      
                     
                
                      
                     
                     
          <!-- /.card -->
                    
                      
                
              <div class="card-footer text-center">
                  
                  <center>
                      <input type="button" id="btnSubmit" runat="server" class="btn   btn-success btn-corner" onclick="script:TokenAPI();" value="Pay Now" />
               
                      </center>
                 </div>         
              </div>
             

        </div>
        </div>
        </div>
         

  
 
          
            <script src="https://common.olemiss.edu/_js/sweet-alert/sweet-alert.min.js"></script>
<link rel="stylesheet" type="text/css" href="https://common.olemiss.edu/_js/sweet-alert/sweet-alert.css">
    <input type="hidden" id="hndsponser" runat="server" />
            <input type="hidden" id="hndPackNo" runat="server" />
            <input type="hidden" id="hndPackid" runat="server" />
            <input type="hidden" id="hndPackType" runat="server" />

</div>
      <script>

        
          function TimeLimit() {
              swal("TimeLimit", "Today Buy Limit Over Please Wait Next day", "warning")
          }
      </script>
</asp:Content>

