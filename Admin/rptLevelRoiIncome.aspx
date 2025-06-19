<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" CodeFile="rptLevelRoiIncome.aspx.cs" Inherits="Admin_rptlevelIncome" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

<div class="alert alert-danger alert-dismissible" id="danger" runat="server" visible="false">
    <h4><i class="icon fa fa-ban"></i>Alert!</h4>
    <asp:Label ID="lbdanger" runat="server" Text="There is  some thing wrong........."></asp:Label>
</div>

<div class="card">
    <div class="form-horizontal">
        <div class="card-body">
            <div class=" form-group row">
                <div class=" col-lg-8">
                    <h2 class="card-title"> Level Income</h2>
                </div>

            <%--    <div class="col-lg-2">
                    <asp:Button ID="btnExportToPdf" CssClass="btn btn-block  btn-dark" Text="Export To Pdf" OnClick="btnExportToPdf_Click" runat="server" />
                </div>--%>

                <div class="col-lg-2">
                    <asp:Button ID="btnExportToExcel" CssClass="btn btn-block  btn-dark" Text="Export To Excel" OnClick="btnExportToExcel_Click" runat="server" />
                </div>
            </div>
            <div class="form-group row align-items-center">
                <div class="col-lg-2 col-md-2 col-xs-6">
                    <asp:TextBox ID="txtsearch" CssClass="form-control" runat="server" placeholder="Enter UserName"></asp:TextBox>
                </div>

                <label class="control-label col-lg-2 col-md-2 col-xs-6">From</label>
                <div class="col-lg-2 col-md-2 col-xs-6 ">
                    <div class='input-group date' id='datetimepicker6'>
                        <asp:TextBox ID="txtfromdate" class="form-control" type="date" runat="server" placeholder="Select Form  Date "></asp:TextBox>
                        <span class="input-group-addon">
                            <span class="glyphicon glyphicon-calendar"></span>
                        </span>
                    </div>
                </div>

                <label class="control-label col-lg-2 col-md-2 col-xs-6">To</label>
                <div class="col-lg-2 col-md-2 col-xs-6 ">
                    <div class='input-group date' id='datetimepicker7'>
                        <asp:TextBox ID="txttodate" class="form-control" type="date" runat="server" placeholder="Select TO  Date "></asp:TextBox>
                        <span class="input-group-addon">
                            <span class="glyphicon glyphicon-calendar"></span>
                        </span>
                    </div>
                </div>
                <div class="col-md-2 col-xs-2 col-lg-2">
                    <asp:Button ID="btnSeach" runat="server" Text="Search" Height="40px" Width="150px" CssClass="btn btn-block btn-success" OnClick="btnsearch_Click" />
                </div>
            </div>


            <div class="form-group">
                <div class="col-lg-12 col-md-12 col-xs-12 col-sm-12" style="overflow: auto;">
                    <table id="example1" class="table table-bordered table-striped table-hover ">
                        <asp:Repeater ID="Repeater1" runat="server" OnItemCommand="Repeater1_ItemCommand">
                            <HeaderTemplate>
                                <thead>
                                    <tr>
                                        <th>#</th>
                                        <th>DOJ</th>
                                        <th>UserName</th>
                                        <th>Name</th>
                                        <th>Total Income</th>
                                        <th>View Income</th>
                                    </tr>
                                </thead>
                            </HeaderTemplate>
                            <ItemTemplate>
                                <tbody>
                                    <tr>
                                        <td><%# Container.ItemIndex+1 %></td>
                                        <td><%#DataBinder.Eval(Container.DataItem, "dateofjoin", "{0:dd/MM/yyyy}")%></td>
                                        <td><%#Eval("username") %></td>
                                        <td><%#Eval("name") %></td>
                                        <td><%#Eval("totalincome") %> USDT</td>
                                        <%--  <td>
                                            <asp:Button ID="Button1" runat="server" Height="40px" Width="100px" Text="View" CssClass="btn  btn-block  btn-warning" CommandArgument='<%#Eval("username") %>' CommandName="View" />
                                        </td>--%>
                                        <td>
                                            <a href="rptViewIncome.aspx?username=<%#Eval("username") %>&type=direct" text="View" class="btn  btn-block  btn-warning">View</a>
                                        </td>
                                    </tr>
                                </tbody>
                            </ItemTemplate>
                        </asp:Repeater>
                        <tfoot>
                            <tr>
                                <th>#</th>
                                <th></th>
                                <th>Total</th>
                                <th></th>
                                <th>
                                    <asp:Label ID="lbtotal" runat="server" Text=""></asp:Label>
                                </th>
                                <th></th>
                            </tr>
                        </tfoot>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>
</asp:Content>

