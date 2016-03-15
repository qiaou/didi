<!DOCTYPE html>
<html>

    <head>
        <title>Disou Systemm</title>
        <!-- Bootstrap -->
        <link href="static/bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen">
        <link href="static/bootstrap/css/bootstrap-responsive.min.css" rel="stylesheet" media="screen">
        <link href="static/assets/styles.css" rel="stylesheet" media="screen">
        <link href="static/assets/DT_bootstrap.css" rel="stylesheet" media="screen">
        <link href="//cdn.datatables.net/1.10.11/css/jquery.dataTables.min.css" rel="stylesheet" media="screen">
        <!-- <link href="static/bootstrap/css/bootstrap-datetimepicker.min.css" rel="stylesheet" media="screen"> -->
        <link href="static/css/bootstrap-datetimepicker.min.css" rel="stylesheet" media="screen">
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
                        <div id="startTimePicker" class="input-append">
                          <input data-format="yyyy-MM-dd hh:mm:ss" type="text" id="startTime"></input>
                          <span class="add-on">
                            <i data-time-icon="icon-time" data-date-icon="icon-calendar">
                            </i>
                          </span>
                        </div>
                      </div>

                    </div>
                    <div class="span4">
                      结束时间:

                      <div class="input-append date form_datetime">
                        <div id="endTimePicker" class="input-append">
                          <input data-format="yyyy-MM-dd hh:mm:ss" type="text" id="endTime"></input>
                          <span class="add-on">
                            <i data-time-icon="icon-time" data-date-icon="icon-calendar">
                            </i>
                          </span>
                        </div>
                      </div>
                    </div>
                  </div>
                  <div class="row-fluid">
                    <div class="span4">
                      司机ID：<input type="text" id="driverid">
                    </div>
                    <div class="span4">
                      乘客ID: <input type="text" id="passengerid">
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
                              <th>时间</th>
                              <th>事件</th>
                              <th>城市</th>
                              <th>订单ID</th>
                              <th>司机ID</th>
                              <th style="width:250px">详细信息</th>
                          </tr>
                      </thead>
                    </table>
                </div>
            </div>
          </div>
            <hr>
            <footer>
                <p>&copy;gy</p>
            </footer>
        </div>
        <!--/.fluid-container-->

        <!-- 模态框（Modal） -->
        <div class="modal fade" id="myModal" tabindex="-1" role="dialog"
           aria-labelledby="myModalLabel" aria-hidden="true">
           <div class="modal-dialog">
              <div class="modal-content">
                 <div class="modal-header">
                    <button type="button" class="close"
                       data-dismiss="modal" aria-hidden="true">
                          &times;
                    </button>
                    <h4 class="modal-title" id="myModalLabel">
                       详细信息
                    </h4>
                 </div>
                 <div class="modal-body">
                    <table id="detailMsgTable">

                    </table>
                 </div>
                 <div class="modal-footer">
                    <button type="button" class="btn btn-default"
                       data-dismiss="modal">关闭
                    </button>
                </div>
              </div><!-- /.modal-content -->
        </div><!-- /.modal -->
        <script src="static/vendors/jquery-1.9.1.js"></script>
        <script src="static/bootstrap/js/bootstrap.min.js"></script>
        <script src="//cdn.datatables.net/1.10.11/js/jquery.dataTables.min.js"></script>
        <!-- <script src="static/bootstrap/js/bootstrap-datetimepicker.js"></script> -->
        <script src="static/js/bootstrap-datetimepicker.min.js"></script>
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

            $("#startTimePicker").datetimepicker({
              language: 'pt-BR'
            });
            $("#endTimePicker").datetimepicker({
                  autoclose: true,
                  todayBtn: true,
                  pickerPosition: "bottom-left"
              });
              $("#searchTable").click(function(e){
                var parent = $(e.target).parent()
                var header =  getHeader()
                var content = getContent(parent)
                var body = buildObject(header,content)
                $("#detailMsgTable").html("")
                for(var key in body) {
                  var tr = $("<tr height='50px'><td style='text-align:center;width:100px'>"+key+"</td><td style='text-align:left;width:400px'>"+body[key]+"</td></tr>")
                  $("#detailMsgTable").append(tr)
                }
                $('#myModal').modal('show')
              })
        });


        function getHeader() {
          var header = [];
          $("#searchTable th").each(function(i,m){header.push($(m).html())})
          return header
        }
        function getContent(target) {
          var header = [];
          $("td",target).each(function(i,m){header.push($(m).html())})
          return header
        }

        function buildObject(header,content) {
          var result = {};
          for(var i = 0 ;i < header.length; i++) {
            result[header[i]] = content[i]
          }

          return result;
        }

        function buildSearchData() {
          return {
            'startTime' : $("#startTime").val(),
            'endTime' :   $("#endTime").val(),
            'passengerid' : $("#passengerid").val(),
            'driverid' : $("#driverid").val()
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

          if(!$("#passengerid").val() && !$("#driverid").val() ) {
            alert("司机ID和乘客ID不能同时为空")
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
