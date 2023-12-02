
<% 
  /**
  * @Class Name : egovSampleList.jsp
  * @Description : Sample List 화면
  * @Modification Information
  *
  *   수정일         수정자                   수정내용
  *  -------    --------    ---------------------------
  *  2009.02.01            최초 생성
  *
  * author 실행환경 개발팀
  * since 2009.02.01
  *
  * Copyright (C) 2009 by MOPAS  All right reserved.
  */
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
        
        /* 글 등록 화면 function */
        function fn_egov_addView() {
           	document.listForm.action = "<c:url value='/addSample.do'/>";
           	document.listForm.submit();
        }
        
        /* 글 목록 화면 function */
        function fn_egov_selectList() {
        	document.listForm.action = "<c:url value='/egovSampleList.do'/>";
           	document.listForm.submit();
        }
        
        /* pagination 페이지 링크 function */
        function fn_egov_link_page(pageNo){
        	document.listForm.pageIndex.value = pageNo;
        	document.listForm.action = "<c:url value='/egovSampleList.do'/>";
           	document.listForm.submit();
        }
        
        //-->
    </script>

<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
        <h1>
            SA System
            <small>This Section Provides detailed information about SA System</small>
        </h1>

    </section>

    <!-- Main content -->

    <section class="content">

        <div class="clearfix" ></div>
        <br/>
        <div class="col-xs-12" >
            <!-- Default box -->
            <div class="box">
                <div class="box-header with-border">

                <form action="addAgent" method="POST">
                <table style="width: 100%" border="0">
                    <tr style="height: 40px">
                        <td class="col-sm-1"><label>* First Name:</label></td>
                        <td class="col-sm-2"><input type="text" name="first_name"/></td>
                        <td class="col-sm-1"><label>* Last Name:</label></td>
                        <td class="col-sm-2"><input type="text" name="last_name"/></td>
                        <td class="col-sm-4">&nbsp;</td>
                    </tr>
                    <tr style="height: 40px">
                        <td class="col-sm-1"><label>* E-mail:</label></td>
                        <td class="col-sm-2"><input type="text" name="email"/></td>
                        <td class="col-sm-1"><label>* E-mail:</label></td>
                        <td class="col-sm-2">
                            <select name="agency_id"> 

                            </select> 
                        </td>
                        <td colspan="3">&nbsp;</td>
                    </tr>
                    <tr style="height: 40px">
                        <td class="col-sm-1"><label>Mobile:</label></td>
                        <td class="col-sm-2"><input type="text" name="mobile"/></td>
                        <td colspan="3">&nbsp;</td>
                    </tr>
                    <tr style="height: 40px">
                        <td class="col-sm-1"><label>Phone:</label></td>
                        <td class="col-sm-2"><input type="text" name="phone"/></td>
                        <td colspan="3">&nbsp;</td>
                    </tr>
                    <tr style="height: 40px">
                        <td class="col-sm-1"><label>* Password:</label></td>
                        <td class="col-sm-2"><input type="password" name="password" id="password" onkeyup='check();'/></td>
                        <td class="col-sm-1"><label>* Confirm Password:</label></td>
                        <td class="col-sm-2"><input type="password" name="confirm_password" id="confirm_password" onkeyup='check();'/></td>
                        <td class="col-sm-4">&nbsp;</td>
                    </tr>
                    <tr style="height: 40px">
                        <td class="col-sm-1"><label>Picture:</label></td>
                        <td colspan="4">
                            <div style="padding-top: 10px; padding-left: 15px"> 
                                <div class="fileinput fileinput-new" data-provides="fileinput">
                                <span class="btn btn-sm btn-primary btn-file"><span class="fileinput-new">Select file</span><span class="fileinput-exists">Change</span><input type="file" name="news_pic"></span>
                                <span class="fileinput-filename"></span>
                                <a href="#" class="close fileinput-exists" data-dismiss="fileinput" style="float: none">&times;</a>
                            </div>
                        </td>
                    </tr>
                    <tr style="height: 40px">
                        <td class="col-sm-1">&nbsp;</td>
                        <td colspan="4">
                            <div style="padding-top: 10px; "> 
                                <div class="col-sm-3"><input class="btn btn-sm btn-success" type="submit" value="SAVE"></div>
                            </div>
                        </td>
                    </tr>
                </table>
                </form>




                </div>

                
            	<div class="box-body">
                	<table class="table table-bordered table-striped" id="tbl1" >
	                    <thead>
	                        <tr>
	                            <th class="secondary-text hidden-xs">
	                                <div class="table-header">
	                                    <span class="column-title">aaaa</span>
	                                </div>
	                            </th>
								<th class="secondary-text hidden-xs">
	                                <div class="table-header">
	                                    <span class="column-title">bbbb</span>
	                                </div>
	                            </th>
	                            <th class="secondary-text">
	                                <div class="table-header">
	                                    <span class="column-title">Title</span>
	                                </div>
	                            </th>
	                            <th class="secondary-text hidden-xs">
	                                <div class="table-header">
	                                    <span class="column-title">Added Date</span>
	                                </div>
	                            </th>
	
	                            <th class="secondary-text">
	                                <div class="table-header">
	                                    <span class="column-title">fffff</span>
	                                </div>
	                            </th>
	                            <th class="secondary-text">
	                                <div class="table-header">
	                                    <span class="column-title">Actions</span>
	                                </div>
	                            </th>
	
	                        </tr>
	                    </thead>
	                    <tbody id="repotbl" >
  
                            <tr>
                                <td>aaaa</td>
                                <td></td>
                                <td>aaaa</td>
                                <td>aaaa</td>
                                <td>aaaaa</td>
                                <td align="right">
                                <form action="index.php/WebAdmin/deleteProperty" method="POST">
                                    <div class="btn-group" role="group" aria-label="...">

                                        <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal_">View</button>
                                        <button type="button" class="btn btn-warning" onclick="location.href='/index.php/WebAdmin/editPropertyForm?id=property_id'">Edit</button>
                                        <input type="hidden" name="propertyId" value="property_id" />
                                        <button type="submit" class="btn btn-danger" onclick="return confirm('Are you sure you want to delete this?');">Delete</button>
                                    </div>
                                </form>
                                </td>
                            </tr>
                                <!-- Modal -->
                                <div id="myModal_" class="modal fade" role="dialog"">
                                    <div class="modal-dialog" style="width:950px;">

                                        <!-- Modal content-->
                                        <div class="modal-content">
                                        <form action="/index.php/Admin/modAdvertiser" method="POST" onsubmit="return upfregisterform_submit(this);" enctype="multipart/form-data">
                                        <div class="modal-header" >
                                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                                            <h4 class="modal-title">Property <small>Detail</small></h4>
                                        </div>
                                        <div class="modal-body">
                                        <div style="margin-top:5px;" class="row">
                                                <label class="col-sm-3" style="width:150px;">ID:</label>
                                                <div class="col-sm-3">property_id</div>
                                            </div>
                                            <div style="margin-top:5px;" class="row">
                                                <label class="col-sm-3" style="width:150px;">Type:</label>
                                                <div class="col-sm-5">property_type_name</div>
                                            </div>
                                            <div style="margin-top:5px;" class="row" >
                                                <label class="col-sm-3" style="width:150px;">Title:</label>
                                                <div class="col-sm-4">property_title</div>
                                                <label class="col-sm-4">&nbsp;</label>
                                            </div>
                                            <div style="margin-top:5px;" class="row" >
                                                <label class="col-sm-3" style="width:150px;">Address:</label>
                                                <div class="col-sm-8">address</div>
                                                <label class="col-sm-4">&nbsp;</label>
                                            </div>
                                            <div style="margin-top:5px;" class="row" >
                                                <label class="col-sm-3" style="width:150px;">Num of Bedrooms:</label>
                                                <div class="col-sm-4">property_bedroom</div>
                                                <label class="col-sm-4">&nbsp;</label>
                                            </div>
                                            <div style="margin-top:5px;" class="row" >
                                                <label class="col-sm-3" style="width:150px;">Num of Bathrooms:</label>
                                                <div class="col-sm-4">property_bathroom</div>
                                                <label class="col-sm-4">&nbsp;</label>
                                            </div>
                                            <div style="margin-top:5px;" class="row" >
                                                <label class="col-sm-3" style="width:150px;">Car Park:</label>
                                                <div class="col-sm-4">property_carpark</div>
                                                <label class="col-sm-4">&nbsp;</label>
                                            </div>
                                            <div style="margin-top:5px;" class="row">
                                                <label class="col-sm-3" style="width:150px;">Land Area:</label>
                                                <div class="col-sm-4">property_land_area</div>
                                                <label class="col-sm-4" id="up_message"></label>
                                            </div>
                                            <div style="margin-top:5px;" class="row">
                                                <label class="col-sm-4" style="width:150px;">Schools:</label>
                                                <div class="col-sm-6" >property_school</div>
                                            </div>
                                            <div style="margin-top:5px;" class="row" >
                                                <label class="col-sm-3" style="width:150px;">Price:</label>
                                                <div class="col-sm-8"></div>
                                            </div>
                                            <div style="margin-top:5px;" class="row">
                                                <label class="col-sm-4" style="width:150px;">Duration of Listing:</label>
                                                <div class="col-sm-6" >property_available_date</div>
                                            </div>
                                            <!-- div style="margin-top:5px;" class="row">
                                                <label class="col-sm-4" style="width:150px;">Open Home:</label>
                                                <div class="col-sm-6" ></div>
                                            </div-->
                                            <div style="margin-top:5px;" class="row">
                                                <label class="col-sm-4" style="width:150px;">Agent:</label>
                                                <div class="col-sm-6" >
                                                
                                                
                                                </div>
                                            </div>
                                            <div style="margin-top:5px;" class="row">
                                                <label class="col-sm-4" style="width:150px;">Picture:</label>
                                                <div class="col-sm-6" >
                                                
                                                
                                                </div>
                                            </div>
                                            <div class="modal-footer">
                                                <button type="button" class="btn btn-sm btn-default" data-dismiss="modal">Close</button>
                                            </div>
                                        </div>
                                        </form>
                                    </div>
                                </div>
                                </div>
                                <!-- Modal -->
                                <div id="myModalE_" class="modal fade" role="dialog"">
                                    <div class="modal-dialog" style="width:950px;">

                                        <!-- Modal content-->
                                        <div class="modal-content">
                                        <form action="/index.php/Admin/modAdvertiser" method="POST" onsubmit="return upfregisterform_submit(this);" enctype="multipart/form-data">
                                        <div class="modal-header" >
                                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                                            <h4 class="modal-title">Property <small>Detail</small></h4>
                                        </div>
                                        <div class="modal-body">
                                        <div style="margin-top:5px;" class="row">
                                                <label class="col-sm-3" style="width:150px;">ID:</label>
                                                <div class="col-sm-3">property_id</div>
                                            </div>
                                            <div style="margin-top:5px;" class="row">
                                                <label class="col-sm-3" style="width:150px;">Sale/Rent:</label>
                                                <div class="col-sm-3"><select name="options" onchange="javascript:changeTypeList(this,'');">
                                                <option value="0" >Sale</option>
                                                <option value="1" >Rent</option>
                                                </select></div>
                                            </div>
                                            <div style="margin-top:5px;" class="row">
                                                <label class="col-sm-3" style="width:150px;">Type:</label>
                                                
                                                
                                                <div class="col-sm-3 sale_"  style="display: none;">
                                                    sdsdsd
                                                </div>
                                                <div class="col-sm-3 rent_>"  style="display: none;">
                                                    <select name="ptype">
                                                       
                                                    </select>
                                                </div>

                                            </div>
                                            <div style="margin-top:5px;" class="row" >
                                                <label class="col-sm-3" style="width:150px;">Title:</label>
                                                <div class="col-sm-6"><input type="text" style="width: 100%;" name="title" value="property_title"/></div>
                                                <label class="col-sm-4">&nbsp;</label>
                                            </div>
                                            <div style="margin-top:5px;" class="row" >
                                                <label class="col-sm-3" style="width:150px;">Address:</label>
                                                <div class="col-sm-4">
  
                                                <input type="text" name="streetno" id="street_number" required placeholder="Street" class="form-control" value="address">

                                                <input type="hidden" name="street" id="route" required placeholder="Street" class="form-control">
                    
                                                <input type="hidden" name="administrative_area_level_1" id="administrative_area_level_1" required class="form-control">
                                                </div>
                                                <label class="col-sm-4">&nbsp;</label>
                                            </div>
                                            <div style="margin-top:5px;" class="row" >
                                                <label class="col-sm-3" style="width:150px;">Region:</label>
                                                <div class="col-sm-6"><select class="form-control" name="region" id="region" >
                                                                    </select></div>
                                                <label class="col-sm-4">&nbsp;</label>
                                            </div>
                                            <div style="margin-top:5px;" class="row" >
                                                <label class="col-sm-3" style="width:150px;">District:</label>
                                                <div class="col-sm-6"><select class="form-control" name="district" id="districts" >
                                                                        <option value="0">All Districts</option>
                                                                    </select></div>
                                                <label class="col-sm-4">&nbsp;</label>
                                            </div>
                                            <div style="margin-top:5px;" class="row" >
                                                <label class="col-sm-3" style="width:150px;">Suburb:</label>
                                                <div class="col-sm-6"><select class="form-control" name="suburb" id="suburbs" >
                                                                        <option value="0">All Suburbs</option>
                                                                    </select></div>
                                                <label class="col-sm-4">&nbsp;</label>
                                            </div>
                                            <div style="margin-top:5px;" class="row" >
                                                <label class="col-sm-3" style="width:150px;">Num of Bedrooms:</label>
                                                <div class="col-sm-4"><input type="text" style="width: 100%;" name="up_company" value="" size="40" maxlength="100"/></div>
                                                <label class="col-sm-4">&nbsp;</label>
                                            </div>
                                            <div style="margin-top:5px;" class="row" >
                                                <label class="col-sm-3" style="width:150px;">Num of Bathrooms:</label>
                                                <div class="col-sm-4"><input type="text" style="width: 100%;" name="up_address" value="" maxlength="150"/></div>
                                                <label class="col-sm-4">&nbsp;</label>
                                            </div>
                                            <div style="margin-top:5px;" class="row" >
                                                <label class="col-sm-3" style="width:150px;">Car Park:</label>
                                                <div class="col-sm-4"></div>
                                                <label class="col-sm-4">&nbsp;</label>
                                            </div>
                                            <div style="margin-top:5px;" class="row">
                                                <label class="col-sm-3" style="width:150px;">Land Area:</label>
                                                <div class="col-sm-4"><input type="password" name="up_password" onkeyup='check_up1(this,"");'/></div>
                                                <label class="col-sm-4" id="up_message"></label>
                                            </div>
                                            <div style="margin-top:5px;" class="row">
                                                <label class="col-sm-4" style="width:150px;">Schools:</label>
                                                <div class="col-sm-6" ><input type="password" name="up_confirm_password" onkeyup='check_up2(this,"");'/></div>
                                            </div>
                                            <div style="margin-top:5px;" class="row" >
                                                <label class="col-sm-3" style="width:150px;">Price:</label>
                                                <div class="col-sm-8">

                                                </div>
                                            </div>
                                            <div style="margin-top:5px;" class="row">
                                                <label class="col-sm-4" style="width:150px;">Duration of Listing:</label>
                                                <div class="col-sm-6" ><input type="password" name="up_confirm_password" onkeyup='check_up2(this,"");'/></div>
                                            </div>
                                            <div style="margin-top:5px;" class="row">
                                                <label class="col-sm-4" style="width:150px;">Open Home:</label>
                                                <div class="col-sm-6" ><input type="password" name="up_confirm_password" onkeyup='check_up2(this,"");'/></div>
                                            </div>
                                            <div style="margin-top:5px;" class="row">
                                                <label class="col-sm-4" style="width:150px;">Agent:</label>
                                                <div class="col-sm-6" ><input type="password" name="up_confirm_password" onkeyup='check_up2(this,"");'/></div>
                                            </div>
                                            <div style="margin-top:5px;" class="row">
                                                <label class="col-sm-4" style="width:150px;">Picture:</label>
                                                <div class="col-sm-6" ><input type="password" name="up_confirm_password" onkeyup='check_up2(this,"");'/></div>
                                            </div>
                                            <div class="modal-footer">
                                                <input type="hidden" name="product_id" value="" />
                                                <input class="btn btn-sm btn-success" type="submit" value="SAVE">
                                                <button type="button" class="btn btn-sm btn-default" data-dismiss="modal">Close</button>
                                            </div>
                                        </div>
                                        </form>
                                    </div>
                                </div>
                                </div>

                           
                            <tr>
                                <td colspan="6">No Data</td>
                            </tr>
                            <tr>
                                <td colspan="6">No Data</td>
                            </tr>
                            <tr>
                                <td colspan="6">No Data</td>
                            </tr>
                            <tr>
                                <td colspan="6">No Data</td>
                            </tr>
                            <tr>
                                <td colspan="6">No Data</td>
                            </tr>
                            <tr>
                                <td colspan="6">No Data</td>
                            </tr>

							
                        </tbody>
                	</table>
                    
                </div>
               

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
<script>
function changeTypeList(i,j){
		var value = i.value;
		if(value == 0){
        	$(".sale_"+j).show();
        	$(".rent_"+j).hide();
		}else if(value == 1){
			$(".sale_"+j).hide();
        	$(".rent_"+j).show();
		}
	}
</script>
<!-- /.content-wrapper -->


<%@ include file="includes/footer.jsp" %>
<%@ include file="includes/jsplugins.jsp" %>
