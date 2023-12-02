<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.io.File" %>
<%
	Date nowTime = new Date();
	SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd a hh:mm");
%>
<% 
  /**
  * @Class Name : egovSampleList.jsp
  * @Description : Sample List 화면
  * @Modification Information
  *
  *   수정일         수정자                   수정내용
  *  -------    --------    ---------------------------
  *  2019.11.01            최초 생성
  *
  * author 남기서ㅇ
  * since 2019.11.01
  *
  * Copyright (C) 2009 by Taehee All right reserved.
  */
%>


<%@ include file="includes/head.jsp" %>
<%@ include file="includes/header.jsp" %>
<%@ include file="includes/leftSidebar.jsp" %>
<script>
setInterval("nowDate()",1000); 
function nowDate(){ 
	var now = new Date(); 
	var year = now.getFullYear();
	var month = now.getMonth()+1;
	var day = now.getDate();
	var hours = now.getHours(); 
	var minutes = now.getMinutes(); 
	var seconds = now.getSeconds(); 
	if (hours > 12){ hours -= 12; ampm = " 오후 "; }else{ ampm = " 오전 "; } 
	if (hours < 10){ hours = "0" + hours; } 
	if (minutes < 10){ minutes = "0" + minutes; } 
	if (seconds < 10){ seconds = "0" + seconds; } 
	document.getElementById("nowDate").innerHTML = year + "-" + month+"-" + day + ampm + hours + ":" + minutes}

</script>
    <script type="text/javaScript" language="javascript" defer="defer">
        <!--
        /* 글 수정 화면 function */
        function fn_egov_select(id) {
        	document.listForm.selectedId.value = id;
           	document.listForm.action = "<c:url value='/updateUserView.do'/>";
           	document.listForm.submit();
        }
        //-->
        function systemSChange(obj){

		    var aTag = document.getElementById('systemS');
		    aTag.style.display = "none";
		    var aTag = document.getElementById('systemE');
		    aTag.style.display = "block";
		    document.getElementById('running').style.display = "none";
		    document.getElementById('stop').style.display = "block";
				//$(".system").hidden(true);
		}
        function systemEChange(obj){

		    var aTag = document.getElementById('systemE');
		    aTag.style.display = "none";
		    var aTag = document.getElementById('systemS');
		    aTag.style.display = "block";
		    document.getElementById('running').style.display = "block";
		    document.getElementById('stop').style.display = "none";
				//$(".system").hidden(true);
		}
    </script>

<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
        <h1>
            SA System
            <small>This Section Provides detailed information about SA System</small>
        </h1>

    </section>

    <!-- Main content -->

    <section class="content">

        <div class="clearfix" ></div>
        <div class="col-xs-12" >
        
            <!-- Default box -->
            <div class="box">
                <div class="box-header with-border">

                <form action="mainHeader" method="POST">
                <table style="width: 100%" border="0">
                    <tr style="height: 40px">
                        <td class="col-sm-2"><label>현재시간 : </label></td>
                        <td class="col-sm-3"><span id="nowDate"><%= sf.format(nowTime) %></span></td>
                        <td class="col-sm-2"><label>시각동기상태 : </label></td>
                        <td class="col-sm-2">정상</td>
                        <td class="col-sm-2"><label>시스템 동작 상태 : </label></td>
                        <td class="col-sm-3"><span id="running">동작중</span><span id="stop" style='display:none;'>동작중지</span></td>
                        <td class="col-sm-4">
                        <button type="button" id="systemS" onclick='systemSChange(this)' class="btn btn-sm btn-warning">시스템중지</button>
                        <button type="button" id="systemE" onclick='systemEChange(this)' class="btn btn-sm btn-primary" style='display:none;'>시스템동작</button>
                        </td>
                    </tr>
                 </table>
                 <table style="width: 100%" border="0">
<%


String  drive;
double  totalSize, freeSize, useSize, usedPercent;     
File[] roots = File.listRoots();

for (File root : roots) {
drive = root.getAbsolutePath();
totalSize = root.getTotalSpace() / Math.pow(1024, 3);
useSize = root.getUsableSpace() / Math.pow(1024, 3);//남은용량
freeSize = totalSize - useSize;//사용량

usedPercent = 100*freeSize / totalSize;
if((int)totalSize > 0){
%>
                    <tr style="height: 40px">
                        <td class="col-sm-3"><label>Driver <%=drive %> 저장공간 용량</label></td>
                        <td width="80" align="right"><button type="button" class="btn btn-sm btn-default">HDD <%=(int)totalSize %> G</button></td>
                        <td colspan="4" align="left" valign="baseline"><br>
	                        <div class="progress">
							  <div class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="40"
							  aria-valuemin="0" aria-valuemax="100" style="width:<%=(int)usedPercent %>%">
							    사용량 <%=(int)usedPercent %>%
							  </div>
							</div>
                        </td>
                        <td class="col-sm-2">&nbsp;</td>
                    </tr>
<%

}
}
%>                    
                </table>
                </form>




                </div>

                <!-- 이상상태요약 시작 -->
            	<div class="box-body">
            	<section class="content-header">
			        <h1>
			            <small><label>이상상태 요약</label></small>
			        </h1>
			    </section>
			    <section class="content">

		        <div class="clearfix" ></div>
		        
		        <!-- div class="col-xs-12" -->
		        
		            <!-- Default box -->
		            <div class="box">
		            
		                <div class="box-header with-border">
                		<table class="table table-bordered table-striped" id="tbl1" >
	                    <thead>
	                        <tr>
	                            <th class="secondary-text hidden-xs">
	                                <div class="table-header">
	                                    <span class="column-title"></span>
	                                </div>
	                            </th>
								<th class="secondary-text hidden-xs">
	                                <div class="table-header">
	                                    <span class="column-title">로그인시간</span>
	                                </div>
	                            </th>
	                            <th class="secondary-text">
	                                <div class="table-header">
	                                    <span class="column-title">로그아웃시간</span>
	                                </div>
	                            </th>
	                            <th class="secondary-text hidden-xs">
	                                <div class="table-header">
	                                    <span class="column-title">백본메인이상</span>
	                                </div>
	                            </th>
								<th class="secondary-text">
	                                <div class="table-header">
	                                    <span class="column-title">백본백업이상</span>
	                                </div>
	                            </th>
	                            <th class="secondary-text">
	                                <div class="table-header">
	                                    <span class="column-title">엑세스이상</span>
	                                </div>
	                            </th>
	                            <th class="secondary-text">
	                                <div class="table-header">
	                                    <span class="column-title">MMS이상</span>
	                                </div>
	                            </th>
	                            <th class="secondary-text">
	                                <div class="table-header">
	                                    <span class="column-title">GOOSE이상</span>
	                                </div>
	                            </th>
	
	                        </tr>
	                    </thead>
	                    <tbody id="repotbl" >
	                    <c:forEach var="result" items="${errorSummList}" varStatus="status">
            				<tr>
                                <td class="listtd"><a href="#" data-toggle="modal" data-target="#myModal_${status.index}">선택</a></td>
                                <td class="listtd"><c:out value="${result.loginTime}"/></td>
                                <td class="listtd"><c:out value="${result.logoutTime}"/></td>
                                <td class="listtd"><c:out value="${result.backMain}"/>개</td>
                                <td class="listtd"><c:out value="${result.backBackup}"/>개</td>
                                <td class="listtd"><c:out value="${result.access}"/>개</td>
                                <td class="listtd"><c:out value="${result.mms}"/>개</td>
                                <td class="listtd"><c:out value="${result.goose}"/>개</td>
                            </tr>
                            


                            <!-- Modal -->
                                <div id="myModal_${status.index}" class="modal fade" role="dialog"">
                                    <div class="modal-dialog" style="width:950px;">

                                        <!-- Modal content-->
                                        <div class="modal-content">
                                        <form action="/index.php/Admin/modAdvertiser" method="POST" onsubmit="return upfregisterform_submit(this);" enctype="multipart/form-data">
                                        <div class="modal-header" >
                                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                                            <h4 class="modal-title">자동삭제기준${status.index}</h4>
                                        </div>
                                        <div class="modal-body">
                                        <div style="margin-top:5px;" class="row">
                                                <label class="col-sm-3" style="width:150px;">ID:</label>
                                                <div class="col-sm-3">id</div>
                                            </div>
                                            <div style="margin-top:5px;" class="row">
                                                <label class="col-sm-3" style="width:150px;">Type:</label>
                                                <div class="col-sm-5">type_name</div>
                                            </div>
                                            <div style="margin-top:5px;" class="row" >
                                                <label class="col-sm-3" style="width:150px;">Title:</label>
                                                <div class="col-sm-4">title</div>
                                                <label class="col-sm-4">&nbsp;</label>
                                            </div>
                                            <div style="margin-top:5px;" class="row" >
                                                <label class="col-sm-3" style="width:150px;">Address:</label>
                                                <div class="col-sm-8">address</div>
                                                <label class="col-sm-4">&nbsp;</label>
                                            </div>
                                            <div style="margin-top:5px;" class="row" >
                                                <label class="col-sm-3" style="width:150px;">Num:</label>
                                                <div class="col-sm-4">1</div>
                                                <label class="col-sm-4">&nbsp;</label>
                                            </div>
                                            <div style="margin-top:5px;" class="row" >
                                                <label class="col-sm-3" style="width:150px;">Num:</label>
                                                <div class="col-sm-4">2</div>
                                                <label class="col-sm-4">&nbsp;</label>
                                            </div>
                                            
                                            <div class="modal-footer">
                                                <button type="button" class="btn btn-sm btn-default" data-dismiss="modal">Close</button>
                                            </div>
                                        </div>
                                        </form>
                                    </div>
                                </div>
                                </div>
                                <!-- modal end -->
        				</c:forEach>
								<script type="text/javascript">
                            	//var sendData = { "type" : $('#type').val() , 
                            	//		"complete" : $('#complete').val() , 
                            	//		"page" : $('#page').val() };
                            	//var sendData = $('#SearchForm').serialize();
                            	//var sendData = JSON.stringify({type:$('#type').val(), complete:$('#complete').val(), page:$('#page').val()}); 
                            	
                            	var sendData = [{"loginTime":"111", "logoutTime":"222"}]; 
								// 시도테이블의 리스트 가져오기
								var url="<c:url value='/errorDetail.do'/>";
								$.ajax({
									type:"post"		// 포스트방식
									,url:url		// url 주소
									,data: JSON.stringify({"loginTime":"111", "logoutTime":"222"})
									//,data:sendData//{"loginTime":"${result.loginTime}", "logoutTime":"${result.logoutTime}"}	//  요청에 전달되는 프로퍼티를 가진 객체
									,dataType:"json"
									,contentType: "application/json;charset=UTF-8"
									//,async: true
									,success:function(data, stat, xhr){	//응답이 성공 상태 코드를 반환하면 호출되는 함수
										//alert(data);
										//alert(stat);
										//alert(xhr);
										//var jsdata = JSON.parse(data);
									    ////$("#result").val(jsdata.name);
										 ////for(var idx=0; idx<args.length; idx++) {
											alert(jsdata);
											 ////$("#sido").append("<option value='"+args.data[idx].snum+"'>"+args.data[idx].sido+"</option>");
											 //id가 sido인 요소선택
											 //append로 기존 셀렉터로 선택된 요소 다음에 다음내용이 들어감
											 //<option value='0'>서울</option> 이런식으로 sido의 요소안에 자식으로 들어감
							   // args.data[idx] : args 는 function(args)의 인자. data는 controller.java에서 json객체에 넣어준 key(여기서는 list가 값이 된다). [idx]는 list의 몇번쨰 데이터를 가져올지 배열을 나타냄
										 ////}
									}
								    ,error:function(e) {	// 이곳의 ajax에서 에러가 나면 얼럿창으로 에러 메시지 출력
								    	alert(11);
								    	alert(e.responseText);
								    }
								});
							</script>
                        </tbody>
                	</table>
                    </div>
                    </div>
 
         
               <!-- 이상상태요약 끝 -->
               
               <!-- 백본스위치(메인) 시작 -->
            	
            	<section class="content-header">
			        <h1>
			            <small><label>백본스위치(메인)</label></small>
			        </h1>
			    </section>


		        <div class="clearfix" ></div>
		        <br/>
		        <!-- div class="col-xs-12" -->
		            <!-- Default box -->
		            <div class="box">
		                <div class="box-header with-border">
                		<table class="table table-bordered table-striped" id="tbl2" >
	                    <thead>
	                        <tr>
	                            <th class="secondary-text hidden-xs">
	                                <div class="table-header">
	                                    <span class="column-title">LED</span>
	                                </div>
	                            </th>
								<th class="secondary-text hidden-xs">
	                                <div class="table-header">
	                                    <span class="column-title">일시</span>
	                                </div>
	                            </th>
	                            <th class="secondary-text">
	                                <div class="table-header">
	                                    <span class="column-title">스위치타입</span>
	                                </div>
	                            </th>
	                            <th class="secondary-text hidden-xs">
	                                <div class="table-header">
	                                    <span class="column-title">포트</span>
	                                </div>
	                            </th>
								<th class="secondary-text">
	                                <div class="table-header">
	                                    <span class="column-title">연결기기</span>
	                                </div>
	                            </th>
	                            <th class="secondary-text">
	                                <div class="table-header">
	                                    <span class="column-title">상태</span>
	                                </div>
	                            </th>
	
	                        </tr>
	                    </thead>
	                    <tbody id="repotbl" >
	                    <c:forEach var="result" items="${backMainErrorList}" varStatus="status">
            				<tr>
                                <td class="listtd">!</td>
                                <td class="listtd"><c:out value="${result.eventDate}"/></td>
                                <td class="listtd"><c:out value="${result.switchType}"/></td>
                                <td class="listtd"><c:out value="${result.port}"/></td>
                                <td class="listtd"><c:out value="${result.connectEquip}"/></td>
                                <td class="listtd"><c:out value="${result.status}"/></td>
                            </tr>
        				</c:forEach>
                        </tbody>
                	</table>
                    </div>
                    </div>


               <!-- 백본스위치(메인) 끝 -->


				<!-- 백본스위치(백업) 시작 -->
            	
            	<section class="content-header">
			        <h1>
			            <small><label>백본스위치(백업)</label></small>
			        </h1>
			    </section>
				<br/>
		        <div class="clearfix" ></div>
		        
		        <!-- div class="col-xs-12" -->
		            <!-- Default box -->
		            <div class="box">
		                <div class="box-header with-border">
                		<table class="table table-bordered table-striped" id="tbl3" >
	                    <thead>
	                        <tr>
	                            <th class="secondary-text hidden-xs">
	                                <div class="table-header">
	                                    <span class="column-title">LED</span>
	                                </div>
	                            </th>
								<th class="secondary-text hidden-xs">
	                                <div class="table-header">
	                                    <span class="column-title">일시</span>
	                                </div>
	                            </th>
	                            <th class="secondary-text">
	                                <div class="table-header">
	                                    <span class="column-title">스위치타입</span>
	                                </div>
	                            </th>
	                            <th class="secondary-text hidden-xs">
	                                <div class="table-header">
	                                    <span class="column-title">포트</span>
	                                </div>
	                            </th>
								<th class="secondary-text">
	                                <div class="table-header">
	                                    <span class="column-title">연결기기</span>
	                                </div>
	                            </th>
	                            <th class="secondary-text">
	                                <div class="table-header">
	                                    <span class="column-title">상태</span>
	                                </div>
	                            </th>
	
	                        </tr>
	                    </thead>
	                    <tbody id="repotbl" >
  						<c:forEach var="result" items="${backBackupErrorList}" varStatus="status">
            				<tr>
                                <td class="listtd">!</td>
                                <td class="listtd"><c:out value="${result.eventDate}"/></td>
                                <td class="listtd"><c:out value="${result.switchType}"/></td>
                                <td class="listtd"><c:out value="${result.port}"/></td>
                                <td class="listtd"><c:out value="${result.connectEquip}"/></td>
                                <td class="listtd"><c:out value="${result.status}"/></td>
                            </tr>
        				</c:forEach>
                        </tbody>
                	</table>
                    </div>
                    </div>


               <!-- 백본스위치(백업) 끝 -->
               
               <!-- 엑세스스위치 시작 -->
            	
            	<section class="content-header">
			        <h1>
			            <small><label>엑세스스위치</label></small>
			        </h1>
			    </section>
				<br/>
		        <div class="clearfix" ></div>
		        
		        <!-- div class="col-xs-12" -->
		            <!-- Default box -->
		            <div class="box">
		                <div class="box-header with-border">
                		<table class="table table-bordered table-striped" id="tbl4" >
	                    <thead>
	                        <tr>
	                            <th class="secondary-text hidden-xs">
	                                <div class="table-header">
	                                    <span class="column-title">LED</span>
	                                </div>
	                            </th>
								<th class="secondary-text hidden-xs">
	                                <div class="table-header">
	                                    <span class="column-title">일시</span>
	                                </div>
	                            </th>
	                            <th class="secondary-text">
	                                <div class="table-header">
	                                    <span class="column-title">스위치타입</span>
	                                </div>
	                            </th>
	                            <th class="secondary-text hidden-xs">
	                                <div class="table-header">
	                                    <span class="column-title">포트</span>
	                                </div>
	                            </th>
								<th class="secondary-text">
	                                <div class="table-header">
	                                    <span class="column-title">연결기기</span>
	                                </div>
	                            </th>
	                            <th class="secondary-text">
	                                <div class="table-header">
	                                    <span class="column-title">상태</span>
	                                </div>
	                            </th>
	
	                        </tr>
	                    </thead>
	                    <tbody id="repotbl" >
  						<c:forEach var="result" items="${accessErrorList}" varStatus="status">
            				<tr>
                                <td class="listtd">!</td>
                                <td class="listtd"><c:out value="${result.eventDate}"/></td>
                                <td class="listtd"><c:out value="${result.switchType}"/></td>
                                <td class="listtd"><c:out value="${result.port}"/></td>
                                <td class="listtd"><c:out value="${result.connectEquip}"/></td>
                                <td class="listtd"><c:out value="${result.status}"/></td>
                            </tr>
        				</c:forEach>
                        </tbody>
                	</table>
                    </div>
                    </div>


               <!-- 엑세스스위치 끝 -->
               
               <!-- MMS 시작 -->
            	
            	<section class="content-header">
			        <h1>
			            <small><label>MMS 연결상태</label></small>
			        </h1>
			    </section>
				<br/>
		        <div class="clearfix" ></div>
		        
		        <!-- div class="col-xs-12" -->
		            <!-- Default box -->
		            <div class="box">
		                <div class="box-header with-border">
                		<table class="table table-bordered table-striped" id="tbl5" >
	                    <thead>
	                        <tr>
	                            <th class="secondary-text hidden-xs">
	                                <div class="table-header">
	                                    <span class="column-title">LED</span>
	                                </div>
	                            </th>
								<th class="secondary-text hidden-xs">
	                                <div class="table-header">
	                                    <span class="column-title">일시</span>
	                                </div>
	                            </th>
	                            <th class="secondary-text">
	                                <div class="table-header">
	                                    <span class="column-title">IED</span>
	                                </div>
	                            </th>
	                            <th class="secondary-text hidden-xs">
	                                <div class="table-header">
	                                    <span class="column-title">IED장치상태</span>
	                                </div>
	                            </th>
								<th class="secondary-text">
	                                <div class="table-header">
	                                    <span class="column-title">SA운영장치상태</span>
	                                </div>
	                            </th>
	                            <th class="secondary-text">
	                                <div class="table-header">
	                                    <span class="column-title">주 정보연계 장치상태</span>
	                                </div>
	                            </th>
	                            <th class="secondary-text">
	                                <div class="table-header">
	                                    <span class="column-title">부 정보연계 장치상태</span>
	                                </div>
	                            </th>
	                            <th class="secondary-text">
	                                <div class="table-header">
	                                    <span class="column-title">REPORT상태</span>
	                                </div>
	                            </th>
	
	                        </tr>
	                    </thead>
	                    <tbody id="repotbl" >
  						<c:forEach var="result" items="${mmsErrorList}" varStatus="status">
            				<tr>
                                <td class="listtd">O</td>
                                <td class="listtd"><c:out value="${result.eventDate}"/></td>
                                <td class="listtd"><c:out value="${result.iedNum}"/></td>
                                <td class="listtd"><c:out value="${result.iedConnStatus}"/></td>
                                <td class="listtd"><c:out value="${result.saStatus}"/></td>
                                <td class="listtd"><c:out value="${result.mainEquipStatus}"/></td>
                                <td class="listtd"><c:out value="${result.subEquipStatus}"/></td>
                                <td class="listtd"><c:out value="${result.reportEquipStatus}"/></td>
                            </tr>
        				</c:forEach>
                        </tbody>
                	</table>
                    </div>
                    </div>


               <!-- MMS 끝 -->
               
               
               <!-- GOOSE 시작 -->
            	
            	<section class="content-header">
			        <h1>
			            <small><label>GOOSE 메세지</label></small>
			        </h1>
			    </section>
				<br/>
		        <div class="clearfix" ></div>
		        
		        <!-- div class="col-xs-12" -->
		            <!-- Default box -->
		            <div class="box">
		                <div class="box-header with-border">
                		<table class="table table-bordered table-striped" id="tbl6" >
	                    <thead>
	                        <tr>
	                            <th class="secondary-text hidden-xs">
	                                <div class="table-header">
	                                    <span class="column-title">LED</span>
	                                </div>
	                            </th>
	                            <th class="secondary-text hidden-xs">
	                                <div class="table-header">
	                                    <span class="column-title">일시</span>
	                                </div>
	                            </th>
								<th class="secondary-text hidden-xs">
	                                <div class="table-header">
	                                    <span class="column-title">주소</span>
	                                </div>
	                            </th>
	                            <th class="secondary-text">
	                                <div class="table-header">
	                                    <span class="column-title">GOOSE시간</span>
	                                </div>
	                            </th>
	                            <th class="secondary-text hidden-xs">
	                                <div class="table-header">
	                                    <span class="column-title">상태번호</span>
	                                </div>
	                            </th>
								<th class="secondary-text">
	                                <div class="table-header">
	                                    <span class="column-title">IED</span>
	                                </div>
	                            </th>
	                            <th class="secondary-text">
	                                <div class="table-header">
	                                    <span class="column-title">MAC주소</span>
	                                </div>
	                            </th>
	                            <th class="secondary-text">
	                                <div class="table-header">
	                                    <span class="column-title">미송신횟수</span>
	                                </div>
	                            </th>
	                            <th class="secondary-text">
	                                <div class="table-header">
	                                    <span class="column-title">상태</span>
	                                </div>
	                            </th>
	
	                        </tr>
	                    </thead>
	                    <tbody id="repotbl" >
  						<c:forEach var="result" items="${gooseErrorList}" varStatus="status">
            				<tr>
                                <td class="listtd">O</td>
                                <td class="listtd"><c:out value="${result.eventDate}"/></td>
                                <td class="listtd"><c:out value="${result.address}"/></td>
                                <td class="listtd"><c:out value="${result.gooseTime}"/></td>
                                <td class="listtd"><c:out value="${result.statusNum}"/></td>
                                <td class="listtd"><c:out value="${result.iedNum}"/></td>
                                <td class="listtd"><c:out value="${result.macAddress}"/></td>
                                <td class="listtd"><c:out value="${result.faultCnt}"/></td>
                                <td class="listtd"><c:out value="${result.status}"/></td>
                            </tr>
        				</c:forEach>
                        </tbody>
                	</table>
                    </div>
                    </div>

                  </section>
                </div>
               <!-- GooSE 끝 -->
               
                <!-- /.box-body -->
                <div class="box-footer">

                </div>
                <!-- /.box-footer-->
            </div>
            <!-- /.box -->
        </div>

<div class="clearfix" ></div>
    </section>
    <!-- /.content -->
</div>
<script>
function changeTypeList(i,j){
		var value = i.value;
		if(value == 0){
        	$(".sale_"+j).show();
        	$(".rent_"+j).hide();
		}else if(value == 1){
			$(".sale_"+j).hide();
        	$(".rent_"+j).show();
		}
	}
</script>
<!-- /.content-wrapper -->


<%@ include file="includes/footer.jsp" %>
<%@ include file="includes/jsplugins.jsp" %>
