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
    

    function fn_user_add() {
    	//$('#myModal_').modal({backdrop: 'static'});
     	frm = document.userForm;
     	 var file = $("#id").val();
	   	 if(file == "" || file == null){
	   	 	alert("USER ID를 입력하세요.");
	   	 	return false;
	   	 }
	   	 var file = $("#name").val();
	   	 if(file == "" || file == null){
	   	 	alert("이름 입력하세요.");
	   	 	return false;
	   	 }
	   	var file = $("#pw").val();
	   	 if(file == "" || file == null){
	   	 	alert("비밀번호를 입력하세요.");
	   	 	return false;
	   	 }
	   	var file1 = $("#rePw").val();
	   	 if(file != file1){
	   	 	alert("비밀번호확인이 올바르지 않습니다. 정확히 입력하세요.");
	   	 	return false;
	   	 }
	   	
         	frm.action = "<c:url value='/addUser.do'/>";
            frm.submit();
     }
    function fn_delete(){
    	var value = "";
    	$("input[name=userList]:checked").each(function() {

			value += $(this).val()+";;";
			
		});
    	$("#selectUser").val(value);

        frm = document.delForm;
        var file = $("#selectUser").val();
   	   	if(file == "" || file == null){
   	   	  alert("리스트에서 체크 후 삭제하시기 바랍니다.");
   	   	  return false;
   	   	}
   	 	if(confirm("삭제 진행 시 리스트에서 완전 삭제됩니다.\n정말로 삭제 하시겠습니까?")){
        	frm.action = "<c:url value='/deleteUser.do'/>";
        	frm.submit();
   	 	}
    	
    	
    	//alert( $('input:checkbox[name="equipList"]').val());
    }
    </script>

<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
        <h1>
            
            <table width="100%" border="0"><tr><td>환경설정 - 사용자계정<small></small></td>
            
            <td width="90"><button style="float: right;" type="button" onclick="location.href='<c:url value='/enviromentList.do'/>' " class="btn btn-primary">환경설정</button></td>
            <td width="90"><button style="float: right;" type="button" onclick="location.href='<c:url value='/equipmentList.do'/>' " class="btn btn-primary">장치관리</button></td>
			<td width="90"><button style="float: right;" type="button" onclick="location.href='<c:url value='/portList.do'/>' " class="btn btn-primary">포트설정</button></td>
			<td width="120"><button style="float: right;" type="button" onclick="location.href='<c:url value='/packetExceptList.do'/>' " class="btn btn-primary">패킷처리제외</button></td>
			<td width="90"><button style="float: right;" type="button" onclick="location.href='<c:url value='/defaultList.do'/>' " class="btn btn-primary">초기설정</button></td>
			
            </tr></table>
            
            
        </h1>
		<form method="POST" id="delForm" name="delForm">
			<input type="hidden" id="selectUser" name="selectUser">
		</form>
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
			            <small>사용자계정</small>
			        </h1>
			    </section>
				<br/>
		        <div class="clearfix" ></div>
		        
		        <div class="col-xs-12" >
		            <!-- Default box -->
		            <div class="box">
		                <div class="box-header with-border">
		                
                		<table class="table table-bordered table-striped" id="tbl10" >
	                    <thead>
	                        <tr>
	                        	<th class="secondary-text hidden-xs">
	                                <div class="table-header">
	                                    <span class="column-title">선택</span>
	                                </div>
	                            </th>
	                            <th class="secondary-text hidden-xs">
	                                <div class="table-header">
	                                    <span class="column-title">사용자 ID</span>
	                                </div>
	                            </th>
	                            <th class="secondary-text hidden-xs">
	                                <div class="table-header">
	                                    <span class="column-title">이름</span>
	                                </div>
	                            </th>
								<th class="secondary-text hidden-xs">
	                                <div class="table-header">
	                                    <span class="column-title">비밀번호</span>
	                                </div>
	                            </th>
	                            
	                            
	                        </tr>
	                    </thead>
	                    <tbody id="repotbl" >
  						<c:forEach var="result" items="${userList}" varStatus="status">
            				<tr>
                                <td class="listtd"><input type="checkbox" id="userList" name="userList" value="<c:out value='${result.id}'/>"></td>
                                <td class="listtd"><c:out value="${result.id}"/></td>
                                <td class="listtd"><c:out value="${result.name}"/></td>
                                <td class="listtd"><c:out value="${result.pw}"/></td>
                            </tr>
        				</c:forEach>
                            
                        </tbody>
                	</table>
                	<table width=100%>
                	
                			<tr>
                            	<td width=88%></td>
                                <td><button style="float: right;" type="button" data-toggle="modal" data-target="#myModal_" data-backdrop="static" data-keyboard="false" class="btn btn-primary">추가</button></td>
                                <td><button style="float: right;" type="button" onclick="javascript:fn_delete();" class="btn btn-primary">삭제</button></td>
                            </tr>
                    </table>
                    </div>
                    </div>
                    </div>
								<!-- Modal -->
                                <div id="myModal_" class="modal fade" role="dialog"">
                                    <div class="modal-dialog" style="width:950px;">

                                        <!-- Modal content-->
                                        <div class="modal-content">
                                        <form method="POST" name="userForm" id="userForm">
                                        <div class="modal-header" >
                                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                                            <h4 class="modal-title">사용자 추가</h4>
                                        </div>
                                        <div class="modal-body">
                                        <div style="margin-top:5px;" class="row">
                                                <label class="col-sm-3" style="width:150px;">ID:</label>
                                                <div class="col-sm-3"><input type="text" name="id" id="id"></div>
                                            </div>
                                            <div style="margin-top:5px;" class="row">
                                                <label class="col-sm-3" style="width:150px;">이름:</label>
                                                <div class="col-sm-5"><input type="text" name="name" id="name"></div>
                                            </div>
                                            <div style="margin-top:5px;" class="row" >
                                                <label class="col-sm-3" style="width:150px;">비밀번호:</label>
                                                <div class="col-sm-4"><input type="password" name="pw" id="pw"></div>
                                                <label class="col-sm-4">&nbsp;</label>
                                            </div>
                                            <div style="margin-top:5px;" class="row" >
                                                <label class="col-sm-3" style="width:150px;">비밀번호 확인:</label>
                                                <div class="col-sm-8"><input type="password" name="rePw" id="rePw"></div>
                                                <label class="col-sm-4">&nbsp;</label>
                                            </div>
                                            <div class="modal-footer">
                                            	<button type="button" onclick="javascript:fn_user_add();" class="btn btn-primary">저장</button>
                                                <button type="button" class="btn btn-sm btn-default" data-dismiss="modal">취소</button>
                                            </div>
                                        </div>
                                        </form>
                                    </div>
                                </div>
                                </div>
                                <!-- modal end -->
                  
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
