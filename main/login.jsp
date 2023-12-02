<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ page import="java.text.DecimalFormat" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Calendar" %>
<%
DecimalFormat df = new DecimalFormat("00");
Calendar currentCalendar = Calendar.getInstance();

//현재 날짜 구하기
String strYear = Integer.toString(currentCalendar.get(Calendar.YEAR));

SimpleDateFormat formatter = new SimpleDateFormat("yy");
String dateStr = formatter.format(new java.util.Date());

%>
<% 
  /**
  * @Class Name : login.jsp
  * @Description : 로긴 화면
  * @Modification Information
  *
  *   수정일         수정자                   수정내용
  *  -------    --------    ---------------------------
  *  2019.11.01            최초 생성
  *
  * author 남기성
  * since 2019.11.01
  *
  * Copyright (C) 2019 by TaeHee  All right reserved.
  */
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">

<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>SA System Login</title>
        <!-- Tell the browser to be responsive to screen width -->
        <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
        <!-- Bootstrap 3.3.6 -->
        <link rel="stylesheet" href="adminstyle/bootstrap/css/bootstrap.min.css">
        <!-- Font Awesome -->
        <!-- <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css"> -->
        <link href="adminstyle/fontawesome/css/all.css" rel="stylesheet">
        <!-- Ionicons -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
        <!-- Theme style -->
        <link rel="stylesheet" href="adminstyle/dist/css/AdminLTE.min.css">
        <!-- iCheck -->
        <link rel="stylesheet" href="adminstyle/plugins/iCheck/square/blue.css">

        <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
        <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
        <![endif]-->

    </head>
    <body class="hold-transition login-page">
    
	<c:set var="existId" value="${empty loginInfo.id ? 'fail' : 'success'}"/>
        <c:if test="${existId == 'fail'}">
                <div class="alert alert-danger alert-dismissible" style="text-align: center;">
                    <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
                    <h4><i class="icon fa fa-ban"></i> Login Error!</h4>
                    Wrong password or ID. Please re-check you ID, password and login again.
                </div>
        </c:if>


        <div class="login-box">
            <div class="login-logo">
                <a href=""><b>SA System (태희)</b></a>
            </div>
            <!-- /.login-logo -->
            <div class="login-box-body">
                <p class="login-box-msg">Sign in to start your session</p>
                <form:form commandName="searchVO" id="loginForm" name="loginForm" action="/SaSystem/loginResult.do" method="post">
                    <div class="form-group has-feedback">
                        <input type="text" class="form-control" name="id" required placeholder="Id">
                        <span class="glyphicon glyphicon-envelope form-control-feedback"></span>
                    </div>
                    <div class="form-group has-feedback">
                        <input type="password" class="form-control" required name="password" placeholder="Password">
                        <span class="glyphicon glyphicon-lock form-control-feedback"></span>
                    </div>
                    <div class="row">

                        <!-- /.col -->
                        <div class="col-xs-4">
                            <button type="submit" class="btn btn-primary btn-block btn-flat">Sign In</button>
                        </div>
                        <!-- /.col -->
                    </div>
                </form:form>
                <br/>

                <!-- /.social-auth-links -->

                <!-- a href="#">I forgot my password</a--><br>

            </div>
            <!-- /.login-box-body -->
            <p style="    font-size: 10px;
               padding-top: 10px;
               text-align: center;" >&COPY; <c:set var="nowdate" value='<%=dateStr%>' /> TaeHee, All Rights Reserved | Developed by <a href="#" >TaeHee System</a></p>
        </div>
        <!-- /.login-box -->

        <!-- jQuery 2.2.3 -->
        <script src="adminstyle/plugins/jQuery/jquery-2.2.3.min.js"></script>
        <!-- Bootstrap 3.3.6 -->
        <script src="adminstyle/bootstrap/js/bootstrap.min.js"></script>

     
    </body>
</html>

