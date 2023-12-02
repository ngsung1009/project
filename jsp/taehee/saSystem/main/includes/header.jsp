<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<body class="hold-transition skin-blue sidebar-mini">
<div class="wrapper">
<script type="text/javaScript" language="javascript" defer="defer">
    /* 윈도우종료 */
    function fn_window_shotDown() {
    	if(confirm("작업중인 모든 응용프로그램이 저장없이 종료됩니다.\n 종료하시겠습니까?")){
    		location.href = "<c:url value='/windowsTurnOff.do'/>";
    	}
    }
    /* 윈도우재시작 */
    function fn_window_restart() {
    	if(confirm("작업중인 모든 응용프로그램이 저장없이 종료됩니다.\n 재시작하시겠습니까?")){
    		location.href = "<c:url value='/windowsRestart.do'/>";
    	}
    }
    function exportTableToCsv(tableId, filename) {
        if (filename == null || typeof filename == undefined)
            filename = tableId;
        filename += ".csv";
     
        var BOM = "\uFEFF";
     
        var table = document.getElementById(tableId);
        var csvString = BOM;
        for (var rowCnt = 0; rowCnt < table.rows.length; rowCnt++) {
            var rowData = table.rows[rowCnt].cells;
            for (var colCnt = 0; colCnt < rowData.length; colCnt++) {
                var columnData = rowData[colCnt].innerHTML;
                if (columnData == null || columnData.length == 0) {
                    columnData = "".replace(/"/g, '""');
                }
                else {
                    columnData = columnData.toString().replace(/"/g, '""'); // escape double quotes
                }
                csvString = csvString + '"' + columnData + '",';
            }
            csvString = csvString.substring(0, csvString.length - 1);
            csvString = csvString + "\r\n";
        }
        csvString = csvString.substring(0, csvString.length - 1);
     
        // IE 10, 11, Edge Run
        if (window.navigator && window.navigator.msSaveOrOpenBlob) {
     
            var blob = new Blob([decodeURIComponent(csvString)], {
                type: 'text/csv;charset=utf8'
            });
     
            window.navigator.msSaveOrOpenBlob(blob, filename);
     
        } else if (window.Blob && window.URL) {
            // HTML5 Blob
            var blob = new Blob([csvString], { type: 'text/csv;charset=utf8' });
            var csvUrl = URL.createObjectURL(blob);
            var a = document.createElement('a');
            a.setAttribute('style', 'display:none');
            a.setAttribute('href', csvUrl);
            a.setAttribute('download', filename);
            document.body.appendChild(a);
     
            a.click()
            a.remove();
        } else {
            // Data URI
            var csvData = 'data:application/csv;charset=utf-8,' + encodeURIComponent(csvString);
            var blob = new Blob([csvString], { type: 'text/csv;charset=utf8' });
            var csvUrl = URL.createObjectURL(blob);
            var a = document.createElement('a');
            a.setAttribute('style', 'display:none');
            a.setAttribute('target', '_blank');
            a.setAttribute('href', csvData);
            a.setAttribute('download', filename);
            document.body.appendChild(a);
            a.click()
            a.remove();
        }
    }
</script>
  <header class="main-header">
    <!-- Logo -->
    <a href="<c:url value='/login.do'/>" class="logo">
      <!-- mini logo for sidebar mini 50x50 pixels -->
      <span class="logo-mini">PM</span>
      <!-- logo for regular state and mobile devices -->
      <span class="logo-lg">SA System(태희)</span>
    </a>
    <!-- Header Navbar: style can be found in header.less -->
    <nav class="navbar navbar-static-top">
      <!-- Sidebar toggle button-->
      

      <div class="navbar-custom-menu">
        <ul class="nav navbar-nav">
          <!-- Messages: style can be found in dropdown.less-->
          
          <!-- Notifications: style can be found in dropdown.less -->
          
          <!-- Tasks: style can be found in dropdown.less -->
          
          <!-- User Account: style can be found in dropdown.less -->
          <li class="dropdown user user-menu">
              <a href="<c:url value='/login.do'/>">Main</a>
          </li>
          <li class="dropdown user user-menu">
              <a href="javascript:fn_window_restart();">윈도우재시작</a>
          </li>
          <li class="dropdown user user-menu">
              <a href="javascript:fn_window_shotDown();">윈도우종료</a>
          </li>
          <li class="dropdown user user-menu">
              <a href="<c:url value='/logout.do'/>">Log Out</a>
          </li>
        </ul>
      </div>
    </nav>
  </header>