using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.IO;
using System.Net;
using System.Data.SqlClient;
using TripleITConnection;
using TripleITTransaction;
using System.Web.Services;
using System.Web.Script.Serialization;

public partial class User_LevelTree : System.Web.UI.Page
{
    clsList objlist = new clsList();
    clsConnection objcon = new clsConnection();
    clsAccount objacc = new clsAccount();
    public static string username = "";
    public static int Level = 1;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            username =  Request.QueryString["upline"].ToString() == "0" ? "AD100001": Request.QueryString["upline"].ToString();
        }
    }

    [WebMethod]
    public static string FunTreeView()
    {

        clsList objlist = new clsList();
        DataTable table = objlist.GetTreeView(username);
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




    protected void btnsearch_Click(object sender, EventArgs e)
    {
        // username = txtsearch.Text.Trim();
    }

    protected void Unnamed_TextChanged(object sender, EventArgs e)
    {
      // Level= Convert.ToInt32(drplevelno.SelectedValue);
    }

    protected void btnsearch_Click1(object sender, EventArgs e)
    {
        username = txtsearch.Text.Trim();
    }
}