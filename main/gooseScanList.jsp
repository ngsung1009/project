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
            
            <table width="100%" border="0"><tr><td>Goose 스캔<small></small></td>
            <td width="110"><button style="float: right;" type="button" onclick="location.href='<c:url value='/gooseList.do'/>' " class="btn btn-primary">Goose 실시간</button></td>
            <td width="110"><button style="float: right;" type="button" onclick="location.href='<c:url value='/gooseStatusList.do'/>' " class="btn btn-primary">Goose 현황</button></td>
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
                <table  border="0">
                    <tr style="height: 40px">
                        
                        <td width="50" align="center"><label>시작일</label></td>
                        <td width="60" class=""><input type="date" placeholder="YYY/MM/dd" name="startDate" id="startDate" class="form-control" value="<%= sf.format(nowTime) %>"/></td>

						<td width="50" align="center"><label>종료일</label></td>
                        <td width="60" class=""><input type="date" placeholder="YYY/MM/dd" name="endDate" id="endDate" class="form-control" value="<%= sf.format(nowTime) %>"/></td>

                        <td width="40" align="center">&nbsp;<label>추가</label></td>
                        <td width="180" class=""><input type="text" name="addFilter"></td>
                        <td width="40" align="center"><button type="button" class="btn btn-primary">검색</button></td>
                    </tr>

                    
                 </table>

                </form>
                </div>


               
               <!-- 엑세스스위치 시작 -->
            	
            	<section class="content-header">
			        <h1>
			            <small><label>Goose 스캔</label></small><button type="button" style="float: right;" class="btn btn-primary">CSV파일저장</button>
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
	                                <div class="table-header">
	                                    <span class="column-title">LED</span>
	                                </div>
	                            </th>
								<th class="secondary-text hidden-xs">
	                                <div class="table-header">
	                                    <span class="column-title">일시</span>
	                                </div>
	                            </th>
	                            <th class="secondary-text">
	                                <div class="table-header">
	                                    <span class="column-title">주소</span>
	                                </div>
	                            </th>
	                            <th class="secondary-text">
	                                <div class="table-header">
	                                    <span class="column-title">IED</span>
	                                </div>
	                            </th>
	                            <th class="secondary-text hidden-xs">
	                                <div class="table-header">
	                                    <span class="column-title">GOOSE시간</span>
	                                </div>
	                            </th>
								<th class="secondary-text">
	                                <div class="table-header">
	                                    <span class="column-title">GOOSE주소</span>
	                                </div>
	                            </th>
	                            
								<th class="secondary-text">
	                                <div class="table-header">
	                                    <span class="column-title">GOOSE ID</span>
	                                </div>
	                            </th>
	                            <th class="secondary-text">
	                                <div class="table-header">
	                                    <span class="column-title">Default 주소</span>
	                                </div>
	                            </th>
	                            <th class="secondary-text">
	                                <div class="table-header">
	                                    <span class="column-title">MAC 주소</span>
	                                </div>
	                            </th>
	                            <th class="secondary-text">
	                                <div class="table-header">
	                                    <span class="column-title">상태</span>
	                                </div>
	                            </th>
	                        </tr>
	                    </thead>
	                    <tbody id="repotbl" >
  
                            <tr>
                                <td>-</td>
                                <td>2019-11-11 19:20</td>
                                <td>D444_C2MTR_BCTL/LLNO GO/GOOSEPUB1</td>
                                <td>2019-11-11 19:20</td>
                                <td>12</td>
                                <td>D980_C6065_PT</td>
                                <td>01-0C-CD-01-00-7D</td>
                                <td>01-0C-CD-01-00-7D</td>
                                <td>1</td>
                                <td>복귀</td>
                            </tr>
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
