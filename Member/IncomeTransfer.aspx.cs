using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using TripleITConnection;
using TripleITTransaction;
using System.Reflection.Emit;

public partial class User_FundTransfer : System.Web.UI.Page
{
    clsfunction objfun = new clsfunction();
    clsAMD objamd = new clsAMD();
    clsConnection objcon = new clsConnection();
    clsTimeZone objtime = new clsTimeZone();
    clsDashboard objDash = new clsDashboard();
    clsSMS objsms = new clsSMS();

    public static string OTP = "", RequestUser = "";
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
                //txtbalance.Text = objDash.TotalWallectBlance(SessionData.Get<string>("Newuser"));

                lbActiveMember.Text = SessionData.Get<string>("Newuser");

            }
        }

    }
    public int checkAccountStatus()
    {
        int status = 0;
        try
        {
            string sql = "select mobile from register where username='" + SessionData.Get<string>("Newuser") + "' ";
            DataTable dt = objcon.ReturnDataTableSql(sql);
            if (dt.Rows.Count > 0)
            {
                info.Visible = false;
                string mobile = dt.Rows[0]["mobile"].ToString();
                //genrateOTP();
                //string SMS = "For Member Active OTP is:" + OTP + " .Do not share it";
                //  objsms.sendsms(mobile, SMS);
            }
            else
            {
                info.Visible = false;
                lbdanger.Text = "Your account has not activate ,You can not fund transfer this time.Please active your account first";
                danger.Visible = true;

            }


        }
        catch (Exception ex)
        { }
        return status;

    }
    //private void genrateOTP()
    //{
    //    try
    //    {


    //        var chars = "5678943210";
    //        var stringChars = new char[4];
    //        var random = new Random();

    //        for (int ik = 0; ik < stringChars.Length; ik++)
    //        {
    //            stringChars[ik] = chars[random.Next(chars.Length)];
    //        }

    //        var finalString = new String(stringChars);
    //        OTP = Convert.ToString(finalString);

    //    }
    //    catch (Exception ex) { }
    //}
    protected void butsubmit_Click(object sender, EventArgs e)
    {
        try
        {
            //int Flag = objfun.GetTransPaswwordCheck(SessionData.Get<string>("Newuser"), txttransPassword.Text);
            //if (Flag == 1)
            //{
                decimal widamount = 0;
            string date = objtime.returnStringServerMachTime();
            string id = SessionData.Get<string>("Newuser");
            decimal finalamount = Convert.ToDecimal(lbIncome.Text.Trim());
            widamount = Convert.ToDecimal(txtAMount.Text);// drpPackage.SelectedValue=="0"? Convert.ToDecimal(txtAdvanceAmount.Text.Trim()): Convert.ToDecimal(lbTotalAmount.Text.Trim());
            if (finalamount >= widamount && widamount > 0)
            {
                int a = objamd.FundTransfer1(lbActiveMember.Text, txtTransid.Text, Convert.ToDecimal(txtAMount.Text), drpIncomeType.SelectedValue, txttransPassword.Text);
                if (a > 0)
                {


                    lbIncome.Text = objDash.TotalWallectBlance(SessionData.Get<string>("Newuser"));
                    warning.Visible = false;
                    danger.Visible = false;
                    sccess.Visible = false;
                    info.Visible = false;
                    sccess.Visible = true;
                    lbsuccess.Text = "Income transfer  successfully";

                }
                else if (a == -1)
                {

                    warning.Visible = false;
                    danger.Visible = false;
                    sccess.Visible = false;
                    info.Visible = false;
                    info.Visible = true;
                    lbinfo.Text = "Transaction Password Wrong...!";
                }



            }
            else
            {


                warning.Visible = false;
                danger.Visible = false;
                sccess.Visible = false;
                info.Visible = false;
                warning.Visible = true;
                lbwarning.Text = "Balance is less then to require pin ";
            }
        //}
        //    else
        //    {
        //    lbdanger.Text = "Invaild Password ...... Try again";
        //    txttransPassword.Text = "";
        //    txttransPassword.Focus();

        //    danger.Visible = true;

        //}
    }
        catch (Exception ex)
        {
            warning.Visible = false;
            danger.Visible = false;
            sccess.Visible = false;
            info.Visible = false;
            lbwarning.Text = "Enter valid pin";
            warning.Visible = true;

            //  Response.Redirect("error.aspx?error=" + ex);


        }
        txtAMount.Text = "";
        txtTransid.Text = "";
        txtfinal.Text = "";
        txtadmincharge.Text = "";
        lbIncome.Text = "";
        drpIncomeType.Text = "0";
    }
    protected void btnResend_Click(object sender, EventArgs e)
    {
        checkAccountStatus();
    }

    protected void txtOTP_TextChanged(object sender, EventArgs e)
    {
        //if (OTP == txtOTP.Text)
        //{ info.Visible = false; }
        //else
        //{
        //    info.Visible = false;
        //    txtOTP.Text = "";
        //    txtOTP.Focus();
        //    lbdanger.Text = "Invalid OTP";
        //    danger.Visible = true;
        //}
    }

    protected void TextBox1_TextChanged(object sender, EventArgs e)
    {
        //int Flag = objfun.GetTransPaswwordCheck(SessionData.Get<string>("Newuser"), txttransPassword.Text);
        //if (Flag > 0)
        //{
        //    danger.Visible = false;

        //}
        //else if (Flag == 0)
        //{
        //    lbdanger.Text = "Invaild Password ...... Try again";
        //    txttransPassword.Text = "";
        //    txttransPassword.Focus();

        //    danger.Visible = true;

        //}
    }

    protected void txtTransid_TextChanged(object sender, EventArgs e)
    {
        int status = 0;
        try
        {
            string sql = "select name from register where username='" + txtTransid.Text + "' ";
            DataTable dt = objcon.ReturnDataTableSql(sql);
            if (dt.Rows.Count > 0)
            {
                lbTransname.Text = dt.Rows[0]["name"].ToString();
            }
            else
            {
                lbinfo.Text = "Invaid Member ID";
                txtTransid.Text = "";
                lbTransname.Text = "";
                txtTransid.Focus();

            }
        }
        catch (Exception ex)
        { }
    }



    protected void txtAMount_TextChanged(object sender, EventArgs e)
    {
        try
        {
            if (txtAMount.Text != "")
            {
                decimal reqAmt = Convert.ToDecimal(txtAMount.Text.Trim());
                decimal finalamount = Convert.ToDecimal(lbIncome.Text.Trim());


                if (finalamount >= reqAmt)
                {
                    decimal AdminCharge = (reqAmt * 10 / 100);
                    //decimal tds = (reqAmt * 5 / 100);
                    decimal amount = reqAmt - AdminCharge;
                    txtfinal.Text = Math.Round(amount, 2).ToString();//amount.ToString();
                    txtadmincharge.Text = Math.Round(AdminCharge, 2).ToString(); ;// AdminCharge.ToString();
                    // txtTDS.Text = tds.ToString();
                    warning.Visible = false;
                    danger.Visible = false;
                    sccess.Visible = false;
                    info.Visible = false;
                    sccess.Visible = false;
                }
                else
                {
                   
                    danger.Visible = false;
                    sccess.Visible = false;
                    info.Visible = false;
                    lbwarning.Text = "Insufficient amount (or) amount  ";
                    warning.Visible = true;
                    txtadmincharge.Text = "";
                    txtfinal.Text = "";
                    txtAMount.Focus();

                }

            }
        }
        catch (Exception ex)
        { }

    }
    protected void drpIncomeType_TextChanged(object sender, EventArgs e)
    {
       //Label1.Visible = false;
        string username = SessionData.Get<string>("Newuser");
        if (drpIncomeType.SelectedValue == "DIRECT")
        {
            //int time = Convert.ToInt32(objtime.returnCurrentSurverTimeHH());


            //string dayname = objtime.returnCurrentDay();
            //if (dayname == "Monday" && time >= 10 && time <= 17)
            //{
            lbIncome.Text = objDash.IncomeTypeBalance(username, "DIRECT");
            btnaction.Visible = true;
            //}

            //else
            //{
            //    btnaction.Visible = false;
            //    warning.Visible = false;
            //    sccess.Visible = false;
            //    info.Visible = false;
            //    lbdanger.Text = "You can applied every MONDAY WITHDRAWAL 10 AM TO 5 PM";

            //    danger.Visible = true;
            //    txtAmt.ReadOnly = true;

            //}
        }
        else if (drpIncomeType.SelectedValue == "OTHER")
        {
            //string Date = objtime.returnStringServerMachTime1();
            //string WithDate = objDash.WithdrawDay(username);

            //if (Date == WithDate)
            //{
            lbIncome.Text = objDash.IncomeTypeBalance(username, "OTHER");
            //}
        }
        //else
        //{
        //    btnaction.Visible = false;
        //    warning.Visible = false;
        //    sccess.Visible = false;
        //    info.Visible = false;
        //    //lbdanger.Text = "You can applied for withdraw only  " + WithDate + " Date Of Month";

        //    danger.Visible = true;
        //    txtAmt.ReadOnly = true;

        //}


    }
}