using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TripleITConnection;
using TripleITTransaction;


public partial class Admin_Default : System.Web.UI.Page
{
    clsfunction objfun = new clsfunction();
    clsDashboard objdash = new clsDashboard();

    protected void Page_Load(object sender, EventArgs e)
    {
       
            if (!IsPostBack)
            {

            //lbavailablefund.Text = objdash.Availablefundadmin();
           // lbTotalDeposite.Text = objdash.CompanyTurnOver();
            //lbTotalWithdrawal.Text = objdash.Totalwithdraw();
            //lbpendingwithdraw.Text = objdash.Totalwithdraw();
            //lbCompanyNetBalance.Text = (Convert.ToDecimal(lbTotalDeposite.Text) - Convert.ToDecimal(lbTotalWithdrawal.Text)).ToString();
              lbTotalMember.Text = objfun.AllUser("1");
            //lbTodayJoin.Text = objfun.UserStatus("1", "Active");
            //lbpaidmember.Text = objfun.UserStatus("0", "Active");
            //lbfreemember.Text = objfun.UserStatus("0", "Not Active");


            lbdirect.Text = objdash.IncomeType("Admin", "DIRECT");
            lbupgrade.Text = objdash.IncomeType("Admin", "UPGRADE");
            lblevelIncome.Text = objdash.IncomeType("Admin", "LEVEL");
           lbroyalty.Text = objdash.IncomeType("Admin", "ROYALTY");
           lbreward.Text = objdash.IncomeType("Admin", "REWARD");
           lbdivident.Text = objdash.IncomeType("Admin", "DIVIDENT");
            lbHoldIncome.Text = objdash.IncomeTypeAvlHold("Admin");
            


            }
       
    }
   
}