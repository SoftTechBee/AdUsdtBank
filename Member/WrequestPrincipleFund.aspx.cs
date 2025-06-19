using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using TripleITConnection;
using TripleITTransaction;
public partial class User_withdrrawPlan1 : System.Web.UI.Page
{
    clsfunction objfun = new clsfunction();
    clsAMD objamd = new clsAMD();
    clsConnection objcon = new clsConnection();
    clsTimeZone objtime = new clsTimeZone();
    clsList objlist = new clsList();
    clsDashboard objDash = new clsDashboard();
    clsSMS objsms = new clsSMS();
    CoinPayments objcoin = new CoinPayments();
    clsmail objmail = new clsmail();
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
                lbbalance.Text = objDash.TotalWallectBlance(SessionData.Get<string>("Newuser"));


                int totaldays = Convert.ToInt32(objDash.IdActiveDays(SessionData.Get<string>("Newuser")));
                if (totaldays > 7)
                {
                    danger.Visible = false;
                    hndmember.Value = SessionData.Get<string>("Newuser");
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "Button(); ", true);

                }
                else
                {
                    info.Visible = false;
                    lbdanger.Text = "Your are Not Eliglible User! Please Check Your Id Active and Id Days 7th Days";
                    danger.Visible = true;
                    txtAmt.ReadOnly = true;
                }

            }



        }
    }

   
   
 
   
   
    [WebMethod]
    public static string Withdraw(string Rid,  string Username, string Amount, string Type, string Wallet, string AdminCharge)
    {
   
        clsConnection objcon = new clsConnection();
        string result = "";
        JavaScriptSerializer jsSerializer = new JavaScriptSerializer();

        clsAMD objamd = new clsAMD();
        //if (Convert.ToDecimal(Balance) >= Convert.ToDecimal(Amount) && Convert.ToDecimal(Amount) >= 10)
        //{


        int a = objamd.WithdrawRequest(Convert.ToInt32( Rid), Username, Convert.ToDecimal( Amount), AdminCharge, Type, Wallet.Trim(), "F");

        if (a > 0)
            {
                result = "Success";

            }
            else if (a == -1)
            {
                result = "Already";

            }
            else
            {
                result = "Invaid Transaction";

            }
        //}
        //else
        //{
        //    result = "Low";
        //}
        return jsSerializer.Serialize(result);



    }
    public void checkBankStatus()
    {
        string sql = "select accno from bankdetail where username='" + SessionData.Get<string>("Newuser") + "' ";
        DataTable dt = objcon.ReturnDataTableSql(sql);
        if (dt.Rows.Count > 0)
        {
            info.Visible = false;
            string accno = dt.Rows[0]["accno"].ToString();
            if (accno != "")
            {

                divwallet.Visible = false;
               // divbankclick.Visible = false;
                divwalletclick.Visible = false;


            }
            else
            {

               
               // divbankclick.Visible = true;
                divwalletclick.Visible = false;
                info.Visible = false;
                lbdanger.Text = "With out Bank Details Updated you can not withdraw amount";
                danger.Visible = true;
               

            }

        }
        else
        {
            
          //  divbankclick.Visible = true;
            divwalletclick.Visible = false;
            info.Visible = false;
            lbdanger.Text = "With out Bank Deatils Updeted  .you can not withdraw amount";
            danger.Visible = true;
           


        }

    }
    protected void paymenttype_TextChanged(object sender, EventArgs e)
    {

        try
        {
            hndType.Value = paymenttype.SelectedValue;
            string sql = "select BTCWallet,TRXWallet,USDTWallet from  [dbo].[TblCryptoWallet] where UserName='" + SessionData.Get<string>("Newuser") + "'";
            DataTable dt = objcon.ReturnDataTableSql(sql);
            if (dt.Rows.Count > 0)
            {
                if (paymenttype.SelectedValue == "0")
                {
                    lbWallet.Text = "";
                    divwallet.Visible = false;
                   // divbankclick.Visible = false;
                    divwalletclick.Visible = false;
                }

               
                else if (paymenttype.SelectedValue == "USDT-BEP20")
                {

                    lbWallet.Text = dt.Rows[0]["USDTWallet"].ToString() == "0" ? "" : dt.Rows[0]["USDTWallet"].ToString();
                    divwallet.Visible = true;
                  //  divbankclick.Visible = false;
                    divwalletclick.Visible = true;
                }
                

                ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "Button(); ", true);

            }


        }
        catch (Exception ex)
        { }

    }

 














    

    protected void txtAmt_TextChanged(object sender, EventArgs e)
    {
        decimal Fund  = Convert.ToDecimal( objDash.TotalWallectBlance(SessionData.Get<string>("Newuser")));
        decimal reqAmt = Convert.ToDecimal(txtAmt.Text);

        if (reqAmt >0 && Fund>= reqAmt)
        {
            hndrid.Value = txtAmt.Text;
            hndamount.Value = txtAmt.Text;

            decimal Deduction = 10;





            decimal AdminCharge = (reqAmt * Deduction / 100);

            decimal amount = reqAmt - AdminCharge;
            txtTotal.Text = amount.ToString();
            txtadmincharge.Text = AdminCharge.ToString();
            per.InnerText = Deduction.ToString();
            warning.Visible = false;
            danger.Visible = false;

            info.Visible = false;
            hndAdminCharge.Value = per.InnerText;
            ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "Button(); ", true);

        }
        else
        {
            info.Visible = false;
            lbdanger.Text = "Enter a valid amount!";
            danger.Visible = true;
            txtAmt.Focus();
            txtTotal.Text = 0.ToString();
            txtadmincharge.Text = 0.ToString();
            per.InnerText = 0.ToString();

        }
    }
}