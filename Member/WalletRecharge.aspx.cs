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
public partial class User_WalletRecharge : System.Web.UI.Page
{
    clsTimeZone objtime = new clsTimeZone();
    clsConnection objcon = new clsConnection();
    clsValidation objValidation = new clsValidation();
    clsAMD objamd = new clsAMD();
    clsList objlist = new clsList();
    string Tid = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            // myInput.Value = BNBAddres.Text;
            payment();

        }
        if (IsPostBack && FileUpload1.PostedFile != null)
        {

            if (FileUpload1.PostedFile.FileName.Length > 0)

            {
                if (FileUpload1.HasFile)
                {
                    if (!objValidation.IsExtenstion(FileUpload1, "Image"))
                    {
                        string UploadedImageType = FileUpload1.PostedFile.ContentType.ToString().ToLower();
                        string UploadedImageFileName = FileUpload1.PostedFile.FileName;

                        //Create an image object from the uploaded file
                        System.Drawing.Image UploadedImage = System.Drawing.Image.FromStream(FileUpload1.PostedFile.InputStream);

                        string ThumbnailImage = System.IO.Path.GetFileName(FileUpload1.PostedFile.FileName);
                        string extenion = System.IO.Path.GetExtension(FileUpload1.PostedFile.FileName);
                        string imgurl = SessionData.Get<string>("newuser") + "ReceiptAmount" + txtAmount.Text;
                        imgurl += ThumbnailImage;
                        string imgPath = "../SoftImg/Wallet/" + imgurl;
                        FileUpload1.SaveAs(Server.MapPath(imgPath.Trim()));
                        Image1.ImageUrl = imgPath;

                        hndurl.Value = imgPath;


                    }
                }
            }
        }
    }

    void payment()
    {
        DataTable pro = objlist.CompanyBankMaster(0, "", "", "", "", "", "", "", "", "L");


        drpPaymentMode.DataSource = pro;


        drpPaymentMode.DataBind();
        drpPaymentMode.Items.Insert(0, "--Select--");
    }

    protected void bntsubmit_Click(object sender, EventArgs e)
    {
        try
        {
            if (hndurl.Value != "")
            {
                int a = objamd.RepuchaseRequest(0, SessionData.Get<string>("newuser"), txtAmount.Text, hndurl.Value, "Pending", objtime.returnStringServerMachTime(), "", "", "", drpPaymentMode.SelectedItem.Text,txtremark.Text, "Repurchase","N");
                if (a > 0)
                {
                    danger.Visible = false;
                    lbinfo.Text = " Request sent successfully";
                    info.Visible = true;


                }
                else if (a == -1)
                {
                    info.Visible = false;
                    lbdanger.Text = "Request Under Process Or TXID/HASHCODE Already Exist!!";
                    danger.Visible = true;
                }
                else
                {
                    info.Visible = false;
                    lbdanger.Text = "Oops! Request has not sent successfully";
                    danger.Visible = true;
                }
            }
            else
            {
                info.Visible = false;
                danger.Visible = true;
                lbdanger.Text = "Plz select upload file.......";
                return;

            }

        



        }
        catch (Exception ex)
        {
            //Response.Redirect("../error.aspx?error=" + ex.Message);
        }

           
      
    }
    //protected void btncencel_Click(object sender, EventArgs e)
    //{
    //    Response.Redirect("Home.aspx");
    //}


    protected void drpbankname_SelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {


            DataTable pro = objlist.CompanyBankMaster(0, drpPaymentMode.SelectedItem.Text, "", "", "", "", "", "", "", "S");

            if (pro.Rows.Count > 0)
            {

                
                    divupi.Visible = true;
                    div1.Visible = true;

                    UPIID.Text = pro.Rows[0]["UPI"].ToString();
                    myInput.Value = UPIID.Text;
                    hndqr.Value = pro.Rows[0]["QRCode"].ToString();
                Img1.Src = hndqr.Value;
                lbqr.Text = drpPaymentMode.SelectedItem.Text+" QR Code";



            }
            else
            {
                lbdanger.Text = "No Payment Mode Available !!! Please Contact Admin";
                danger.Visible = true;
            }





        }
        catch (Exception ex)
        {

        }

    }
   
}