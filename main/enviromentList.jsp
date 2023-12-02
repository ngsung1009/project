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
        
     function checkFileType(filePath){
		var fileFormat = filePath.split(".");
		if(fileFormat.indexOf("xls") > -1){
			return true;
		}else if(fileFormat.indexOf("xlsx") > -1){
			return true;
		}else{
			return false;
		}
	}
     function check(){
    	 var file = $("#excel").val();
    	 if(file == "" || file == null){
    	 	alert("첨부된 파일이 없습니다.");
    	 	return false;
    	 }else if(!checkFileType(file)){
    	 	alert("엑셀파일만 첨부할 수 있습니다.");
    	 	return false;
    	 }
    	 var fileFormat = file.split(".");
    	 var fileType = fileFormat[1];
    	 	if(confirm("업로드 하시겠습니까?")){
    	 	$("#excelUpForm").attr("action","/accountsMngs/compExcelUpload");
    	 	var options = {
    	 	success:function(data){
    	 		alert("업로드가 완료되었습니다.");
    	 		$("#ajax-content").html(data);
    	 	},
    	 		type: "POST",
    	 		data : {"excelType" : fileType}
    	 	};
    	 	$("form").ajaxSubmit(options);
    	 }
    	 	
    }
     function sciUpload() {
     	//document.cidUpForm.selectedId.value = id;
    	 var file = $("#sclFile").val();
    	 if(file == "" || file == null){
    	 	alert("SCL 파일을 첨부하세요.");
    	 	return false;
    	 }
    	 var file = $("#excel").val();
    	 if(file == "" || file == null){
    	 	alert("EXCEL 파일을 첨부하세요.");
    	 	return false;
    	 }	
        	document.cidUpForm.action = "<c:url value='/saveXml.do'/>";
        	document.cidUpForm.submit();
     }
     /* 글 등록 function */
     function fn_sa_save() {
     	frm = document.saForm;
     	 var file = $("#saName").val();
	   	 if(file == "" || file == null){
	   	 	alert("SA 장치이름을 입력하세요.");
	   	 	return false;
	   	 }
	   	 var file = $("#saIp").val();
	   	 if(file == "" || file == null){
	   	 	alert("ip를 입력하세요.");
	   	 	return false;
	   	 }
	   	var file = $("#saPort").val();
	   	if(file == "" || file == null){
	   	 	alert("포트갯수를 선택하세요.");
	   	 	return false;
	   	}
         	frm.action = "<c:url value='/addSa.do'/>";
            frm.submit();
     }
     /* switch 등록 function */
     function fn_switch_save() {
     	frm = document.switchForm;
     	 var file = $("#switchName").val();
	   	 if(file == "" || file == null){
	   	 	alert("switch 이름을 입력하세요.");
	   	 	return false;
	   	 }
	   	 var file = $("#switchIp").val();
	   	 if(file == "" || file == null){
	   	 	alert("ip를 입력하세요.");
	   	 	return false;
	   	 }
	   	var file = $("#iPort").val();
	   	if(file == "" || file == null){
	   	 	alert("포트갯수를 선택하세요.");
	   	 	return false;
	   	}
         	frm.action = "<c:url value='/addESwitch.do'/>";
            frm.submit();
     }
     /* sntp 등록 function */
     function fn_sntp_save() {
     	frm = document.sntpForm;
     	 var file = $("#sntpName").val();
	   	 if(file == "" || file == null){
	   	 	alert("SNTP 이름을 입력하세요.");
	   	 	return false;
	   	 }
	   	 var file = $("#sntpIp").val();
	   	 if(file == "" || file == null){
	   	 	alert("ip를 입력하세요.");
	   	 	return false;
	   	 }
	   	var file = $("#iPort").val();
	   	if(file == "" || file == null){
	   	 	alert("포트갯수를 선택하세요.");
	   	 	return false;
	   	}
         	frm.action = "<c:url value='/addSntp.do'/>";
            frm.submit();
     }
    </script>
<c:set var="existId" value="${iedInfo.iedName}"/>
        <c:if test="${existId == '1'}">
        		<div class="alert alert-danger alert-dismissible" style="text-align: center;">
                    <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
                    <h4><i class="icon fa fa-ban"></i> IED Number error!</h4>
                    IED 번호가 틀립니다. 첨부파일을 다시 확인하시기 바랍니다.
                </div>
                <script>
                	alert("Ied 번호가 틀립니다. 다시 확인하시기 바랍니다.");
                	return;
                </script>
        </c:if>
<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
        <h1>
            
            <table width="100%" border="0"><tr><td>환경설정<small></small></td>
            
            <td width="90"><button style="float: right;" type="button" onclick="location.href='<c:url value='/equipmentList.do'/>' " class="btn btn-primary">장치관리</button></td>
			<td width="90"><button style="float: right;" type="button" onclick="location.href='<c:url value='/portList.do'/>' " class="btn btn-primary">포트설정</button></td>
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


               
               <!-- 엑세스스위치 시작 -->
            	
            	<section class="content-header">
			        <h1>
			            <table width="100%" border="0"><tr><td><small>네트워크 카드설정</small></td>
			            <td width="60"><button style="float: right;" type="button" class="btn btn-primary">갱신</button></td>
			            <td width="60"><button style="float: right;" type="button" class="btn btn-primary">적용</button></td>
			            </tr></table>
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
	                                <div class="table-header">
	                                    <span class="column-title"><input type="checkbox" id="all" value="all"></span>
	                                </div>
	                            </th>
	                            <th class="secondary-text hidden-xs">
	                                <div class="table-header">
	                                    <span class="column-title">네크워크카드이름</span>
	                                </div>
	                            </th>
								<th class="secondary-text hidden-xs">
	                                <div class="table-header">
	                                    <span class="column-title">IP</span>
	                                </div>
	                            </th>
	                            <th class="secondary-text">
	                                <div class="table-header">
	                                    <span class="column-title">설명</span>
	                                </div>
	                            </th>
	                            
	                        </tr>
	                    </thead>
	                    <tbody id="repotbl" >
  
                            <tr> 
                                <td><input type="checkbox" id="net" name="iedList"></td>
                                <td>D444_C2MTR_BCTL/LLNO GO/GOOSEPUB1</td>
                                <td>10.234.32.1</td>
                                <td>SA운영장치</td>
                            </tr>
                        </tbody>
                	</table>
                    </div>
                    </div>


                  
               <!-- GooSE 끝 -->
               
               <!-- MMS 시작 -->
            	
            	<section class="content-header">
			        <h1>
			            <small><label>IED 추가</label></small>
			        </h1>
			    </section>
				<br/>
		        <div class="clearfix" ></div>
		        
		        <!-- div class="col-xs-12" -->
		            <!-- Default box -->
		            <div class="box">
		                <div class="box-header with-border">
		                
		                
		                <form id="cidUpForm" name="cidUpForm" method="post" action="<c:url value='/saveXml.do'/>" role="form" enctype="multipart/form-data">
                		<table  border="0">
		                    <tr style="height: 40px">
		                        
		                        <td width="150"><label>SCL파일</label></td>
		                        <td width="120" class=""><input type="file" id="sclFile" name="sclFile"/></td>
		
								<td width="80" align="center"><label>IED파일</label></td>
		                        <td width="160" class=""><input id="excel" name="excel" type="file" /></td>
		
		                        <td width="80" align="center">&nbsp;<label>포트갯수</label></td>
		                        <td width="160" class=""><select id="iPort" name="iPort"><option value="1">1</option>
		                        <option value="2">2</option>
		                        <option value="3">3</option>
		                        <option value="4">4</option>
		                        <option value="5">5</option>
		                        </select></td>
		                        <td width="40" align="right"><button type="button" class="btn btn-primary" onclick="javascript:sciUpload();" id="excelUp">확인</button></td>
		                    </tr>
		                 </table>
		                 </form>
                    </div>
                    </div>


               <!-- MMS 끝 -->
               
               <!-- MMS 시작 -->
            	
            	<section class="content-header">
			        <h1>
			            <small><label>SA 상위운영장치 추가</label></small>
			        </h1>
			    </section>
				<br/>
		        <div class="clearfix" ></div>
		        
		        <!-- div class="col-xs-12" -->
		            <!-- Default box -->
		            <div class="box">
		                <div class="box-header with-border">
		               <form id="saForm" name="saForm" method="post" >
                		<table  border="0">
		                    <tr style="height: 40px">
		                        
		                        <td width="150"><label>SA 상위 운영장치 이름</label></td>
		                        <td width="120" class=""><input type="text" id="saName" name="saName"/></td>
		
								<td width="80" align="center"><label>IP주소</label></td>
		                        <td width="160" class=""><input type="text" id="saIp" name="saIp"/></td>
		
		                        <td width="80" align="center">&nbsp;<label>포트갯수</label></td>
		                        <td width="160" class=""><select id="saPort" name="saPort"><option value="1">1</option>
		                        <option value="2">2</option>
		                        <option value="3">3</option>
		                        <option value="4">4</option>
		                        <option value="5">5</option>
		                        </select></td>
		                        <td width="40" align="right"><button type="button" onclick="javascript:fn_sa_save();" class="btn btn-primary">확인</button></td>
		                    </tr>
		                 </table>
		                 </form>
                    </div>
                    </div>


               <!-- MMS 끝 -->
               
               
                <!-- MMS 시작 -->
            	
            	<section class="content-header">
			        <h1>
			            <small><label>이더넷스위치 추가</label></small>
			        </h1>
			    </section>
				<br/>
		        <div class="clearfix" ></div>
		        
		        <!-- div class="col-xs-12" -->
		            <!-- Default box -->
		            <div class="box">
		                <div class="box-header with-border">
		                <form method="POST" id="switchForm" name="switchForm">
                		<table  border="0">
		                    <tr style="height: 40px">
		                        
		                        <td width="150"><label>이더넷스위치 이름</label></td>
		                        <td width="120" class=""><input type="text" id="switchName" name="switchName"/></td>
		
								<td width="80" align="center"><label>IP주소</label></td>
		                        <td width="160" class=""><input type="text" id="switchIp" name="switchIp"/></td>
		
		                        <td width="80" align="center">&nbsp;<label>포트갯수</label></td>
		                        <td width="160" class=""><select id="iPort" name="iPort"><option value="1">1</option>
		                        <option value="2">2</option>
		                        <option value="3">3</option>
		                        <option value="4">4</option>
		                        <option value="5">5</option>
		                        </select></td>
		                        <td width="40" align="right"><button type="button" onclick="javascript:fn_switch_save();" class="btn btn-primary">확인</button></td>
		                    </tr>
		                 </table>
		                 </form>
                    </div>
                    </div>

               <!-- MMS 끝 -->
               
               <!-- MMS 시작 -->
            	
            	<section class="content-header">
			        <h1>
			            <small><label>SNTP 추가</label></small>
			        </h1>
			    </section>
				<br/>
		        <div class="clearfix" ></div>
		        
		        <!-- div class="col-xs-12" -->
		            <!-- Default box -->
		            <div class="box">
		                <div class="box-header with-border">
		                <form method="POST" id="sntpForm" name="sntpForm">
                		<table  border="0">
		                    <tr style="height: 40px">
		                        
		                        <td width="150"><label>SNTP 이름</label></td>
		                        <td width="120" class=""><input type="text" id="sntpName" name="sntpName"/></td>
		
								<td width="80" align="center"><label>IP주소</label></td>
		                        <td width="160" class=""><input type="text" id="sntpIp" name="sntpIp"/></td>
		
		                        <td width="80" align="center">&nbsp;<label>포트갯수</label></td>
		                        <td width="160" class=""><select id="iPort" name="iPort"><option value="1">1</option>
		                        <option value="2">2</option>
		                        <option value="3">3</option>
		                        <option value="4">4</option>
		                        <option value="5">5</option>
		                        </select></td>
		                        <td width="40" align="right"><button type="button" onclick="javascript:fn_sntp_save();" class="btn btn-primary">확인</button></td>
		                    </tr>
		                 </table>
		                 </form>
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
