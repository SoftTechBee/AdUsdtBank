<%@ Page Title="" Language="C#" MasterPageFile="~/Member/MasterPage.master" AutoEventWireup="true" CodeFile="TransactionChangePassword.aspx.cs" Inherits="User_TransactionChangePassword" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
    <style>
        .l2 {
            color: #ff5050 !important;
            font-size: medium;
            font-weight: 700;
        }
    </style>

    <div class="alert alert-arrow-left alert-icon-left alert-light-success alert-dismissible fade show mb-4 mt-4" id="success" runat="server" visible="false" role="alert">
        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close">
            <svg xmlns="http://www.w3.org/2000/svg" data-bs-dismiss="alert" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-x close">
                <line x1="18" y1="6" x2="6" y2="18"></line><line x1="6" y1="6" x2="18" y2="18"></line></svg></button>
        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-check-circle">
            <path d="M22 11.08V12a10 10 0 1 1-5.93-9.14"></path><polyline points="22 4 12 14.01 9 11.01"></polyline></svg>
        <strong>Success !!! </strong>
        <asp:Label ID="lbsuccess" CssClass="text-white-50" runat="server" Text="There is Something Wrong !!"></asp:Label>
    </div>

    <div class="alert alert-arrow-left alert-icon-left alert-light-info alert-dismissible fade show mb-4 mt-4" id="info" runat="server" visible="false" role="alert">
        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close">
            <svg xmlns="http://www.w3.org/2000/svg" data-bs-dismiss="alert" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-x close">
                <line x1="18" y1="6" x2="6" y2="18"></line><line x1="6" y1="6" x2="18" y2="18"></line></svg></button>
        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-bell">
            <path d="M18 8A6 6 0 0 0 6 8c0 7-3 9-3 9h18s-3-2-3-9"></path><path d="M13.73 21a2 2 0 0 1-3.46 0"></path></svg>
        <strong>Info !!! </strong>
        <asp:Label ID="lbinfo" CssClass="text-white-50" runat="server" Text="There is Something Wrong !!"></asp:Label>
    </div>

    <div class="alert alert-arrow-left alert-icon-left alert-light-danger alert-dismissible fade show mb-4 mt-4" id="danger" runat="server" visible="false" role="alert">
        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close">
            <svg xmlns="http://www.w3.org/2000/svg" data-bs-dismiss="alert" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-x close">
                <line x1="18" y1="6" x2="6" y2="18"></line><line x1="6" y1="6" x2="18" y2="18"></line></svg></button>
        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-alert-triangle">
            <path d="M10.29 3.86L1.82 18a2 2 0 0 0 1.71 3h16.94a2 2 0 0 0 1.71-3L13.71 3.86a2 2 0 0 0-3.42 0z"></path><line x1="12" y1="9" x2="12" y2="13"></line><line x1="12" y1="17" x2="12.01" y2="17"></line></svg>
        <strong>Danger !!! </strong>
        <asp:Label ID="lbdanger" CssClass="text-white-50" runat="server" Text="There is Something Wrong !!"></asp:Label>
    </div>

    <div class="alert alert-arrow-left alert-icon-left alert-light-warning alert-dismissible fade show mb-4 mt-4" id="warning" runat="server" visible="false" role="alert">
        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close">
            <svg xmlns="http://www.w3.org/2000/svg" data-bs-dismiss="alert" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-x close">
                <line x1="18" y1="6" x2="6" y2="18"></line><line x1="6" y1="6" x2="18" y2="18"></line></svg></button>
        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-alert-circle">
            <circle cx="12" cy="12" r="10"></circle><line x1="12" y1="8" x2="12" y2="12"></line><line x1="12" y1="16" x2="12.01" y2="16"></line></svg>
        <strong>Warning !!! </strong>
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
                    
                
                          <label class="control-label text-center col-lg-4">Current PIN </label>
                          <div class="col-lg-6">
                         <asp:TextBox ID="txtoldpass" required="" runat="server" CssClass="form-control"></asp:TextBox>
                         </div>

                          </div>
                                    <br />
                            <div class=" form-group row">
                    
                
                          <label class="control-label text-center col-lg-4">New PIN </label>
                          <div class="col-lg-6">
                         <asp:TextBox ID="txtnew" TextMode="Password"  required="" runat="server" CssClass="form-control"></asp:TextBox>
                         </div>
                          </div>  <br />
                      <div class="form-group row">
                          <label class="control-label text-center col-lg-4">Confirm PIN </label>
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
              <div class="form-group row">
                    <center>
    <label class=" text-success col-lg-12">Notes.</label>
    <br />
    <label class=" text-danger col-lg-12"> If you forget your current PIN, please contact the admin.</label>
                          <center>
</div>
              </div>
              </div>
          
       
 

</asp:Content>

