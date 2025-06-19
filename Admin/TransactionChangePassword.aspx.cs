using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using TripleITConnection;

public partial class User_TransactionChangePassword : System.Web.UI.Page
{
    clsConnection objcon = new clsConnection();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (SessionData.Get<string>("Newuser") == null && SessionData.Get<string>("Newuser") == "")
        {
            Response.Redirect("Logout.aspx");
        }
        else
        {
            try
            {
                if (!IsPostBack)
                {
                    info.Visible = false;
                }
            }
            catch (Exception ex)
            { }
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        try
        {
            if (txtnew.Text == txtconfirm.Text)
            {
                string sql = "update tbladmin set pass='" + txtnew.Text + "' where username='" + SessionData.Get<string>("Newuser") + "' and pass='" + txtoldpass.Text.Trim()+"'";
            int flag=    objcon.ExecuteSqlQuery(sql);

                if (flag > 0)
                {
                    lbsuccess.Text = "Password Change Successfully your PIN : '"+ txtnew.Text + "'";
                    success.Visible = true;
                    danger.Visible = false;
                }
                else
                {
                    lbdanger.Text = "Invaild Current Password ...... Try again";
                    //txtoldpass.Text = "";
                    //txtoldpass.Focus();

                    danger.Visible = true;
                    success.Visible = false;
            
                }
            }
            else
            {
                lbdanger.Text = "New Password And Confirm Password Not Match";
                danger.Visible = true;
            }
        }
        catch (Exception ex)
        { }
    }
}