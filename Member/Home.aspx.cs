using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using TripleITConnection;
using TripleITTransaction;
public partial class Member_Default : System.Web.UI.Page
{
    clsList objlist = new clsList();
    clsTimeZone objtime = new clsTimeZone();
    clsConnection objcon = new clsConnection();
    clsAccount objacc = new clsAccount();
    public List<clsaccount> objacclist = new List<clsaccount>();
    clsfunction objfun = new clsfunction();
    clsDashboard objdash = new clsDashboard();
    clsAMD objamd = new clsAMD();
    CoinPayments objcoin = new CoinPayments();
    clsDashboard objdashboard = new clsDashboard();
    string Sql = "";
    protected void Page_Load(object sender, EventArgs e)
    {

        if (!IsPostBack)
        {
            loadNews();
            loadDownLineBusniess();



            string username = SessionData.Get<string>("Newuser");
            wallet.Value = SessionData.Get<string>("wallet");


            myInput.Value = "http://adusdtbank.live/register.aspx?Sponsor=" + username;
            lbreffsidLeft.Text = "http://adusdtbank.live/register.aspx?Sponsor=" + username;


            //lbAvailabledeposit.Text = objdashboard.TotalWallectBlance(username);
            //lbdeposit.Text = objdashboard.DepositCredit(username, "Payment");
            //lbWithdrawdeposit.Text = objdashboard.DepositDebit(username, "INCOME");

           // lbinvest.Text = objdashboard.SelfBusiness(username);
          //  lbwithdrawapprove.Text = objdashboard.WithdrawType(username, "Approved", "INCOME");

            lbTotalIncome.Text = (Convert.ToDecimal(objdashboard.TotalIncome(username))).ToString();
            lbteam.Text = (Convert.ToDecimal(objdashboard.PoolTeam(username, "A"))).ToString();
          //  lbbalance.Text = objdashboard.TotalBlance(username);

            //lbdirectbusiness.Text = objdashboard.TotalDirectBusiness(username);
            //lbTeambusiness.Text = objdashboard.TeamBusiness(username);
            lbdirect.Text = objdashboard.IncomeType(username, "DIRECT");
            lblevelincome.Text = objdashboard.IncomeType(username, "LEVEL");
            lbdivident.Text = objdashboard.IncomeType(username, "DIVIDENT");
            lbupgrade.Text = objdashboard.IncomeType(username, "UPGRADE");
            lbroyalty.Text = objdashboard.IncomeType(username, "Royalty");
            lbreward.Text = objdashboard.IncomeType(username, "Reward");
            //lbHoldIncome.Text = objdashboard.IncomeTypeHold(username);
            //lbReleaseIncome.Text = objdashboard.IncomeTypeHoldDebit(username);
            lbavlHoldIncome.Text = objdashboard.IncomeTypeAvlHold(username);

            lbdirectTeam.Text = objdashboard.TotalDirect(username);
            //lbteam.Text = objdashboard.TotalTeam(username);
            //totalactiveteam.Text = objdashboard.TotalActiveTeam(username);
            //lbinactiveteam.Text = objdashboard.TotalInActiveTeam(username);
            

            //lbpoolTeam.Text = objdashboard.PoolTeam(username, "A");

        }
    }

    [WebMethod]
    public static String S1Slot()
    {
        clsConnection objlist = new clsConnection();


        string sql = "EXEC [dbo].[DashBoard]@UserName='" + SessionData.Get<string>("Newuser") + "',@Type='S'";

        DataTable table = objlist.ReturnDataTableSql(sql);

        JavaScriptSerializer jsSerializer = new JavaScriptSerializer();
        List<Dictionary<string, object>> parentRow = new List<Dictionary<string, object>>();
        Dictionary<string, object> childRow;
        foreach (DataRow row in table.Rows)
        {
            childRow = new Dictionary<string, object>();
            foreach (DataColumn col in table.Columns)
            {
                childRow.Add(col.ColumnName, row[col]);
            }
            parentRow.Add(childRow);
        }
        return jsSerializer.Serialize(parentRow);

    }

    private void loadDownLineBusniess()
    {
        try
        {
            string sql = "select CONCAT(LEFT(walletaddress, 6), '......', RIGHT(walletaddress, 6)) AS formatted_walletaddress,capping,status,reffid,username,email,reward,mobile,dob,doa,dateofjoin,name,country,packtype,JoinAmount,TotalRepurchase,rankname from register  where username='" + SessionData.Get<string>("Newuser") + "'";
            DataTable dt = objcon.ReturnDataTableSql(sql);

            if (dt.Rows.Count > 0)
            {
                lbwallet.Text = dt.Rows[0]["formatted_walletaddress"].ToString();
                // lbEmail.Text = dt.Rows[0]["email"].ToString();
                //lbDOJ.Text = Convert.ToDateTime(dt.Rows[0]["dateofjoin"].ToString()).ToShortDateString();
                lbdoa.Text = Convert.ToDateTime(dt.Rows[0]["DOA"].ToString()).ToShortDateString();
                lbSponsorId.Text = dt.Rows[0]["reffid"].ToString();

                lblimit.Text = dt.Rows[0]["capping"].ToString();

                // lbRewardstaus.Text = dt.Rows[0]["reward"].ToString();






            }

            string sql1 = "select top 1 Amount,PoolNo from tbltransaction where username='" + SessionData.Get<string>("Newuser") + "'  order by tid desc";
            DataTable dt1 = objcon.ReturnDataTableSql(sql1);

            if (dt1.Rows.Count > 0)
            {
                lbjoinamount.Text = dt1.Rows[0]["Amount"].ToString();
                lbpack.Text ="A"+dt1.Rows[0]["PoolNo"].ToString();
              






            }
        }
        catch (Exception ex)
        { }
    }

    private void loadNews()
    {
        try
        {
            string sql = "select news,tittle from tblnews order by id desc";
            DataTable dt = objcon.ReturnDataTableSql(sql);
            //repNews.DataSource = dt;
            //repNews.DataBind();
            lbnews.Text = dt.Rows[0]["news"].ToString();
            lbhead.Text = dt.Rows[0]["tittle"].ToString();

        }
        catch (Exception ex)
        { }
    }





  


    public class Checkout
    {
        public string currency { get; set; }
        public long amount { get; set; }
        public int test { get; set; }
        public string item_number { get; set; }
        public string item_name { get; set; }
        public List<object> details { get; set; }
        public string invoice { get; set; }
        public string custom { get; set; }
        public string ipn_url { get; set; }
        public int amountf { get; set; }
    }

    public class Result
    {
        public int time_created { get; set; }
        public int time_expires { get; set; }
        public int status { get; set; }
        public string status_text { get; set; }
        public string type { get; set; }
        public string coin { get; set; }
        public long amount { get; set; }
        public string amountf { get; set; }
        public long received { get; set; }
        public string receivedf { get; set; }
        public int recv_confirms { get; set; }
        public string payment_address { get; set; }
        public int time_completed { get; set; }
        public string send_tx { get; set; }
        public string sender_ip { get; set; }
        public Checkout checkout { get; set; }
        public List<object> shipping { get; set; }
    }



}