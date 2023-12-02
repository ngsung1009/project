package taehee.saSystem.main.web;

import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

import taehee.saSystem.main.service.SaSystemService;
import taehee.saSystem.main.service.SaSystemVO;

import java.util.Date;

import javax.annotation.Resource;
import javax.servlet.http.*;

public class SessionListener implements HttpSessionBindingListener{

 /** EgovSampleService */
 @Resource(name = "saSystemService")
 private SaSystemService saSystemService;
 
 @Override
 public void valueBound(HttpSessionBindingEvent event) {
 Date date = new Date();
 System.out.println(date.getHours() + ":" + date.getMinutes() + ":" + date.getSeconds() + " 세션생성");
 System.out.println(event.getName() + " / " + event.getSession().getId());   // getName() 은 account 가 출력됨.
 }
 
 
 @Override
 public void valueUnbound(HttpSessionBindingEvent event) {
 Date date = new Date();
 System.out.println(date.getHours() + ":" + date.getMinutes() + ":" + date.getSeconds() + " 세션만료");
 System.out.println(event.getName() + " / " + event.getSession().getId());

 SaSystemVO saSystemVO = new SaSystemVO();
 //로그아웃시간 입력
 saSystemVO.setId(event.getName());
 try {
	saSystemService.updateLoginInfo(saSystemVO);
	 System.out.println(event.getName() + " / " + event.getSession().getId());
 } catch (Exception e) {
	// TODO Auto-generated catch block
	e.printStackTrace();
 }
 // 세션이 종료되면 다른 작업 수행 구문 작성
 }
}

