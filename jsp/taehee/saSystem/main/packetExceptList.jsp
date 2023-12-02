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
        function fn_packet(a){
        	var value = "";
        	$("input[name=equipList]:checked").each(function() {
				value += $(this).val()+";;";
			});
        	$("#selectEquip").val(value);
        	
	        frm = document.packetForm;
	        var file = $("#selectEquip").val();
	   	   	if(file == "" || file == null){
	   	   	  alert("리스트에서 체크한 장비가 없습니다.");
	   	   	  return false;
	   	   	}
	   	   	if (a==1){
		   	 	if(confirm("제외 진행 시 리스트에서 패킷정보가 더이상 수신되지 않습니다.\n진행 하시겠습니까?")){
	            	frm.action = "<c:url value='/exceptEquipPack.do'/>";
	            	frm.submit();
		   	 	}
	   	   	}
	   	 	if (a==2){
		   	 	if(confirm("선택한 장비의 패킷을 수신합니다.\n진행 하시겠습니까?")){
	            	frm.action = "<c:url value='/addEquipPack.do'/>"; 
	            	frm.submit();
		   	 	}
	   	   	}
        	
        	
        	//alert( $('input:checkbox[name="equipList"]').val());
        }
    </script>

<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
        <h1>
            
            <table width="100%" border="0"><tr><td>환경설정 - 패킷처리제외<small></small></td>
            
            <td width="90"><button style="float: right;" type="button" onclick="location.href='<c:url value='/enviromentList.do'/>' " class="btn btn-primary">환경설정</button></td>
            <td width="90"><button style="float: right;" type="button" onclick="location.href='<c:url value='/equipmentList.do'/>' " class="btn btn-primary">장치관리</button></td>
			<td width="90"><button style="float: right;" type="button" onclick="location.href='<c:url value='/portList.do'/>' " class="btn btn-primary">포트설정</button></td>
			
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

                <form method="POST" id="packetForm" name="packetForm">
				    	<input type="hidden" id="selectEquip" name="selectEquip">
				</form>
                </div>


               
               <!-- 엑세스스위치 시작 -->
            	
            	<section class="content-header">
			        <h1>
			            <table width="100%" border="0"><tr><td><small>패킷처리제외</small></td>
			            <td width="100"><button style="float: right;" type="button" onclick="javascript:fn_packet(1);" class="btn btn-primary">패킷제외적용</button></td>
			            <td width="110"><button style="float: right;" type="button" onclick="javascript:fn_packet(2);" class="btn btn-primary">장치재기동</button></td>
			            </tr></table>
			        </h1>
			    </section>
				<br/>
		        <div class="clearfix" ></div>
		        
		        <div class="col-xs-12" >
		            <!-- Default box -->
		            <div class="box">
		                <div class="box-header with-border">
		                
                		<table class="table table-bordered table-striped" id="tblScl" >
	                    <thead>
	                        <tr>
	                        	<th class="secondary-text hidden-xs">
	                                <div class="table-header">
	                                    <span class="column-title">선택</span>
	                                </div>
	                            </th>
	                            <th class="secondary-text hidden-xs">
	                                <div class="table-header">
	                                    <span class="column-title">장치종류</span>
	                                </div>
	                            </th>
	                            <th class="secondary-text hidden-xs">
	                                <div class="table-header">
	                                    <span class="column-title">장치이름</span>
	                                </div>
	                            </th>
								<th class="secondary-text hidden-xs">
	                                <div class="table-header">
	                                    <span class="column-title">IP</span>
	                                </div>
	                            </th>
	                            <th class="secondary-text hidden-xs">
	                                <div class="table-header">
	                                    <span class="column-title">패킷수집여부</span>
	                                </div>
	                            </th>
	                            
	                        </tr>
	                    </thead>
	                    <tbody id="repotbl" >
  							<c:forEach var="result" items="${equipList}" varStatus="status">
            				<tr>
                                <td class="listtd"><input type="checkbox" id="equipList" name="equipList" value="<c:out value='${result.equipType}'/>_<c:out value='${result.num}'/>"></td>
                                <td class="listtd">
                                <c:if test="${result.equipType == 'IED'}">IED</c:if>
                                <c:if test="${result.equipType == 'SA'}">SA 상위장치</c:if>
                                <c:if test="${result.equipType == 'ES'}">이더넷스위치</c:if>
                                <c:if test="${result.equipType == 'SNTP'}">SNTP</c:if>
                                </td>
                                <td class="listtd"><c:out value="${result.name}"/></td>
                                <td class="listtd"><c:out value="${result.ip}"/></td>
                                <td class="listtd"><c:out value="${result.useYn}"/></td>

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
