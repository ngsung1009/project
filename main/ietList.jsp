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
    </script>

<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
        <h1>
            
            <table width="100%" border="0"><tr><td>IET 검사<small></small></td>
            <td width="110"><button style="float: right;" type="button" onclick="location.href='<c:url value='/engineeringList.do'/>' " class="btn btn-primary">엔지니어링 검사</button></td>
            <td width="130"><button style="float: right;" type="button" onclick="location.href='<c:url value='/sclReportList.do'/>' " class="btn btn-primary">SCL/Report 검사</button></td>
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
			        	<table width="100%" border="0"><tr><td><small>IET 검사</small></td>
			            <td width="110"><button style="float: right;" type="button" class="btn btn-primary">IET 검사</button></td>
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
	                                    <span class="column-title"><input type="checkbox" id="all" value="all"></span>
	                                </div>
	                            </th>
	                            <th class="secondary-text hidden-xs">
	                                <div class="table-header">
	                                    <span class="column-title">IED</span>
	                                </div>
	                            </th>

	                            <th class="secondary-text">
	                                <div class="table-header">
	                                    <span class="column-title">IP</span>
	                                </div>
	                            </th>
	                            <th class="secondary-text hidden-xs">
	                                <div class="table-header">
	                                    <span class="column-title">IED파일</span>
	                                </div>
	                            </th>
	                           
	                        </tr>
	                    </thead>
	                    <tbody id="repotbl" >
  						<c:forEach var="result" items="${ietList}" varStatus="status">
            				<tr>
                                <td class="listtd"><input type="checkbox" id="iedList" name="iedList"></td>
                                <td class="listtd"><c:out value="${result.iedName}"/></td>
                                <td class="listtd"><c:out value="${result.iedIp}"/></td>
                                <td class="listtd"><c:out value="${result.ietFile}"/></td>
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
