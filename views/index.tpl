<!DOCTYPE html>
<html>

    <head>
        <title>不知道神马系统</title>
        <!-- Bootstrap -->
        <link href="static/bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen">
        <link href="static/bootstrap/css/bootstrap-responsive.min.css" rel="stylesheet" media="screen">
        <link href="static/assets/styles.css" rel="stylesheet" media="screen">
        <link href="static/assets/DT_bootstrap.css" rel="stylesheet" media="screen">
        <link href="//cdn.datatables.net/1.10.11/css/jquery.dataTables.min.css" rel="stylesheet" media="screen">
        <link href="static/bootstrap/css/bootstrap-datetimepicker.min.css" rel="stylesheet" media="screen">
        <!--[if lte IE 8]><script language="javascript" type="text/javascript" src="vendors/flot/excanvas.min.js"></script><![endif]-->
        <!-- HTML5 shim, for IE6-8 support of HTML5 elements -->
        <!--[if lt IE 9]>
            <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
        <![endif]-->
        <style>
          table tbody td {
            text-align: center;
          }

          .dataTables_length {
            margin-top:10px
          }
          .date_format {
            width:200px
          }
        </style>
        <script src="static/vendors/modernizr-2.6.2-respond-1.1.0.min.js"></script>
    </head>

    <body>
        <div class="navbar navbar-fixed-top">
            <div class="navbar-inner">
                <div class="container-fluid">
                    <a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse"> <span class="icon-bar"></span>
                     <span class="icon-bar"></span>
                     <span class="icon-bar"></span>
                    </a>
                    <a class="brand" href="#">Admin Panel</a>
                    <div class="nav-collapse collapse">

                        <ul class="nav">
                            <li class="active">
                                <a href="#">Dashboard</a>
                            </li>

                        </ul>
                    </div>
                    <!--/.nav-collapse -->
                </div>
            </div>
        </div>
        <div class="container-fluid">
            <div class="row-fluid">


                <!--/span-->
                <div class="span12" id="content">
                  <div class="row-fluid">
                    <div class="span4">
                      开始时间：

                      <div class="input-append date form_datetime">
                          <input size="16" type="text" value="" id="startTime">
                      </div>

                    </div>
                    <div class="span4">
                      结束时间:

                      <div class="input-append date form_datetime">
                          <input size="16" type="text" value="" id="endTime">
                      </div>
                    </div>
                  </div>
                  <div class="row-fluid">
                    <div class="span4">
                      司机电话：<input type="text" id="driverMobile">
                    </div>
                    <div class="span4">
                      乘客电话: <input type="text" id="passMobile">
                    </div>
                    <div class="span4">
                      <input type="button" value="查询" onclick="query()"/>
                    </div>
                  </div>

                  <div class="block">
                    <div class="navbar navbar-inner block-header">
                                <div class="muted pull-left">查询结果</div>
                            </div>
                  <table id="searchTable" class="display" cellspacing="0" width="100%">
                      <thead>
                          <tr>
                              <th>Name</th>
                              <th>Position</th>
                              <th>Office</th>
                              <th>Extn.</th>
                              <th>Start date</th>
                          </tr>
                      </thead>
                    </table>
                </div>
            </div>
          </div>
            <hr>
            <footer>
                <p>&copy; 滴滴出行</p>
            </footer>
        </div>
        <!--/.fluid-container-->

        <script src="static/vendors/jquery-1.9.1.js"></script>
        <script src="static/bootstrap/js/bootstrap.min.js"></script>
        <script src="//cdn.datatables.net/1.10.11/js/jquery.dataTables.min.js"></script>
<script src="static/bootstrap/js/bootstrap-datetimepicker.js"></script>
        <script>
        $(function() {
          table = $('#searchTable').DataTable( {
            "ajax": {
                  "url": '/search',
                  "type": 'get',
                  "data": buildSearchData
              },
              paging: true,
              searching : false
             } );

             $("#startTime").datetimepicker({
                autoclose: true,
                todayBtn: true,
                pickerPosition: "bottom-left"
            });
            $("#endTime").datetimepicker({
                  autoclose: true,
                  todayBtn: true,
                  pickerPosition: "bottom-left"
              });
        });

        function buildSearchData() {
          return {
            'startTime' : $("#startTime").val(),
            'endTime' :   $("#endTime").val(),
            'passMobile' : $("#passMobile").val(),
            'driverMobile' : $("#driverMobile").val()
          }
        }

        function validate() {
          if(!$("#startTime").val()) {
            alert("起始时间不能为空")
            return false
          }

          if(!$("#endTime").val()) {
            alert("结束时间不能为空")
            return false
          }

          if(!$("#passMobile").val() && !$("#driverMobile").val() ) {
            alert("司机号码和乘客号码不能同时为空")
            return false
          }

          return true
        }
        function query() {
          if(validate())
            table.ajax.reload()
        }
        </script>
    </body>

</html>
