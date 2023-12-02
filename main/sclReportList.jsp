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
            
            <table width="100%" border="0"><tr><td>SCL/Report 검사<small></small></td>
            <td width="110"><button style="float: right;" type="button" onclick="location.href='<c:url value='/engineeringList.do'/>' " class="btn btn-primary">엔지니어링 검사</button></td>
            <td width="90"><button style="float: right;" type="button" onclick="location.href='<c:url value='/ietList.do'/>' " class="btn btn-primary">IET 검사</button></td>
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
                        
                        <td width="70" align="center"><label>운영기준</label></td>
                        <td width="260" class=""><select id="basicRoll">
                        <option>운영기준(개정:20191111)</option>
                        </select></td>
                        <td width="70" align="center"><button type="button" class="btn btn-primary">추가</button></td>
                        <td width="70" align="center"><button type="button" class="btn btn-primary">수정</button></td>
                        <td width="70" align="center"><button type="button" class="btn btn-primary">삭제</button></td>
                    </tr>
                 </table>
                </form>
                </div>


               
               <!-- 엑세스스위치 시작 -->
            	
            	<section class="content-header">
			        <h1>
			        	<table width="100%" border="0"><tr><td><small>SCL/Report 검사</small></td>
			            <td width="110"><button style="float: right;" type="button" class="btn btn-primary">검사시작</button></td>
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
	                                    <span class="column-title">IED</span>
	                                </div>
	                            </th>

	                            <th class="secondary-text">
	                                <div class="table-header">
	                                    <span class="column-title">RCB</span>
	                                </div>
	                            </th>
	                            <th class="secondary-text hidden-xs">
	                                <div class="table-header">
	                                    <span class="column-title">Buffered</span>
	                                </div>
	                            </th>
	                            <th class="secondary-text hidden-xs">
	                                <div class="table-header">
	                                    <span class="column-title">Buffertime</span>
	                                </div>
	                            </th>
	                            <th class="secondary-text hidden-xs">
	                                <div class="table-header">
	                                    <span class="column-title">Integrity Period</span>
	                                </div>
	                            </th>
	                            <th class="secondary-text hidden-xs">
	                                <div class="table-header">
	                                    <span class="column-title">Dchg</span>
	                                </div>
	                            </th>
	                            <th class="secondary-text hidden-xs">
	                                <div class="table-header">
	                                    <span class="column-title">Qchg</span>
	                                </div>
	                            </th>
	                            <th class="secondary-text hidden-xs">
	                                <div class="table-header">
	                                    <span class="column-title">Dupd</span>
	                                </div>
	                            </th>
	                            <th class="secondary-text hidden-xs">
	                                <div class="table-header">
	                                    <span class="column-title">Intpd</span>
	                                </div>
	                            </th>
	                            <th class="secondary-text hidden-xs">
	                                <div class="table-header">
	                                    <span class="column-title">SeqNum</span>
	                                </div>
	                            </th>
								<th class="secondary-text">
	                                <div class="table-header">
	                                    <span class="column-title">TimeStamp</span>
	                                </div>
	                            </th>
	                            <th class="secondary-text">
	                                <div class="table-header">
	                                    <span class="column-title">Reason</span>
	                                </div>
	                            </th>
								<th class="secondary-text">
	                                <div class="table-header">
	                                    <span class="column-title">DataSet</span>
	                                </div>
	                            </th>
	                            <th class="secondary-text">
	                                <div class="table-header">
	                                    <span class="column-title">DataRef</span>
	                                </div>
	                            </th>
	                            <th class="secondary-text">
	                                <div class="table-header">
	                                    <span class="column-title">BufOvf</span>
	                                </div>
	                            </th>
	                            <th class="secondary-text">
	                                <div class="table-header">
	                                    <span class="column-title">EntryID</span>
	                                </div>
	                            </th>
	                            <th class="secondary-text">
	                                <div class="table-header">
	                                    <span class="column-title">ContRev</span>
	                                </div>
	                            </th>
	                        </tr>
	                    </thead>
	                    <tbody id="repotbl" >
  
                            <tr>
                                <td>D980_C6065_PT</td>
                                <td>D444_C2MTR_BCTL/LLNO GO/GOOSEPUB1</td>
                                <td></td>
                                <td>0</td>
                                <td>6000</td>
                                <td> </td>
                                <td>v</td>
                                <td>v</td>
                                <td>v</td>
                                <td>v</td>
                                <td> </td>
                                <td>v</td>
                                <td>v</td>
                                <td>v</td>
                                <td>v</td>
                                <td></td>
                                <td>v</td>
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
