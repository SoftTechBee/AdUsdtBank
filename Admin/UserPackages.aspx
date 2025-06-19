<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" CodeFile="UserPackages.aspx.cs" Inherits="Admin_rptMachingIncome" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

  <!------Msgbox End---->
     <div class="box-body">
              <div class="alert alert-danger alert-dismissible" id="danger"  runat="server"  visible="false">
              
                <h4><i class="icon fa fa-ban"></i> Alert!</h4>
            <asp:Label ID="lbdanger" runat="server" Text="There is  some thing wrong........."></asp:Label> 
              </div>
              <div class="alert alert-info alert-dismissible" id="info" runat="server"  visible="false">
              
                <h4><i class="icon fa fa-info"></i> Alert!</h4>
               <asp:Label ID="lbinfo" runat="server" Text="ere is  some thing wrong........."></asp:Label>  
             
              </div>
              <div class="alert alert-warning alert-dismissible" id="warning" runat="server"  visible="false">
              
                <h4><i class="icon fa fa-warning"></i> Alert!</h4>
               <asp:Label ID="lbwarning" runat="server" Text=" Try Again............"></asp:Label> 
            
              </div>
              <div class="alert alert-success alert-dismissible" id="sccess" runat="server" visible="false" >
              
                <h4><i class="icon fa fa-check"></i> Alert!</h4>
                  <asp:Label ID="lbsuccess" runat="server" Text="Successfully updated................"></asp:Label>  
              </div>
            </div>
    <!-----Alert End----->

    <div class="card">
        <div class="form-horizontal">
            <div class="card-body">
                <div class="form-group row">
                    <div class="col-lg-10">
                        <h2 class="card-title">User Packages</h2>
                    </div>

                    <div class="col-lg-2">
                        <asp:Button ID="btnExportToExcel" CssClass="btn btn-block  btn-dark" Text="ExportToExcel" OnClick="btnExportToExcel_Click" runat="server" />
                    </div>
                </div>

                <div class=" form-group row">
                    <label class="control-label col-lg-3 col-md-3 col-xs-6 ">Select Package</label>
                </div>

                <div class=" form-group row">
                    <div class="col-lg-3 col-md-3 col-xs-6 ">
                        <asp:DropDownList runat="server" ID="drppack" CssClass="form-control" OnSelectedIndexChanged="Unnamed_SelectedIndexChanged" AutoPostBack="true">
                            <asp:ListItem Value="0">All</asp:ListItem>
                            <asp:ListItem Value="1">Package-1</asp:ListItem>
                            <asp:ListItem Value="2">Package-2</asp:ListItem>
                            <asp:ListItem Value="3">Package-3</asp:ListItem>
                            <asp:ListItem Value="4">Package-4</asp:ListItem>
                            <asp:ListItem Value="5">Package-5</asp:ListItem>
                            <asp:ListItem Value="6">Package-6</asp:ListItem>
                            <asp:ListItem Value="7">Package-7</asp:ListItem>
                            <asp:ListItem Value="8">Package-8</asp:ListItem>
                            <asp:ListItem Value="9">Package-9</asp:ListItem>
                            <asp:ListItem Value="10">Package-10</asp:ListItem>
                            <asp:ListItem Value="11">Package-11</asp:ListItem>
                            <asp:ListItem Value="12">Package-12</asp:ListItem>
                            <asp:ListItem Value="13">Package-13</asp:ListItem>
                            <asp:ListItem Value="14">Package-14</asp:ListItem>
                            <asp:ListItem Value="15">Package-15</asp:ListItem>
                        </asp:DropDownList>
                    </div>

               
                </div>

                <hr />
                <div class="form-group">
                    <div class="col-lg-12 col-md-12 col-xs-12 col-sm-12" style="overflow: auto;">

                        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CssClass="table table-bordered table-striped table-hover"
                             AllowPaging="True" PageSize="50" OnPageIndexChanging="GridView1_PageIndexChanging" ShowFooter="true">
                            <Columns>
                                <asp:TemplateField HeaderText="#">
                                    <ItemTemplate>
                                        <%# Container.DataItemIndex + 1 %>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField DataField="Username" HeaderText="Username" />
                                <asp:BoundField DataField="poolno" HeaderText="Pack Name" />

                                <asp:BoundField DataField="DOI" HeaderText="Date" DataFormatString="{0:dd/MM/yyyy}" />

                                

                                <asp:BoundField DataField="Amount" HeaderText="Amount" />


                               
                            </Columns>

                            <FooterStyle CssClass="font-weight-bold" />
                        </asp:GridView>



                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

