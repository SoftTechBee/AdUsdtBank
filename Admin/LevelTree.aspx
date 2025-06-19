<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" CodeFile="LevelTree.aspx.cs" Inherits="User_LevelTree" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
       <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
    <link href="https://ajax.googleapis.com/ajax/static/modules/gviz/1.0/orgchart/orgchart.css" rel="stylesheet" />
     <script type="text/javascript">
    
    function NewWindow(mypage, myname, w, h, scroll) {
        var winl = (screen.width - w) / 2;
        var wint = (screen.height - h) / 2;
        winprops = 'height=' + h + ',width=' + w + ',resizable, top=' + wint + ',left=' + winl + ',scrollbars=' + scroll + ','
        win = window.open(mypage, myname, winprops)
        if (parseInt(navigator.appVersion) >= 4) { win.window.focus(); }
    }
</script>
    <link href="../Mycss/Tree.css" rel="stylesheet" />
    
        
            <div class="alert alert-danger alert-dismissible" id="danger"  runat="server"  visible="false">
                <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                <h4><i class="icon fa fa-ban"></i> Alert!</h4>
            <asp:Label ID="lbdanger" runat="server" Text="There is  some thing wrong........."></asp:Label> 
              </div>
      

                        
                        <script type="text/javascript" src="https://www.google.com/jsapi"></script>
                        
                          <script type="text/javascript">
                              google.load("visualization", "1", { packages: ["orgchart"] });
                              google.setOnLoadCallback(drawChart);
                              function drawChart() {
                                  $.ajax({
                                      type: "POST",
                                      url: "LevelTree.aspx/FunTreeView",
                                      data: '{}',
                                      contentType: "application/json; charset=utf-8",
                                      dataType: "json",
                                      success: function (r) {
                                          //  alert(r.d);

                                          var maindata = eval(r.d);
                                          //  alert(maindata[0].UserName);
                                          var data = new google.visualization.DataTable();
                                          data.addColumn('string', 'Entity');
                                          data.addColumn('string', 'ParentEntity');
                                          data.addColumn('string', 'ToolTip');
                                          data.addColumn('string', 'ImageName');
                                          data.addColumn('string', 'UserName');

                                          if (maindata.length > 0) {
                                              for (var i = 0; i < maindata.length; i++) {
                                                  var UserName = maindata[i].UserName;
                                                  var memberName = maindata[i].Name;
                                                  var parentId = maindata[i].ParentID;
                                                  var memberId = maindata[i].MemberID;
                                                  var TeamBus = maindata[i].TeamBus;
                                                  var Direct = maindata[i].Direct;
                                                  var Team = maindata[i].Team;
                                                  var JoinAmount = maindata[i].JoinAmount;

                                                  var ImageName = '../SoftImg/R.png';

                                                  var status = maindata[i].Status
                                                  var RankName = maindata[i].RANKNAME;
                                                  var color = '#F01B0A';
                                                  if (status == "Active") {
                                                      color = '#076E25';
                                                      var ImageName = '../SoftImg/G.png';
                                                  }
                                                  data.addRows([[{
                                                      v: memberId,
                                                      f: '<div  style="background: #184068; width: 110px;" ><a href="LevelTreeView.aspx?upline=' + UserName + '"><img src ="' + ImageName + '" alt="' + UserName + '" height="40" width="40" /></a><br/><span style="font-size: 12px;"> Id: ' + UserName + '<span/>  <span style="font-size: 12px;">Wallet: ' + memberName + '<span/> </div>'
                                                      //f: '<div  style="background: #184068; width: 110px;" ><a href="LevelTreeView.aspx?upline=' + UserName + '"><img src ="' + ImageName + '" alt="' + UserName + '" height="40" width="40" /></a><br/><span style="font-size: 12px;">{ Id: ' + UserName + '<span/>} {<span style="font-size: 12px;">Name: ' + memberName + '<span/>} {<span style="font-size: 12px;">SelfBuss: ' + JoinAmount + '<span/>} {<span style="font-size: 12px;">TeamBuss: ' + TeamBus + '<span/>} {<span style="font-size: 12px;">Direct: ' + Direct + '<span/>} {<span style="font-size: 12px;">Teams: ' + Team + '<span/>}</div>'

                                                  }, parentId, memberName, ImageName, UserName]]);


                                              }
                                          }
                                          var chart = new google.visualization.OrgChart($("#chart")[0]);
                                          chart.draw(data, { allowHtml: true, size: 'large' });
                                      },
                                      failure: function (r) {
                                          alert(r.d);
                                      },
                                      error: function (r) {
                                          // alert('hi');
                                          alert(r.d);
                                      }
                                  });
                              }
                          </script>


                        <style>
                            .google-visualization-orgchart-nodesel{
                                background:none;
                                border:1px solid #fff;


                            }
                            .google-visualization-orgchart-node{
                                 background:none;
                                border:1px solid #fff;
                                box-shadow:none;

                            }
                           /*  .google-visualization-orgchart-linebottom{
                                border-bottom:1px solid #fff; 
                            }
                             .google-visualization-orgchart-lineleft{
                                 border-left:1px solid #fff;
                             }
                             .google-visualization-orgchart-lineright{
                                 border-right:1px solid #fff;
                             }*/
                        </style>
      <div class="page-content">
                    <div class="container-fluid">

                        <!-- start page title -->
                        <div class="row">
                            <div class="col-12">
                                <div class="page-title-box d-flex align-items-center justify-content-between">
                                    <h4 class="mb-0">My Tree</h4>

                                    <div class="page-title-right">
                                        <ol class="breadcrumb m-0">
                                          <%--<li class="breadcrumb-item"><a href="javascript: void(0);">Minible</a></li>--%>
                                            <li class="breadcrumb-item active"><a href="Home.aspx">Home</a>/My Tree</li>
                                        </ol>
                                    </div>

                                </div>
                            </div>
                        </div>
                        <!-- end page title -->
                         <div class="card">
      
                                <div class="card-body">
                                      <div class="form-horizontal">
                                  
                          
                                      <div class="form-group row">
         <div class="input-group input-group-sm" style="margin-top:30px;">
           <asp:TextBox ID="txtsearch" CssClass="form-control" runat="server" placeholder="Enter UserName"></asp:TextBox>
               
                    <span class="input-group-btn">
          <asp:Button ID="btnsearch" runat="server" Text="Go!"   OnClick="btnsearch_Click1" CssClass="btn btn-info btn-flat btn-lg"  />
                    
                    </span>
              </div>
                                        </div>
                        
      
                             <div class="form-group row">
                                <div class="col-lg-12">
                        <div id="chart"  style="overflow:auto;">
                        </div>
                                    </div>
                                 </div>
                                          </div>
                                    </div>
                             </div>
                        </div>
          </div>
    
                    
                 

<!-- page script -->
</asp:Content>

