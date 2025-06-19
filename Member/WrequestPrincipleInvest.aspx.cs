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



                loaddata();


            }



        }
    }



    public string remark(object IsType)
    {
        string Status = "";
        if (IsType.ToString() == "False")
        {
            Status = "Continue";
        }

        else
        {
            Status = "Withdraw";
        }
        return Status;

    }
    private void loaddata()
    {
        try
        {
            
            DataTable dt = objcon.ReturnDataTableSql("SELECT datediff(day,dor,getdate()) as Days,dor ,amount,packtype,rid,islive,nodays FROM tblretopup where username='" + SessionData.Get<string>("Newuser") + "' ");
            if (dt.Rows.Count > 0)
            {
                Repeater1.DataSource = dt;
                Repeater1.DataBind();
                



            }
            DataTable dt1 = objcon.ReturnDataTableSql("SELECT datediff(day,dor,getdate()) as Days,dor ,amount,packtype,rid,islive,nodays FROM tblretopup where username='" + SessionData.Get<string>("Newuser") + "' and islive='0'");
            if (dt1.Rows.Count > 0)
            {
               
                txtAmt.DataSource = dt1;
                txtAmt.DataBind();
                txtAmt.Items.Insert(0, "Select Amount");



            }
        }
        catch (Exception ex)
        {


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


        int a = objamd.WithdrawRequest(Convert.ToInt32( Rid), Username, Convert.ToDecimal( Amount), AdminCharge, Type, Wallet.Trim(), "I");

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
                    divwalletclick.Visible = false;
                }

                else if (paymenttype.SelectedValue == "INR")
                {

                   // checkBankStatus();

                }
                else if (paymenttype.SelectedValue == "USDT-BEP20")
                {

                    lbWallet.Text = dt.Rows[0]["USDTWallet"].ToString() == "0" ? "" : dt.Rows[0]["USDTWallet"].ToString();
                    divwallet.Visible = true;
                    divwalletclick.Visible = true;
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "Button(); ", true);

                }
                else if (paymenttype.SelectedValue == "TRX")
                {
                    lbWallet.Text = dt.Rows[0]["TRXWallet"].ToString() == "0" ? "" : dt.Rows[0]["TRXWallet"].ToString();
                    divwallet.Visible = true;
                    divwalletclick.Visible = true;
                }



            }


        }
        catch (Exception ex)
        { }

    }
















    //protected void txtAmt_SelectedIndexChanged(object sender, EventArgs e)
    //{
    //    if (txtAmt.SelectedValue != "Select Amount")
    //    {
    //        int Multiple = 7, Total=0;
    //        int totaldays = Convert.ToInt32(objDash.IdActiveDays(SessionData.Get<string>("Newuser"), txtAmt.SelectedValue));
    //        Total = totaldays % Multiple;
    //        if (Total == 0)
    //        {
    //            danger.Visible = false;
    //            hndmember.Value = SessionData.Get<string>("Newuser");
    //            ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "Button(); ", true);




    //            decimal reqAmt = Convert.ToDecimal(txtAmt.SelectedItem.Text);
    //            hndrid.Value = txtAmt.SelectedValue;
    //            hndamount.Value = txtAmt.SelectedItem.Text;

    //            decimal Deduction = 20;

    //            if (totaldays >= 20 )
    //            {
    //                Deduction = 20;
    //            }
    //           else  if (totaldays >= 14) 
    //            {
    //                Deduction = 20;
    //            }





    //            decimal AdminCharge = (reqAmt * Deduction / 100);

    //            decimal amount = reqAmt - AdminCharge;
    //            txtTotal.Text = amount.ToString();
    //            txtadmincharge.Text = AdminCharge.ToString();
    //            per.InnerText = Deduction.ToString();
    //            warning.Visible = false;
    //            danger.Visible = false;

    //            info.Visible = false;
    //            hndAdminCharge.Value = per.InnerText;


    //        }
    //        else
    //        {
    //            info.Visible = false;
    //            lbdanger.Text = "Your are Not Eliglible User! Please Check Your Id Active and 7th Days multiple";
    //            danger.Visible = true;
    //            // txtAmt.ReadOnly = true;
    //        }

    //    }
    //    else
    //    {
    //        txtTotal.Text = 0.ToString();
    //        txtadmincharge.Text = 0.ToString();
    //        per.InnerText = 0.ToString();
    //    }

    //}

    protected void txtAmt_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (txtAmt.SelectedValue != "Select Amount")
        {
           // int Limitdays = Convert.ToInt32(objDash.IdLimitdays(SessionData.Get<string>("Newuser"), txtAmt.SelectedValue));
            //int totaldays = Convert.ToInt32(objDash.IdActiveDays(SessionData.Get<string>("Newuser"), txtAmt.SelectedValue));

            danger.Visible = false;
            hndmember.Value = SessionData.Get<string>("Newuser");
            ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "Button(); ", true);

            decimal reqAmt = Convert.ToDecimal(txtAmt.SelectedItem.Text);
            hndrid.Value = txtAmt.SelectedValue;
            hndamount.Value = txtAmt.SelectedItem.Text;

            decimal Deduction = 25;

            //if (totaldays <= Limitdays)
            //{
            //    Deduction = 20; 
            //}
            

            decimal AdminCharge = (reqAmt * Deduction / 100);

          
            decimal amount = reqAmt - AdminCharge;
            txtTotal.Text = amount.ToString();
            txtadmincharge.Text = AdminCharge.ToString();
            per.InnerText = Deduction.ToString();
            warning.Visible = false;
            danger.Visible = false;
            info.Visible = false;
            hndAdminCharge.Value = per.InnerText;
        }
        else
        {
            txtTotal.Text = 0.ToString();
            txtadmincharge.Text = 0.ToString();
            per.InnerText = 0.ToString();
        }
    }


}