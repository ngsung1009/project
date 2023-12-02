
<!-- ./wrapper -->

<!-- Resolve conflict in jQuery UI tooltip with Bootstrap tooltip -->
<script>
    $.widget.bridge('uibutton', $.ui.button);
</script>
<!-- Bootstrap 3.3.6 -->
<script src="adminstyle/bootstrap/js/bootstrap.min.js"></script>
<!-- script src="adminstyle/bootstrap/js/jasny-bootstrap.min.js"></script-->

<!-- DataTables -->
<script src="adminstyle/plugins/datatables/jquery.dataTables.min.js"></script>
<!-- script src="adminstyle/plugins/datatables/jquery.dataTables.js"></script-->
<script src="adminstyle/plugins/datatables/dataTables.bootstrap.min.js"></script>
<script>

    $(function () {
    	$('table.display').DataTable({
    			"paging": true,
      	      "lengthChange": true,
      	      "searching": false,
      	      "ordering": false,
      	      "info": true,
      	      "autoWidth": false});
        $("#tbl_packet").DataTable();
        $("#tbl1").DataTable({
			"paging": true,
    	      "lengthChange": true,
    	      "searching": false,
    	      "ordering": false,
    	      "info": true,
    	      "autoWidth": false});
        $("#tbl2").DataTable({"filter":false,"ordering":false});
        $("#tbl3").DataTable({"filter":false,"ordering":false});
        $("#tbl4").DataTable({"filter":false,"ordering":false});
        $("#tbl5").DataTable({"filter":false,"ordering":false});
        $("#tbl6").DataTable({"filter":false,"ordering":false});
        $("#tblScl").DataTable({
			"paging": true,
    	      "lengthChange": true,
    	      "searching": true,
    	      "ordering": false,
    	      "info": true,
    	      "autoWidth": false});
        $("#tblF1").DataTable({
    		"paging": true,
    	      "lengthChange": true,
    	      "searching": true,
    	      "ordering": false,
    	      "info": true,
    	      "autoWidth": false});

    	$("#tblF2").DataTable({
    		"paging": true,
    	      "lengthChange": true,
    	      "searching": true,
    	      "ordering": false,
    	      "info": true,
    	      "autoWidth": false});

    	$("#tblF3").DataTable({
    		"paging": true,
    	      "lengthChange": true,
    	      "searching": true,
    	      "ordering": false,
    	      "info": true,
    	      "autoWidth": false});

    	$("#tblF4").DataTable({
    		"paging": true,
    	      "lengthChange": true,
    	      "searching": true,
    	      "ordering": false,
    	      "info": true,
    	      "autoWidth": false});
    });
    
    
    var dev="";
</script>

<!-- Datetimepicker picker -->
<!-- script src="adminstyle/plugins/datetimepicker/datetimepicker.js"></script-->
<!-- Bootstrap WYSIHTML5 -->
<script src="adminstyle/plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.all.min.js"></script>
<!-- Slimscroll -->
<script src="adminstyle/plugins/slimScroll/jquery.slimscroll.min.js"></script>
<!-- FastClick -->
<script src="adminstyle/plugins/fastclick/fastclick.js"></script>
<!-- AdminLTE App -->
<script src="adminstyle/dist/js/app.min.js"></script>
<!-- AdminLTE dashboard demo (This is only for demo purposes) -->

<!-- AdminLTE for demo purposes -->
<script src="adminstyle/dist/js/demo.js"></script>
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>



    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDyfn51T4qG9yTDMN24cOu_RQYEATnfZeg&libraries=places&callback=initAutocomplete"
    async defer></script>
<!--
    <script>


    $(document).ready(function () {
        $("#propicchange").click(function () {
            $("#fileupds").trigger("click");
        });


        $("#fileupds").change(function () {
            $("#modelloading").show();
            var formData = new FormData($("#frmpicupload")[0]);

            $.ajax({
                url: document.location.origin + dev + '/index.php/Admin/modagentpic',
                type: 'POST',
                data: formData,
                contentType: false,
                processData: false
            }).done(function (msg) {
                location.reload();
            });
        });
        
        
        $("#update1").click(function(){
            $("#modelloading").show();
            $.ajax({
                url: document.location.origin + dev + '/index.php/Admin/modagentprfile',
                type: 'POST',
                data: $("#updatefrm1").serialize()
            }).done(function (msg) {
                location.reload();
            });
        });
        
        
        $("#update2").click(function(){
            $("#modelloading").show();
            $.ajax({
                url: document.location.origin + dev + '/index.php/Admin/modagentreea',
                type: 'POST',
                data: $("#updatefrm2").serialize()
            }).done(function (msg) {
                location.reload();
            });
        });
        
        
         $("#update3").click(function(){
            $("#modelloading").show();
            $.ajax({
                url: document.location.origin + dev + '/index.php/Admin/modagentagency',
                type: 'POST',
                data: $("#updatefrm3").serialize()
            }).done(function (msg) {
                location.reload();
            });
        });



    });





    var placeSearch, autocomplete;


    function initAutocomplete() {
        // Create the autocomplete object, restricting the search to geographical
        // location types..
        // console.log(document.getElementById('autocomplete').value);

        autocomplete = new google.maps.places.Autocomplete(
                /** @type {!HTMLInputElement} */(document.getElementById('suburbs')),
                {types: ['geocode']});



        // When the user selects an address from the dropdown, populate the address
        // fields in the form.
        autocomplete.addListener('place_changed', fillInAddress);
    }


    function fillInAddress() {
        var place;
        // place.geometry.location.lat()
        //place.geometry.location.lng()

        place = autocomplete.getPlace();
        document.getElementById("lat").value = place.geometry.location.lat();
        document.getElementById("lon").value = place.geometry.location.lng();


    }
    // Bias the autocomplete object to the user's geographical location,
    // as supplied by the browser's 'navigator.geolocation' object.
    function geolocate() {
        if (navigator.geolocation) {
            navigator.geolocation.getCurrentPosition(function (position) {
                var geolocation = {
                    lat: position.coords.latitude,
                    lng: position.coords.longitude
                };
                var circle = new google.maps.Circle({
                    center: geolocation,
                    radius: position.coords.accuracy
                });
                //autocomplete.setBounds(circle.getBounds());
            });


        }
    }


    </script>
-->



    <style>
        .selectedrow{
            background:gray !important;
            color:white !important;
        }


    </style>
    <!--  
    <script type="text/javascript">
        var arg = [];
        $(document).ready(function () {
            $("#property_id").change(function () {
                GetAssist();
                $("#assings").show();
                GetSearchAssist();
            });

            function GetAssist() {
                var property_id = "";//document.getElementById("property_id").value;

                $.ajax({
                    url: "",
                    type: 'POST',
                    dataType: 'json',
                    data: {
                        'property_id': property_id
                    },
                    error: function () {
                        // message("Please, try again.");
                    },
                    success: function (data) {
                        // alert(JSON.stringify(result));
                        // message("gsdgd.");
                        // assist_info = JSON.stringify(data);

                        // alert(data['result'].length); 

                        var HTML = "";

                        var assist_size = data['assist_list'].length;

                        //console.log(data);

                        if (assist_size > 0) {
                            for (var rows = 0; rows < assist_size; rows++) {
                                HTML += "<tr>";
                                /*HTML += "    <td><img width='50' src='<?php echo base_url(); ?>" + data['assist_list'][rows].agent_pic + "' /></td>";
                                HTML += "    <td>" + data['assist_list'][rows].agent_code + "</td>";
                                HTML += "    <td>" + data['assist_list'][rows].agent_first_name + " " + data['assist_list'][rows].agent_last_name + "</td>";
                                HTML += "    <td>" + data['assist_list'][rows].agent_email + "</td>";
                                HTML += "    <td>" + data['assist_list'][rows].agent_mobile + "</td>";
                                HTML += "    <td>" + data['assist_list'][rows].agent_phone + "</td>";
                                HTML += "    <td>";
                                HTML += "        <button type='button' agentid='" + data['assist_list'][rows].agent_id + "' class='btn btn-sm btn-danger dele'>DELETE</button>";
                                HTML += "    </td>";
                                */
                                HTML += "</tr>";
                            }
                        } else {
                            HTML += "<tr><td colspan='7' align=center> No Result </td></tr>";
                        }

                        HTML += "";
                        ////document.getElementById("assist_list").innerHTML = HTML;
                    }
                });
            }



            function GetSearchAssist() {

                //var key_word = document.getElementById("key_word").value;
                var property_id = "";//document.getElementById("property_id").value;

                $.ajax({
                    url: "",//"<?php echo base_url("index.php/Admin/GetSearchAssistAjax"); ?>",
                    type: 'POST',
                    dataType: 'json',
                    data: {
                        'property_id': property_id
                    },
                    error: function () {
                        // message("Please, try again.");
                    },
                    success: function (data) {

                        //console.log(data);

                        var HTML = "";
                        var assist_size = data['result'].length;
                        if (assist_size > 0) {
                            for (var i = 0; i < assist_size; i++) {
                                HTML += "<tr style='cursor:pointer;' angtid=" + data['result'][i].agent_id + ">";
                               /* HTML += "    <td>" + data['result'][i].agent_first_name + " " + data['result'][i].agent_last_name + "</td>";
                                HTML += "    <td>" + data['result'][i].agent_email + "</td>";
                                HTML += "    <td>" + data['result'][i].agent_mobile + "</td>";
                                HTML += "    <td>" + data['result'][i].agent_phone + "</td>";
                                */
                                HTML += "</tr>";
                            }

                        } else {
                            HTML += "<tr><td colspan='7' align=center> No Result </td></tr>";
                        }

                        ////document.getElementById("assist_search").innerHTML = HTML;
                    }
                });
            }



            $("#savebntf").click(function () {
                SetSearchAssist();
            });

            function SetSearchAssist() {
                var property_id = document.getElementById("property_id").value;

                // Test Code: A11F3C2DF

                for (var i = 0; i < arg.length; i++) {
                    $.ajax({
                        url: "",//"<?php echo base_url("index.php/Admin/SetAssistAjax"); ?>",
                        type: 'POST',
                        dataType: 'json',
                        data: {
                            'assist_agent_id': arg[i],
                            'property_id': property_id
                        },
                        error: function () {
                            // message("Please, try again.");
                        },
                        success: function (data) {
                            GetAssist();
                        }
                    });
                }

                $('#myModal').modal('hide');

            }



            $("body").on("click", "#assist_search tr", function () {

                if ($(this).hasClass("selectedrow")) {
                    if (arg.length > 0) {
                        var index = arg.indexOf($(this).attr("angtid"));
                        if (index > -1) {
                            arg.splice(index, 1);
                        }
                    }
                    $(this).removeClass("selectedrow");
                } else {
                    arg.push($(this).attr("angtid"));
                    $(this).addClass("selectedrow");
                }
            });

            function DelAssist(agent_id, tblbtn) {
                var property_id = document.getElementById("property_id").value;

                // Test Code: A11F3C2DF

                var chk = confirm('Are you sure you want to delete this?');

                if (chk == true) {
                    $.ajax({
                        url: "",//"<?php echo base_url("index.php/Admin/DelAssistAjax"); ?>",
                        type: 'POST',
                        dataType: 'json',
                        data: {
                            'assist_agent_id': agent_id,
                            'property_id': property_id
                        },
                        error: function () {
                            // message("Please, try again.");
                        },
                        success: function (data) {
                            tblbtn.parent("td").parent("tr").remove();

                        }
                    });
                }
            }




            $("body").on("click", "#assist_list tr td button.dele", function () {
                DelAssist($(this).attr("agentid"), $(this));
            });


        });












    </script>

-->



</body>
</html>
