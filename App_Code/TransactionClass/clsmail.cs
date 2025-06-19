using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Diagnostics;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Net.Mail;
using System.IO;
using System.Xml;
using System.Net;
using TripleITTransaction;
/// <summary>
/// Summary description for clsmail
/// </summary>
public class clsmail
{
   
    public clsmail()
    {
        //
        // TODO: Add constructor logic here
        //admin@oneroyal.us
    }
    string BeginHtml = @"<!DOCTYPE html PUBLIC '-//W3C//DTD XHTML 1.0 Transitional//EN' 'http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd'><html xmlns='http://www.w3.org/1999/xhtml' xmlns:v='urn:schemas-microsoft-com:vml' xmlns:o='urn:schemas-microsoft-com:office:office' lang='en'><head><title></title><meta charset='UTF-8' /><meta http-equiv='Content-Type' content='text/html; charset=UTF-8' /><!--[if !mso]><meta http-equiv='X-UA-Compatible' content='IE=edge' /><!--<![endif]--><meta name='x-apple-disable-message-reformatting' content='' /><meta content='target-densitydpi=device-dpi' name='viewport' /><meta content='true' name='HandheldFriendly' /><meta content='width=device-width' name='viewport' /><meta name='format-detection' content='telephone=no, date=no, address=no, email=no, url=no' /><link href='Mail/mailcss.css' rel='stylesheet' /><link href='https://fonts.googleapis.com/css2?family=Albert+Sans:wght@400;700&amp;family=Inter+Tight:wght@800&amp;display=swap' rel='stylesheet' type='text/css' /></head><body id='body' class='t76' style='min-width:100%;Margin:0px;padding:0px;background-color:#EDEDED;'><div class='t75' style='background-color:#EDEDED;'><table role='presentation' width='100%' cellpadding='0' cellspacing='0' border='0' align='center'><tr><td class='t74' style='font-size:0;line-height:0;mso-line-height-rule:exactly;background-color:#EDEDED;' valign='top' align='center'><!--[if mso]><v:background xmlns:v='urn:schemas-microsoft-com:vml' fill='true' stroke='false'><v:fill color='#EDEDED'/></v:background><![endif]--><table role='presentation' width='100%' cellpadding='0' cellspacing='0' border='0' align='center' id='innerTable'><tr><td align='center'>   <br /><br />";

    string endHtml = "<br /> <table class='t73' role='presentation' cellpadding='0' cellspacing='0' style='Margin-left:auto;Margin-right:auto;'><tr><td width = '680' class='t72' style='background-color:#E6D305;width:680px;'><table class='t71' role='presentation' cellpadding='0' cellspacing='0' width='100%' style='width:100%;'><tr><td class='t70' style='padding:80px 30px 80px 30px;'><table role = 'presentation' width='100%' cellpadding='0' cellspacing='0' style='width:100% !important;'><tr><td align = 'center' >< table class='t69' role='presentation' cellpadding='0' cellspacing='0' style='Margin-left:auto;Margin-right:auto;'><tr><td width = '475' class='t68' style='background-color:transparent;width:475px;'><table class='t67' role='presentation' cellpadding='0' cellspacing='0' width='100%' style='width:100%;'><tr><td class='t66'><table role = 'presentation' width='100%' cellpadding='0' cellspacing='0' style='width:100% !important;'><tr><td align = 'center' >< table class='t59' role='presentation' cellpadding='0' cellspacing='0' style='Margin-left:auto;Margin-right:auto;'><tr><td width = '475' class='t58' style='width:600px;'><table class='t57' role='presentation' cellpadding='0' cellspacing='0' width='100%' style='width:100%;'><tr><td class='t56'><p class='t55' style='margin:0;Margin:0;font-family:Albert Sans,BlinkMacSystemFont,Segoe UI,Helvetica Neue,Arial,sans-serif;line-height:22px;font-weight:400;font-style:normal;font-size:14px;text-decoration:none;text-transform:none;direction:ltr;color:#000000;text-align:left;mso-line-height-rule:exactly;mso-text-raise:2px;'>Your Credentials Are GIven Above Please save it for future Refrences also do not share this to anyone to avoid any fund loss</p></td></tr></table></td></tr></table></td></tr><tr><td><div class='t60' style='mso-line-height-rule:exactly;mso-line-height-alt:20px;line-height:20px;font-size:1px;display:block;'>&nbsp;&nbsp;</div></td></tr><tr><td align = 'center' >< table class='t65' role='presentation' cellpadding='0' cellspacing='0' style='Margin-left:auto;Margin-right:auto;'><tr><td width = '475' class='t64' style='width:600px;'><table class='t63' role='presentation' cellpadding='0' cellspacing='0' width='100%' style='width:100%;'><tr><td class='t62'><p class='t61' style='margin:0;Margin:0;font-family:Albert Sans,BlinkMacSystemFont,Segoe UI,Helvetica Neue,Arial,sans-serif;line-height:22px;font-weight:400;font-style:normal;font-size:14px;text-decoration:none;text-transform:none;direction:ltr;color:#000000;text-align:left;mso-line-height-rule:exactly;mso-text-raise:2px;'>ADUSDT BANK GLOBAL All rights reserved</p></td></tr></table></td></tr></table></td></tr></table></td></tr></table></td></tr></table></tr></table></td></tr></table></td></tr></table><div class='gmail-fix' style='display: none; white-space: nowrap; font: 15px courier; line-height: 0;'>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</div>";

    //private static string MailSmtp = "smtpout.secureserver.net";
    //private static string MailSmtp = "relay-hosting.secureserver.net";
    private static string MailSmtp = "mail.privateemail.com";
    private static string MailUserName = "admin@oneroyal.us";
    private static string MailPassword = "Admin@123";
    public string sendpass(string Name, string Username, string pass, string TransactionPass, string Email)
    {
        try
        {


            ServicePointManager.SecurityProtocol = SecurityProtocolType.Tls12;

            string msg = "Dear " + Name + ",<br />Welcome to ADUSDT BANK.Your Registration has been Successfully completed.<br /><br /><bold>Your account details are as follows :</bold><br />Your UserName:-" + Username + "<br /> Your Password :-" + pass + "<br/>";
            //msg += "Transaction Password:-" + TransactionPass + "<br /><br />";
            //msg += "Please reachout to US, If you have any Concerns, simply write a mail to<br />";
            //msg += "admin@oneroyal.us. We're always happy to help you..!!<br /><br />";
            //msg += "<br/><br/>Cheers! <br/><h3>Team ADUSDT BANK<h3/> <br/>visit:-<a href=http://oneroyal.us>www.oneroyal.us</a>";
            // string MiddHtml = "<table style='padding: 60px 30px 100px 30px;'  class='t25' role='presentation' cellpadding='0' cellspacing='0' width='100%' style='width:100%;'><tr><td class='t24'><table role='presentation' width='100%' cellpadding='0' cellspacing='0' style='width:100% !important;'><tr><td align='left'><table class='t4' role='presentation' cellpadding='0' cellspacing='0' style='Margin-right:auto;'><tr><td width='291' class='t3' style='width:291px;'><table class='t2' role='presentation' cellpadding='0' cellspacing='0' width='100%' style='width:100%;'><tr><td class='t1'><div style='font-size:0px;'><img class='t0' style='display:block;border:0;height:auto;width:100%;Margin:0;max-width:100%;' width='291' height='291' alt='' src='https://0539b559-56b6-489b-9e8c-846c430acc8c.b-cdn.net/e/212c3ac6-a71d-4642-a1ca-0864d8e9f33c/5956b469-19e4-43ea-8aac-04d055876646.png' /></div></td></tr></table></td></tr></table></td></tr><!--[if !mso]>--><tr><td><div class='t5' style='mso-line-height-rule:exactly;font-size:1px;display:none;'>&nbsp;&nbsp;</div></td></tr><!--<![endif]--><tr><td align='center'><table class='t10' role='presentation' cellpadding='0' cellspacing='0' style='Margin-left:auto;Margin-right:auto;'><tr><td width='475' class='t9' style='width:475px;'><table class='t8' role='presentation' cellpadding='0' cellspacing='0' width='100%' style='width:100%;'><tr><td class='t7'><h1 class='t6' style='margin:0;Margin:0;font-family:Albert Sans,BlinkMacSystemFont,Segoe UI,Helvetica Neue,Arial,sans-serif;line-height:39px;font-weight:700;font-style:normal;font-size:35px;text-decoration:none;text-transform:none;direction:ltr;color:#FFFFFF;text-align:left;mso-line-height-rule:exactly;mso-text-raise:1px;'>Thank You For Registration</h1></td></tr></table></td></tr></table></td></tr><tr><td><div class='t11' style='mso-line-height-rule:exactly;mso-line-height-alt:16px;line-height:16px;font-size:1px;display:block;'>&nbsp;&nbsp;</div></td></tr><tr><td align='left'><table class='t16' role='presentation' cellpadding='0' cellspacing='0' style='Margin-right:auto;'><tr><td width='430' class='t15' style='width:430px;'><table class='t14' role='presentation' cellpadding='0' cellspacing='0' width='100%' style='width:100%;'><tr><td class='t13'><p class='t12' style='margin:0;Margin:0;font-family:Albert Sans,BlinkMacSystemFont,Segoe UI,Helvetica Neue,Arial,sans-serif;line-height:32px;font-weight:400;font-style:normal;font-size:21px;text-decoration:none;text-transform:none;direction:ltr;color:#FFFFFF;text-align:left;mso-line-height-rule:exactly;mso-text-raise:3px;'>We welcome you to our system please proceed further towards Account Activation For any help or assistance do reach out to company helpdesk</p></td></tr></table></td></tr></table></td></tr><tr><td><div class='t17' style='mso-line-height-rule:exactly;mso-line-height-alt:56px;line-height:56px;font-size:1px;display:block;'>&nbsp;&nbsp;</div></td></tr><tr><td align='left'><table class='t23' role='presentation' cellpadding='0' cellspacing='0' style='Margin-right:auto;'><tr><td width='246' class='t22' style='background-color:#9095A2;overflow:hidden;width:246px;border-radius:4px 4px 4px 4px;'><table class='t21' role='presentation' cellpadding='0' cellspacing='0' width='100%' style='width:100%;'><tr><td class='t20' style='text-align:center;line-height:48px;mso-line-height-rule:exactly;mso-text-raise:10px;'><a class='t19' href='https://oneroyal.us/login.aspx' style='display:block;margin:0;Margin:0;font-family:Inter Tight,BlinkMacSystemFont,Segoe UI,Helvetica Neue,Arial,sans-serif;line-height:48px;font-weight:800;font-style:normal;font-size:14px;text-decoration:none;text-transform:uppercase;letter-spacing:0.65px;direction:ltr;color:#FFFFFF;text-align:center;mso-line-height-rule:exactly;mso-text-raise:10px;' target='_blank'>LOGIN<span class='t18' style='margin:0;Margin:0;mso-line-height-rule:exactly;'> </span>TO DASHBOARD</a></td></tr></table></td></tr></table></td></tr></table></td></tr></table>";
          
            string MiddHtml = "<table class='t54' role='presentation' cellpadding='0' cellspacing='0' style='Margin-left:auto;Margin-right:auto;'><tr><td width='680' class='t53' style='background-color:#1A2120;width:680px;'><table class='t52' role='presentation' cellpadding='0' cellspacing='0' width='100%' style='width:100%;'><tr><td class='t51' style='padding: 60px 30px 100px 30px; ' ><table role='presentation' width='100%' cellpadding='0' cellspacing='0' style='width:100% !important;'><tr><td align='center'><table class='t27' role='presentation' cellpadding='0' cellspacing='0' style='Margin-left:auto;Margin-right:auto;'><tr><td width='475' class='t26' style='background-color:transparent;width:475px;'><table class='t25' role='presentation' cellpadding='0' cellspacing='0' width='100%' style='width:100%;'><tr><td class='t24'><table role='presentation' width='100%' cellpadding='0' cellspacing='0' style='width:100% !important;'><tr><td align='left'><table class='t4' role='presentation' cellpadding='0' cellspacing='0' style='Margin-right:auto;'><tr><td width='291' class='t3' style='width:291px;'><table class='t2' role='presentation' cellpadding='0' cellspacing='0' width='100%' style='width:100%;'><tr><td class='t1'><div style='font-size:0px;'><img class='t0' style='display:block;border:0;height:auto;width:100%;Margin:0;max-width:100%;' width='291' height='291' alt='' src='https://0539b559-56b6-489b-9e8c-846c430acc8c.b-cdn.net/e/212c3ac6-a71d-4642-a1ca-0864d8e9f33c/5956b469-19e4-43ea-8aac-04d055876646.png' /></div></td></tr></table></td></tr></table></td></tr></tr><tr><td align='center'><table class='t10' role='presentation' cellpadding='0' cellspacing='0' style='Margin-left:auto;Margin-right:auto;'><tr><td width='475' class='t9' style='width:475px;'><table class='t8' role='presentation' cellpadding='0' cellspacing='0' width='100%' style='width:100%;'><tr><td class='t7'><h1 class='t6' style='margin:0;Margin:0;font-family:Albert Sans,BlinkMacSystemFont,Segoe UI,Helvetica Neue,Arial,sans-serif;line-height:39px;font-weight:700;font-style:normal;font-size:35px;text-decoration:none;text-transform:none;direction:ltr;color:#FFFFFF;text-align:left;mso-line-height-rule:exactly;mso-text-raise:1px;'>Thank You For Registration</h1></td></tr></table></td></tr></table></td></tr><tr><td align='left'><table class='t16' role='presentation' cellpadding='0' cellspacing='0' style='Margin-right:auto;'><tr><td width='430' class='t15' style='width:430px;'><table class='t14' role='presentation' cellpadding='0' cellspacing='0' width='100%' style='width:100%;'><tr><td class='t13'><p class='t12' style='margin:0;Margin:0;font-family:Albert Sans,BlinkMacSystemFont,Segoe UI,Helvetica Neue,Arial,sans-serif;line-height:32px;font-weight:400;font-style:normal;font-size:21px;text-decoration:none;text-transform:none;direction:ltr;color:#FFFFFF;text-align:left;mso-line-height-rule:exactly;mso-text-raise:3px;'>We welcome you to our system please proceed further towards Account Activation For any help or assistance do reach out to company helpdesk</p></td></tr></table></td></tr></table></td></tr><tr><td align='left'><table class='t23' role='presentation' cellpadding='0' cellspacing='0' style='Margin-right:auto;'><tr><td width='246' class='t22' style='background-color:#9095A2;overflow:hidden;width:246px;border-radius:4px 4px 4px 4px;'><table class='t21' role='presentation' cellpadding='0' cellspacing='0' width='100%' style='width:100%;'><tr><td class='t20' style='text-align:center;line-height:48px;mso-line-height-rule:exactly;mso-text-raise:10px;'><a class='t19' href='https://oneroyal.us/login.aspx' style='display:block;margin:0;Margin:0;font-family:Inter Tight,BlinkMacSystemFont,Segoe UI,Helvetica Neue,Arial,sans-serif;line-height:48px;font-weight:800;font-style:normal;font-size:14px;text-decoration:none;text-transform:uppercase;letter-spacing:0.65px;direction:ltr;color:#FFFFFF;text-align:center;mso-line-height-rule:exactly;mso-text-raise:10px;' target='_blank'>LOGIN<span class='t18' style='margin:0;Margin:0;mso-line-height-rule:exactly;'> </span>TO DASHBOARD</a></td></tr></table></td></tr></table></td></tr></table></td></tr></table></td></tr><tr><td align='center'><table class='t34' role='presentation' cellpadding='0' cellspacing='0' style='Margin-left:auto;Margin-right:auto;'><tr><td width='552' class='t33' style='width:552px;'><table class='t32' role='presentation' cellpadding='0' cellspacing='0' width='100%' style='width:100%;'><tr><td class='t31'><h1 class='t30' style='margin:0;Margin:0;font-family:Albert Sans,BlinkMacSystemFont,Segoe UI,Helvetica Neue,Arial,sans-serif;line-height:39px;font-weight:700;font-style:normal;font-size:20px;text-decoration:none;text-transform:none;direction:ltr;color:#FFFFFF;text-align:left;mso-line-height-rule:exactly;mso-text-raise:6px;'><span class='t29' style='margin:0;Margin:0;color:#E6D305;mso-line-height-rule:exactly;'>" +
              "USER ID</span> - " + Username + "&nbsp;</h1></td></tr></table></td></tr></table></td></tr><tr><td align='center'><table class='t41' role='presentation' cellpadding='0' cellspacing='0' style='Margin-left:auto;Margin-right:auto;'><tr><td width='552' class='t40' style='width:552px;'><table class='t39' role='presentation' cellpadding='0' cellspacing='0' width='100%' style='width:100%;'><tr><td class='t38'><h1 class='t37' style='margin:0;Margin:0;font-family:Albert Sans,BlinkMacSystemFont,Segoe UI,Helvetica Neue,Arial,sans-serif;line-height:39px;font-weight:700;font-style:normal;font-size:20px;text-decoration:none;text-transform:none;direction:ltr;color:#FFFFFF;text-align:left;mso-line-height-rule:exactly;mso-text-raise:6px;'><span class='t36' style='margin:0;Margin:0;color:#E6D305;mso-line-height-rule:exactly;'>" +
              "PASSWORD</span> - " + pass + "&nbsp;</h1></td></tr></table></td></tr></table></td></tr><tr><td align='center'><table class='t49' role='presentation' cellpadding='0' cellspacing='0' style='Margin-left:auto;Margin-right:auto;'><tr><td width='552' class='t48' style='width:552px;'><table class='t47' role='presentation' cellpadding='0' cellspacing='0' width='100%' style='width:100%;'><tr><td class='t46'><h1 class='t45' style='margin:0;Margin:0;font-family:Albert Sans,BlinkMacSystemFont,Segoe UI,Helvetica Neue,Arial,sans-serif;line-height:39px;font-weight:700;font-style:normal;font-size:20px;text-decoration:none;text-transform:none;direction:ltr;color:#FFFFFF;text-align:left;mso-line-height-rule:exactly;mso-text-raise:6px;'><span class='t43' style='margin:0;Margin:0;color:#E6D305;mso-line-height-rule:exactly;'>" +
              "TRANSACTION</span> <span class='t44' style='margin:0;Margin:0;color:#E6D305;mso-line-height-rule:exactly;'>" +
              "PASSWORD</span> - " + TransactionPass + "</h1></td></tr></table></td></tr></table></td></tr></table>";


            string htmlContent = BeginHtml + MiddHtml + endHtml;

            MailAddress FromMailAddress = new MailAddress(MailUserName, "ADUSDT BANK");
            MailMessage theTestMail = new MailMessage(FromMailAddress.ToString(), Email);
            // Set the HTML content
            AlternateView htmlView = AlternateView.CreateAlternateViewFromString(htmlContent, null, "text/html");
            theTestMail.AlternateViews.Add(htmlView);
            //html template end by jeesan -30-05-2024
            theTestMail.Body = msg;
            theTestMail.IsBodyHtml = true;
            theTestMail.Priority = MailPriority.High;
            theTestMail.Subject = "Registration  "; ;

            SmtpClient theTest = new SmtpClient();
            theTest.Port = 587;
            theTest.Timeout = 20000;
            theTest.Host = MailSmtp;
            theTest.UseDefaultCredentials = true;
            theTest.EnableSsl = true;

            System.Net.NetworkCredential theCredential = new System.Net.NetworkCredential(MailUserName, MailPassword);
            theTest.Credentials = theCredential;
            theTest.Send(theTestMail);



            string s = "Yes";
            return s;
        }
        catch (Exception ex)
        {
            string s = ex.Message;
            return s;
        }
    }
    public string DepositeFund(string Name, string Amount, string to)
    {
        try
        {

            ServicePointManager.SecurityProtocol = SecurityProtocolType.Tls12;

            string msg = "Dear " + Name + ",<br />" + Amount + "<br/>";
            msg += "Should you have any questions, reply to this email or simply write a mail to<br />";
            msg += "admin@oneroyal.us We're always happy to help you.<br /><br />";
            msg += "<br/><h3>Team ADUSDT BANK<h3/> <br/>visit:-<a https://oneroyal.us>www.oneroyal.us</a>";



            MailAddress FromMailAddress = new MailAddress(MailUserName, "ADUSDT BANK");
            MailMessage theTestMail = new MailMessage(FromMailAddress.ToString(), to);
            theTestMail.Body = msg;
            theTestMail.IsBodyHtml = true;
            theTestMail.Priority = MailPriority.High;
            theTestMail.Subject = "Fund Deposite"; ;

            SmtpClient theTest = new SmtpClient();
            theTest.Port = 587;
            theTest.Timeout = 20000;
            theTest.Host = MailSmtp;
            theTest.UseDefaultCredentials = true;
            theTest.EnableSsl = true;

            System.Net.NetworkCredential theCredential = new System.Net.NetworkCredential(MailUserName, MailPassword);
            theTest.Credentials = theCredential;
            theTest.Send(theTestMail);



            string s = "Successfully";
            return s;
        }
        catch (Exception ex)
        {
            string s = ex.Message;
            return s;
        }
    }
    public string ForgotPassword(string Name, string Username, string pass, string TransactionPass, string Email)
    {
        try
        {
            ServicePointManager.SecurityProtocol = SecurityProtocolType.Tls12;

            string msg= "Dear " + Name + ",<br /><bold>Your account details are as follows :</bold><br />Your UserName:-" + Username + "<br /> Your Password :-" + pass + "<br/>";
            //msg += "Transaction Password:-" + TransactionPass + "<br /><br />";
            //msg += "Should you have any questions, reply to this email or simply write a mail to<br />";
            //msg += "admin@oneroyal.us We're always happy to help you.<br /><br />";
            //msg += "<br/><h3>Team ADUSDT BANK<h3/> <br/>visit:-<a https://oneroyal.us>www.oneroyal.us</a>";


            string MiddHtml = "<table class='t54' role='presentation' cellpadding='0' cellspacing='0' style='Margin-left:auto;Margin-right:auto;'><tr><td width='680' class='t53' style='background-color:#1A2120;width:680px;'><table class='t52' role='presentation' cellpadding='0' cellspacing='0' width='100%' style='width:100%;'><tr><td class='t51' style='padding: 60px 30px 100px 30px; ' ><table role='presentation' width='100%' cellpadding='0' cellspacing='0' style='width:100% !important;'><tr><td align='center'><table class='t27' role='presentation' cellpadding='0' cellspacing='0' style='Margin-left:auto;Margin-right:auto;'><tr><td width='475' class='t26' style='background-color:transparent;width:475px;'><table class='t25' role='presentation' cellpadding='0' cellspacing='0' width='100%' style='width:100%;'><tr><td class='t24'><table role='presentation' width='100%' cellpadding='0' cellspacing='0' style='width:100% !important;'><tr><td align='left'><table class='t4' role='presentation' cellpadding='0' cellspacing='0' style='Margin-right:auto;'><tr><td width='291' class='t3' style='width:291px;'><table class='t2' role='presentation' cellpadding='0' cellspacing='0' width='100%' style='width:100%;'><tr><td class='t1'><div style='font-size:0px;'><img class='t0' style='display:block;border:0;height:auto;width:100%;Margin:0;max-width:100%;' width='291' height='291' alt='' src='https://0539b559-56b6-489b-9e8c-846c430acc8c.b-cdn.net/e/212c3ac6-a71d-4642-a1ca-0864d8e9f33c/5956b469-19e4-43ea-8aac-04d055876646.png' /></div></td></tr></table></td></tr></table></td></tr></tr><tr><td align='center'><table class='t10' role='presentation' cellpadding='0' cellspacing='0' style='Margin-left:auto;Margin-right:auto;'><tr><td width='475' class='t9' style='width:475px;'><table class='t8' role='presentation' cellpadding='0' cellspacing='0' width='100%' style='width:100%;'><tr><td class='t7'><h1 class='t6' style='margin:0;Margin:0;font-family:Albert Sans,BlinkMacSystemFont,Segoe UI,Helvetica Neue,Arial,sans-serif;line-height:39px;font-weight:700;font-style:normal;font-size:35px;text-decoration:none;text-transform:none;direction:ltr;color:#FFFFFF;text-align:left;mso-line-height-rule:exactly;mso-text-raise:1px;'>Password Recovery</h1></td></tr></table></td></tr></table></td></tr><tr><td align='left'><table class='t16' role='presentation' cellpadding='0' cellspacing='0' style='Margin-right:auto;'><tr><td width='430' class='t15' style='width:430px;'><table class='t14' role='presentation' cellpadding='0' cellspacing='0' width='100%' style='width:100%;'><tr><td class='t13'><p class='t12' style='margin:0;Margin:0;font-family:Albert Sans,BlinkMacSystemFont,Segoe UI,Helvetica Neue,Arial,sans-serif;line-height:32px;font-weight:400;font-style:normal;font-size:21px;text-decoration:none;text-transform:none;direction:ltr;color:#FFFFFF;text-align:left;mso-line-height-rule:exactly;mso-text-raise:3px;'>We understand you’re having trouble accessing your account. Please check below your details.</p></td></tr></table></td></tr></table></td></tr><tr><td align='left'><table class='t23' role='presentation' cellpadding='0' cellspacing='0' style='Margin-right:auto;'><tr><td width='246' class='t22' style='background-color:#9095A2;overflow:hidden;width:246px;border-radius:4px 4px 4px 4px;'><table class='t21' role='presentation' cellpadding='0' cellspacing='0' width='100%' style='width:100%;'><tr><td class='t20' style='text-align:center;line-height:48px;mso-line-height-rule:exactly;mso-text-raise:10px;'><a class='t19' href='https://oneroyal.us/login.aspx' style='display:block;margin:0;Margin:0;font-family:Inter Tight,BlinkMacSystemFont,Segoe UI,Helvetica Neue,Arial,sans-serif;line-height:48px;font-weight:800;font-style:normal;font-size:14px;text-decoration:none;text-transform:uppercase;letter-spacing:0.65px;direction:ltr;color:#FFFFFF;text-align:center;mso-line-height-rule:exactly;mso-text-raise:10px;' target='_blank'>LOGIN<span class='t18' style='margin:0;Margin:0;mso-line-height-rule:exactly;'> </span>TO DASHBOARD</a></td></tr></table></td></tr></table></td></tr></table></td></tr></table></td></tr><tr><td align='center'><table class='t34' role='presentation' cellpadding='0' cellspacing='0' style='Margin-left:auto;Margin-right:auto;'><tr><td width='552' class='t33' style='width:552px;'><table class='t32' role='presentation' cellpadding='0' cellspacing='0' width='100%' style='width:100%;'><tr><td class='t31'><h1 class='t30' style='margin:0;Margin:0;font-family:Albert Sans,BlinkMacSystemFont,Segoe UI,Helvetica Neue,Arial,sans-serif;line-height:39px;font-weight:700;font-style:normal;font-size:20px;text-decoration:none;text-transform:none;direction:ltr;color:#FFFFFF;text-align:left;mso-line-height-rule:exactly;mso-text-raise:6px;'><span class='t29' style='margin:0;Margin:0;color:#E6D305;mso-line-height-rule:exactly;'>" +
                "USER ID</span> - "+ Username + "&nbsp;</h1></td></tr></table></td></tr></table></td></tr><tr><td align='center'><table class='t41' role='presentation' cellpadding='0' cellspacing='0' style='Margin-left:auto;Margin-right:auto;'><tr><td width='552' class='t40' style='width:552px;'><table class='t39' role='presentation' cellpadding='0' cellspacing='0' width='100%' style='width:100%;'><tr><td class='t38'><h1 class='t37' style='margin:0;Margin:0;font-family:Albert Sans,BlinkMacSystemFont,Segoe UI,Helvetica Neue,Arial,sans-serif;line-height:39px;font-weight:700;font-style:normal;font-size:20px;text-decoration:none;text-transform:none;direction:ltr;color:#FFFFFF;text-align:left;mso-line-height-rule:exactly;mso-text-raise:6px;'><span class='t36' style='margin:0;Margin:0;color:#E6D305;mso-line-height-rule:exactly;'>" +
                "PASSWORD</span> - " + pass + "&nbsp;</h1></td></tr></table></td></tr></table></td></tr><tr><td align='center'><table class='t49' role='presentation' cellpadding='0' cellspacing='0' style='Margin-left:auto;Margin-right:auto;'><tr><td width='552' class='t48' style='width:552px;'><table class='t47' role='presentation' cellpadding='0' cellspacing='0' width='100%' style='width:100%;'><tr><td class='t46'><h1 class='t45' style='margin:0;Margin:0;font-family:Albert Sans,BlinkMacSystemFont,Segoe UI,Helvetica Neue,Arial,sans-serif;line-height:39px;font-weight:700;font-style:normal;font-size:20px;text-decoration:none;text-transform:none;direction:ltr;color:#FFFFFF;text-align:left;mso-line-height-rule:exactly;mso-text-raise:6px;'><span class='t43' style='margin:0;Margin:0;color:#E6D305;mso-line-height-rule:exactly;'>" +
                "TRANSACTION</span> <span class='t44' style='margin:0;Margin:0;color:#E6D305;mso-line-height-rule:exactly;'>" +
                "PASSWORD</span> - " + TransactionPass + "</h1></td></tr></table></td></tr></table></td></tr></table>";

            string htmlContent = BeginHtml + MiddHtml + endHtml;
            MailAddress FromMailAddress = new MailAddress(MailUserName, "ADUSDT BANK");
            MailMessage theTestMail = new MailMessage(FromMailAddress.ToString(), Email);
            // Set the HTML content
            AlternateView htmlView = AlternateView.CreateAlternateViewFromString(htmlContent, null, "text/html");
            theTestMail.AlternateViews.Add(htmlView);
            //html template end by jeesan -30-05-2024
            theTestMail.Body = msg;
            theTestMail.IsBodyHtml = true;
            theTestMail.Priority = MailPriority.High;
            theTestMail.Subject = "Forgot Password  "; ;

            SmtpClient theTest = new SmtpClient();
            theTest.Port = 587;
            theTest.Timeout = 20000;
            theTest.Host = MailSmtp;
            theTest.UseDefaultCredentials = true;
            theTest.EnableSsl = true;

            System.Net.NetworkCredential theCredential = new System.Net.NetworkCredential(MailUserName, MailPassword);
            theTest.Credentials = theCredential;
            theTest.Send(theTestMail);



            string s = "Password has sent successfully on your register '"+ Email + "'.";
            return s;
        }
        catch (Exception ex)
        {
            string s = ex.Message;
            return s;
        }
    }

    public string WithdrawFund(string Name, string Amount, string PaymentType, string Adddress, string Email)
    {
        try
        {
            ServicePointManager.SecurityProtocol = SecurityProtocolType.Tls12;

            string msg = "Dear  " + Name + ",<br />You've requested to withdraw " + Amount + " " + PaymentType + "to this Address:" + Adddress + "<br/>";

            msg += "Before going further with the withdrawal, pleasecheck carefully the target address.<br />";
            msg += "Be aware that if you confirm an incorrect address, we won't be able to assist you to recover your assets.< br />";
            msg += "Should you have any questions, simply write a mail to.<br />admin@oneroyal.us.We're always happy to help you..!!< br />";
            msg += "<br/>Cheers,<br/> <h3>Team ADUSDT BANK<h3/> <br/>visit:-<a https://www.oneroyal.us>https://www.oneroyal.us</a>";

            MailAddress FromMailAddress = new MailAddress(MailUserName, "ADUSDT BANK");
            MailMessage theTestMail = new MailMessage(FromMailAddress.ToString(), Email);
            theTestMail.Body = msg;
            theTestMail.IsBodyHtml = true;
            theTestMail.Priority = MailPriority.High;
            theTestMail.Subject = "No need to rply   "; ;

            SmtpClient theTest = new SmtpClient();
            theTest.Port = 587;
            theTest.Timeout = 20000;
            theTest.Host = MailSmtp;
            theTest.UseDefaultCredentials = false;
            theTest.EnableSsl = true;

            System.Net.NetworkCredential theCredential = new System.Net.NetworkCredential(MailUserName, MailPassword);
            theTest.Credentials = theCredential;
            theTest.Send(theTestMail);
            string s = "yes";
            return s;

        }
        catch (Exception ex)
        {
            string s = ex.Message;
            return s;
        }
    }
    public string WithdrawApproved(string Name, string Amount, string Email)
    {
        try
        {
            ServicePointManager.SecurityProtocol = SecurityProtocolType.Tls12;

            string msg = "Dear " + Name + ",<br />" + Amount + "<br/>";
            msg += "Should you have any questions, reply to this email or simply write a mail to<br />";
            msg += "admin@oneroyal.us We're always happy to help you.<br /><br />";
            msg += "<br/><h3>Team ADUSDT BANK<h3/> <br/>visit:-<a https://oneroyal.us>www.oneroyal.us</a>";



            MailAddress FromMailAddress = new MailAddress(MailUserName, "ADUSDT BANK");
            MailMessage theTestMail = new MailMessage(FromMailAddress.ToString(), Email);
            theTestMail.Body = msg;
            theTestMail.IsBodyHtml = true;
            theTestMail.Priority = MailPriority.High;
            theTestMail.Subject = "Withdraw" ;

            SmtpClient theTest = new SmtpClient();
            theTest.Port = 587;
            theTest.Timeout = 20000;
            theTest.Host = MailSmtp;
            theTest.UseDefaultCredentials = true;
            theTest.EnableSsl = true;

            System.Net.NetworkCredential theCredential = new System.Net.NetworkCredential(MailUserName, MailPassword);
            theTest.Credentials = theCredential;
            theTest.Send(theTestMail);



            string s = "Successfully";
            return s;

        }
        catch (Exception ex)
        {
            string s = ex.Message;
            return s;
        }
    }
    
    public string PackageActivate(string Name, string Amount, string to)
    {
        try
        {
            ServicePointManager.SecurityProtocol = SecurityProtocolType.Tls12;

            string SenderAddress = "admin@oneroyal.us";
            // any address Reciver where the email will be sending
            string toAddress = to;
            //Password of your gmail address
            const string SenderPassword = "Admin@123";
            // Passing the values and make a email formate to display


            MailMessage theTestMail = new MailMessage(SenderAddress, toAddress);
            theTestMail.Body = "Dear  " + Name + ",<br />Welcome to ADUSDT BANK.  Your  " + Amount + "$ Package has been Successfully Activated.<br/>";

            theTestMail.Body += "Enjoy The ADUSDT BANK Coin Benifits.<br />";
            theTestMail.Body += "Should you have any questions, simply write a mail to<br />";
            theTestMail.Body += "admin@oneroyal.us.We're always happy to help you..!!<br /><br />";
            theTestMail.Body += "<br/>Cheers<br/> <h3>Team ADUSDT BANK<h3/> <br/>visit:-<a href=https://www.oneroyal.us>https://www.oneroyal.us</a>";
            theTestMail.IsBodyHtml = true;
            theTestMail.Priority = MailPriority.High;
            theTestMail.Subject = "No need to rply   ";

            SmtpClient theTest = new System.Net.Mail.SmtpClient();
            theTest.Port = 587;
            theTest.Host = "relay-hosting.secureserver.net";//from godaddy;//"smtpout.secureserver.net";// "smtp.gmail.com";
            theTest.UseDefaultCredentials = false;
            theTest.EnableSsl = true;
            theTest.DeliveryMethod = System.Net.Mail.SmtpDeliveryMethod.Network;
            System.Net.NetworkCredential theCredential = new System.Net.NetworkCredential(SenderAddress, SenderPassword);
            theTest.Credentials = theCredential;
            theTest.Timeout = 20000;
            theTest.Send(theTestMail);
            string s = "yes";
            return s;
        }
        catch (Exception ex)
        {
            string s = ex.Message;
            return s;
        }
    }
     public void OTP(string Username, string pass, string to)
    {
        try
        {
            ServicePointManager.SecurityProtocol = SecurityProtocolType.Tls12;

            string msg = "Dear " + Username + ".<br />Your OneTimePassword :-" + pass + " <br/> For Withdraw Request";
            msg += "<br/><br/>Have a great day! <br/><h3>TeamADUSDT BANK<h3/> <br/>visit:-<a href=https://oneroyal.us>https://www.oneroyal.us</a>";
             
             
             
             MailAddress FromMailAddress = new MailAddress(MailUserName, "ADUSDT BANK");
          
          
            MailMessage theTestMail = new MailMessage(FromMailAddress.ToString(), to);
            theTestMail.Body = msg;
            theTestMail.IsBodyHtml = true;
            theTestMail.Priority = MailPriority.High;
            theTestMail.Subject = "Withdrawal OTP(No need to rply)   "; ;

            SmtpClient theTest = new SmtpClient();
            theTest.Port = 587;
            theTest.Timeout = 20000;
            theTest.Host = MailSmtp;
            theTest.UseDefaultCredentials = false;
            theTest.EnableSsl = true;

            System.Net.NetworkCredential theCredential = new System.Net.NetworkCredential(MailUserName, MailPassword);
            theTest.Credentials = theCredential;
            theTest.Send(theTestMail);
            string s = "yes";
           

        }
        catch (Exception ex)
        {
            string s = ex.Message;
            
        }

    }

    public string OTP1(string Username, string msg, string to)
    {
        try
        {
            ServicePointManager.SecurityProtocol = SecurityProtocolType.Tls12;
            string msg1 = "Hello " + Username + ".<br />" + msg + "<br/>";
            msg1 += "<br/><br/>For security purposes, please do not share your personal data with anyone, including ADUSDT BANK support team.";
            msg1 += "<br/><br/>For further assistance, please contact us via chat or email us at admin@oneroyal.us";
            msg1 += "<br/><br/>Regards,<br />The  ADUSDT BANK  Team";
            msg1 += "<br/><br/>Copyright @2023  ADUSDT BANK | Powered by  ADUSDT BANK ";

            MailAddress FromMailAddress = new MailAddress(MailUserName, "ADUSDT BANK");
            MailMessage theTestMail = new MailMessage(FromMailAddress.ToString(), to);
            theTestMail.Body = msg;
            theTestMail.IsBodyHtml = true;
            theTestMail.Priority = MailPriority.High;
            theTestMail.Subject = "[ ADUSDT BANK ] OTP ";

            SmtpClient theTest = new SmtpClient();
            theTest.Port = 587;
            theTest.Timeout = 20000;
            theTest.Host = MailSmtp;
            theTest.UseDefaultCredentials = false;
            theTest.EnableSsl = true;

            System.Net.NetworkCredential theCredential = new System.Net.NetworkCredential(MailUserName, MailPassword);
            theTest.Credentials = theCredential;
            theTest.Send(theTestMail);

            string s = "OTP sent to "+ to + " !!! OTP will be valid for 30 minutes only.";
            return s;

        }
        catch (Exception ex)
        {
            string s = ex.Message;
            return s;
        }

    }

    public string Notification(string Username, string msg, string to)
    {
        try
        {
            string SenderAddress = "admin@oneroyal.us";
            // any address Reciver where the email will be sending
            string toAddress = to;
            //Password of your gmail address
            const string SenderPassword = "Admin@123";
            // Passing the values and make a email formate to display


            MailMessage theTestMail = new MailMessage(SenderAddress, toAddress);
            theTestMail.Body = "HI " + Username + ".<br />" + msg + "<br/>";
            theTestMail.Body += "<br/><br/>Have a great day! <br/><h3>Team ADUSDT BANK<h3/> <br/>visit:-<a href=https://www.oneroyal.us>https://www.oneroyal.us</a>";
            theTestMail.IsBodyHtml = true;
            theTestMail.Priority = MailPriority.High;
            theTestMail.Subject = "No need to rply   " + DateTime.Now;


            SmtpClient theTest = new System.Net.Mail.SmtpClient();
            theTest.Port = 587;
            theTest.Host = "relay-hosting.secureserver.net";//from godaddy;//"smtpout.secureserver.net";// "smtp.gmail.com";
            theTest.UseDefaultCredentials = false;
            theTest.EnableSsl = true;
            theTest.DeliveryMethod = System.Net.Mail.SmtpDeliveryMethod.Network;
            System.Net.NetworkCredential theCredential = new System.Net.NetworkCredential(SenderAddress, SenderPassword);
            theTest.Credentials = theCredential;
            theTest.Timeout = 20000;
            theTest.Send(theTestMail);
            string s = "yes";
            return s;
        }
        catch (Exception ex)
        {
            string s = ex.Message;
            return s;
        }
    }
    public string Pack1(string Name,  string to)
    {
        try
        {

            string SenderAddress = "admin@oneroyal.us";
            // any address Reciver where the email will be sending
            string toAddress = to;
            //Password of your gmail address
            const string SenderPassword = "Admin@123";
            // Passing the values and make a email formate to display


            MailMessage theTestMail = new MailMessage(SenderAddress, toAddress);
            theTestMail.Body = "Dear  " + Name + ",<br />Welcome to ADUSDT BANK Crypto Community. Your Registration has been Successfully completed.<br/>";

            theTestMail.Body += "Please Join Our Premium Group : https://t.me/joinchat/rkNzcSTeBQk0ZWQx <br />";
            theTestMail.Body += "Please reach out to US, If you have any Concerns, simply write a mail to <br />";            
            theTestMail.Body += "admin@oneroyal.us.We're always happy to help you..!!<br /><br />";
            theTestMail.Body += "<br/>Cheers<br/> <h3>Team ADUSDT BANK<h3/> <br/>visit:-<a href=https://www.oneroyal.us>https://www.oneroyal.us</a>";
            theTestMail.IsBodyHtml = true;
            theTestMail.Priority = MailPriority.High;
            theTestMail.Subject = "No need to rply   ";

            SmtpClient theTest = new System.Net.Mail.SmtpClient();
            theTest.Port = 587;
            theTest.Host = "relay-hosting.secureserver.net";//"smtpout.secureserver.net";// "smtp.gmail.com";
            theTest.UseDefaultCredentials = false;
            theTest.EnableSsl = true;
            theTest.DeliveryMethod = System.Net.Mail.SmtpDeliveryMethod.Network;
            System.Net.NetworkCredential theCredential = new System.Net.NetworkCredential(SenderAddress, SenderPassword);
            theTest.Credentials = theCredential;
            theTest.Timeout = 20000;
            theTest.Send(theTestMail);
            string s = "yes";
            return s;
        }
        catch (Exception ex)
        {
            string s = ex.Message;
            return s;
        }
    }
    public string Pack2(string Name, string to)
    {
        try
        {

            string SenderAddress = "admin@oneroyal.us";
            // any address Reciver where the email will be sending
            string toAddress = to;
            //Password of your gmail address
            const string SenderPassword = "Admin@123";
            // Passing the values and make a email formate to display


            MailMessage theTestMail = new MailMessage(SenderAddress, toAddress);
            theTestMail.Body = "Dear  " + Name + ",<br />Welcome to ADUSDT BANK Forex Community. Your Registration has been Successfully completed.<br/>";

            theTestMail.Body += "Please Join Our Premium Group : https://t.me/joinchat/vxdPSpX2uvs3MWRh <br />";
            theTestMail.Body += "Please reach out to US, If you have any Concerns, simply write a mail to <br />";
            theTestMail.Body += "admin@oneroyal.us.We're always happy to help you..!!<br /><br />";
            theTestMail.Body += "<br/>Cheers<br/> <h3>Team ADUSDT BANK<h3/> <br/>visit:-<a href=https://www.oneroyal.us>https://www.oneroyal.us</a>";
            theTestMail.IsBodyHtml = true;
            theTestMail.Priority = MailPriority.High;
            theTestMail.Subject = "No need to rply   ";

            SmtpClient theTest = new System.Net.Mail.SmtpClient();
            theTest.Port = 587;
            theTest.Host = "relay-hosting.secureserver.net";//"smtpout.secureserver.net";// "smtp.gmail.com";
            theTest.UseDefaultCredentials = false;
            theTest.EnableSsl = true;
            theTest.DeliveryMethod = System.Net.Mail.SmtpDeliveryMethod.Network;
            System.Net.NetworkCredential theCredential = new System.Net.NetworkCredential(SenderAddress, SenderPassword);
            theTest.Credentials = theCredential;
            theTest.Timeout = 20000;
            theTest.Send(theTestMail);
            string s = "yes";
            return s;
        }
        catch (Exception ex)
        {
            string s = ex.Message;
            return s;
        }
    }
    public string Pack3(string Name, string to)
    {
        try
        {

            string SenderAddress = "admin@oneroyal.us";
            // any address Reciver where the email will be sending
            string toAddress = to;
            //Password of your gmail address
            const string SenderPassword = "Admin@123";
            // Passing the values and make a email formate to display


            MailMessage theTestMail = new MailMessage(SenderAddress, toAddress);
            theTestMail.Body = "Dear  " + Name + ",<br />Welcome to ADUSDT BANK Crypto/Forex  Community. Your Registration has been Successfully completed.<br/>";

            theTestMail.Body += "Please Join Our Crypto Premium Group : https://t.me/joinchat/rkNzcSTeBQk0ZWQx <br />";
            theTestMail.Body += "Please Join Our Forex  Premium Group : https://t.me/joinchat/vxdPSpX2uvs3MWRh <br />";
            theTestMail.Body += "Please reach out to US, If you have any Concerns, simply write a mail to <br />";
            theTestMail.Body += "admin@oneroyal.us.We're always happy to help you..!!<br /><br />";
            theTestMail.Body += "<br/>Cheers<br/> <h3>Team ADUSDT BANK<h3/> <br/>visit:-<a href=https://www.oneroyal.us>https://www.oneroyal.us</a>";
            theTestMail.IsBodyHtml = true;
            theTestMail.Priority = MailPriority.High;
            theTestMail.Subject = "No need to rply   ";

            SmtpClient theTest = new System.Net.Mail.SmtpClient();
            theTest.Port = 587;
            theTest.Host = "relay-hosting.secureserver.net";//"smtpout.secureserver.net";// "smtp.gmail.com";
            theTest.UseDefaultCredentials = false;
            theTest.EnableSsl = true;
            theTest.DeliveryMethod = System.Net.Mail.SmtpDeliveryMethod.Network;
            System.Net.NetworkCredential theCredential = new System.Net.NetworkCredential(SenderAddress, SenderPassword);
            theTest.Credentials = theCredential;
            theTest.Timeout = 20000;
            theTest.Send(theTestMail);
            string s = "yes";
            return s;
        }
        catch (Exception ex)
        {
            string s = ex.Message;
            return s;
        }
    }

}