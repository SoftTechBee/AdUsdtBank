using System;
using System.Collections.Generic;
//using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using TripleITConnection;
using TripleITTransaction;
public partial class User_rptPoolMemberStatus : System.Web.UI.Page
{

    clsList objlist = new clsList();
    clsConnection objcon = new clsConnection();
    protected void Page_Load(object sender, EventArgs e)
    {


        if (!IsPostBack)
        {
            string poolno = Request.QueryString["PoolNo"].ToString();
            lbpool.Text = poolno;
            LoadData(poolno,"0");
            SessionData.Put("PoolNo", poolno);

            //Repeater1.DataSource = dt;
            //Repeater1.DataBind();
        }


    }
   
    public void LoadData(string poolno,string Levelno)
    {
        try
        {
            string username = SessionData.Get<string>("Newuser");
            DataTable dt = objlist.PoolMemberStatus(SessionData.Get<string>("Newuser"), poolno, Levelno, "P");
            if (drppack.SelectedValue != "0")
            {
                
                dt = objlist.PoolMemberStatus(SessionData.Get<string>("Newuser"), poolno, Levelno, "P");

            }
            
            if (dt.Rows.Count > 0)
            {
                danger.Visible = false;
            }
            else
            {
                lbdanger.Text = "OOPS! NO DATA FOUND.";
                danger.Visible = true;
            
            }
            Repeater1.DataSource = dt;
            Repeater1.DataBind();

        }
        catch (Exception ex)
        {

        }


    }


    public string remark(object IsType)
    {
        string Status = "";
        if (IsType.ToString() == "True")
        {
            Status = "Completed";
        }
      
        else
        {
            Status = "Pending";
        }
        return Status;

    }

    protected void drppack_SelectedIndexChanged(object sender, EventArgs e)
    {
        string poolno = Request.QueryString["PoolNo"].ToString();
        LoadData(poolno,drppack.SelectedValue);
    }
}

