<%@ Page Title="" Language="C#" MasterPageFile="~/member/MasterPage.master" AutoEventWireup="true"
  CodeFile="account.aspx.cs" Inherits="Admin_Account" %>

  <asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <!-- Content body -->

        <div class="alert alert-danger alert-dismissible" id="danger" runat="server" visible="false">

          <h4><i class="icon fa fa-ban"></i> Alert!</h4>
          <asp:Label ID="lbdanger" runat="server" Text="There is  some thing wrong........."></asp:Label>
        </div>
        <div class="row">
          <div class="col-lg-12">
            <div class="card">
              <div class="card-header">
                <h5 class="card-title text-warning">Main Wallet Statement</h5>

              </div>
              <!-- /.card-header -->
           <div class="card-body" style="overflow:auto;">

    <asp:GridView ID="grdData" runat="server" AutoGenerateColumns="False" CellPadding="10" PageSize="100"
        Font-Size="Large" CssClass="table table-bordered table-hover" GridLines="Both"
        Width="100%" AllowPaging="True" OnPageIndexChanging="grdData_PageIndexChanging" ShowFooter="true">

        <Columns>

            <asp:TemplateField HeaderText="#">
                <HeaderStyle CssClass="header-yellow-border"  />
                <ItemTemplate>
                    <%# Container.DataItemIndex + 1 %>
                </ItemTemplate>
                <ItemStyle Width="10%" />
            </asp:TemplateField>

           <asp:BoundField DataField="username" HeaderText="UserName">
                <HeaderStyle CssClass="header-yellow-border" />
            </asp:BoundField>

            <asp:BoundField DataField="date" HeaderText="Date" DataFormatString="{0:d}">
                <HeaderStyle CssClass="header-yellow-border" />
            </asp:BoundField>

            <asp:BoundField DataField="Remark" HeaderText="Types of Income">
                <HeaderStyle CssClass="header-yellow-border" />
            </asp:BoundField>

            <asp:BoundField DataField="Credit" HeaderText="Credit">
                <HeaderStyle CssClass="header-yellow-border" />
            </asp:BoundField>

            <asp:BoundField DataField="Debit" HeaderText="Debit">
                <HeaderStyle CssClass="header-yellow-border" />
            </asp:BoundField>


        </Columns>

    </asp:GridView>

</div>

              <!-- /.card-body -->
            </div>
            <!-- /.card -->
          </div>
          <!-- /.col -->
        </div>
    
    <!-- /.row -->



    <!-- page script -->

  </asp:Content>