using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using TripleITTransaction;

public partial class Member_AutoWalletRechargeUSDT : System.Web.UI.Page
{
    clsDashboard objdash = new clsDashboard();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (SessionData.Get<string>("newuser") == null && SessionData.Get<string>("newuser") == "")
        {
            Response.Redirect("Logout.aspx");
        }
        else
        {
            if (!IsPostBack)
            {
                hndsponser.Value = SessionData.Get<string>("newuser");
            }
        }
    }


    [WebMethod]
    public static string BuyNextPackage(string Username,string Amount, string HashCode)
    {
        clsAMD objamd = new clsAMD();

        string result = "";
        JavaScriptSerializer jsSerializer = new JavaScriptSerializer();

        int status =  objamd.AutoWalletRecharge(Username, HashCode, Amount, "N");
        if (status > 0)
        {
            result = "Success";
        }
        else
        {
            result = "Invaild";
        }

        return jsSerializer.Serialize(result);

    }



    //protected void txtamt_TextChanged(object sender, EventArgs e)
    //{
    //    decimal Token = Convert.ToDecimal(lbBalance.Text);
    //    decimal Amt = Convert.ToDecimal(txtamt.Text);
    //    if(Amt> Token)
    //}
}