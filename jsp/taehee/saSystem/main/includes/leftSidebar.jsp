<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
  <!-- Left side column. contains the logo and sidebar -->
  <aside class="main-sidebar">
    <!-- sidebar: style can be found in sidebar.less -->
    <section class="sidebar">
     
      <!-- /.search form -->
      <!-- sidebar menu: : style can be found in sidebar.less -->
      <ul class="sidebar-menu">
      <% if(String.valueOf((String)session.getAttribute("auth")).equals("1") ) { %> <!-- Only Admin -->
        <li class="header">for ADMIN </li>
     <% }else{ %> 
        <li class="header">for GUEST </li>
      <% } %> 
        <li>
          <a href="<c:url value='/packetList.do'/>">
            <i class="fa fa-calendar"></i><span> 패킷추출 </span>
          </a>
        </li>
        
        <li>
          <a href="<c:url value='/ethernetSwitchList.do'/>">
            <i class="fa fa-calendar"></i><span> 이더넷스위치</span> 
          </a>
        </li>
        <li>
          <a href="<c:url value='/faultRecorderList.do'/>">
            <i class="fa fa-calendar"></i><span> Fault Recorder</span>
          </a>
        </li>
        <li>
          <a href="<c:url value='/mmsMessageList.do'/>">
            <i class="fa fa-calendar"></i><span> MMS 실시간</span>
          </a>
        </li>
        <li>
          <a href="<c:url value='/gooseList.do'/>">
            <i class="fa fa-calendar"></i><span> GOOSE 실시간</span>
          </a>
        </li>
        <li>
          <a href="<c:url value='/engineeringList.do'/>">
            <i class="fa fa-calendar"></i><span> 엔지니어링검사</span>
          </a>
        </li>
        <li>
          <a href="<c:url value='/enviromentList.do'/>">
            <i class="fa fa-calendar"></i><span> 환경설정</span>
          </a>
        </li>

        
      </ul>
      
    </section>
    <!-- /.sidebar -->
  </aside>