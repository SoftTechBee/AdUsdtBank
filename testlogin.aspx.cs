using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using TripleITConnection;
using TripleITTransaction;

public partial class Login : System.Web.UI.Page
{
    clsConnection objcon = new clsConnection();
    clsAMD objamd = new clsAMD();
    clsList objlist = new clsList();
    clsclosing objclosing = new clsclosing();
    clsTimeZone objtime = new clsTimeZone();
    clsSMS objsms = new clsSMS();
    // clsEncryptionandDecryption onjEncrypt = new clsEncryptionandDecryption();
    protected void Page_Load(object sender, EventArgs e)
    {
      

    }


    protected void btnLogin_Click(object sender, EventArgs e)
    {
        try
        {

            //string S = onjEncrypt.Encrypt(txtPassword.Text);
            DataTable dt = objlist.LoginCheck(txtUserName.Text.Trim(), txtPassword.Text.Trim().ToUpper(), "U");
            if (dt.Rows.Count > 0)
            {
                SessionData.Put("UserCode", dt.Rows[0]["id"].ToString());
                SessionData.Put("UserType", "User");
                SessionData.Put("newuser", dt.Rows[0]["username"].ToString());
                SessionData.Put("name", dt.Rows[0]["name"].ToString());
               // SessionData.Put("Password", dt.Rows[0]["Password"].ToString());
                //SessionData.Put("Packtype", dt.Rows[0]["packtype"].ToString());
                SessionData.Put("profilepic", dt.Rows[0]["profilepic"].ToString());
                Response.Redirect("~/User/Home.aspx", false);

            }
            else
            {
                // dr.Close();
                //lbmsg.Text = "Invalid Username or Password";
                txtPassword.Text = "";
                txtUserName.Text = "";

                //Response.Write("<script>alert('')</script>");
            }

            //string sql2 = "Select Symbol from TblCurrency where cid ='1'";
            //DataTable dt2 = objcon.ReturnDataTableSql(sql2);

            //if (dt2.Rows.Count > 0)
            //{
            //    SessionData.Put("Currency", dt2.Rows[0]["Symbol"].ToString());

            //}



        }
        catch (Exception ex)
        {
            //lbmsg.Text = "Invalid Username or Password";
            txtPassword.Text = "";
            txtUserName.Text = "";
        }


    }
}