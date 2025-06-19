using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.IO;
using TripleITTransaction;
using TripleITConnection;

public partial class Admin_rptMachingIncome : System.Web.UI.Page
{
    clsList objlist = new clsList();
    clsConnection objcon = new clsConnection();
   
    public List<clsaccount> objacclist = new List<clsaccount>();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            loadlist();
        }
    }

    private void loadlist()
    {
        try
        {
            string sql = "select * from tbltransaction  where  1=1 ";
            if (drppack.SelectedItem.Value!= "0")
            {
                sql += " and PoolNO='"+ drppack.SelectedItem.Value + "'";

            }
            
            sql += "  order by PoolNO asc";


            // Fetch data
            DataTable dt = objcon.ReturnDataTableSql(sql);

            if (dt.Rows.Count > 0)
            {
                //int total = 0;
                //foreach (DataRow row in dt.Rows)
                //{
                //    total += Convert.ToInt32(row["amount"]);
                //}

                // Bind data to GridView
                GridView1.DataSource = dt;
                GridView1.DataBind();

                //// Set total income in footer
                //GridViewRow footerRow = GridView1.FooterRow;
                //if (footerRow != null)
                //{
                //    footerRow.Cells[3].Text = "Total: " + total.ToString();
                //    footerRow.Cells[3].HorizontalAlign = HorizontalAlign.Right;
                //}

                danger.Visible = false;
            }
            else
            {
                GridView1.DataSource = null;
                GridView1.DataBind();

                danger.Visible = true;
                lbdanger.Text = "Oops! No Data Found";
            }
        }
        catch (Exception ex)
        {
            // Handle exceptions if necessary
        }
    }

    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        // Set the new page index
        GridView1.PageIndex = e.NewPageIndex;

        // Reload data
        loadlist();
    }

    

  
    protected void btnExportToExcel_Click(object sender, EventArgs e)
    {
        try
        {
            Response.Clear();
            Response.Buffer = true;
            Response.AddHeader("content-disposition", "attachment;filename=rptIncome.xls");
            Response.Charset = "";
            Response.ContentType = "application/vnd.ms-excel";

            System.IO.StringWriter stringWrite = new System.IO.StringWriter();
            System.Web.UI.HtmlTextWriter htmlWrite = new HtmlTextWriter(stringWrite);
            GridView1.RenderControl(htmlWrite);
            Response.Write("<table>");
            Response.Write(stringWrite.ToString());
            Response.Write("</table>");
            Response.End();
        }
        catch (Exception ex)
        {
            // Handle exceptions if necessary
        }
    }

    protected void Unnamed_SelectedIndexChanged(object sender, EventArgs e)
    {
        loadlist();
    }
}
