<%@ Page Title="" Language="C#" MasterPageFile="~/Member/MasterPage.master" AutoEventWireup="true" CodeFile="WithdrawRequestlist.aspx.cs" Inherits="User_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

            <div class="alert alert-danger alert-dismissible fade show" role="alert" id="danger" runat="server" visible="false">
                <i data-feather="bell"></i>
                <p>
                    <asp:Label ID="lbdanger" runat="server" Text=""></asp:Label></p>
                <button class="btn-close" type="button" data-bs-dismiss="alert" aria-label="Close"></button>
            </div>

            <div class="row">
                <div class="col-lg-12">
                    <div class="card">
                        <div class="card-header">
                            <h5 class="text text-bold ">Withdraw Status</h5>
                            <asp:Label ID="lbname" runat="server" Text="" Visible="false"></asp:Label>
                        </div>
                        <!-- /.card-header -->
                        <div class="card-body">
                            <div class=" form-group row align-items-center mb-2">
                                <label class="col-lg-2 col-md-2 col-xs-6 col-sm-6">Select Form  Date </label>
                                <div class="ccol-lg-3 col-md-3 col-xs-6 col-sm-6">
                                    <div class='input-group date' id='datetimepicker6'>
                                        <asp:TextBox ID="txtfromdate" class="form-control" required="" type="date" runat="server" placeholder="DD-MM-YYYY"></asp:TextBox>
                                        <span class="input-group-addon">
                                            <span class="glyphicon glyphicon-calendar"></span>
                                        </span>
                                    </div>
                                </div>

                                <label class="col-lg-2 col-md-2 col-xs-6 col-sm-6">Select TO  Date </label>
                                <div class="col-lg-3 col-md-3 col-xs-6 col-sm-6">
                                    <div class='input-group date' id='datetimepicker7'>
                                        <asp:TextBox ID="txttodate" class="form-control" required="" type="date" runat="server" placeholder="DD-MM-YYYY"></asp:TextBox>
                                        <span class="input-group-addon">
                                            <span class="glyphicon glyphicon-calendar"></span>
                                        </span>
                                    </div>
                                </div>
                                <div class="col-lg-2 col-md-2 col-xs-6 col-sm-6">
                                    <asp:Button ID="btnSeach" runat="server" Text="Search" CssClass="btn btn-block btn-success" OnClick="btnSeach_Click" />
                                </div>
                            </div>

                            <div style="overflow: auto; color: #000000;">
                                <asp:GridView ID="grdData" runat="server" AutoGenerateColumns="False" CellPadding="10" PageSize="20" Font-Size="Large" CssClass="table table-bordered table-striped table-hover"
                                    GridLines="Both" Width="100%" AllowPaging="True" OnPageIndexChanging="grdData_PageIndexChanging">

                                    <Columns>

                                        <asp:TemplateField HeaderText="#">
                                            <ItemTemplate>
                                                <%# Container.DataItemIndex + 1 %>
                                            </ItemTemplate>
                                            <ItemStyle Width="10%" />
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="Incometype" HeaderText="Mode"></asp:BoundField>
                                        <%--<asp:BoundField DataField="Packtype" HeaderText="Mode"></asp:BoundField>--%>
                                        <asp:BoundField DataField="Amount" HeaderText="Amount"></asp:BoundField>
                                        <%--<asp:BoundField DataField="AdminCharge" HeaderText="AdminCharge"></asp:BoundField>--%>
                                        <%--<asp:BoundField DataField="Payout" HeaderText="WalletTransfer"></asp:BoundField>--%>
                                        <%--<asp:BoundField DataField="tds" HeaderText="Final"></asp:BoundField>--%>
                                        <%--<asp:BoundField DataField="CoinType" HeaderText="Paid"></asp:BoundField>--%>
                                        <%-- <asp:boundfield DataField="remark" HeaderText="Remark"></asp:boundfield>--%>
                                        <asp:BoundField DataField="Wallet" HeaderText="Wallet_Address"></asp:BoundField>
                                        <asp:BoundField DataField="DOR" DataFormatString="{0:dd/MM/yyyy}" HeaderText="DateOfAction"></asp:BoundField>
                                        <asp:BoundField DataField="Status" HeaderText="Status"></asp:BoundField>

                                    </Columns>

                                </asp:GridView>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

</asp:Content>



