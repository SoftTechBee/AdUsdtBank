<%@ Page Title="" Language="C#" MasterPageFile="~/Member/MasterPage.master" AutoEventWireup="true" CodeFile="Packages.aspx.cs" Inherits="Member_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    
     <!-- Content body -->
            <!-- Content -->
               <!------Msgbox End---->

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
       
    <!-----Alert End----->
       
          
             <!-- layout modes selection -->
            <div class="row mb-3">
                <div class="col-12">
                    <h6 class="mb-0">Packages For ID: <asp:Label ID="lbActiveMember"  runat="server"  ></asp:Label></h6>
                </div>
            </div>
<!-- Panel Content --> 
         <!-- Content -->
  
                <div class="row">
                    <div class="col-lg-12">
                        <div class="card  mb-4 custom-card5" style="border: 1px solid yellow;">

                            <div class="card-body">
                                <div class="form-horizontal">
                                    <h5 class="text-warning " style="text-align: right; padding-right: 20px;" runat="server" visible="false" id="lbfund"><a class=" btn  btn-success" href="WalletRecharge.aspx">Add Fund</a></h5>
                                    <div class="mb-3 row">
                                        <label class="control-label col-sm-3">Fund Balance </label>
                                        <div class="col-sm-3">
                                            <h6>$
                                                <asp:Label ID="txtbalance" runat="server" Text="0"></asp:Label></h6>
                                        </div>
                                        <label class="control-label col-sm-3">Current Package </label>
                                        <div class="col-sm-3">

                                            <h6>
                                                <asp:Label ID="txtcurrentpack" runat="server" Text="NONE"></asp:Label>
                                                (<asp:Label ID="txtcurrentamt" CssClass="text-warning" runat="server" Text="0"></asp:Label>)</h6>

                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>


     <div class="row"> 
                     <br />
    <asp:Repeater ID="Repeater1" runat="server" OnItemCommand="repPack_ItemCommand">
        <ItemTemplate>
            <div class="col-12 col-xl-4 mb-4">
                <div class="card" style="background-image: url(../bg.jpg) " >
                    <div class="card-body bg-opacity-10" >
                        <div class="my-4">
                                
                            <h2 class="mb-2 text-warning">
                                <asp:Label runat="server" ID="lbpack" Text='<%#Eval("product") %>'></asp:Label>
                            </h2>
                           
                        </div>
                          <div class="pricing-content d-flex flex-column gap-3">
                            <div class="d-flex align-items-center justify-content-between">
                                <h5 class="mb-0 ">Amount:</h5>
                                <h3 class="mb-0 fw-medium  text-warning">
                                    $ <asp:Label runat="server" ID="lbamountmin" Text='<%#Eval("min") %>'></asp:Label> 
                                </h3>
                            </div>
                        </div>

                        <div class="pricing-content d-flex flex-column gap-3">
                            <div class="d-flex align-items-center justify-content-between">
                                <h5 class="mb-0 ">Capping:</h5>
                                <h3 class="mb-0 fw-medium  text-warning">
                                    $ <asp:Label runat="server" ID="lbPerdays" Text='<%#Eval("SoldRate") %>'></asp:Label>
                                </h3>
                            </div>
                        </div>
                      
                        <!-- Chart Canvas -->
                        <%--<div class="chart-container mt-4">
                            <canvas id="chart_<%#Eval("packid") %>"></canvas>
                        </div>--%>
                        <hr />
         
                        <div class="d-grid">
                               <%--<asp:Button ID="Button1" runat="server" Text="Upgrade Now" CssClass="btn  btn-block  btn-warning" CommandArgument='<%#Eval("packid") %>' CommandName="Click" />--%> 
                            <a href="SelfActive.aspx?id=<%=SessionData.Get<string>("newuser") %>&Packid=<%#Eval("packid") %>" class="btn btn-warning text-black">Upgrade Now?</a>

                        </div>

                    </div>
                    
                </div>
            </div>

        </ItemTemplate>
    </asp:Repeater>
</div>

   

                <script>

                    function Processclick() {
                        swal({
                            title: "Processing.......!",
                            text: "Note: Do Not press back or close the app? It will close in few seconds.",
                            imageUrl: "../SoftImg/refresh.gif",
                            timer: 2000000,
                            showConfirmButton: false
                        });
                    }
                    function Successclick() {
                        swal("Succesfully", "Packages Purchased successfully!", "success")
                    }
                    function dangerlick() {
                        swal("Oops...!", "Something went wrong! Try Again", "error")
                    }
                    function Warninglick() {
                        swal("Oops...!", "You have already buy this Package ,please buy another packages!", "warning")
                    }
                    function fundlick() {
                        swal("Oops...!", "Balance is less then to require amount,Please Add Fund! Check Minimum And Maxmum Amount", "warning")
                    }
                    function PrePackBuy() {
                        swal("Oops...!", "you can't buy this packages! Please Buy previous packages SequenceWise", "error")
                    }
                    function Direct() {
                        swal("Oops...!", "you can't buy this packages! Required 2 Direct For Buy a Packages?", "error")
                    }
     //function NotActive() {
     //    swal("Oops...!", "Your Account Is Not-Active ...! Please Active Your Account(Buy JOIN PAKAGE)", "error")
     //}
                </script>
                <script src="https://common.olemiss.edu/_js/sweet-alert/sweet-alert.min.js"></script>
                <link rel="stylesheet" type="text/css" href="https://common.olemiss.edu/_js/sweet-alert/sweet-alert.css">
           <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

                </div>
    <asp:HiddenField runat="server" ID="hndpackid" />
</asp:Content>

