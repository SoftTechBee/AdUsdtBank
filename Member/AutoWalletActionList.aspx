<%@ Page Title="" Language="C#" MasterPageFile="~/Member/MasterPage.master" AutoEventWireup="true" CodeFile="AutoWalletActionList.aspx.cs" Inherits="Admin_WalletApprovedList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

   

    <div class="account-settings-container layout-top-spacing">
        <div class="account-content">
            <div class="row">
                <div class="col-lg-12">

                    <div class="alert alert-danger alert-dismissible fade show" role="alert" id="danger" runat="server" visible="false">
                        <i class="feather feather-alert-circle text-black me-2"></i>
                        <asp:Label ID="lbdanger" runat="server" CssClass="text-black" Text="There is  some thing wrong........."></asp:Label>
                        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close">
                        </button>
                    </div>

                    <div class="card">
                        <div class="card-header">
                            <h4>Fund History</h4>
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                                <%--<div class="col-lg-12" style="overflow: auto;">--%>
                                <table id="example1" class="table table-bordered text-center">
                                    <headertemplate>
                                        <thead>
                                            <tr>
                                                <th class="back text-center">#</th>
                                                <th class="back text-center">Member</th>
                                                <th class="back text-center">Date </th>
                                               <%-- <th class="back text-center">TPC USDT</th>--%>
                                                <th class="back text-center">USDT</th>
                                                <th class="back text-center">Hashcode</th>
                                            </tr>
                                        </thead>
                                    </headertemplate>
                                    <tbody>
                                        <asp:Repeater ID="Repeater1" runat="server">
                                            <ItemTemplate>
                                                <tr>
                                                    <td class="text-center"><%#Container.ItemIndex+1 %> </td>
                                                    <td class="text-center">
                                                        <asp:Label ID="lbname" runat="server" Text='<%#Eval("UserName") %>'></asp:Label>
                                                    </td>
                                                    <td class="text-center"><%#DataBinder.Eval(Container.DataItem, "DOI", "{0:MM/dd/yyyy}")%></td>
                                                   <%-- <td class="text-center">
                                                        <asp:Label ID="lbcoinAmount" runat="server" Text='<%#Eval("Amount") %>'></asp:Label>
                                                    </td>--%>
                                                   <td class="text-center">
                                                        <asp:Label ID="lbusdtAmount" runat="server" Text='<%#Eval("Amount") %>'></asp:Label>
                                                    </td>
                                                    <td class="text-center"><%#Eval("[hashcode]") %></td>
                                                </tr>
                                            </ItemTemplate>
                                        </asp:Repeater>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>




