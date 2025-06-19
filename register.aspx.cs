using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Net;
using System.Data.SqlClient;
using TripleITConnection;
using TripleITTransaction;
using System.Drawing;
using System.Threading.Tasks;
using System.Web.Script.Serialization;
using System.Web.Services;
using System.Runtime.Remoting.Lifetime;

public partial class Signup : System.Web.UI.Page
{
    clsmail objmail = new clsmail();
    clsfunction objfun = new clsfunction();

    clsConnection objcon = new clsConnection();
    clsTimeZone objtime = new clsTimeZone();
    clsAMD objamd = new clsAMD();
    clsSMS objsms = new clsSMS();
    clsDashboard objdash = new clsDashboard();
    string Password = "", UserName = "", Sponserid = "", SponserName = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            string sponsor =Request.QueryString["Sponsor"].ToString();
            DataTable dt2 = objcon.ReturnDataTableSql("select walletaddress,username,name from register where username='" + sponsor + "' order by username asc");
            if (dt2.Rows.Count > 0)
            {
                hdnsposor.Value = dt2.Rows[0]["username"].ToString();
                lbsponsor.Text = dt2.Rows[0]["username"].ToString();
                lbSponsermsg.Text = dt2.Rows[0]["name"].ToString();
            }
            else
            {
                hdnsposor.Value = "";
                lbsponsor.Text = "";
                lbSponsermsg.Text = "";
            }
            hndamt.Value = "5";



        }
    }



    [WebMethod]
    public static String LoadList(string sponsor)
    {
        JavaScriptSerializer jsSerializer = new JavaScriptSerializer();
        TripleITConnection.clsConnection objlist = new TripleITConnection.clsConnection();
        string sql = "exec [dbo].[PreRegister] '" + sponsor + "'";
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
    public static string WalletBalance(String BNB_ac)
    {
        clsConnection objcon = new clsConnection();

        string result = "";
        JavaScriptSerializer jsSerializer = new JavaScriptSerializer();

        DataTable dt = objcon.ReturnDataTableSql("select id,walletaddress, username,name,Reffid,Profilepic,dateofjoin from register where walletaddress='" + BNB_ac + "'");
        if (dt.Rows.Count > 0)
        {
            result = dt.Rows[0]["username"].ToString();
            SessionData.Put("UserCode", dt.Rows[0]["id"].ToString());
            SessionData.Put("UserType", "User");
            SessionData.Put("newuser", dt.Rows[0]["username"].ToString());
            SessionData.Put("name", dt.Rows[0]["name"].ToString());
            SessionData.Put("wallet", dt.Rows[0]["walletaddress"].ToString());
            // SessionData.Put("Password", dt.Rows[0]["Password"].ToString());
            //SessionData.Put("Packtype", dt.Rows[0]["packtype"].ToString());
            SessionData.Put("profilepic", dt.Rows[0]["profilepic"].ToString());

        }
        else
        {
            result = "Invaild";
        }

        return jsSerializer.Serialize(result);



    }
    [WebMethod]
    public static string Register1(string referral_id,  string wallet_address, string PIN, string hashcode, string Amt)
    {
        clsConnection objcon = new clsConnection();
        string capta = "";
        string newuser = "", result = "";
        JavaScriptSerializer jsSerializer = new JavaScriptSerializer();
        for (int i = 1; i <= 100; i++)
        {
            var chars = "0123456789";
            var stringChars = new char[6];
            var random = new Random();

            for (int ik = 0; ik < stringChars.Length; ik++)
            {
                stringChars[ik] = chars[random.Next(chars.Length)];
            }

            var finalString = new String(stringChars);
            capta = Convert.ToString(finalString);
            newuser = "AD" + capta;
            DataTable dt1 = objcon.ReturnDataTableSql("select username from register where username='" + newuser + "'");
            if (dt1.Rows.Count > 0)
            {

            }
            else
            {
                i = 120;
            }
        }
        clsAMD objamd = new clsAMD();
    
        int a = objamd.Register(0, referral_id, wallet_address, "ADUSDT PARTNER", newuser, "Admin@123#", Amt, "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", PIN, hashcode, "", "", "N");
        if (a > 0)
        {
            result ="Success";

            SessionData.Put("UserType", "User");
            SessionData.Put("newuser", newuser);
            SessionData.Put("name", "MAGIC PARTNER");
            SessionData.Put("wallet", wallet_address);
            // SessionData.Put("Password", dt.Rows[0]["Password"].ToString());
            //SessionData.Put("Packtype", dt.Rows[0]["packtype"].ToString());
        }
        else if (a ==-1)
        {
            result = "Already";

          
        }
        else
        {
            result = "Invaid";

        }
    

        return jsSerializer.Serialize(result);



    }


}