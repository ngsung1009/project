<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.io.File" %>

<% 
  /**
  * @Class Name : MmsMessageList.jsp
  * @Description : MmsMessage List 화면
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
     function fn_mms_search() {
     	frm = document.mmsForm;
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
         	frm.action = "<c:url value='/mmsMessageList.do'/>";
            frm.submit();
     }
    </script>

<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
        <h1>
            MMS 실시간
            <small></small><button style="float: right;" type="button" onclick="location.href='<c:url value='/reportStatusList.do'/>' " class="btn btn-primary">Report 상태</button>
        </h1>

    </section>

    <!-- Main content -->

    <section class="content">
        <div class="clearfix" ></div>
        <div class="col-xs-12" >
            <!-- Default box -->
            <div class="box">
                <div class="box-header with-border">

                <form action="mainHeader" id="mmsForm" name="mmsForm" method="POST">
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
                        <td width="40" align="right"><button type="button" onclick="javascript:fn_mms_search();" class="btn btn-primary">검색</button></td>
                    </tr>
                 </table>

                </form>
                </div>

                 <!-- 엑세스스위치 시작 -->
            	
            	<section class="content-header">
			        <h1>
			            <small><label>MMS 메세지상태</label></small><button type="button" onclick="javascript:exportTableToCsv('tbl1','mmsMessageStatusList');"style="float: right;" class="btn btn-primary">CSV파일저장</button>
			        </h1>
			    </section>
				<br/>
		        <div class="clearfix" ></div>
		        
		        <!-- div class="col-xs-12" -->
		            <!-- Default box -->
		            <div class="box">
		                <div class="box-header with-border">
                		<table class="table table-bordered table-striped" id="tbl1" >
	                    <thead>
	                        <tr>
	                            <th class="secondary-text hidden-xs">
	                                LED
	                            </th>
								<th class="secondary-text hidden-xs">
	                                	일시
	                            </th>
	                            <th class="secondary-text">
	                                IED장치
	                            </th>
	                            <th class="secondary-text hidden-xs">
	                                SA 상위장치
	                            </th>
								<th class="secondary-text">
	                                	서비스
	                            </th>
	                            <th class="secondary-text">
	                                	상태
	                            </th>
	
	                        </tr>
	                    </thead>
	                    <tbody id="repotbl" >
  						<c:forEach var="result" items="${mmsMessageStatusList}" varStatus="status">
            				<tr>
                                <td class="listtd">O</td>
                                <td class="listtd"><c:out value="${result.eventDate}"/></td>
                                <td class="listtd"><c:out value="${result.iedNum}"/></td>
                                <td class="listtd"><c:out value="${result.saName}"/></td>
                                <td class="listtd"><c:out value="${result.service}"/></td>
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
			            <small><label>MMS 연결상태</label></small><button type="button" onclick="javascript:exportTableToCsv('tbl2','mmsStatusList');" style="float: right;" class="btn btn-primary">CSV파일저장</button>
			        </h1>
			    </section>
				<br/>
		        <div class="clearfix" ></div>
		        
		        <!-- div class="col-xs-12" -->
		            <!-- Default box -->
		            <div class="box">
		                <div class="box-header with-border">
                		<table class="table table-bordered table-striped" id="tbl2" >
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
