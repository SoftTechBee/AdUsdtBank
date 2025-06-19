<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" CodeFile="TransactionChangePassword.aspx.cs" Inherits="User_TransactionChangePassword" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
    <style>
        .l2 {
            color: #ff5050 !important;
            font-size: medium;
            font-weight: 700;
        }
    </style>

    <div class="alert alert-arrow-left alert-icon-left alert-light-success alert-dismissible fade show mb-4 mt-4" id="success" runat="server" visible="false" role="alert">
        
     
        <asp:Label ID="lbsuccess" CssClass="text-white-50" runat="server" Text="There is Something Wrong !!"></asp:Label>
    </div>

    <div class="alert alert-arrow-left alert-icon-left alert-light-info alert-dismissible fade show mb-4 mt-4" id="info" runat="server" visible="false" role="alert">
        
        <asp:Label ID="lbinfo" CssClass="text-white-50" runat="server" Text="There is Something Wrong !!"></asp:Label>
    </div>

    <div class="alert alert-arrow-left alert-icon-left alert-light-danger alert-dismissible fade show mb-4 mt-4" id="danger" runat="server" visible="false" role="alert">
        
        <asp:Label ID="lbdanger" CssClass="text-white-50" runat="server" Text="There is Something Wrong !!"></asp:Label>
    </div>

    <div class="alert alert-arrow-left alert-icon-left alert-light-warning alert-dismissible fade show mb-4 mt-4" id="warning" runat="server" visible="false" role="alert">
        
        <asp:Label ID="lbwarning" CssClass="text-white-50" runat="server" Text="There is Something Wrong !!"></asp:Label>
    </div>


    <div class="card layout-top-spacing">
        <div class="card-header bg-danger-light rounded">
            <h4>Change Security PIN</h4>
        </div>
        <div class="form-horizontal">
 
                                <div class="card-body">
                             <!----form start---->
                                      <div class=" form-group row">
                    
                
                          <label class="control-label text-center col-lg-4">Current Password </label>
                          <div class="col-lg-6">
                         <asp:TextBox ID="txtoldpass" required="" runat="server" CssClass="form-control"></asp:TextBox>
                         </div>

                          </div>
                                    <br />
                            <div class=" form-group row">
                    
                
                          <label class="control-label text-center col-lg-4">New Password </label>
                          <div class="col-lg-6">
                         <asp:TextBox ID="txtnew" TextMode="Password"  required="" runat="server" CssClass="form-control"></asp:TextBox>
                         </div>
                          </div>  <br />
                      <div class="form-group row">
                          <label class="control-label text-center col-lg-4">Confirm Password </label>
                          <div class="col-lg-6">
                         <asp:TextBox ID="txtconfirm"  required="" runat="server" CssClass="form-control"></asp:TextBox>
                              </div>
                          </div>
                   
                      </div>
                    <br />
             <div class="form-group row">
                  <div class="col-sm-3">
                      </div>
                 <center>
                  <div class="col-sm-4">

   <asp:Button ID="btnaction" runat="server" Text="Update"  OnClick="Button1_Click" CssClass="btn  btn-success btn-sm"/>
               

                  </div>
                         </center> 
                <br />
                                

              </div>
 <hr />
             <%-- <div class="form-group row">
                    <center>
    <label class=" text-success col-lg-12">Notes.</label>
    <br />
    <label class=" text-danger col-lg-12"> If you forget your current PIN, please contact the admin.</label>
                          <center>
</div>--%>
              </div>
              </div>
          
       
 

</asp:Content>

