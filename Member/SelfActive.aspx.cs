using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using TripleITConnection;
using TripleITTransaction;
using System.Web.Script.Serialization;
using System.Web.Services;

public partial class User_Default : System.Web.UI.Page
{
    clsfunction objfun = new clsfunction();
    clsAMD objamd = new clsAMD();
    clsConnection objcon = new clsConnection();
    clsTimeZone objtime = new clsTimeZone();
    clsDashboard objDash = new clsDashboard();
    clsSMS objsms = new clsSMS();

    public static string OTP = "", RequestUser="";
    protected void Page_Load(object sender, EventArgs e)
    {
         try
        {
            if (Request.QueryString.Count == 0) { Response.Redirect("Home.aspx",false); }
            if (!IsPostBack)
            {
                string reqUser = Request.QueryString["Id"].ToString();
                string pid = Request.QueryString["packid"].ToString();
                lbActiveMember.Text = reqUser == "0" ? SessionData.Get<string>("newuser") : reqUser;

                
               // loadunit();

                hndPackid.Value = pid;

                FillFormPackage(pid);
               

            }
        }
        catch (Exception ex)
        { }
    }
  
    [WebMethod]
    public static string BuyNextPackage(string Username, string Amount, string HashCode, string PackType)
    {
        clsAMD objamd = new clsAMD();

        string result = "";
        JavaScriptSerializer jsSerializer = new JavaScriptSerializer();

        int status = objamd.ActiveMember(Username, Convert.ToDecimal(Amount), Convert.ToDecimal(Amount), PackType, HashCode, "N");
        if (status > 0)
        {
            result = "Success";
        }
        else if(status == -1)
        {
            result = "Already";
        }
        else
        {
            result = "Invaild";
        }

        return jsSerializer.Serialize(result);

    }


    public void FillFormPackage(string pid)
    {
        try
        {
            try
            {
                string sql = "Select * From TblProduct Where PID =" + pid;               
                DataTable Rs = objcon.ReturnDataTableSql(sql);
                if (Rs.Rows.Count != 0)
                {
                    hndPackType.Value = Rs.Rows[0]["Product"].ToString();
                    hndPackNo.Value = Rs.Rows[0]["packid"].ToString();
                    txtpackage.Text = Rs.Rows[0]["Product"].ToString();
                    txtAmt.Text = Rs.Rows[0]["mrp"].ToString();
                    //txtmax.Text = Rs.Rows[0]["soldrate"].ToString();
                    //txtmin.Text = Rs.Rows[0]["mrp"].ToString();
                }
            }
            catch (Exception ex)
            { }
        }
        catch (Exception ex)
        { }
    }

    

  

    //protected void butsubmit_Click(object sender, EventArgs e)
    //{
    //    try
    //    {
    //        btnaction.Visible = false;
    //        decimal widamount = 0,Min=0, Max=0;
    //        string date = objtime.returnStringServerMachTime();
    //        string PackType = txtpackage.Text; 

    //        string Username = SessionData.Get<string>("newuser");
    //        decimal finalamount = Convert.ToDecimal(0);
            
    //        widamount =Convert.ToDecimal(txtAmt.Text) ;
    //        //Min = Convert.ToDecimal(txtmin.Text) ;
    //        //Max = Convert.ToDecimal(txtmax.Text) ;
    //        if (finalamount >= widamount )
    //        {

                
    //           int a = objamd.ActiveMember(lbActiveMember.Text.Trim(), widamount, widamount, PackType, Username, "N");
    //            if (a > 0)
    //            {
                   
            
    //              //  txtbalance.Text = objDash.TotalWallectBlance(SessionData.Get<string>("newuser"));
    //                warning.Visible = false;
    //                danger.Visible = false;
    //                sccess.Visible = false;
    //                info.Visible = false;
    //                sccess.Visible = true;

    //                lbsuccess.Text = "Packages Buy successfully.";
    //                //lbsuccess.Text = "Congratulations! Your Package {"+ txtpackage.Text + "} has been activated successfully.";

    //                ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "Successclick(); ", true);
    //            }
    //            else if (a == -1)
    //            {

    //                warning.Visible = false;
    //                danger.Visible = false;
    //                sccess.Visible = false;
    //                info.Visible = false;
    //                info.Visible = true;

    //                lbinfo.Text = "You can buy the same package only once a day or Buy Another One ";
    //                //lbinfo.Text = "You have already buy this " + txtpackage.Text + "! try another buy a pack!";
    //                ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "warningclick(); ", true);
    //                btnaction.Visible = true;
    //            }
    //            else
    //            {
    //                warning.Visible = false;
    //                danger.Visible = false;
    //                sccess.Visible = false;
    //                info.Visible = false;
    //                warning.Visible = true;
    //                lbwarning.Text = "Account active Not successfully";
    //                ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "dangerlick(); ", true);
    //                btnaction.Visible = true;
    //            }

    //        }
    //        else
    //        {


    //            warning.Visible = false;
    //            danger.Visible = false;
    //            sccess.Visible = false;
    //            info.Visible = false;
    //            warning.Visible = true;
    //            //lbwarning.Text = "Balance is less then to require amount or Please Enter Min Amt $"+ Min + " and Max Amt $" + Max+" ";
    //            lbwarning.Text = "Insufficient Balance..!";
    //          //  lbfund.Visible = true;
    //            ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "fundlick(); ", true);
    //            btnaction.Visible = true;
    //        }
    //    }
    //    catch (Exception ex)
    //    {
    //        warning.Visible = false;
    //        danger.Visible = false;
    //        sccess.Visible = false;
    //        info.Visible = false;
    //        lbwarning.Text = "Enter valid amount";
    //        warning.Visible = true;
    //        ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "dangerlick(); ", true);
    //        btnaction.Visible = true;
    //    }
    //}

   

    

   
}