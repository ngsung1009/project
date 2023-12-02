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

    <script type="text/javaScript" language="javascript" defer="defer">
    /* port 등록 function */
    function fn_port_save() {
    	frm = document.portForm;
    	 var file = $("#sntpNum").val();
	   	 if(file == "" || file == null){
	   	 	alert("SNTP를 선택하세요.");
	   	 	return false;
	   	 }
	   	 var file = $("#sntpPort").val();
	   	 if(file == "" || file == null){
	   	 	alert("SNTP Port를 선택하세요.");
	   	 	return false;
	   	 }
	   	var file = $("#saNum").val();
	   	 if(file == "" || file == null){
	   	 	alert("SA를 선택하세요.");
	   	 	return false;
	   	 }
	   	 var file = $("#saPort").val();
	   	 if(file == "" || file == null){
	   	 	alert("SA Port를 선택하세요.");
	   	 	return false;
	   	 }
	   	var file = $("#iedNum").val();
	   	 if(file == "" || file == null){
	   	 	alert("IED를 선택하세요.");
	   	 	return false;
	   	 }
	   	var file = $("#switchNum").val();
	   	 if(file == "" || file == null){
	   	 	alert("SWITCH를 선택하세요.");
	   	 	return false;
	   	 }
	   	var file = $("#ipAddress").val();
	   	 if(file == "" || file == null){
	   	 	alert("IP를 선택하세요.");
	   	 	return false;
	   	 }
        frm.action = "<c:url value='/addPort.do'/>";
        frm.submit();
    }
    </script>

<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
        <h1>
            <table width="100%" border="0"><tr><td>환경설정 - 포트설정<small></small></td>
            <td width="90"><button style="float: right;" type="button" onclick="location.href='<c:url value='/enviromentList.do'/>' " class="btn btn-primary">환경설정</button></td>
            <td width="90"><button style="float: right;" type="button" onclick="location.href='<c:url value='/equipmentList.do'/>' " class="btn btn-primary">장치관리</button></td>
			<td width="120"><button style="float: right;" type="button" onclick="location.href='<c:url value='/packetExceptList.do'/>' " class="btn btn-primary">패킷처리제외</button></td>
			<td width="90"><button style="float: right;" type="button" onclick="location.href='<c:url value='/defaultList.do'/>' " class="btn btn-primary">초기설정</button></td>
			<td width="105"><button style="float: right;" type="button" onclick="location.href='<c:url value='/userAccountList.do'/>' " class="btn btn-primary">사용자계정</button></td>
            </tr></table>
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
                </form>
                </div>
            	<section class="content-header">
			        <h1>
			            <small>포트설정</small>
			        </h1>
			    </section>
				<br/>
		        <div class="clearfix" ></div>
		        <!--포트설정  시작 -->
		        <div class="" >
		            <!-- Default box -->
		            <div class="box">
		                <div class="box-header with-border">
		                <form action="mainHeader" method="POST" id="portForm" name="portForm">
                		<table class="table table-bordered table-striped" id="tblPort" >
	                    <thead>
	                        <tr>
	                        	<th class="secondary-text hidden-xs">
	                                <div class="table-header">
	                                    <span class="column-title">SNTP</span>
	                                </div>
	                            </th>
	                            <th class="secondary-text hidden-xs">
	                                <div class="table-header">
	                                    <span class="column-title">SA 상위운영장치</span>
	                                </div>
	                            </th>
	                            <th class="secondary-text hidden-xs">
	                                <div class="table-header">
	                                    <span class="column-title">IED</span>
	                                </div>
	                            </th>
								<th class="secondary-text hidden-xs">
	                                <div class="table-header">
	                                    <span class="column-title">이더넷스위치</span>
	                                </div>
	                            </th>
	                        </tr>
	                    </thead>
	                    <tbody id="repotbl" >
  
                            <tr>
                            	<td><select id="sntpNum" name="sntpNum">
                            	<c:forEach var="result" items="${equipList}" varStatus="status">
	                                <c:if test="${result.equipType == 'SNTP'}">
	                                	<option value="<c:out value="${result.num}"/>"><c:out value="${result.name}"/></option>
	                                </c:if>
        						</c:forEach>
                            	
                            	</select></td>
                                <td><select id="saNum" name="saNum">
                            	<c:forEach var="result" items="${equipList}" varStatus="status">
	                                <c:if test="${result.equipType == 'SA'}">
	                                	<option value="<c:out value="${result.num}"/>"><c:out value="${result.name}"/></option>
	                                </c:if>
        						</c:forEach>
                            	</select></td>
                                <td><select id="iedNum" name="iedNum">
                            	<c:forEach var="result" items="${equipList}" varStatus="status">
	                                <c:if test="${result.equipType == 'IED'}">
	                                	<option value="<c:out value="${result.num}"/>"><c:out value="${result.name}"/></option>
	                                </c:if>
        						</c:forEach>
                            	</select></td>
                                <td><select id="switchNum" name="switchNum">
                            	<c:forEach var="result" items="${equipList}" varStatus="status">
	                                <c:if test="${result.equipType == 'ES'}">
	                                	<option value="<c:out value="${result.num}"/>"><c:out value="${result.name}"/></option>
	                                </c:if>
        						</c:forEach>
                            	</select></td>
                            </tr>
                            <tr>
                            	<td><select id="sntpPort" name="sntpPort">
                            	<option value="1">port1</option>
                            	<option value="2">port2</option>
                            	</select></td>
                                <td><select id="saPort" name="saPort">
                            	<option value="1">port1</option>
                            	<option value="2">port2</option>
                            	</select></td>
                                <td></td>
                                <td><select id="ipAddress" name="ipAddress">
                            	<option value="1">192.168.1.2</option>
                            	<option value="2">192.168.1.3</option>
                            	</select></td>
                            </tr>
                        </tbody>
                	</table>
                	<table width="100%"><tr><td align="right"><button type="button" class="btn btn-primary" onclick="javascript:fn_port_save();" id="excelUp">적용</button></td></tr></table>
                	</form>
                    </div>
                    </div>
                    </div>
                    
                <!-- 포트설정 끝 -->
                <!-- 설정장치정보 -->  
                <section class="content-header">
			        <h1>
			            <small>설정 리스트</small>
			        </h1>
			    </section>
				<br/>  
		        <div class="" >
		            <!-- Default box -->
		            <div class="box">
		                <div class="box-header with-border">
		                
                		<table class="table table-bordered table-striped" id="tblScl" >
	                    <thead>
	                        <tr>
	                        	<th class="secondary-text hidden-xs">
	                                <div class="table-header">
	                                    <span class="column-title">SNTP</span>
	                                </div>
	                            </th>
	                            <th class="secondary-text hidden-xs">
	                                <div class="table-header">
	                                    <span class="column-title">SNTP Port</span>
	                                </div>
	                            </th>
	                            <th class="secondary-text hidden-xs">
	                                <div class="table-header">
	                                    <span class="column-title">SA 상위장치</span>
	                                </div>
	                            </th>
								<th class="secondary-text hidden-xs">
	                                <div class="table-header">
	                                    <span class="column-title">SA Port</span>
	                                </div>
	                            </th>
	                            <th class="secondary-text hidden-xs">
	                                <div class="table-header">
	                                    <span class="column-title">IED</span>
	                                </div>
	                            </th>
	                            <th class="secondary-text hidden-xs">
	                                <div class="table-header">
	                                    <span class="column-title">이더넷스위치</span>
	                                </div>
	                            </th>
	                            <th class="secondary-text hidden-xs">
	                                <div class="table-header">
	                                    <span class="column-title">IP</span>
	                                </div>
	                            </th>
	                        </tr>
	                    </thead>
	                    <tbody id="repotbl" >
  						<c:forEach var="result" items="${equipConnectList}" varStatus="status">
            				<tr>
                                <td class="listtd"><c:out value="${result.sntpName}"/></td>
                                <td class="listtd"><c:out value="${result.sntpPort}"/></td>
                                <td class="listtd"><c:out value="${result.saName}"/></td>
                                <td class="listtd"><c:out value="${result.saPort}"/></td>
                                <td class="listtd"><c:out value="${result.iedName}"/></td>
                                <td class="listtd"><c:out value="${result.switchName}"/></td>
                                <td class="listtd"><c:out value="${result.ipAddress}"/></td>
                            </tr>
        				</c:forEach>
                        </tbody>
                	</table>
                    </div>
                    </div>
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
