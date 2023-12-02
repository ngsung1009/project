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
        <!--
        /* 글 수정 화면 function */
        function fn_egov_select(id) {
        	document.listForm.selectedId.value = id;
           	document.listForm.action = "<c:url value='/updateUserView.do'/>";
           	document.listForm.submit();
        }
        //-->
        function defaultInfoUpload() {
     	//document.cidUpForm.selectedId.value = id;
    	// var file = $("#sclFile").val();
    	// if(file == "" || file == null){
    	// 	alert("SCL 파일을 첨부하세요.");
    	// 	return false;
    	// }
    	// var file = $("#excel").val();
    	 //if(file == "" || file == null){
    	// 	alert("EXCEL 파일을 첨부하세요.");
    	// 	return false;
    	// }	
        	document.defaultForm.action = "<c:url value='/saveDefaultInfo.do'/>";
        	document.defaultForm.submit();
     }
    </script>

<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
        <h1>
            
            <table width="100%" border="0"><tr><td>환경설정 - 초기설정<small></small></td>
            <td width="90"><button style="float: right;" type="button" onclick="location.href='<c:url value='/enviromentList.do'/>' " class="btn btn-primary">환경설정</button></td>
            <td width="90"><button style="float: right;" type="button" onclick="location.href='<c:url value='/equipmentList.do'/>' " class="btn btn-primary">장치관리</button></td>
			<td width="90"><button style="float: right;" type="button" onclick="location.href='<c:url value='/portList.do'/>' " class="btn btn-primary">포트설정</button></td>
			<td width="120"><button style="float: right;" type="button" onclick="location.href='<c:url value='/packetExceptList.do'/>' " class="btn btn-primary">패킷처리제외</button></td>
			
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


               
              
               
               <!-- MMS 시작 -->
            	
            	<section class="content-header">
			        <h1>
			            <small><label>환경설정</label></small>
			        </h1>
			    </section>
				<br/>
		        <div class="clearfix" ></div>
		        
		        <div class="col-xs-12" >
		            <!-- Default box -->
		            <div class="box">
		                <div class="box-header with-border">
		                <form id="defaultForm" name="defaultForm" method="post" action="" role="form" enctype="multipart/form-data">
                		<table  border="0">
		                    <tr style="height: 40px">
		                        <td width="190"><label>NTP서버(IP주소)</label></td>
		                        <td width="200" class=""><input type="text" id="ntpServerIp" name="ntpServerIp" value="<c:out value='${defaultInfo.ntpServerIp}'/>"/></td>
								<td width="180"><label>NTP주기(단위:msec)</label></td>
		                        <td width="180" class=""><input type="text" id="ntpTime" name="ntpTime" value="<c:out value='${defaultInfo.ntpTime}'/>"/></td>
		                    </tr>
		                    <tr style="height: 40px">
		                        <td width="190"><label>HDD저장패킷용량(단위:%)</label></td>
		                        <td width="200" class=""><input type="text" id="hdd" name="hdd" value="<c:out value='${defaultInfo.hdd}'/>"/></td>
								<td width="180"></td>
		                        <td width="180" class=""></td>
		                    </tr>
		                    <tr style="height: 40px">
		                        <td width="190"><label>Report미송신기중(의미:배수)</label></td>
		                        <td width="200" class=""><input type="text" id="reportMis" name="reportMis" value="<c:out value='${defaultInfo.reportMis}'/>"/></td>
								<td width="180"></td>
		                        <td width="180" class=""></td>
		                    </tr>
		                    <tr style="height: 40px">
		                        <td width="190"><label>Goose미송신기준(의미:배수)</label></td>
		                        <td width="200" class=""><input type="text" id="gooseMis" name="gooseMis" value="<c:out value='${defaultInfo.gooseMis}'/>"/></td>
								<td width="180"></td>
		                        <td width="180" class=""></td>
		                    </tr>
		                    <tr style="height: 40px">
		                        <td width="190"><label>Report스캔 최대동작시간</label></td>
		                        <td width="200" class=""><input type="text" id="reportScan" name="reportScan" value="<c:out value='${defaultInfo.reportScan}'/>"/></td>
								<td width="180"></td>
		                        <td width="180" class=""></td>
		                    </tr>
		                    <tr style="height: 40px">
		                        <td width="190"><label>Report시간 유효성기준</label></td>
		                        <td width="200" class=""><input type="text" id="reportTime" name="reportTime" value="<c:out value='${defaultInfo.reportTime}'/>"/></td>
								<td width="180"></td>
		                        <td width="180" class=""></td>
		                    </tr>
		                    <tr style="height: 40px">
		                        <td width="190"><label>외부연계(IEC61850서버)NIC</label></td>
		                        <td width="560" class="" colspan="3"><select><option value="1">Device/NPT....</option></select></td>
		                    </tr>
		                    <tr style="height: 40px">
		                        <td width="190"><label>외부연계(IEC61850서버)SCL</label></td>
		                        <td width="560" class="" colspan="3"><input type="file" id="outsideScl" name="outsideScl" /></td>
		                    </tr>
		                    <tr style="height: 40px">
		                        <td width="190"><label>IET 데이타목록 시트이름</label></td>
		                        <td width="560" class="" colspan="3"><input type="text" id="ietData" name="ietData" value="<c:out value='${defaultInfo.ietData}'/>"/></td>
		                    </tr>
		                    <tr style="height: 40px">
		                        <td width="190"><label>데이타시작 행번호</label></td>
		                        <td width="200" class=""><input type="text" id="dataStart" name="dataStart" value="<c:out value='${defaultInfo.dataStart}'/>"/></td>
								<td width="180"><label>시그널 열</label></td>
		                        <td width="180" class=""><input type="text" id="signalRow" name="signalRow" value="<c:out value='${defaultInfo.signalRow}'/>"/></td>
		                    </tr>
		                    <tr style="height: 40px">
		                        <td width="190"><label>명칭(열1)</label></td>
		                        <td width="200" class=""><input type="text" name="title1" value="<c:out value='${defaultInfo.title1}'/>"/></td>
								<td width="180"><label>명칭(열2)</label></td>
		                        <td width="180" class=""><input type="text" name="title2" value="<c:out value='${defaultInfo.title2}'/>"/></td>
		                    </tr>
		                 </table>
		                 <table>
		                 	<tr style="height: 60px">
		                        <td width="90"><button style="float: right;" type="button" onclick="location.href='<c:url value='/reportStatusList.do'/>' " class="btn btn-primary">Report상태</button> </td>
		                        <td width="140" class=""><button style="float: right;" type="button" onclick="location.href='<c:url value='/gooseList.do'/>' " class="btn btn-primary">Goose실시간 감시</button></td>
								<td width="400"></td>
								<td width="60"><button style="float: right;" onclick="javascript:defaultInfoUpload();" type="button" class="btn btn-primary">확인</button></td>
		                        <td width="60" class=""><button style="float: right;" type="button" class="btn btn-primary">취소</button></td>
		                    </tr>
		                 </table>

		                 </form>
                    </div>
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
