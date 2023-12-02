<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.io.File" %>

<% 
  /**
  * @Class Name : faultRecorderList.jsp
  * @Description : faultRecorder List 화면
  * @Modification Information
  *
  *   수정일         수정자                   수정내용
  *  -------    --------    ---------------------------
  *  2019.11.11            최초 생성
  *
  * author 남기성
  * since 2019.11.01
  *
  * Copyright (C) 2009 by Taehee All right reserved.
  */
%>

<%
	Date nowTime = new Date();
	SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");
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
	//document.getElementById("nowDate").innerHTML = year + "-" + month+"-" + day + ampm + hours + ":" + minutes}

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
           /* switch 등록 function */
     function fn_fault_search() {
     	frm = document.faultForm;
     	 var file = $("#startTime").val();
	   	 if(file == "" || file == null){
	   	 	alert("시작일을 입력하세요.");
	   	 	return false;
	   	 }
	   	 var file = $("#endTime").val();
	   	 if(file == "" || file == null){
	   	 	alert("종료일을 입력하세요.");
	   	 	return false;
	   	 }
         	frm.action = "<c:url value='/faultRecorderList.do'/>";
            frm.submit();
     }
     function fn_set_autoDel() {
    	 frm = document.autoDelForm;
      	 var file = $("#saveMonth").val();
 	   	 if(file == "" || file == null){
 	   	 	alert("보존할 개월을 입력하세요.");
 	   	 	return false;
 	   	 }
 	   	var file1 = $("#hdd").val();
	   	 if(file1 == "" || file1 == null){
	   	 	alert("하드용량을 입력하세요.");
	   	 	return false;
	   	 }
     	//$('#myModal_').modal({backdrop: 'static'});
     	//var sendData = [{"loginTime":"111", "logoutTime":"222"}]; 
		// 시도테이블의 리스트 가져오기
		var url="<c:url value='/delFaultRecordDate.do'/>";
		$.ajax({
			type:"post"		// 포스트방식
			,url:url		// url 주소
			,data: JSON.stringify({"saveMonth":file,"hdd":file1})
			//,data:sendData//{"loginTime":"${result.loginTime}", "logoutTime":"${result.logoutTime}"}	//  요청에 전달되는 프로퍼티를 가진 객체
			,dataType:"json"
			,contentType: "application/json;charset=UTF-8"
			//,async: true
			,success:function(data, stat, xhr){	//응답이 성공 상태 코드를 반환하면 호출되는 함수
										//alert(data);
										//alert(stat);
										//alert(xhr);
										//var jsdata = JSON.parse(data);
									    $("#saveMonth").val(data.saveMonth);
									    $("#hdd").val(data.hdd);
									   // alert(data.delDate);
										 ////for(var idx=0; idx<args.length; idx++) {
			alert("변경되었습니다.");
			
											 ////$("#sido").append("<option value='"+args.data[idx].snum+"'>"+args.data[idx].sido+"</option>");
											 //id가 sido인 요소선택
											 //append로 기존 셀렉터로 선택된 요소 다음에 다음내용이 들어감
											 //<option value='0'>서울</option> 이런식으로 sido의 요소안에 자식으로 들어감
							   // args.data[idx] : args 는 function(args)의 인자. data는 controller.java에서 json객체에 넣어준 key(여기서는 list가 값이 된다). [idx]는 list의 몇번쨰 데이터를 가져올지 배열을 나타냄
										 ////}
			}
			,error:function(e) {	// 이곳의 ajax에서 에러가 나면 얼럿창으로 에러 메시지 출력
			alert(e.responseText);
			}
		});
								
      	
          	//frm.action = "<c:url value='/delFaultRecordDate.do'/>";
            // frm.submit();
      }
    </script>
<style>


/* change border radius for the tab , apply corners on top*/

#exTab3 .nav-pills > li > a {
  border-radius: 4px 4px 0 0 ;
}

#exTab3 .tab-content {
  padding : 5px 15px;
    width : 92%;
}
#exTab44 .tab-content {
  color : white;
  background-color: #428bca;
  padding : 5px 15px;

}

</style>
<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
        <h1>
            Fault Recorder
            <small></small><button style="float: right;" type="button"  data-toggle="modal" data-target="#myModal_" data-backdrop="static" data-keyboard="false" class="btn btn-primary">자동삭제기준설정</button>
        </h1>

    </section>

    <!-- Main content -->

    <section class="content">
        <div class="col-xs-12">
            <!-- Default box -->
            <div class="box">
                <div class="box-header with-border">

                <form action="mainHeader" name="faultForm" id="faultForm" method="POST">
                <table  border="0">
                    <tr style="height: 40px">
                        
                        <td width="50" align="center"><label>시작일</label></td>
                        <td width="60" class=""><input type="date" placeholder="YYY/MM/dd" name="startTime" id="startTime" class="form-control" value="<%= sf.format(nowTime) %>"/></td>

						<td width="50" align="center"><label>종료일</label></td>
                        <td width="60" class=""><input type="date" placeholder="YYY/MM/dd" name="endTime" id="endTime" class="form-control" value="<%= sf.format(nowTime) %>"/></td>

                        <td width="40" align="center">&nbsp;<label>추가</label></td>
                        <td width="180" class=""><input type="text" name="searchKeyword"></td>
                        <td width="40" align="center">&nbsp;<label>추가2</label></td>
                        <td width="180" class=""><input type="text" name="searchKeyword2"></td>
                        <td width="40" align="center">&nbsp;<label></label></td>
                    </tr>
                    <tr style="height: 40px">
                        
                        <td width="50" align="center"> </td>
                        <td width="60" class=""> </td>

						<td width="50" align="center"> </td>
                        <td width="60" class=""> </td>

                        <td width="40" align="center"> </td>
                        <td width="40" colspan="2" align="center">&nbsp;<label>발생전후시간</label></td>
                        <td width="180" class=""><input type="text" name="addFilter"></td>
                        <td width="40" align="right"><button type="button" onclick="javascript:fn_fault_search();" class="btn btn-primary">검색</button></td>
                    </tr>
                    <!-- Modal -->
                                <div id="myModal_" class="modal fade" role="dialog"">
                                    <div class="modal-dialog" style="width:950px;">

                                        <!-- Modal content-->
                                        <div class="modal-content">
                                        <form method="POST" name="autoDelForm" id="autoDelForm">
                                        <div class="modal-header" >
                                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                                            <h4 class="modal-title">Fault Record 자동삭제 기준</h4>
                                        </div>
                                        <div class="modal-body">
                                        	<div style="margin-top:5px;" class="row">
                                                <label class="col-sm-3" style="width:150px;">보존개월수:</label>
                                                <div class="col-sm-1"><input type="text" name="saveMonth" id="saveMonth" class="form-control" value="${saveMonth.saveMonth}"/>개월</div>
                                            </div>
                                            <div style="margin-top:5px;" class="row">
                                                <label class="col-sm-3" style="width:150px;">하드용량:</label>
                                                <div class="col-sm-1"><input type="text" name="hdd" id="hdd" class="form-control" value="${saveMonth.hdd}"/>%</div>
                                            </div>
                                            <div style="margin-top:5px;" class="row">
                                                <label class="col-sm-8" style="width:550px;">하드용량이 위에서 설정한 용량을 넘어서면 현재일로부터 보존개월수 이후  데이터를 모두 삭제합니다.</label>
                                            </div>
                                            <div class="modal-footer">
                                            	<button type="button" onclick="javascript:fn_set_autoDel();" class="btn btn-primary">저장</button>
                                                <button type="button" class="btn btn-sm btn-default" data-dismiss="modal">취소</button>
                                            </div>
                                        </div>
                                        </form>
                                    </div>
                                </div>
                                </div>
                                <!-- modal end -->
                 </table>

                </form>
            </div>
                
            <div class="box">

					<div id="exTab3" class="container">	
						<ul  class="nav nav-pills">
							<li class="active">
				        	<a  href="#info" data-toggle="tab">요약정보</a>
							</li>
							<li><a href="#switch" data-toggle="tab">이더넷스위치 상태</a>
							</li>
							<li><a href="#mms" data-toggle="tab">MMS 연결상태</a>
							</li>
				  			<li><a href="#goose" data-toggle="tab">GOOSE 연결상태</a>
							</li>
						</ul>
<div class="tab-content clearfix">
  <div class="tab-pane active" id="info">
  <br/>
		        
		        <!-- div class="col-xs-12" -->
		            <!-- Default box -->
					<div class="box-header with-border">
                		<table class="table table-bordered table-striped" id="tblF1">
	                    <thead>
	                        <tr>
	                            <th class="secondary-text hidden-xs">
	                                LED
	                            </th>
								<th class="secondary-text hidden-xs">
	                                	일시
	                            </th>
	                            <th class="secondary-text">
	                                	스위치타입
	                            </th>
	                            <th class="secondary-text hidden-xs">
	                                	포트
	                            </th>
								<th class="secondary-text">
	                                	연결기기
	                            </th>
	                            <th class="secondary-text">
	                                	상태
	                            </th>
	
	                        </tr>
	                    </thead>
	                    <tbody id="repotbl" >
  
                        <c:forEach var="result" items="${ethernetSwitchHisList}" varStatus="status">
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
  <div class="tab-pane" id="switch">
    
               <!-- 엑세스스위치 시작 -->
            	
            	<!-- section class="content-header">
			        <h1>
			            <small><label>이더넷스위치 상태</label></small><button onclick="javascript:exportTableToCsv('tbl1','ESwitchStatusList');" type="button" style="float: right;" class="btn btn-primary">CSV파일저장</button>
			        </h1>
			    </section-->
				<br/>
		        
		        <!-- div class="col-xs-12" -->
		            <!-- Default box -->
		            
		                <div class="box-header with-border">
                		<table class="table table-bordered table-striped" id="tblF2" >
	                    <thead>
	                        <tr>
	                            <th class="secondary-text hidden-xs">
	                                LED
	                            </th>
								<th class="secondary-text hidden-xs">
	                                	일시
	                            </th>
	                            <th class="secondary-text">
	                                	스위치타입
	                            </th>
	                            <th class="secondary-text hidden-xs">
	                                	포트
	                            </th>
								<th class="secondary-text">
	                                	연결기기
	                            </th>
	                            <th class="secondary-text">
	                                	상태
	                            </th>
	
	                        </tr>
	                    </thead>
	                    <tbody id="repotbl" >
  
                        <c:forEach var="result" items="${ethernetSwitchHisList}" varStatus="status">
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

               <!-- 엑세스스위치 끝 -->
  </div>
  <div class="tab-pane" id="mms">
                   
               <!-- MMS 시작 -->
            	
            	<!-- section class="content-header">
			        <h1>
			            <small><label>MMS 연결상태</label></small><button onclick="javascript:exportTableToCsv('tbl2','mmsStatusList');" type="button" style="float: right;" class="btn btn-primary">CSV파일저장</button>
			        </h1>
			    </section-->
				<br/>
		        
		        <!-- div class="col-xs-12" -->
		            <!-- Default box -->
						<div class="box-header with-border">
                		<table class="table table-bordered table-striped" id="tblF3" >
	                    <thead>
	                        <tr>
	                            <th class="secondary-text hidden-xs">
	                                LED
	                            </th>
								<th class="secondary-text hidden-xs">
	                                	일시
	                            </th>
	                            <th class="secondary-text">
	                                IED
	                            </th>
	                            <th class="secondary-text hidden-xs">
	                                IED장치상태
	                            </th>
								<th class="secondary-text">
	                                SA운영장치상태
	                            </th>
	                            <th class="secondary-text">
	                                	주 정보연계 장치상태
	                            </th>
	                            <th class="secondary-text">
	                                	부 정보연계 장치상태
	                            </th>
	                            <th class="secondary-text">
	                                REPORT상태
	                            </th>
	
	                        </tr>
	                    </thead>
	                    <tbody id="repotbl" >
  						<c:forEach var="result" items="${mmsHisList}" varStatus="status">
            				<tr>
                                <td class="listtd">O</td>
                                <td class="listtd"><c:out value="${result.eventDate}"/></td>
                                <td class="listtd"><c:out value="${result.iedNum}"/></td>
                                <td class="listtd"><c:out value="${result.iedConnStatus}"/></td>
                                <td class="listtd"><c:out value="${result.saStatus}"/></td>
                                <td class="listtd"><c:out value="${result.mainEquipStatus}"/></td>
                                <td class="listtd"><c:out value="${result.subEquipStatus}"/></td>
                                <td class="listtd"><c:out value="${result.reportStatus}"/></td>
                            </tr>
        				</c:forEach>

                        </tbody>
                	</table>
				</div>

               <!-- MMS 끝 -->
	</div>
  	<div class="tab-pane" id="goose">
                
               
               <!-- GOOSE 시작 -->
            	
            	<!-- section class="content-header">
			        <h1>
			            <small><label>GOOSE 메세지</label></small><button onclick="javascript:exportTableToCsv('tbl3','gooseStatusList');" type="button" style="float: right;" class="btn btn-primary">CSV파일저장</button>
			        </h1>
			    </section-->
				<br/>
		        
		        <!-- div class="col-xs-12" -->
		            <!-- Default box -->
						<div class="box-header with-border">
                		<table class="table table-bordered table-striped" id="tblF4" >
	                    <thead>
	                        <tr>
	                            <th class="secondary-text hidden-xs">
	                                LED
	                            </th>
	                            <th class="secondary-text hidden-xs">
	                                	일시
	                            </th>
								<th class="secondary-text hidden-xs">
	                                	주소
	                            </th>
	                            <th class="secondary-text">
	                                GOOSE시간
	                            </th>
	                            <th class="secondary-text hidden-xs">
	                                	상태번호
	                            </th>
								<th class="secondary-text">
	                                IED
	                            </th>
	                            <th class="secondary-text">
	                                MAC주소
	                            </th>
	                            <th class="secondary-text">
	                                	미송신횟수
	                            </th>
	                            <th class="secondary-text">
	                                	상태
	                            </th>
	
	                        </tr>
	                    </thead>
	                    <tbody id="repotbl" >
  						<c:forEach var="result" items="${gooseHisList}" varStatus="status">
            				<tr>
                                <td class="listtd">!</td>
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
</div>
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
<!-- /.content-wrapper -->


<%@ include file="includes/footer.jsp" %>
<%@ include file="includes/jsplugins.jsp" %>
