using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TripleITTransaction;
using TripleITConnection;
using System.Data;

using System.Web.Services;
using System.Web.Script.Serialization;
using System.Runtime.Remoting.Lifetime;
public partial class User_BuyNow : System.Web.UI.Page
{
    clsConnection objcon = new clsConnection();
    clsTimeZone objtime = new clsTimeZone();
    clsAMD objamd = new clsAMD();
  
    clsDashboard objdash = new clsDashboard();
    public static string Password = "", UserName = "", Sponserid = "", SponserName = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Request.QueryString.Count == 0) { return; }


            hndboxtype.Value = Request.QueryString["PoolNo"].ToString();
            hdnmember.Value = SessionData.Get<string>("newuser");
            txtusername.Text = hdnmember.Value;
            //string ActivePool = objdash.ActivePool(hndboxtype.Value);
            //if (ActivePool == "Active")
            //{
                int lastpool = Convert.ToInt32(objdash.ReturnCurPool(SessionData.Get<string>("newuser")));

                int BuyPool = Convert.ToInt32(hndboxtype.Value);
                if (BuyPool == (lastpool + 1))
                {
                    lbpoolno.Text = "A" + BuyPool;

                    int nthTerm = 5 * (int)Math.Pow(2, BuyPool - 1);

                    btndiv.Visible = true;
                    lbWallet.Text = (nthTerm ) + " USDT";
                    hndamt.Value = (nthTerm ).ToString();
                    //hndamt.Value = (nthTerm + 5).ToString();
                }
                else
                {

                    ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "warning('You cannot purchase this package because you need to buy your packages in serial order.'); ", true);
                    lbdanger.Text = "You cannot purchase this package because you need to buy your packages in serial order.";
                    danger.Visible = true;
                }
            //}
            //else
            //{
            //    ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "error('This package will be active soon'); ", true);
            //    lbdanger.Text = "This package will be active soon.";
            //    danger.Visible = true;
            //}

           
        }
    }


    [WebMethod]
    public static String LoadList(string UserName,int PoolNO)
    {
        JavaScriptSerializer jsSerializer = new JavaScriptSerializer();
        TripleITConnection.clsConnection objlist = new TripleITConnection.clsConnection();
        string sql = "exec [dbo].[PreNextBuyPool] '" + UserName + "','"+ PoolNO + "'";
        DataTable dt = objlist.ReturnDataTableSql(sql);
        if (dt.Rows.Count > 0)
        {
            List<Dictionary<string, object>> parentRow = new List<Dictionary<string, object>>();
            Dictionary<string, object> childRow;
            foreach (DataRow row in dt.Rows)
            {
                childRow = new Dictionary<string, object>();
                foreach (DataColumn col in dt.Columns)
                {
                    childRow.Add(col.ColumnName, row[col]);
                }
                parentRow.Add(childRow);
            }
            return jsSerializer.Serialize(parentRow);
        }
        else
        {
            return "0";
        }



    }




    [WebMethod]
    public static string Reinvestment(string Amount, string Hashcode,string Pack)
    {
        clsConnection objcon = new clsConnection();
        string capta = "";
        string newuser = "", result = "";
        JavaScriptSerializer jsSerializer = new JavaScriptSerializer();

        clsAMD objamd = new clsAMD();
        int a = objamd.BoxPurchase(SessionData.Get<string>("newuser"),Hashcode, "X2",Convert.ToInt32(Pack), Convert.ToDecimal(Amount));
        if (a > 0)
        {
            result = "Success";

        }
        else
        {
            result = "Invaid Transaction";

        }
        return jsSerializer.Serialize(result);



    }


 
    protected void btnreset_Click(object sender, EventArgs e)
    {
        Response.Redirect("home.aspx");
    }
}