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
 * @Class Name : MmsMessageController.java
 * @Description : MmsMessage Controller Class
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
public class MmsMessageController {
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
	@RequestMapping(value = "/mmsMessageList.do")
	public String mmsMessageList(@ModelAttribute("searchVO") SaSystemDefaultVO searchVO, Model model, HttpServletRequest request) throws Exception {
		SaSystemVO saSystemVO = new SaSystemVO();
		HttpSession session = request.getSession();
	    String ids = (String)session.getAttribute("id");
	    if(ids == null || ids.equals("")) {
			return "forward:/login.do";
		}
	    
	    List<?> selectMmsMessageStatusList = saSystemService.selectMmsMessageStatusList(searchVO);
		model.addAttribute("mmsMessageStatusList", selectMmsMessageStatusList);
		
		List<?> selectMmsErrorList = saSystemService.selectMmsErrorList(searchVO);
		model.addAttribute("mmsErrorList", selectMmsErrorList);
		
		return "main/mmsMessageList";
	}
	
	/**
	 * 이더넷화면.
	 * @param searchVO - 조회조건 정보가 담긴 VO
	 * @param model
	 * @return "EthernetSwitch"
	 * @exception Exception
	 */
	@SuppressWarnings("null")
	@RequestMapping(value = "/reportStatusList.do")
	public String reportStatusList(@ModelAttribute("searchVO") SaSystemDefaultVO searchVO, Model model, HttpServletRequest request) throws Exception {
		SaSystemVO saSystemVO = new SaSystemVO();
		HttpSession session = request.getSession();
	    String ids = (String)session.getAttribute("id");
	    if(ids == null || ids.equals("")) {
			return "forward:/login.do";
		}
	    
	    List<?> selectIetList = saSystemService.selectIetList(searchVO);
		model.addAttribute("ietList", selectIetList);
		
		return "main/reportStatusList";
	}
}
