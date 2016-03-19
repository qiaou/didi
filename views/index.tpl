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
        @import url('https://rawgithub.com/ashleydw/typeahead.js-bootstrap.css/master/typeahead.js-bootstrap.css');
          table tbody td {
            text-align: center;
          }

          .dataTables_length {
            margin-top:10px
          }
          .date_format {
            width:200px
          }
          .twitter-typeahead {
            width:inherit;
            height: 30px;
          }
          .span4 .tt-hint {
            height: 20px
          }

          #cityCode {
            height: 20px
          }

          .span12 .row-fluid label{
              width: 70px;
              display: inline-block;
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
                      <label for="startTime">开始时间：</label>

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
                      <label for="endTime">结束时间</label>
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
                    <div class="span4">
                      <label for="cityCode">城市：</label>
                      <input name="cityCode" type="text" id="cityCode"  autocomplete="off"/>
                    </div>
                  </div>
                  <div class="row-fluid">
                    <div class="span4">
                        <label for="driverMobile">司机手机：</label> <input type="text" id="driverMobile">
                    </div>
                    <div class="span4">
                      <label for="passengerMobile">乘客手机: </label><input type="text" id="passengerMobile">
                    </div>
                  </div>
                  <div class="row-fluid">
                    <div class="span4">
                        <label for="driverid">司机ID：</label> <input type="text" id="driverid">
                    </div>
                    <div class="span4">
                      <label for="orderId">订单ID: </label><input type="text" id="orderId">
                    </div>
                    <div class="span4">
                      <input type="button" value="查询" onclick="query()"/>
                      <input type="button" value="查询signIn事件" onclick="querySignIn()"/>
                    </div>
                  </div>

                  <div class="block" id="searchTableBlock">
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
                              <th style="width:250px;overflow:hidden;text-overflow:clip;">详细信息</th>
                          </tr>
                      </thead>
                    </table>
                </div>
                <div class="block" id="tableWithOrderIdBlock" style="display:none">
                  <div class="navbar navbar-inner block-header">
                              <div class="muted pull-left">OrderId查询结果</div>
                              <div class="muted pull-left" style="float:right"><a href="#" onclick='goBackSearchTable("tableWithOrderIdBlock")'>返回</a></div>
                          </div>
                  <table id="tableWithOrderId" class="display" cellspacing="0" width="100%" >
                    <thead>
                        <tr>
                            <th>时间</th>
                            <th>事件</th>
                            <th>城市</th>
                            <th>订单ID</th>
                            <th>司机ID-2</th>
                            <th style="width:250px;overflow:hidden;text-overflow:clip;">详细信息</th>
                        </tr>
                    </thead>
                  </table>
                </div>
                <div class="block" id="tableWithSignInBlock" style="display:none">
                  <div class="navbar navbar-inner block-header">
                              <div class="muted pull-left">SignIn事件查询</div>
                              <div class="muted pull-left" style="float:right"><a href="#" onclick='goBackSearchTable("tableWithSignInBlock")'>返回</a></div>
                          </div>
                  <table id="tableWithSignIn" class="display" cellspacing="0" width="100%" >
                    <thead>
                        <tr>
                            <th>时间</th>
                            <th>事件</th>
                            <th>城市</th>
                            <th>订单ID</th>
                            <th>司机ID-2</th>
                            <th style="width:250px;overflow:hidden;text-overflow:clip;">详细信息</th>
                        </tr>
                    </thead>
                  </table>
                </div>
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
        <script src="https://rawgit.com/zeMirco/typeahead.js/master/dist/typeahead.min.js"></script>
        <script>
        $(function() {

            $('#cityCode').typeahead(
            {
              name: 'my-dataset',
              local: ['Aaaa', 'Abbb', 'Accc']
            });

            table = $('#searchTable').DataTable( {
              "ajax": {
                    "url": '/search',
                    "type": 'get',
                    "data": buildSearchData
                },
                paging: true,
                searching : false
               } );


             tableWithOrderId = $('#tableWithOrderId').DataTable( {
               "ajax": {
                     "url": '/search',
                     "type": 'get',
                     "data": buildSearchDataWithOrderId
                 },
                 paging: true,
                 searching : false
                } )

                tableWithSignIn = $('#tableWithSignIn').DataTable( {
                  "ajax": {
                        "url": '/search',
                        "type": 'get',
                        "data": buildSearchDataWithSignIn
                    },
                    paging: true,
                    searching : false
                   } )
            $("#startTimePicker").datetimepicker({
              language: 'pt-BR'
            });
            $("#endTimePicker").datetimepicker({
                  autoclose: true,
                  todayBtn: true,
                  pickerPosition: "bottom-left"
              });
              $("#searchTable").click(function(e){
                if($(e.target).prop("tagName") == 'A') {
                  var orderId = $(e.target).html();
                  tableWithOrderId.ajax.reload();
                  $("#orderId").val(orderId);
                  $("#searchTableBlock").fadeOut();
                  $("#tableWithOrderIdBlock").fadeIn();
                  return;
                }
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
            'passengerMobile' : $("#passengerMobile").val(),
            'driverid' : $("#driverid").val(),
            'signIn' : 0
          }
        }

        function buildSearchDataWithOrderId() {
          var result = buildSearchData()
          result['orderId'] = $("#orderId").val()
          return result
        }

        function buildSearchDataWithSignIn() {
          var result = buildSearchData()
          result['signIn'] = 1
          return result
        }

        function goBackSearchTable(id) {

          $("#"+id).fadeOut()
          $("#searchTableBlock").fadeIn()
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

          if(!$("#passengerMobile").val() && !$("#driverid").val() &&!$("#orderId").val() && !$("#driverMobile").val()) {
            alert("司机ID,乘客ID,司机手,订单ID不能同时为空")
            return false
          }

          return true
        }
        function query() {
          if(validate()){
            if(!!$("#passengerMobile").val() || !!$("#orderId").val()) {
              toggleBetweenTable("tableWithSignInBlock","searchTableBlock");
              toggleBetweenTable("tableWithOrderIdBlock","searchTableBlock");
              table.ajax.reload()
            } else if(!!$("#driverid").val() || !!$("#driverMobile").val() ) {
              toggleBetweenTable("searchTableBlock","tableWithOrderIdBlock");
              toggleBetweenTable("tableWithSignInBlock","tableWithOrderIdBlock");
              tableWithOrderId.ajax.reload()
            }
          }
        }

        function querySignIn() {
          if(validate()) {
            toggleBetweenTable("tableWithOrderIdBlock","tableWithSignInBlock");
            toggleBetweenTable("searchTableBlock","tableWithSignInBlock");
            tableWithSignIn.ajax.reload();
          }
        }

        function toggleBetweenTable(fadeOutId,fadeInId) {
          $("#"+fadeOutId).fadeOut();
          $("#"+fadeInId).fadeIn();
        }
        </script>
    </body>

</html>
