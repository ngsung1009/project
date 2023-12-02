package taehee.saSystem.main.web;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import egovframework.rte.fdl.property.EgovPropertyService;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;
import taehee.saSystem.main.service.SaSystemService;
import taehee.saSystem.main.service.SaSystemDefaultVO;
import taehee.saSystem.main.service.SaSystemJsonVO;
import taehee.saSystem.main.service.SaSystemVO;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.support.SessionStatus;
import org.springmodules.validation.commons.DefaultBeanValidator;

import com.fasterxml.jackson.annotation.JsonManagedReference;

/**
 * @Class Name : FaultRecorderController.java
 * @Description : FaultRecorder Controller Class
 * @Modification Information
 * @
 * @  수정일      수정자              수정내용
 * @ ---------   ---------   -------------------------------
 * @ 2019.11.16           최초생성
 *
 * @author nam
 * @since 2011. 11.16
 * @version 1.0
 * @see
 *
 *  Copyright (C) by TAEHEE All right reserved.
 */
@Controller
public class FaultRecorderController {
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
	 * 이더넷화면.
	 * @param searchVO - 조회조건 정보가 담긴 VO
	 * @param model
	 * @return "EthernetSwitch"
	 * @exception Exception
	 */
	@SuppressWarnings("null")
	@RequestMapping(value = "/faultRecorderList.do")
	public String ethernetSwitchList(@ModelAttribute("searchVO") SaSystemDefaultVO searchVO, Model model, HttpServletRequest request) throws Exception {
		SaSystemVO saSystemVO = new SaSystemVO();
		HttpSession session = request.getSession();
	    String ids = (String)session.getAttribute("id");
	    if(ids == null || ids.equals("")) {
			return "forward:/login.do";
		}
	    List<?> selectEthernetSwitchHisList = saSystemService.selectEthernetSwitchHisList(searchVO);
		model.addAttribute("ethernetSwitchHisList", selectEthernetSwitchHisList);
	    
		List<?> selectMmsHisList = saSystemService.selectMmsHisList(searchVO);
		model.addAttribute("mmsHisList", selectMmsHisList);
		
		List<?> selectGooseHisList = saSystemService.selectGooseHisList(searchVO);
		model.addAttribute("gooseHisList", selectGooseHisList);
		//삭제기준날짜
		SaSystemVO VO = new SaSystemVO();
	    VO.setTitle1("FAULT_RECORD");
		model.addAttribute("saveMonth", saSystemService.selectDelDate(VO));
		return "main/faultRecorderList";
	}
	/**
	 * fault record 사게기준 수정한다.
	 * @param sampleVO - 수정할 정보가 담긴 VO
	 * @param searchVO - 목록 조회조건 정보가 담긴 VO
	 * @param status
	 * @return "forward:/egovSampleList.do"
	 * @exception Exception
	 */
	@JsonManagedReference
	@RequestMapping(value = "/delFaultRecordDate.do", method = RequestMethod.POST,consumes = MediaType.APPLICATION_JSON_VALUE,
			produces = MediaType.APPLICATION_JSON_VALUE)//consumes 와 produces를 넣어준다.

	@ResponseBody //이게 없으면 return 값이 안넘어간다
	public SaSystemVO delFaultRecordDate(@RequestBody Map<String, Object> param) throws Exception {  
	    String saveMonth = (String) param.get("saveMonth");
	    String hdd = (String) param.get("hdd");
	    System.out.println(param+"--------------------------------------000-----------------"+saveMonth);
	    SaSystemVO VO = new SaSystemVO();
	    VO.setSaveMonth(saveMonth);
	    VO.setHdd(hdd);
	    VO.setTitle1("FAULT_RECORD");
	    System.out.println(param+"--------------------------------------111-----------------"+hdd);
	    saSystemService.delFaultRecordDate(VO); 
		return saSystemService.selectDelDate(VO);
	}
	
}
