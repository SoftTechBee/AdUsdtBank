<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" CodeFile="SetTodayROI.aspx.cs" Inherits="Admin_setnews" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">


    <div class="alert alert-info alert-dismissible" id="info" runat="server" visible="false">
        <h4><i class="icon fa fa-info"></i>Alert!</h4>
        <asp:Label ID="lbinfo" runat="server" Text="Already Inserted........."></asp:Label>
    </div>
    <div class="alert alert-danger alert-dismissible" id="danger" runat="server" visible="false">
        <h4><i class="icon fa fa-danger"></i>Alert!</h4>
        <asp:Label ID="lbdanger" runat="server" Text="Already Inserted........."></asp:Label>
    </div>


    <div class="card">
        <div class="form-horizontal">
            <div class="card-body">
                <h3>Set ROI</h3>
                <div class="form-group row">
                    <div class="col-lg-12">
                       
                      
                        <div class="form-group row">
                            <div class="col-3">
                                <label class="control-label" for="inputSuccess">Package</label>
                            </div>
                            <div class="col-9">
                                <asp:DropDownList runat="server" ID="drppack" CssClass="form-control" >
                                    <asp:ListItem Value="1"> Silver</asp:ListItem>
                                    <asp:ListItem Value="2"> Gold</asp:ListItem>
                                    <asp:ListItem Value="3"> Diamond</asp:ListItem>
                                  
                                </asp:DropDownList>
                            </div>
                        </div>
                        <div class="form-group row">
                            <div class="col-3">
                                <label class="control-label" for="inputSuccess">Today ROI</label>
                            </div>
                            <div class="col-9">
                                <asp:TextBox ID="txtroi" runat="server" class="form-control" placeholder="Enter Today ROI"></asp:TextBox>
                            </div>
                        </div>
                      
                    </div>
                </div>
            </div>
             <div class="form-group row">
                <div class="col-md-12">
                    <center>
                        <asp:Button ID="bntsubmit" runat="server" Text="Submit" CssClass="btn btn-block btn-success" OnClick="bntsubmit_Click" />
                    </center>
                </div>
            </div>
            <div class="card">
                  <div class="card-body">
                <div class="col-lg-12" style="overflow:auto!important">
                    <table class="table table-bordered table-hover table-responsive">
                        <tr>
                            <th>#</th>
                            <th>Package</th>
                            <th>ROI(%)</th>
                            <th>Updated On</th>
                            <th>Update</th>
                            <th>Delete</th>
                        </tr>
                        <asp:Repeater ID="Repeater1" runat="server" OnItemCommand="Repeater1_ItemCommand">
                            <ItemTemplate>
                                <tr>
                                    <td><%# Container.ItemIndex+1 %></td>
                                    <td>
                                        <asp:Label ID="pack" runat="server" Text='<%#Eval("type") %>'></asp:Label></td>
                                    <td>
                                        <asp:Label ID="Label7" runat="server" Text='<%#Eval("ROI") %>'></asp:Label></td>
                                    <td>
                                        <asp:Label ID="lbname" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "DOI", "{0:dd/MM/yyyy}")%>'></asp:Label></td>
                                    <td><asp:Button ID="Button2" runat="server"  Text="Update" CssClass="btn  btn-block  btn-primary btn-sm" CommandArgument='<%#Eval("idx") %>' CommandName="Edit" /> </td>
                                    <td><asp:Button ID="Button3" runat="server"  Text="Delete" CssClass="btn  btn-block  btn-danger btn-sm" CommandArgument='<%#Eval("idx") %>' CommandName="Delete" /> </td>
                                </tr>
                            </ItemTemplate>
                        </asp:Repeater>
                    </table>
                </div>
                </div>
                </div>
           

            
        </div>
    </div>
            <asp:HiddenField runat="server" ID="hndIDX" />
</asp:Content>

