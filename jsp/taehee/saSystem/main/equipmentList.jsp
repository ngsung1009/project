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
        function fn_delete(){
        	var value = "";
        	$("input[name=equipList]:checked").each(function() {

				value += $(this).val()+";;";
				
			});
        	$("#selectEquip").val(value);
        	
	        frm = document.delForm;
	        var file = $("#selectEquip").val();
	   	   	if(file == "" || file == null){
	   	   	  alert("리스트에서 체크 후 삭제하시기 바랍니다.");
	   	   	  return false;
	   	   	}
	   	 	if(confirm("삭제 진행 시 리스트에서 완전 삭제됩니다.\n정말로 삭제 하시겠습니까?")){
            	frm.action = "<c:url value='/delEquip.do'/>";
            	frm.submit();
	   	 	}
        	
        	
        	//alert( $('input:checkbox[name="equipList"]').val());
        }

	        // 체크 박스 모두 체크
	
			$("#checkAll").click(function() {
				if($('input:checkbox[id="checkAll"]').is(":checked") == true){
					$("input[name=equipList]:checkbox").each(function() {

						$(this).attr("checked", true);
		
					});
				}else{
					$("input[name=equipList]:checkbox").each(function() {

						$(this).attr("checked", false);
		
					});
				}
	
			});



    </script>


<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
        <h1>
            
            <table width="100%" border="0"><tr><td>환경설정 - 장치관리<small></small></td>
            
            <td width="90"><button style="float: right;" type="button" onclick="location.href='<c:url value='/enviromentList.do'/>' " class="btn btn-primary">환경설정</button></td>
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

                    <form method="POST" id="delForm" name="delForm">
				    	<input type="hidden" id="selectEquip" name="selectEquip">
				    </form>
                </div>


               
               <!-- 엑세스스위치 시작 -->
            	
            	<section class="content-header">
			        <h1>
			            <table width="100%" border="0"><tr><td><small>장치관리</small></td>
			            <td width="100"><button style="float: right;" type="button" onclick="javascript:exportTableToCsv('tblScl','equipmentList');" class="btn btn-primary">CSV 파일저장</button></td>
			            <td width="120"><button style="float: right;" type="button" onclick="javascript:fn_delete();" class="btn btn-primary">선택목록 삭제</button></td>
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
	                                	선택
	                            </th>
	                            <th class="secondary-text hidden-xs">
	                                	장치종류
	                            </th>
	                            <th class="secondary-text hidden-xs">
	                                	장치이름
	                            </th>
								<th class="secondary-text hidden-xs">
	                                IP주소
	                            </th>
	                            <th class="secondary-text">
	                                	포트갯수
	                            </th>
	                            <th class="secondary-text">
	                                SCL파일
	                            </th>
	                            <th class="secondary-text">
	                                IET파일
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
                                <td class="listtd"><c:out value="${result.port}"/></td>
                                <td class="listtd"><c:out value="${result.sclFileName}"/></td>
                                <td class="listtd"><c:out value="${result.ietFileName}"/></td>
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
