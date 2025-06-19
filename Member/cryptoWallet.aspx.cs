using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.IO;
using System.Net;
using System.Data.SqlClient;
using TripleITConnection;
using TripleITTransaction;
public partial class User_cryptoWallet1 : System.Web.UI.Page
{
    clsConnection objcon = new clsConnection();
    clsTimeZone objtime = new clsTimeZone();
    clsAMD objamd = new clsAMD();
    clsSMS objsms = new clsSMS();
    clsfunction objfun = new clsfunction();
    static string Password = "", id = "", dateofjoining = "", Profilepic="";
   
    protected void Page_Load(object sender, EventArgs e)
    {
        if (SessionData.Get<string>("Newuser") == null && SessionData.Get<string>("Newuser") == "")
        {
            Response.Redirect("Logout.aspx");
        }
        else
        {
            if (!IsPostBack)
            {
                info.Visible = false;
             
                String UserName = SessionData.Get<string>("Newuser");
                loadlist(UserName);

            }
        }
    }

    private void loadlist(string UserName)
    {
        try
        {

            string sql = "select BTCWallet, ETHWallet,TRXWallet,LTCWallet,USDTWallet,DogeWallet from  [dbo].[TblCryptoWallet] where UserName='" + UserName + "'";
            DataTable dt = objcon.ReturnDataTableSql(sql);
            if (dt.Rows.Count > 0)
            {
                //txtBTC.Text = dt.Rows[0]["BTCWallet"].ToString() == "0" ? "" : dt.Rows[0]["BTCWallet"].ToString();
              //  txtETH.Text = dt.Rows[0]["ETHWallet"].ToString() == "0" ? "" : dt.Rows[0]["ETHWallet"].ToString();
              //  txtTRX.Text = dt.Rows[0]["TRXWallet"].ToString()=="0"?"" : dt.Rows[0]["TRXWallet"].ToString();
                //  txtHHc.Text = dt.Rows[0]["ETHWallet"].ToString() == "0" ? "" : dt.Rows[0]["USDTWallet"].ToString();
                txtUSDT.Text = dt.Rows[0]["USDTWallet"].ToString() == "0" ? "" : dt.Rows[0]["USDTWallet"].ToString();
               // txtHHc.Text = dt.Rows[0]["DogeWallet"].ToString() == "0" ? "" : dt.Rows[0]["DogeWallet"].ToString();


            }



        }
        catch (Exception ex) { }
    }
    protected void bntsubmit_Click(object sender, EventArgs e)
    {
        try
        {
            int a = objamd.CryptoWallet(SessionData.Get<string>("Newuser"), "", "", "", txtUSDT.Text, "", "", "N");
            if (a > 0)
            {
               
                lbinfo.Text = "Crypto Wallet updated Successfully";
                info.Visible = true;
                Clear();
                
            }
            else if (a == -1)
            {

                lbinfo.Text = "Crypto Wallet already Updated successfully";
                info.Visible = true;
             
            }
            else
            {

                lbinfo.Text = "Crypto Wallet have not Updated successfully";
                info.Visible = true;
            }
            loadlist(SessionData.Get<string>("Newuser"));

        }
        catch (Exception ex)
        { }
    }
    public void Clear()
    {
        Password = "";
        //txtaadhar.Text = "";
       // txtAddress.Text = "";
       //// txtDOB.Text = "";
       // //txtEmail.Text = "";
       // txtFName.Text = "";
       // txtMobile.Text = "";
       // txtName.Text = "";
       // txtpan.Text = "";
       // txtpincode.Text = "";
    
        //lbUpline.Text = "";
        //lbmsg.Text = "";

    }
   
    protected void btncencel_Click(object sender, EventArgs e)
    {
        Clear();
        
    }
    
    
}