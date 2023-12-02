<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.io.File" %>

<% 
  /**
  * @Class Name : egovSampleList.jsp
  * @Description : Sample List 화면
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
	//하루 전
	Date yesterdayTime = new Date();
	yesterdayTime.setTime(new Date().getTime() - (1 * 24 * 60 * 60 * 1000)); //1일전
	String beforeDate = new java.text.SimpleDateFormat("yyyy-MM-dd").format(yesterdayTime);

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
        function fn_search() {
    	//$('#myModal_').modal({backdrop: 'static'});
     	frm = document.searchForm;
     	 var file = $("#startDate").val();
	   	 if(file == "" || file == null){
	   	 	alert("시작일자를 입력하세요.");
	   	 	return false;
	   	 }
	   	 var file = $("#startTime").val();
	   	 if(file == "" || file == null){
	   	 	alert("시작시간을 입력하세요.");
	   	 	return false;
	   	 }
	   	 var file = $("#endDate").val();
	   	 if(file == "" || file == null){
	   	 	alert("종료일자를 입력하세요.");
	   	 	return false;
	   	 }
	   	 var file = $("#endTime").val();
	   	 if(file == "" || file == null){
	   	 	alert("종료시간을 입력하세요.");
	   	 	return false;
	   	 }
	   	var value = "";
    	$("input[name=equipList]:checked").each(function() {

			value += $(this).val()+";;";

		});
    	$("#selectEquip").val(value);

        var file = $("#selectEquip").val();
   	   	if(file == "" || file == null){
   	   	  alert("장치리스트에서 선택 후 검색하시기 바랍니다.");
   	   	  return false;
   	   	}
   	 	frm.action = "<c:url value='/packetList.do'/>";
   		frm.submit();
     }
        function fn_filedownload(){
        	frm = document.packetForm;
	   	   	var value = "";
	       	$("input[name=packetList]:checked").each(function() {
	
	   			value += $(this).val()+";;";
	
	   		});
	       	$("#selectPacket").val(value);
	
	           var file = $("#selectPacket").val();
	      	   	//if(file == "" || file == null){
	      	   	//  alert("검색된 패킷리스트에서 선택 후 다운로드 하시기 바랍니다.");
	      	   	//  return false;
	      	   	//}
	      	 	frm.action = "<c:url value='/downloadFile.do'/>";
	      		frm.submit();
        }
    </script>

<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
        <h1>
            Packet 추출
            <small></small>
        </h1>

    </section>

    <!-- Main content -->

    <section class="content">
        <div class="clearfix" ></div>
        <div class="col-xs-12" >
            <!-- Default box -->
            <div class="box">
                <div class="box-header with-border">

                <form action="mainHeader" method="POST" id="searchForm" name="searchForm">
                <input type="hidden" id="selectEquip" name="selectEquip">
                <table style="width: 100%" border="0">
                    <tr style="height: 40px">
                        <td width="100" align="center"><label>시작시간</label></td>
                        <td width="100" class=""><input type="date" placeholder="YYY/MM/dd" name="startDate" id="startDate" class="form-control" value="<%= beforeDate %>"/></td>
                        <td width="120" class="">
                        <div class="input-group bootstrap-timepicker timepicker">
				            <input id="startTime" name="startTime" type="text" class="form-control input-small">
				            <span class="input-group-addon"><i class="glyphicon glyphicon-time"></i></span>
				        </div>
				 
				        <script type="text/javascript">
				            $('#startTime').timepicker();
				        </script>
						</td>
						<td width="100" align="center"><label>종료시간</label></td>
                        <td width="100" class=""><input type="date" placeholder="YYY/MM/dd" name="endDate" id="endDate" class="form-control" value="<%= sf.format(nowTime) %>"/></td>
                        <td width="120" class="">
                        <div class="input-group bootstrap-timepicker timepicker">
				            <input id="endTime" name="endTime" type="text" class="form-control input-small">
				            <span class="input-group-addon"><i class="glyphicon glyphicon-time"></i></span>
				        </div>
				 
				        <script type="text/javascript">
				            $('#endTime').timepicker();
				        </script>
						</td>
						<td width="100" align="center"><label>현재시간</label></td>
                        <td width="60" class=""><select id="nowTime" name="nowTime">
                        <option value="">선택</option>
                        <option value="10">+-10</option>
                        <option value="10">+-20</option>
                        <option value="10">+-30</option>
                        <option value="10">+-40</option>
                        <option value="10">+-50</option></select></td>
                        <td width="70" align="center">&nbsp;<label>추가</label></td>
                        <td width="120" class=""><input type="text" id="searchKeyword" name="searchKeyword"></td>
                        <td width="70" align="right"><button type="button" onclick="javascript:fn_search();" class="btn btn-primary">검색</button></td>
                    </tr>
                 </table>

                </form>
                </div>

                <!-- packet 시작 -->
            	<div class="box-body">
            	<section class="content-header">
			        <h1>
			            <small><label>Packet List</label></small>
			        </h1>
			    </section>
			    <section class="content">

		        <div class="clearfix" ></div>
		        
		        <div class="col-xs-12" >
		            <!-- Default box -->
		            <div class="box">
		                <div class="box-header with-border">
		                
                		<table class="table table-bordered table-striped" id="tbl_packet" >
	                    <thead>
	                        <tr>
	                            <th class="secondary-text hidden-xs">
	                                <div class="table-header">
	                                    <span class="column-title"></span>
	                                </div>
	                            </th>
								<th class="secondary-text hidden-xs">
	                                <div class="table-header">
	                                    <span class="column-title">시작일시</span>
	                                </div>
	                            </th>
	                            <th class="secondary-text">
	                                <div class="table-header">
	                                    <span class="column-title">종료일시</span>
	                                </div>
	                            </th>
	                            <th class="secondary-text hidden-xs">
	                                <div class="table-header">
	                                    <span class="column-title">장치종류</span>
	                                </div>
	                            </th>
								<th class="secondary-text">
	                                <div class="table-header">
	                                    <span class="column-title">장치ID</span>
	                                </div>
	                            </th>
	                            <th class="secondary-text">
	                                <div class="table-header">
	                                    <span class="column-title">IP주소</span>
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
  						<c:forEach var="result" items="${equipList}" varStatus="status">
            				<tr>
                                <td class="listtd"><input type="checkbox" id="equipList" name="equipList" value="<c:out value='${result.equipType}'/>_<c:out value='${result.num}'/>"></td>
                                <td class="listtd"><!-- c:out value="${result.startTime}"/--></td>
                                <td class="listtd"><!--c:out value="${result.endTime}"/--></td>
                                <td class="listtd">
                                <c:if test="${result.equipType == 'IED'}">IED</c:if>
                                <c:if test="${result.equipType == 'SA'}">SA 상위장치</c:if>
                                <c:if test="${result.equipType == 'ES'}">이더넷스위치</c:if>
                                <c:if test="${result.equipType == 'SNTP'}">SNTP</c:if>
                                </td>
                                <td class="listtd"><c:out value="${result.name}"/></td>
                                <td class="listtd"><c:out value="${result.ip}"/></td>
                                <td class="listtd"><!-- c:out value="${result.status}"/--></td>
                            </tr>
        				</c:forEach>
                            
   							<!-- tr>
	            				<td align="center" class="listtd"><c:out value="${paginationInfo.totalRecordCount+1 - ((searchVO.pageIndex-1) * searchVO.pageSize + status.count)}"/></td>
	            				<td align="center" class="listtd"><a href="javascript:fn_egov_select('<c:out value="${result.id}"/>')"><c:out value="${result.id}"/></a></td>
	            				<td align="left" class="listtd"><c:out value="${result.name}"/>&nbsp;</td>
	            				<td align="center" class="listtd"><c:out value="${result.useYn}"/>&nbsp;</td>
	            				<td align="center" class="listtd"><c:out value="${result.pw}"/>&nbsp;</td>
	            				<td align="center" class="listtd"><c:out value="${result.auth}"/>&nbsp;</td>
            				</tr-->
                        </tbody>
                	</table>
                    </div>
                    </div>
					 </div>
                    
         			</section>
                </div>
               <!-- 이상상태요약 끝 -->
               <!-- packet 시작 -->
            	<div class="box-body">
            	<section class="content-header">
			        <h1>
			            <small><label>Packet 추출 List</label></small>
			        </h1>
			    </section>
			    <section class="content">

		        <div class="clearfix" ></div>
		        
		        <div class="col-xs-12" >
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
	                                    <span class="column-title">시작일시</span>
	                                </div>
	                            </th>
	                            <th class="secondary-text">
	                                <div class="table-header">
	                                    <span class="column-title">종료일시</span>
	                                </div>
	                            </th>
	                            <th class="secondary-text hidden-xs">
	                                <div class="table-header">
	                                    <span class="column-title">장치종류</span>
	                                </div>
	                            </th>
								<th class="secondary-text">
	                                <div class="table-header">
	                                    <span class="column-title">장치ID</span>
	                                </div>
	                            </th>
	                            <th class="secondary-text">
	                                <div class="table-header">
	                                    <span class="column-title">IP주소</span>
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
  						<c:forEach var="result" items="${packetExtrList}" varStatus="status">
            				<tr>
                                <td class="listtd"><input type="checkbox" id="packetList" name="packetList" value="<c:out value='${result.num}'/>"></td>
                                <td class="listtd"><c:out value="${result.startDate}"/> <c:out value="${result.startTime}"/></td>
                                <td class="listtd"><c:out value="${result.endDate}"/> <c:out value="${result.endTime}"/></td>
                                <td class="listtd">
                                <c:if test="${result.equipType == 'IED'}">IED</c:if>
                                <c:if test="${result.equipType == 'SA'}">SA 상위장치</c:if>
                                <c:if test="${result.equipType == 'ES'}">이더넷스위치</c:if>
                                <c:if test="${result.equipType == 'SNTP'}">SNTP</c:if>
                                </td>
                                <td class="listtd"><c:out value="${result.equipNum}"/></td>
                                <td class="listtd"><c:out value="${result.ipAddres}"/></td>
                                <td class="listtd"><c:out value="${result.status}"/></td>
                            </tr>
        				</c:forEach>
                            
   							<!-- tr>
	            				<td align="center" class="listtd"><c:out value="${paginationInfo.totalRecordCount+1 - ((searchVO.pageIndex-1) * searchVO.pageSize + status.count)}"/></td>
	            				<td align="center" class="listtd"><a href="javascript:fn_egov_select('<c:out value="${result.id}"/>')"><c:out value="${result.id}"/></a></td>
	            				<td align="left" class="listtd"><c:out value="${result.name}"/>&nbsp;</td>
	            				<td align="center" class="listtd"><c:out value="${result.useYn}"/>&nbsp;</td>
	            				<td align="center" class="listtd"><c:out value="${result.pw}"/>&nbsp;</td>
	            				<td align="center" class="listtd"><c:out value="${result.auth}"/>&nbsp;</td>
            				</tr-->
                        </tbody>
                	</table>
                    </div>
                    </div>
                    <form action="mainHeader" method="POST" id="packetForm" name="packetForm">
                	<input type="hidden" id="selectPacket" name="selectPacket">
                	</form>
                    <button type="button" onclick="javascript:fn_filedownload();" class="btn btn-primary">Packet 추출</button>
                    <button type="button" onclick="location.href='<c:url value='/packCall.do'/>' " class="btn btn-primary">Packet저장테스트</button>
                    </div>
                    
         			</section>
                </div>
               <!-- 이상상태요약 끝 -->
               
               
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
