<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<!-- meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge"-->
    <title>SA System</title>
    <!-- Tell the browser to be responsive to screen width -->
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <!-- Bootstrap 3.3.6 -->
    <link rel="stylesheet" href="adminstyle/bootstrap/css/bootstrap.min.css">
    <!-- Bootstrap datetime -->
    <link rel="stylesheet" href="adminstyle/bootstrap/css/bootstrap-datetimepicker.min.css">
            <link type="text/css" href="adminstyle/bootstrap/css/bootstrap-timepicker.min.css" />

  <!-- Font Awesome -->
  <!-- <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css"> -->
  <link href="adminstyle/fontawesome/css/all.css" rel="stylesheet">
  <!-- Ionicons -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
  <!-- daterange picker -->
  <link rel="stylesheet" href="adminstyle/plugins/daterangepicker/daterangepicker.css">
  <!-- bootstrap datepicker -->
  <link rel="stylesheet" href="adminstyle/plugins/datepicker/datepicker3.css">
  <!-- iCheck for checkboxes and radio inputs -->
  <link rel="stylesheet" href="adminstyle/plugins/iCheck/all.css">
  <!-- Bootstrap Color Picker -->
  <link rel="stylesheet" href="adminstyle/plugins/colorpicker/bootstrap-colorpicker.min.css">
  <!-- Bootstrap time Picker -->
  <link rel="stylesheet" href="adminstyle/plugins/timepicker/bootstrap-timepicker.min.css">
  <!-- Select2 -->
  <link rel="stylesheet" href="adminstyle/plugins/select2/select2.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="adminstyle/dist/css/AdminLTE.min.css">
  <!-- AdminLTE Skins. Choose a skin from the css/skins
       folder instead of downloading all of them to reduce the load. -->
  <link rel="stylesheet" href="adminstyle/dist/css/skins/_all-skins.min.css">



  <!-- DataTables -->
  <link rel="stylesheet" href="adminstyle/plugins/datatables/dataTables.bootstrap.css">
  <!-- link rel="stylesheet" href="adminstyle/plugins/datatables/jquery.dataTables.css"-->
  <link rel="stylesheet" href="adminstyle/plugins/datatables/jquery.css">
  <link rel="stylesheet" href="adminstyle/dist/css/skins/_all-skins.min.css">
    
    

    <!--<link rel="stylesheet" type="text/css" href="<?php echo base_url(); ?>adminstyle/plugins/msdropdown/dd.css" />-->
    <style>
        .dd .ddArrow{
            background:url(dd_arrow.gif) no-repeat;
        }
        .dd .ddTitle{
            background:#e2e2e4 url(title-bg.gif) repeat-x left top;
        }
    </style>
    
    <!-- jQuery 2.2.3 -->
<script src="adminstyle/plugins/jQuery/jquery-2.2.3.min.js"></script>
<!-- jQuery UI 1.11.4 -->
<script src="https://code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>
<!-- Bootstrap datetime -->
<script src="adminstyle/bootstrap/js/bootstrap-datetimepicker.min.js"></script>
<script type="text/javascript" src="adminstyle/bootstrap/js/bootstrap-timepicker.min.js"></script>