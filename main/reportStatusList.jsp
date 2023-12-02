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
    </script>

<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
        <h1>
            
            
            
            
            
            <table width="100%" border="0"><tr><td>Report 상태<small></small></td>
            <td width="130"><button style="float: right;" type="button"  data-toggle="modal" data-target="#myModal_" class="btn btn-primary">미송신검출기준설정</button></td>
            <td width="110"><button style="float: right;" type="button" onclick="location.href='<c:url value='/mmsMessageList.do'/>' " class="btn btn-primary">MMS 실시간</button></td></tr></table>
            
            
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
                <table  border="0">
                    <tr style="height: 40px">
                        
                        <td width="50" align="center"><label>시작일</label></td>
                        <td width="60" class=""><input type="date" placeholder="YYY/MM/dd" name="startDate" id="startDate" class="form-control" value="<%= sf.format(nowTime) %>"/></td>

						<td width="50" align="center"><label>종료일</label></td>
                        <td width="60" class=""><input type="date" placeholder="YYY/MM/dd" name="endDate" id="endDate" class="form-control" value="<%= sf.format(nowTime) %>"/></td>

                        <td width="40" align="center">&nbsp;<label>추가</label></td>
                        <td width="180" class=""><input type="text" name="addFilter"></td>
                        
                        <td width="40" align="center">&nbsp;<label>추가2</label></td>
                        <td width="180" class=""><input type="text" name="addFilter2"></td>
                        <td width="40" align="right"><button type="button" class="btn btn-primary">검색</button></td>
                    </tr>
                 </table>

                </form>
                </div>

                 <!-- 엑세스스위치 시작 -->
            	
            	<section class="content-header">
			        <h1>
			            <small><label>Report 상태</label></small><button type="button" onclick="javascript:exportTableToCsv('tbl1','reportStatusList');" style="float: right;" class="btn btn-primary">CSV파일저장</button>
			        </h1>
			    </section>
				<br/>
		        <div class="clearfix" ></div>
		        
		        <div class="col-xs-12" >
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
	                                Report ID
	                            </th>
	                            <th class="secondary-text hidden-xs">
	                                IED 장치
	                            </th>
								<th class="secondary-text">
	                                SA 상위장치
	                            </th>
	                            <th class="secondary-text">
	                               	 전송횟수
	                            </th>
	                            <th class="secondary-text">
	                               	 이벤트 전송횟수
	                            </th>
	                            <th class="secondary-text">
	                                	미 전송횟수
	                            </th>
	                            <th class="secondary-text">
	                                	최소전송주기
	                            </th>
	                            <th class="secondary-text">
	                                	최대전송주기
	                            </th>
	                            <th class="secondary-text">
	                                	상태
	                            </th>
	
	                        </tr>
	                    </thead>
	                    <tbody id="repotbl" >
  						<c:forEach var="result" items="${ietList}" varStatus="status">
            				<tr>
                                <td class="listtd">O</td>
                                <td class="listtd"> </td>
                                <td class="listtd"><c:out value="${result.iedName}"/></td>
                                <td class="listtd"></td>
                                <td class="listtd"> </td>
                                <td class="listtd"> </td>
                                <td>1</td>
                                <td>0</td>
                                <td>0</td>
                                <td>0</td>
                                <td>정상</td>
                            </tr>
        				</c:forEach>
                            <!-- Modal -->
                                <div id="myModal_" class="modal fade" role="dialog"">
                                    <div class="modal-dialog" style="width:950px;">

                                        <!-- Modal content-->
                                        <div class="modal-content">
                                        <form action="/index.php/Admin/modAdvertiser" method="POST" onsubmit="return upfregisterform_submit(this);" enctype="multipart/form-data">
                                        <div class="modal-header" >
                                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                                            <h4 class="modal-title">자동삭제기준</h4>
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
                        </tbody>
                	</table>
                    </div>
                    </div>
                    </div>

               <!-- 엑세스스위치 끝 -->
               
               
               
               
               
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
