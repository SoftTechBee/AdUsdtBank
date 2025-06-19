<%@ Page Title="" Language="C#" MasterPageFile="~/member/MasterPage.master" AutoEventWireup="true" CodeFile="rptPoolMemberStatus.aspx.cs" Inherits="User_rptPoolMemberStatus" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="content-body">
        <div class="content">
            <div class="alert alert-danger alert-dismissible" id="danger" runat="server" visible="false">
                <h4><i class="icon fa fa-ban"></i>Alert!</h4>
                <asp:Label ID="lbdanger" runat="server" Text="There is  some thing wrong........."></asp:Label>
            </div>

            <div class="container-fluid">
                <div class="card ">
                    <div class="form-horizontal">
                        <div class="card-body">
                            <h3  style="color:#ff0101;">Package-<asp:Label runat="server" ID="lbpool"></asp:Label> Status Details </h3>
                            <a href="NewTree.aspx?UserName=<%=SessionData.Get<string>("newuser") %>&PoolNo=<%=SessionData.Get<string>("PoolNo") %>" class="btn btn-sm btn-primary">Tree View</a>
                           

                            <div class="form-group row d-none">
                                <label class="col-lg-2 col-md-2 col-xs-6 col-sm-6">Select Level </label>
                                <div class="col-lg-3 col-md-3 col-xs-6 col-sm-6">
                                    <asp:DropDownList runat="server" ID="drppack" OnSelectedIndexChanged="drppack_SelectedIndexChanged" AutoPostBack="true" CssClass="form-control">
                                        <asp:ListItem Value="0">---- All ----</asp:ListItem>
                                        <asp:ListItem Value="1">Level-1</asp:ListItem>
                                        <asp:ListItem Value="2">Level-2</asp:ListItem>
                                        <asp:ListItem Value="3">Level-3</asp:ListItem>
                                        <asp:ListItem Value="4">Level-4</asp:ListItem>
                                        <asp:ListItem Value="5">Level-5</asp:ListItem>
                                        <asp:ListItem Value="6">Level-6</asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                            </div>
                            <hr />

                              <div class="form-group">
      <div class="col-lg-12 col-md-12 col-xs-12 col-sm-12" style="overflow: auto;">

          <table id="example1" class="table table-bordered table-striped table-hover ">
              <thead>
                  <tr>
                      <th>#</th>
                     
                      
            <%--<th>Username</th>--%>
            <th>LevelNo</th>
            <th>TargetMember</th>
            <%--<th>Poolno</th>--%>
            <th>TotalTeam</th>
            <th>Recieved</th>
            <th>Status</th>
                    
                  </tr>
              </thead>
              <tbody>
                  <asp:Repeater ID="Repeater1" runat="server" >
                      <ItemTemplate>
                          <tr>
                              <td><%# Container.ItemIndex+1 %></td>
                            
                              <%--<td><%# Eval("Username") %></td>--%>
                    <td>LEVEL-<%# Eval("LevelNo") %></td>
                    <td><%# Eval("TragetMember") %></td>
                    <%--<td><%# Eval("Poolno") %></td>--%>
                    <td><%# Eval("TotalTeam") %></td>
                    <td><%# Eval("Recived") %></td>
                    <td><%# remark(Eval("IsTransfer")) %></td>
                              <%--<td><strong>[<%#Eval("M1") %>]</strong><br /><%#Eval("M1DOI") %></td>
                              <td><strong>[<%#Eval("M2") %>]</strong><br /><%#Eval("M2DOI") %></td>
                              <td><strong>[<%#Eval("M3") %>]</strong><br /><%#Eval("M3DOI") %></td>
                              <td><strong>[<%#Eval("M4") %>]</strong><br /><%#Eval("M4DOI") %></td>
                              --%>
                              
                            
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
    </div>

</asp:Content>

