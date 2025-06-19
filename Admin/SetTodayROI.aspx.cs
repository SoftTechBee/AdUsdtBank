using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using TripleITConnection;
using TripleITTransaction;

public partial class Admin_setnews : System.Web.UI.Page
{
    clsConnection objcon = new clsConnection();
    clsTimeZone objtime = new clsTimeZone();
    clsList objlist = new clsList();
    clsAMD objamd = new clsAMD();
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            if (!IsPostBack)
            {
                loadlist();
                
            }

        }
        catch (Exception ex)
        { }
    }
    protected void Repeater1_ItemCommand(object source, RepeaterCommandEventArgs e)
    {

        if (e.CommandName == "Delete")
        {
            string id = e.CommandArgument.ToString();
            objcon.ExecuteSqlQuery("delete from TblTodayROI where idx='" + id + "'");

            lbinfo.Text = "Delete Successfully";
            info.Visible = true;
            loadlist();
        }
        if (e.CommandName == "Edit")
        {
            string id = e.CommandArgument.ToString();
            hndIDX.Value = id;
            string sql = "select * from TblTodayROI where idx='" + id + "'";
            DataTable dt = objcon.ReturnDataTableSql(sql);
            drppack.SelectedItem.Text = dt.Rows[0]["type"].ToString();
            txtroi.Text = dt.Rows[0]["ROI"].ToString();
            bntsubmit.Text = "Update";
            loadlist();
        }

    }
    private void loadlist()
    {
        try
        {
            string sql = "select  * from TblTodayROI";
            DataTable dt = objcon.ReturnDataTableSql(sql);
            Repeater1.DataSource = dt;
            Repeater1.DataBind();
            

        }
        catch (Exception ex)
        { }
    }
    protected void bntsubmit_Click(object sender, EventArgs e)
    {
        try
        {
            string date = objtime.returnStringServerMachTime();
            string pack ="A";
            //string Day = drpWeekDay.SelectedItem.Text; 

            if (bntsubmit.Text == "Submit")
            {
                 int a = objamd.ROIMaster(drppack.SelectedValue, drppack.SelectedItem.Text,Convert.ToDecimal( txtroi.Text), "", "A");

                    if (a > 0)
                    {


                        lbinfo.Text = "ROI Updated Successfully For ";
                        info.Visible = true;
                        loadlist();
                        
                    }
                    else
                    {
                        lbinfo.Text = "Unable to Update ROI !!! Please Try Again";
                        info.Visible = true;
                        loadlist();
                       

                    }
                
                
            }

            if(bntsubmit.Text == "Update")
            {
                int a = objamd.ROIMaster(hndIDX.Value, drppack.SelectedItem.Text, Convert.ToDecimal(txtroi.Text),  "", "U");

                if (a > 0)
                {

                    
                    lbinfo.Text = "ROI Updated Successfully !!!";
                    info.Visible = true;
                    loadlist();
                   
                }
            }

        }
        catch (Exception ex)
        {
            lbdanger.Text = "Please Fill All the Inputs !!!";
            danger.Visible = true;
        }
    }

 
   

}