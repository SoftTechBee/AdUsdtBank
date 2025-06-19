using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using TripleITConnection;
using TripleITTransaction;
using Newtonsoft.Json;
using System.Drawing;
public partial class User_withdrrawPlan1 : System.Web.UI.Page
{
    clsfunction objfun = new clsfunction();
    clsAMD objamd = new clsAMD();
    clsConnection objcon = new clsConnection();
    clsTimeZone objtime = new clsTimeZone();
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
            danger.Visible = false;
           // paymenttype_TextChanged(sender, e);
          
            lbIncome.Text = objDash.TotalBlance(SessionData.Get<string>("Newuser"));
            lbWallet.Text = objDash.ReturnWallet(SessionData.Get<string>("Newuser"));
            //int time = Convert.ToInt32(objtime.returnCurrentSurverTimeHH());


            //string dayname = objtime.returnCurrentDay();
            //if (dayname == "Monday" && time >= 10 && time <= 17)
            //{





            int flag = checkrequest();
                if (flag == 0)
                {
                    warning.Visible = false;
                    sccess.Visible = false;
                    info.Visible = false;
                    lbdanger.Text = "Your withdrawal has been disabled. Please Contact Admin.";
                    danger.Visible = true;
                    txtAmt.ReadOnly = true;
                    btnaction.Visible = false;


                }
                else
                {



                }

            //}

            //else
            //{
            //    btnaction.Visible = false;
            //    warning.Visible = false;
            //    sccess.Visible = false;
            //    info.Visible = false;
            //    lbdanger.Text = "You can applied for withdraw only 10th, 20th & 30th Date Of Month";

            //    danger.Visible = true;
            //    txtAmt.ReadOnly = true;

            //}
        }
    }
    public void loadclean()
    {
        txtAmt.Text = "";
        // txtremark.Text = "";
        // lbIncome.Text = "";
        txtTotal.Text = "";
        //txtfinal.Text = "";
        // txttds.Text = "";
         txtadmincharge.Text = "";

    }
    public int checkrequest()
    {
        int status = 0;
        try
        {
            string sql = "select username from register where  [loginstatus]= '1' and username ='" + SessionData.Get<string>("Newuser") + "'";
            DataTable dt = objcon.ReturnDataTableSql(sql);
            if (dt.Rows.Count > 0)
            {
                status = 0;
            }
            else
            {
                status = 1;
            }
        }
        catch (Exception ex)
        { }
        return status;
    }

  

    protected void butsubmit_Click(object sender, EventArgs e)
    {
        try
        {
            hndwallet.Value = objDash.ReturnWallet(SessionData.Get<string>("Newuser"));

            decimal widamount = 0 ;
            string date = objtime.returnStringServerMachTime();

            string id = SessionData.Get<string>("Newuser");
            decimal finalamount = Convert.ToDecimal(lbIncome.Text.Trim());
            //string TransPass = objDash.ReturnTransPass(SessionData.Get<string>("Newuser"));
            widamount = Convert.ToDecimal(txtAmt.Text.Trim());
            
                if (paymenttype.SelectedValue != "0")
                {
                    if (lbWallet.Text != "") //&& txtotp.Text != "")
                    {
                        //if (TransPass == txttransPassword.Text)
                        //{
                        if (finalamount >= widamount && widamount >= 10 )
                        {
                            string address = hndwallet.Value;

                            int a = objamd.WithdrawRequest(0, SessionData.Get<string>("Newuser"), widamount, lbWallet.Text.Trim(), "",  paymenttype.SelectedValue,  "P");
                            if (a > 0)
                            {
                            lbIncome.Text = objDash.TotalBlance(SessionData.Get<string>("Newuser"));
                            //string email = objDash.ReturnEmail(SessionData.Get<string>("Newuser"));
                            // objmail.WithdrawFund(SessionData.Get<string>("Newuser"), widamount.ToString(), paymenttype.SelectedValue, address, email);

                                warning.Visible = false;
                                danger.Visible = false;
                                sccess.Visible = false;
                                info.Visible = false;
                                sccess.Visible = true;
                                lbsuccess.Text = "Congratulations!!! Your Withdrawal Request sent Successfully.!!";
                                loadclean();
                                btnaction.Visible = false;

                            }
                            else if (a == -1)
                            {
                                loadclean();
                                warning.Visible = false;
                                danger.Visible = false;
                                sccess.Visible = false;
                                info.Visible = false;
                                info.Visible = true;
                                lbinfo.Text = "Your previous Withdrawal Under Pending ";
                                //lbinfo.Text = "Your Id NotActive Please First Active Then Withdraw or Your previous Withdrawal Under Pending ";
                            }

                            else
                            {
                                loadclean();
                                warning.Visible = false;
                                danger.Visible = false;
                                sccess.Visible = false;
                                info.Visible = false;
                                info.Visible = true;
                                lbinfo.Text = "Something went to wrong! Try Again?.";

                            }

                        }
                        else
                        {
                            loadclean();
                            warning.Visible = false;
                            danger.Visible = false;
                            sccess.Visible = false;
                            info.Visible = false;
                            warning.Visible = true;
                            lbwarning.Text = "Insufficient USDT (or) Minimum Withdrawal 10$ and one day one Withdrawal";

                        }
                        //}

                        //else
                        //{
                        //    lbdanger.Text = "Your Transaction Password is wrong ...... Try again";
                        //    txttransPassword.Text = "";
                        //    txttransPassword.Focus();
                        //    danger.Visible = true;
                        //}
                    }
                    else
                    {
                        lbdanger.Text = "Invaild Wallet Address !!! Try again";
                        //txttransPassword.Text = "";
                        //txttransPassword.Focus();
                        danger.Visible = true;
                    }
                }
                else
                {
                    lbdanger.Text = "Select Payment Mode Like - USDT ...... Try again";
                    //  paymenttype.Focus();
                    //txttransPassword.Text = "";
                    //txttransPassword.Focus();

                    danger.Visible = true;

                }
           

        }
        catch (Exception ex)
        {
            warning.Visible = false;
            danger.Visible = false;
            sccess.Visible = false;
            info.Visible = false;
            lbwarning.Text = "Enter valid USDT";
            warning.Visible = true;
            txtAmt.Text = "";
            txtAmt.Focus();
            //  Response.Redirect("error.aspx?error=" + ex);


        }

    }
    protected void txtAmt_TextChanged(object sender, EventArgs e)
    {
        try
        {
            //if (drpIncomeType.SelectedValue != "0")
            {
                decimal finalamount = Convert.ToDecimal(lbIncome.Text.Trim());
                decimal reqAmt = Convert.ToDecimal(txtAmt.Text);
                if (finalamount >= reqAmt)
                {
                    if (reqAmt >= 10 )
                    {
                        if (reqAmt % 10 == 0)
                        {
                            decimal AdminCharge = Convert.ToDecimal(((double)reqAmt) * 10 / 100);
                        //decimal tds = (reqAmt * 5 / 100);
                        decimal amount = reqAmt - AdminCharge;
                        txtTotal.Text = amount.ToString();
                        txtadmincharge.Text = AdminCharge.ToString();
                        // lbfinalamount.Text = (amount / 2).ToString();
                        //     lbBario.Text = (amount / 2).ToString();
                        // txtTDS.Text = tds.ToString();
                        warning.Visible = false;
                        danger.Visible = false;
                        sccess.Visible = false;
                        info.Visible = false;
                        sccess.Visible = false;
                        Label1.Visible = false;
                        }
                        else
                        {
                            warning.Visible = false;
                            danger.Visible = false;
                            sccess.Visible = false;
                            info.Visible = false;
                            lbwarning.Text = "USDT should be in multiple of 10$ or Minimum $10";
                            warning.Visible = true;
                            txtAmt.Text = "";
                            txtAmt.Focus();

                        }
                    }
                    else
                    {
                        warning.Visible = false;
                        danger.Visible = false;
                        sccess.Visible = false;
                        info.Visible = false;
                        lbwarning.Text = "USDT should be Minimum $10";
                        warning.Visible = true;
                        txtAmt.Text = "";
                        txtAmt.Focus();

                    }
                }
                else
                {
                    warning.Visible = false;
                    danger.Visible = false;
                    sccess.Visible = false;
                    info.Visible = false;
                    Label1.Visible = true;
                    txtAmt.Text = "";
                    txtAmt.Focus();
                    Label1.Text = "Don't have enough Fund, “Please Enter a valid USDT ”";
                    warning.Visible = false;
                    btnaction.Focus();
                }

            }
            //else
            //{
            //    Label1.Text = "Select Income Type !!!";
            //    drpIncomeType.Focus();
            //    //txttransPassword.Text = "";
            //    //txttransPassword.Focus();

            //    Label1.Visible = true;

            //}
        }
        catch (Exception ex)
        { }
    }
    protected void paymenttype_TextChanged(object sender, EventArgs e)
    {

        //try
        //{
        //    string sql = "select BTCWallet, ETHWallet,TRXWallet,LTCWallet,USDTWallet,DogeWallet from  [dbo].[TblCryptoWallet] where UserName='" + SessionData.Get<string>("Newuser") + "'";
        //    DataTable dt = objcon.ReturnDataTableSql(sql);
        //    if (dt.Rows.Count > 0)
        //    {
        //        if (paymenttype.SelectedValue == "BTC")
        //        {
        //             lbWallet.Text = dt.Rows[0]["BTCWallet"].ToString() == "0" ? "" : dt.Rows[0]["BTCWallet"].ToString();
                   
        //           // lbfinalamount.Text = txtTotal.Text;
        //           // lbpaid.InnerText = "Final Paid (USDT)";

        //        }

        //        else if (paymenttype.SelectedValue == "USDT.BEP20")
        //        {
        //             lbWallet.Text = dt.Rows[0]["USDTWallet"].ToString() == "0" ? "" : dt.Rows[0]["USDTWallet"].ToString();
        //            //lbfinalamount.Text = (Math.Round(Convert.ToDecimal(txtTotal.Text) / Convert.ToDecimal(lbcoinrate.Text), 2)).ToString();
        //            //lbpaid.InnerText = "Final Paid (BRIO) Amount";
        //        }
        //        else
        //        {
        //            btnaction.Visible = false;
        //            danger.Visible = false;
        //            sccess.Visible = false;
        //            info.Visible = false;
        //            lbwarning.Text = "Please Update the Wallet Address";
        //            warning.Visible = true;
        //            txtAmt.Text = "";
        //            txtAmt.Focus();
        //        }
        //        walletlink.Visible = false;

        //    }

        //    if (lbWallet.Text == "")
        //    {
        //        btnaction.Visible = false;
        //        danger.Visible = false;
        //        sccess.Visible = false;
        //        info.Visible = false;
        //        lbwarning.Text = "Please Update the Wallet Address";
        //        warning.Visible = true;
        //        walletlink.Visible = true;

        //    }
        //}
        //catch (Exception ex)
        //{ }

    }
  

  

 

}