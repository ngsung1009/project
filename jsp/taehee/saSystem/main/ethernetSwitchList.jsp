<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.io.File" %>

<% 
  /**
  * @Class Name : EthernetSwitchList.jsp
  * @Description : EthernetSwitch List 화면
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
            	이더넷 스위치
            <small></small><button style="float: right;" type="button" onclick="location.href='<c:url value='/ethernetSwitchHisList.do'/>' " class="btn btn-primary">이더넷스위치 이력</button>
        </h1>

    </section>

    <!-- Main content -->

    <section class="content">
        <div class="clearfix" ></div>
        <div class="col-xs-12" >
            <!-- Default box -->
            <div class="box">
                
                <!-- 백본(메인) 시작 -->
            	<div class="box-body">
            	<section class="content-header">
			        <h1>
			            <small><label>백본(메인)</label></small>
			        </h1>
			    </section>
			    <section class="content">

		        <div class="clearfix" ></div>
		        
		        <div class="col-xs-12" >
		            <!-- Default box -->
		            <div class="box">
		                <div class="box-header with-border">
                		<table class="table table-bordered table-striped" id="tbl_es" >
	                    <thead>
                            <tr>
                             <c:forEach var="result" items="${ethernetSwitchList}" varStatus="status">
	                            <th class="secondary-text hidden-xs">
	                                <div class="table-header">
	                                    <span class="column-title"><c:out value="${status.index}"/></span>
	                                </div>
	                            </th>
	                         </c:forEach>
	                        </tr>
	                    </thead>
	                    <tbody id="repotbl" >
                             
                            <tr>
                            <c:forEach var="result" items="${ethernetSwitchList}" varStatus="status">
                                <td class="listtd"><c:out value="${result.useYn}"/></td>
                            </c:forEach>
                            </tr>
                            <tr>
                            <c:forEach var="result" items="${ethernetSwitchList}" varStatus="status">
                                <td class="listtd"><c:out value="${result.status}"/></td>
                            </c:forEach>
                            </tr>
                        </tbody>
                	</table>
                    </div>
                    </div>
                    </div>

               <!-- 백본(메인) 끝 -->
               <!-- 백본(백업) 시작 -->
            	
            	<section class="content-header">
			        <h1>
			            <small><label>백본(백업)</label></small>
			        </h1>
			    </section>


		        <div class="clearfix" ></div>
		        <br/>
		        <div class="col-xs-12" >
		            <!-- Default box -->
		            <div class="box">
		                <div class="box-header with-border">
                		<table class="table table-bordered table-striped" id="tbl_es" >
	                    <thead>
                            <tr>
                             <c:forEach var="result" items="${ethernetSwitchList}" varStatus="status">
	                            <th class="secondary-text hidden-xs">
	                                <div class="table-header">
	                                    <span class="column-title"><c:out value="${status.index}"/></span>
	                                </div>
	                            </th>
	                         </c:forEach>
	                        </tr>
	                    </thead>
	                    <tbody id="repotbl" >
                             
                            <tr>
                            <c:forEach var="result" items="${ethernetSwitchList}" varStatus="status">
                                <td class="listtd"><c:out value="${result.useYn}"/></td>
                            </c:forEach>
                            </tr>
                            <tr>
                            <c:forEach var="result" items="${ethernetSwitchList}" varStatus="status">
                                <td class="listtd"><c:out value="${result.status}"/></td>
                            </c:forEach>
                            </tr>
                        </tbody>
                	</table>
                    </div>
                    </div>
                    </div>

               <!-- 백본(백업) 끝 -->
               
               <!-- Access#1 시작 -->
            	
            	<section class="content-header">
			        <h1>
			            <small><label>Access#1</label></small>
			        </h1>
			    </section>


		        <div class="clearfix" ></div>
		        <br/>
		        <div class="col-xs-12" >
		            <!-- Default box -->
		            <div class="box">
		                <div class="box-header with-border">
                		<table class="table table-bordered table-striped" id="tbl_es1" >
	                    <thead>
                            <tr>
                             <c:forEach var="result" items="${ethernetSwitchList}" varStatus="status">
	                            <th class="secondary-text hidden-xs">
	                                <div class="table-header">
	                                    <span class="column-title"><c:out value="${status.index}"/></span>
	                                </div>
	                            </th>
	                         </c:forEach>
	                        </tr>
	                    </thead>
	                    <tbody id="repotbl" >
                             
                            <tr>
                            <c:forEach var="result" items="${ethernetSwitchList}" varStatus="status">
                                <td class="listtd"><c:out value="${result.useYn}"/></td>
                            </c:forEach>
                            </tr>
                            <tr>
                            <c:forEach var="result" items="${ethernetSwitchList}" varStatus="status">
                                <td class="listtd"><c:out value="${result.status}"/></td>
                            </c:forEach>
                            </tr>
                        </tbody>
                	</table>
                    </div>
                    </div>
                    </div>

               <!-- Access#1 끝 -->
               
               <!-- Access#2 시작 -->
            	
            	<section class="content-header">
			        <h1>
			            <small><label>Access#2</label></small>
			        </h1>
			    </section>


		        <div class="clearfix" ></div>
		        <br/>
		        <div class="col-xs-12" >
		            <!-- Default box -->
		            <div class="box">
		                <div class="box-header with-border">
                		<table class="table table-bordered table-striped" id="tbl_es2" >
	                    <thead>
                            <tr>
                             <c:forEach var="result" items="${ethernetSwitchList}" varStatus="status">
	                            <th class="secondary-text hidden-xs">
	                                <div class="table-header">
	                                    <span class="column-title"><c:out value="${status.index}"/></span>
	                                </div>
	                            </th>
	                         </c:forEach>
	                        </tr>
	                    </thead>
	                    <tbody id="repotbl" >
                             
                            <tr>
                            <c:forEach var="result" items="${ethernetSwitchList}" varStatus="status">
                                <td class="listtd"><c:out value="${result.useYn}"/></td>
                            </c:forEach>
                            </tr>
                            <tr>
                            <c:forEach var="result" items="${ethernetSwitchList}" varStatus="status">
                                <td class="listtd"><c:out value="${result.status}"/></td>
                            </c:forEach>
                            </tr>
                        </tbody>
                	</table>
                    </div>
                    </div>
                    </div>

               <!-- Access#2 끝 -->
               
               <!-- Access#3 시작 -->
            	
            	<section class="content-header">
			        <h1>
			            <small><label>Access#3</label></small>
			        </h1>
			    </section>


		        <div class="clearfix" ></div>
		        <br/>
		        <div class="col-xs-12" >
		            <!-- Default box -->
		            <div class="box">
		                <div class="box-header with-border">
                		<table class="table table-bordered table-striped" id="tbl_es3" >
	                    <thead>
                            <tr>
                             <c:forEach var="result" items="${ethernetSwitchList}" varStatus="status">
	                            <th class="secondary-text hidden-xs">
	                                <div class="table-header">
	                                    <span class="column-title"><c:out value="${status.index}"/></span>
	                                </div>
	                            </th>
	                         </c:forEach>
	                        </tr>
	                    </thead>
	                    <tbody id="repotbl" >
                             
                            <tr>
                            <c:forEach var="result" items="${ethernetSwitchList}" varStatus="status">
                                <td class="listtd"><c:out value="${result.useYn}"/></td>
                            </c:forEach>
                            </tr>
                            <tr>
                            <c:forEach var="result" items="${ethernetSwitchList}" varStatus="status">
                                <td class="listtd"><c:out value="${result.status}"/></td>
                            </c:forEach>
                            </tr>
                        </tbody>
                	</table>
                    </div>
                    </div>
                    </div>

               <!-- Access#3 끝 -->
               
               <!-- Access#4 시작 -->
            	
            	<section class="content-header">
			        <h1>
			            <small><label>Access#4</label></small>
			        </h1>
			    </section>


		        <div class="clearfix" ></div>
		        <br/>
		        <div class="col-xs-12" >
		            <!-- Default box -->
		            <div class="box">
		                <div class="box-header with-border">
                		<table class="table table-bordered table-striped" id="tbl_es4" >
	                    <thead>
                            <tr>
                             <c:forEach var="result" items="${ethernetSwitchList}" varStatus="status">
	                            <th class="secondary-text hidden-xs">
	                                <div class="table-header">
	                                    <span class="column-title"><c:out value="${status.index}"/></span>
	                                </div>
	                            </th>
	                         </c:forEach>
	                        </tr>
	                    </thead>
	                    <tbody id="repotbl" >
                             
                            <tr>
                            <c:forEach var="result" items="${ethernetSwitchList}" varStatus="status">
                                <td class="listtd"><c:out value="${result.useYn}"/></td>
                            </c:forEach>
                            </tr>
                            <tr>
                            <c:forEach var="result" items="${ethernetSwitchList}" varStatus="status">
                                <td class="listtd"><c:out value="${result.status}"/></td>
                            </c:forEach>
                            </tr>
                        </tbody>
                	</table>
                    </div>
                    </div>
                    </div>
				</section>
                </div>
               <!-- Access#4 끝 -->
               
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
