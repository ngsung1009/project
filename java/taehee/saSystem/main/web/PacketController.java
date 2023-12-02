package taehee.saSystem.main.web;

import java.io.IOException;
import java.util.List;

import egovframework.rte.fdl.property.EgovPropertyService;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;
import taehee.saSystem.main.service.SaSystemService;
import taehee.saSystem.main.service.SaSystemDefaultVO;
import taehee.saSystem.main.service.SaSystemVO;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.support.SessionStatus;
import org.springmodules.validation.commons.DefaultBeanValidator;
 
/**
 * @Class Name : PacketController.java
 * @Description : Packet Controller Class
 * @Modification Information
 * @
 * @  수정일      수정자              수정내용
 * @ ---------   ---------   -------------------------------
 * @ 2019.11.19           최초생성
 *
 * @author nam
 * @since 2011. 11.16
 * @version 1.0
 * @see
 *
 *  Copyright (C) by TAEHEE All right reserved.
 */
@Controller
public class PacketController {
	/** EgovSampleService */
	@Resource(name = "saSystemService")
	private SaSystemService saSystemService;

	/** EgovPropertyService */
	@Resource(name = "propertiesService")
	protected EgovPropertyService propertiesService;

	/** Validator */
	@Resource(name = "beanValidator")
	protected DefaultBeanValidator beanValidator;

	/**
	 * Packet화면.
	 * @param searchVO - 조회조건 정보가 담긴 VO
	 * @param model
	 * @return "packetList"
	 * @exception Exception
	 */
	@SuppressWarnings("null")
	@RequestMapping(value = "/packetList.do")
	public String packetList(@ModelAttribute("searchVO") SaSystemDefaultVO searchVO, SaSystemVO SaSystemVO, Model model, HttpServletRequest request) throws Exception {
		SaSystemVO saSystemVO = new SaSystemVO();
		HttpSession session = request.getSession();
	    String ids = (String)session.getAttribute("id");
	    if(ids == null || ids.equals("")) {
			return "forward:/login.do";
		}
	    
	    //전체 패킷이 저장되고 있는 장치 리스트
	    List<?> equipList = saSystemService.selectEquipList(searchVO);
		model.addAttribute("equipList", equipList);
		
		//장치 아이디
		String selectEquip = SaSystemVO.getSelectEquip();
		if(selectEquip != null) {
			selectEquip.toString();
			System.out.println(SaSystemVO.getStartDate()+"-------------------"+searchVO.getStartDate());
			String[] selectedEquip = selectEquip.split(";;");                     // '-'로 연결된 userid를 split으로 잘라 배열에 넣음.
			String equipTypeArray = "";
			//equipTypeArray = new String[2];
			String numArray = "";
			//numArray = new String[2];
			String comma = ",";
		     if(selectedEquip != null && selectedEquip.length>0){
		       for(int i=0 ; i<selectedEquip.length ; i++){
		    	   
		    	   System.out.println("-------------------"+selectedEquip[i].split("_",-1)[0]);
		    	   if(selectedEquip[i].split("_").length > 0) {
		    		   if (i == selectedEquip[i].split("_").length-1) {
			    		   comma = "";
			    	   }
			    	   equipTypeArray += "'"+selectedEquip[i].split("_",-1)[0]+"'"+comma;
			    	   numArray += "'"+selectedEquip[i].split("_",-1)[1]+"'"+comma;
		    	   }
		       }
		     } 
		    String startTime = "";
		    String endTime = "";
		    if(SaSystemVO.getStartTime() != null) {
		    	System.out.println("--"+SaSystemVO.getStartTime().split(" ")[1]+"-------------------"+SaSystemVO.getEndTime().split(" ")[0]);
			    if(SaSystemVO.getStartTime().split(" ")[1].equals("AM")) {
			    	startTime = SaSystemVO.getStartTime().split(" ")[0];
			    }
			    if(SaSystemVO.getStartTime().split(" ")[1].equals("PM")) {
			    	startTime = Integer.toString(Integer.parseInt(SaSystemVO.getStartTime().split(" ")[0].split(":")[0])+12)+":"+SaSystemVO.getStartTime().split(" ")[0].split(":")[1];
			    	 
			    	System.out.println("--"+SaSystemVO.getStartTime().split(" ")[1]+"-------------------"+SaSystemVO.getEndTime().split(" ")[0]);
			    }
		    }
		    if(SaSystemVO.getEndTime() != null) {
			    if(SaSystemVO.getEndTime().split(" ")[1].equals("AM")) {
			    	endTime = SaSystemVO.getEndTime().split(" ")[0];
			    }
			    if(SaSystemVO.getEndTime().split(" ")[1].equals("PM")) {
			    	endTime = Integer.toString(Integer.parseInt(SaSystemVO.getEndTime().split(" ")[0].split(":")[0])+12)+":"+SaSystemVO.getEndTime().split(" ")[0].split(":")[1];
			    }
		    }
		    SaSystemVO.setStartTime(startTime);
		    SaSystemVO.setEndTime(endTime);
		    SaSystemVO.setEquipTypeArray(equipTypeArray);
		    SaSystemVO.setNumArray(numArray);
		    System.out.println(startTime+"-------------------"+endTime);
			//전체 패킷이 저장되고 있는 장치 리스트
		    List<?> packetExtrList = saSystemService.selectExtrPacketList(SaSystemVO);
			model.addAttribute("packetExtrList", packetExtrList);
		}
		//저장된 패킷리스트 불러오기
	    //List<?> packetList = saSystemService.selectPacketList(searchVO);
		//model.addAttribute("packetList", packetList);
		
		return "main/packetList";
	}
}
