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
                txtUsdtBep20.Text = dt.Rows[0]["USDTWallet"].ToString() == "0" ? "" : dt.Rows[0]["USDTWallet"].ToString();
                txtUsdtTRC20.Text = dt.Rows[0]["BTCWallet"].ToString() == "0" ? "" : dt.Rows[0]["BTCWallet"].ToString();
               // txtBNB.Text = dt.Rows[0]["ETHWallet"].ToString() == "0" ? "" : dt.Rows[0]["ETHWallet"].ToString();
                //txtBUSD.Text = dt.Rows[0]["TRXWallet"].ToString() == "0" ? "" : dt.Rows[0]["TRXWallet"].ToString();
                //txtELN.Text = dt.Rows[0]["USDTWallet"].ToString() == "0" ? "" : dt.Rows[0]["USDTWallet"].ToString();
                //// txtDOge.Text = dt.Rows[0]["DogeWallet"].ToString() == "0" ? "" : dt.Rows[0]["DogeWallet"].ToString();


            }



        }
        catch (Exception ex) { }
    }
    protected void bntsubmit_Click(object sender, EventArgs e)
    {
        try
        {
            int a = objamd.CryptoWallet(txtsearch.Text, txtUsdtTRC20.Text, "", "", txtUsdtBep20.Text, "", "", "A");
            if (a > 0)
            {
               
                lbinfo.Text = "Crypto Wallet updated Successfully";
                info.Visible = true;
             
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
  
   
    



    protected void btnsearch_Click(object sender, EventArgs e)
    {
        loadlist(txtsearch.Text);

    }
}