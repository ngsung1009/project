package taehee.saSystem.main.web;

import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.StringReader;
import java.security.Principal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import egovframework.rte.fdl.property.EgovPropertyService;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;
import taehee.saSystem.main.service.SaSystemService;
import taehee.saSystem.main.service.SaSystemDefaultVO;
import taehee.saSystem.main.service.SaSystemVO;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.xpath.XPath;
import javax.xml.xpath.XPathConstants;
import javax.xml.xpath.XPathFactory;

import org.apache.commons.io.IOUtils;
import org.apache.log4j.Logger;
import org.apache.log4j.spi.LoggerFactory;
import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.util.Assert;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springmodules.validation.commons.DefaultBeanValidator;
import org.w3c.dom.Document;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;
import org.xml.sax.InputSource;
import org.springframework.web.bind.annotation.RequestParam;


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
public class EnviromentController {
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
	 * 환경설정 .
	 * @param searchVO - 조회조건 정보가 담긴 VO
	 * @param model
	 * @return "EthernetSwitch"
	 * @exception Exception
	 */
	@SuppressWarnings("null")
	@RequestMapping(value = "/enviromentList.do")
	public String enviromentList(@ModelAttribute("searchVO") SaSystemDefaultVO searchVO, Model model, HttpServletRequest request) throws Exception {
		SaSystemVO saSystemVO = new SaSystemVO();
		HttpSession session = request.getSession();
	    String ids = (String)session.getAttribute("id");
	    String auth = (String)session.getAttribute("auth");
	    if((ids == null || ids.equals(""))) {
			return "forward:/login.do";
		}

		saSystemVO.setIedName("0");//최초 ied check시 true로 보낼라고
		model.addAttribute("iedInfo", saSystemVO);
		return "main/enviromentList";
	}
	@RequestMapping(value = "/addIed.do")
	public String addIed(@ModelAttribute("searchVO") SaSystemDefaultVO searchVO, Model model, HttpServletRequest request) throws Exception {
		SaSystemVO saSystemVO = new SaSystemVO();
		HttpSession session = request.getSession();
	    String ids = (String)session.getAttribute("id");
	    String auth = (String)session.getAttribute("auth");
	    if((ids == null || ids.equals(""))) {
			return "forward:/login.do";
		}
	    
	    


		return "main/enviromentList";
	}
	/**
	 * 이더넷화면.
	 * @param searchVO - 조회조건 정보가 담긴 VO
	 * @param model
	 * @return "EthernetSwitch"
	 * @exception Exception
	 */
	@SuppressWarnings("null")
	@RequestMapping(value = "/equipmentList.do")
	public String equipmentList(@ModelAttribute("searchVO") SaSystemDefaultVO searchVO, Model model, HttpServletRequest request) throws Exception {
		SaSystemVO saSystemVO = new SaSystemVO();
		HttpSession session = request.getSession();
	    String ids = (String)session.getAttribute("id");
	    String auth = (String)session.getAttribute("auth");
	    if((ids == null || ids.equals(""))) {
			return "forward:/login.do";
		}
	    List<?> selectEquipList = saSystemService.selectEquipList(searchVO);
		model.addAttribute("equipList", selectEquipList);
		
		return "main/equipmentList";
	}
	/**
	 * 장비 삭제한다.
	 * @param sampleVO - 삭제할 정보가 담긴 VO
	 * @param searchVO - 목록 조회조건 정보가 담긴 VO
	 * @param status
	 * @return "forward:/egovSampleList.do"
	 * @exception Exception
	 */
	@RequestMapping("/delEquip.do")
	public String delEquip(SaSystemVO SaSystemVO, @ModelAttribute("searchVO") SaSystemDefaultVO searchVO, SessionStatus status) throws Exception {
		
		String selectEquip = SaSystemVO.getSelectEquip().toString();
		  
		String[] selectedEquip = selectEquip.split(";;");                     // '-'로 연결된 userid를 split으로 잘라 배열에 넣음.
		  
	     if(selectedEquip != null && selectedEquip.length>0){
	       for(int i=0 ; i<selectedEquip.length ; i++){
	    	   SaSystemVO.setEquipType(selectedEquip[i].split("_")[0]);
	    	   SaSystemVO.setNum(Integer.parseInt(selectedEquip[i].split("_")[1]));
	    	   if(selectedEquip[i].split("_")[0].equals("IED")) {
	    		   saSystemService.delIed(SaSystemVO);
	    	   }
	    	   if(selectedEquip[i].split("_")[0].equals("SA")) {
	    		   saSystemService.delSa(SaSystemVO);
	    	   }
	    	   if(selectedEquip[i].split("_")[0].equals("ES")) {
	    		   saSystemService.delEs(SaSystemVO);
	    	   }
	    	   if(selectedEquip[i].split("_")[0].equals("SNTP")) {
	    		   saSystemService.delSntp(SaSystemVO);
	    	   }
	       }
	     } 
		status.setComplete();
		return "forward:/equipmentList.do";
	}
	/**
	 * 장비 패킷수신제외한다.
	 * @param sampleVO - 삭제할 정보가 담긴 VO
	 * @param searchVO - 목록 조회조건 정보가 담긴 VO
	 * @param status
	 * @return "forward:/egovSampleList.do"
	 * @exception Exception
	 */
	@RequestMapping("/exceptEquipPack.do")
	public String exceptEquipPack(SaSystemVO SaSystemVO, @ModelAttribute("searchVO") SaSystemDefaultVO searchVO, SessionStatus status) throws Exception {
		
		String selectEquip = SaSystemVO.getSelectEquip().toString();
		  
		String[] selectedEquip = selectEquip.split(";;");                     // '-'로 연결된 userid를 split으로 잘라 배열에 넣음.
		  
	     if(selectedEquip != null && selectedEquip.length>0){
	       for(int i=0 ; i<selectedEquip.length ; i++){
	    	   SaSystemVO.setEquipType(selectedEquip[i].split("_")[0]);
	    	   SaSystemVO.setNum(Integer.parseInt(selectedEquip[i].split("_")[1]));
	    	   if(selectedEquip[i].split("_")[0].equals("IED")) {
	    		   saSystemService.exceptPackIed(SaSystemVO);
	    	   }
	    	   if(selectedEquip[i].split("_")[0].equals("SA")) {
	    		   saSystemService.exceptPackSa(SaSystemVO);
	    	   }
	    	   if(selectedEquip[i].split("_")[0].equals("ES")) {
	    		   saSystemService.exceptPackEs(SaSystemVO);
	    	   }
	    	   if(selectedEquip[i].split("_")[0].equals("SNTP")) {
	    		   saSystemService.exceptPackSntp(SaSystemVO);
	    	   }
	       }
	     } 
		status.setComplete();
		return "forward:/packetExceptList.do";
	}
	/**
	 * 장비 패킷수신한다.
	 * @param sampleVO - 삭제할 정보가 담긴 VO
	 * @param searchVO - 목록 조회조건 정보가 담긴 VO
	 * @param status
	 * @return "forward:/egovSampleList.do"
	 * @exception Exception
	 */
	@RequestMapping("/addEquipPack.do")
	public String addEquipPack(SaSystemVO SaSystemVO, @ModelAttribute("searchVO") SaSystemDefaultVO searchVO, SessionStatus status) throws Exception {
		
		String selectEquip = SaSystemVO.getSelectEquip().toString();
		  
		String[] selectedEquip = selectEquip.split(";;");                     // '-'로 연결된 userid를 split으로 잘라 배열에 넣음.
		  
	     if(selectedEquip != null && selectedEquip.length>0){
	       for(int i=0 ; i<selectedEquip.length ; i++){
	    	   SaSystemVO.setEquipType(selectedEquip[i].split("_")[0]);
	    	   SaSystemVO.setNum(Integer.parseInt(selectedEquip[i].split("_")[1]));
	    	   if(selectedEquip[i].split("_")[0].equals("IED")) {
	    		   saSystemService.addPackIed(SaSystemVO);
	    	   }
	    	   if(selectedEquip[i].split("_")[0].equals("SA")) {
	    		   saSystemService.addPackSa(SaSystemVO);
	    	   }
	    	   if(selectedEquip[i].split("_")[0].equals("ES")) {
	    		   saSystemService.addPackEs(SaSystemVO);
	    	   }
	    	   if(selectedEquip[i].split("_")[0].equals("SNTP")) {
	    		   saSystemService.addPackSntp(SaSystemVO);
	    	   }
	       }
	     } 
		status.setComplete();
		return "forward:/packetExceptList.do";
	}
	//private static final Logger logger = LoggerFactory.getLogger(EnviromentController.class);

	/**
	 * iet xml파일저장
	 * @return 
	 * @throws IOException 
	 */
	@RequestMapping(value = "/saveDefaultInfo.do")
	public String saveDefaultInfo(final MultipartHttpServletRequest request, Model model, SessionStatus status, SaSystemVO saSystemVO,SaSystemDefaultVO searchVO, HttpServletRequest request1)
			throws Exception {
		
		final long startTime = System.nanoTime();
		/*
		 * validate request type
		 */
		Assert.state(request instanceof MultipartHttpServletRequest,
				"request !instanceof MultipartHttpServletRequest");
		final MultipartHttpServletRequest multiRequest = (MultipartHttpServletRequest) request;
		/*
		 * extract files
		 */
		final Map<String, MultipartFile> files = multiRequest.getFileMap();
		Assert.notNull(files, "files is null");
		Assert.state(files.size() > 0, "0 files exist");
	     
		/*
		 * process files
		 */
		String uploadPath = "C:\\Default_File";
		File saveFolder = new File(uploadPath);
		 
		// 디렉토리 생성
		if (!saveFolder.exists() || saveFolder.isFile()) {
			saveFolder.mkdirs();
		}
		Iterator<Entry<String, MultipartFile>> itr = files.entrySet()
				.iterator();
		MultipartFile file;
		List fileInfoList = new ArrayList();
		
		String filePath = "";//파일경로
		String sclFile = "";//scl 파일
		//String excelFile = "";//엑셀파일
		String sclFileName = "";//scl 파일
		//String excelFileName = "";//엑셀파일
		while (itr.hasNext()) {
			Entry<String, MultipartFile> entry = itr.next();
			System.out.println("[" + entry.getKey() + "]");
		 
			file = entry.getValue();//각 파일추출
			
			if ("outsideScl".equals(entry.getKey())) {//scl파일추출
				if(file.getOriginalFilename() == null || file.getOriginalFilename().equals("")) {}else {
					filePath = uploadPath + "\\" + file.getOriginalFilename();
					System.out.println("XML to String using BufferedReader : "+file.getOriginalFilename()); 
					file.transferTo(new File(filePath));//파일저장
					//MultipartFile 을 String로 변환
					ByteArrayInputStream stream = new   ByteArrayInputStream(file.getBytes());
					sclFile = IOUtils.toString(stream, "UTF-8");
					sclFileName = file.getOriginalFilename();
					System.out.println("XML to String using BufferedReader : "); 
				}
				//System.out.println(myString); 
			}
			
//			if ("excel".equals(entry.getKey())) {
//				filePath = uploadPath + "\\" + file.getOriginalFilename();
//				file.transferTo(new File(filePath));//파일저장
//				excelFileName = file.getOriginalFilename();
//				ByteArrayInputStream stream = new   ByteArrayInputStream(file.getBytes());
//				excelFile = IOUtils.toString(stream, "UTF-8");
//			}
		}
		saSystemVO.setSclFileName(sclFileName);
		saSystemVO.setFilePath(uploadPath);

		SaSystemVO defaultVO = selectDefault(saSystemVO, searchVO);
		if(defaultVO == null) {
			//ied 저장
			saSystemService.insertDefault(saSystemVO);
			System.out.println("--------------------11-----------");
			status.setComplete();
		}else {
			//ied 업데이트.
			saSystemService.updateDefault(saSystemVO);
			System.out.println("--------------------22-----------");
			status.setComplete();
			//session.setAttribute("auth",iedList.getAuth());
		}
		
		return "forward:defaultList.do";
	}
	/**
	 * DEFAULT SETTING 조회한다.
	 * @param sampleVO - 조회할 정보가 담긴 VO
	 * @param searchVO - 목록 조회조건 정보가 담긴 VO
	 * @param status
	 * @return @ModelAttribute("sampleVO") - 조회한 정보
	 * @exception Exception
	 */
	public SaSystemVO selectDefault(SaSystemVO SaSystemVO, @ModelAttribute("searchVO") SaSystemDefaultVO searchVO) throws Exception {
		return saSystemService.selectDefault(SaSystemVO);
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
    @Inject
    SaSystemService adminAccountsMngService;
    //HashMap<String,String> CustomParamMap = new HashMap<String,String>();
    @RequestMapping(value = "/excelUploadPage", method = RequestMethod.GET)
    public String serviceMngForm(Model model,Principal principal,HashMap paramMap) {
    	model.addAttribute("userNm", principal.getName());
    	model.addAttribute("menuTarget", paramMap.get("menuTarget"));
    	return "admin/accountsMng/excelUploadPage";
    }

    @RequestMapping(value = "/compExcelUpload")
    public ModelAndView excelUpload(MultipartHttpServletRequest req) throws Exception{
    	ModelAndView mav = new ModelAndView("admin/accountsMng/excelUploadPage");
    	List<?> list = new ArrayList<>();
    	//엑셀 파일이 xls일때와 xlsx일때 서비스 라우팅
    	String excelType = req.getParameter("excelType");
    	if(excelType.equals("xlsx")){
    			list = saSystemService.xlsxExcelReader(req);
    	}else if(excelType.equals("xls")){
    			list = saSystemService.xlsExcelReader(req);
    	}
    	mav.addObject("list", list);
    	return mav;
    }
	/**
	 * 이더넷화면.
	 * @param searchVO - 조회조건 정보가 담긴 VO
	 * @param model
	 * @return "EthernetSwitch"
	 * @exception Exception
	 */
	@SuppressWarnings("null")
	@RequestMapping(value = "/portList.do")
	public String portList(@ModelAttribute("searchVO") SaSystemDefaultVO searchVO, Model model, HttpServletRequest request) throws Exception {
		SaSystemVO saSystemVO = new SaSystemVO();
		HttpSession session = request.getSession();
	    String ids = (String)session.getAttribute("id");
	    String auth = (String)session.getAttribute("auth");
	    if((ids == null || ids.equals(""))) {
			return "forward:/login.do";
		}
	    List<?> selectEquipList = saSystemService.selectEquipList(searchVO);
		model.addAttribute("equipList", selectEquipList);
		
		List<?> selectEquipConnectList = saSystemService.selectEquipConnectList(searchVO);
		model.addAttribute("equipConnectList", selectEquipConnectList);
		
		return "main/portList";
	}
	/**
	 * 이더넷화면.
	 * @param searchVO - 조회조건 정보가 담긴 VO
	 * @param model
	 * @return "EthernetSwitch"
	 * @exception Exception
	 */
	@SuppressWarnings("null")
	@RequestMapping(value = "/packetExceptList.do")
	public String packetExceptList(@ModelAttribute("searchVO") SaSystemDefaultVO searchVO, Model model, HttpServletRequest request) throws Exception {
		SaSystemVO saSystemVO = new SaSystemVO();
		HttpSession session = request.getSession();
	    String ids = (String)session.getAttribute("id");
	    String auth = (String)session.getAttribute("auth");
	    if((ids == null || ids.equals(""))) {
			return "forward:/login.do";
		}
	    
	    List<?> selectEquipList = saSystemService.selectEquipList(searchVO);
		model.addAttribute("equipList", selectEquipList);
		
		return "main/packetExceptList";
	}
	/**
	 * 이더넷화면.
	 * @param searchVO - 조회조건 정보가 담긴 VO
	 * @param model
	 * @return "EthernetSwitch"
	 * @exception Exception
	 */
	@SuppressWarnings("null")
	@RequestMapping(value = "/defaultList.do")
	public String defaultList(@ModelAttribute("searchVO") SaSystemDefaultVO searchVO, Model model, HttpServletRequest request) throws Exception {
		SaSystemVO saSystemVO = new SaSystemVO();
		HttpSession session = request.getSession();
	    String ids = (String)session.getAttribute("id");
	    String auth = (String)session.getAttribute("auth");
	    if((ids == null || ids.equals(""))) {
			return "forward:/login.do";
		}
	    SaSystemVO defaultVO = selectDefault(saSystemVO, searchVO);
	    if(defaultVO != null) {
	    	model.addAttribute("defaultInfo", defaultVO);
	    }
		return "main/defaultList";
	}
	/**
	 * 이더넷화면.
	 * @param searchVO - 조회조건 정보가 담긴 VO
	 * @param model
	 * @return "EthernetSwitch"
	 * @exception Exception
	 */
	@SuppressWarnings("null")
	@RequestMapping(value = "/userAccountList.do")
	public String userAccountList(@ModelAttribute("searchVO") SaSystemDefaultVO searchVO, Model model, HttpServletRequest request) throws Exception {
		SaSystemVO saSystemVO = new SaSystemVO();
		HttpSession session = request.getSession();
	    String ids = (String)session.getAttribute("id");
	    String auth = (String)session.getAttribute("auth");
	    if((ids == null || ids.equals(""))) {
			return "forward:/login.do";
		}

	    List<?> selectUserList = saSystemService.selectUserList(searchVO);
		model.addAttribute("userList", selectUserList);
		return "main/userAccountList";
	}
	/**
	 * 사용자 등록한다.
	 * @param sampleVO - 등록할 정보가 담긴 VO
	 * @param searchVO - 목록 조회조건 정보가 담긴 VO
	 * @param status
	 * @return "forward:/egovSampleList.do"
	 * @exception Exception
	 */
	@RequestMapping(value = "/addUser.do", method = RequestMethod.POST)
	public String addUser(@ModelAttribute("searchVO") SaSystemDefaultVO searchVO, SaSystemVO saSystemVO, 
			BindingResult bindingResult, Model model, SessionStatus status,HttpServletResponse response)
			throws Exception {

		// Server-Side Validation
		beanValidator.validate(saSystemVO, bindingResult);

		SaSystemVO checkUser = selectUserChk(saSystemVO,searchVO);
		
		if(checkUser == null) {
			if (bindingResult.hasErrors()) {
				model.addAttribute("saSystemVO", saSystemVO);
				return "main/userAccountList";
			}
	
			saSystemService.insertUser(saSystemVO);
			status.setComplete();
			return "forward:/userAccountList.do";
		}else {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('이미존재하는 ID입니다.'); </script>");
			out.flush();
			//out.close();
			return "forward:/userAccountList.do";
		}
	}
	/**
	 * 사용자조회한다.
	 * @param sampleVO - 조회할 정보가 담긴 VO
	 * @param searchVO - 목록 조회조건 정보가 담긴 VO
	 * @param status
	 * @return @ModelAttribute("sampleVO") - 조회한 정보
	 * @exception Exception
	 */
	public SaSystemVO selectUserChk(SaSystemVO SaSystemVO, @ModelAttribute("searchVO") SaSystemDefaultVO searchVO) throws Exception {
		return saSystemService.selectUserChk(SaSystemVO);
	}
	/**
	 * 사용자 삭제한다.
	 * @param sampleVO - 삭제할 정보가 담긴 VO
	 * @param searchVO - 목록 조회조건 정보가 담긴 VO
	 * @param status
	 * @return "forward:/egovSampleList.do"
	 * @exception Exception
	 */
	@RequestMapping("/deleteUser.do")
	public String deleteUser(SaSystemVO SaSystemVO, @ModelAttribute("searchVO") SaSystemDefaultVO searchVO, SessionStatus status) throws Exception {
		
		String selectUser = SaSystemVO.getSelectUser().toString();
		  
		String[] selectedUser = selectUser.split(";;"); 
		  
	     if(selectedUser != null && selectedUser.length>0){
	       for(int i=0 ; i<selectedUser.length ; i++){
	    	   SaSystemVO.setId(selectedUser[i]);
	    	   saSystemService.deleteUser(SaSystemVO);
	       }
	     } 
		status.setComplete();
		return "forward:/userAccountList.do";
	}
	/**
	 * sa를등록한다..
	 * @param sampleVO - 등록할 정보가 담긴 VO
	 * @param searchVO - 목록 조회조건 정보가 담긴 VO
	 * @param status
	 * @return "forward:/egovSampleList.do"
	 * @exception Exception
	 */
	@RequestMapping(value = "/addSa.do", method = RequestMethod.POST)
	public String addSa(@ModelAttribute("searchVO") SaSystemDefaultVO searchVO, SaSystemVO saSystemVO, BindingResult bindingResult, Model model, SessionStatus status, HttpServletRequest request)
			throws Exception {
		HttpSession session = request.getSession();
	    String ids = (String)session.getAttribute("id");
	    String auth = (String)session.getAttribute("auth");
	    if((ids == null || ids.equals(""))) {
			return "forward:/login.do";
		}
		// Server-Side Validation
//		beanValidator.validate(saSystemVO, bindingResult);
//
//		if (bindingResult.hasErrors()) {
//			model.addAttribute("saSystemVO", saSystemVO);
//			return "main/enviromentList";
//		}

		saSystemService.insertSa(saSystemVO);
		status.setComplete();
		return "forward:/enviromentList.do";
	}
	/**
	 * switch를등록한다..
	 * @param sampleVO - 등록할 정보가 담긴 VO
	 * @param searchVO - 목록 조회조건 정보가 담긴 VO
	 * @param status
	 * @return "forward:/egovSampleList.do"
	 * @exception Exception
	 */
	@RequestMapping(value = "/addESwitch.do", method = RequestMethod.POST)
	public String addESwitch(@ModelAttribute("searchVO") SaSystemDefaultVO searchVO, SaSystemVO saSystemVO, BindingResult bindingResult, Model model, SessionStatus status, HttpServletRequest request)
			throws Exception {
		HttpSession session = request.getSession();
	    String ids = (String)session.getAttribute("id");
	    String auth = (String)session.getAttribute("auth");
	    if((ids == null || ids.equals(""))) {
			return "forward:/login.do";
		}

		saSystemService.insertESwitch(saSystemVO);
		status.setComplete();
		return "forward:/enviromentList.do";
	}
	/**
	 * sntp를등록한다..
	 * @param sampleVO - 등록할 정보가 담긴 VO
	 * @param searchVO - 목록 조회조건 정보가 담긴 VO
	 * @param status
	 * @return "forward:/egovSampleList.do"
	 * @exception Exception
	 */
	@RequestMapping(value = "/addSntp.do", method = RequestMethod.POST)
	public String addSntp(@ModelAttribute("searchVO") SaSystemDefaultVO searchVO, SaSystemVO saSystemVO, BindingResult bindingResult, Model model, SessionStatus status, HttpServletRequest request)
			throws Exception {
		HttpSession session = request.getSession();
	    String ids = (String)session.getAttribute("id");
	    String auth = (String)session.getAttribute("auth");
	    if((ids == null || ids.equals(""))) {
			return "forward:/login.do";
		}

		saSystemService.insertSntp(saSystemVO);
		status.setComplete();
		return "forward:/enviromentList.do";
	}
	/**
	 * port를등록한다..
	 * @param sampleVO - 등록할 정보가 담긴 VO
	 * @param searchVO - 목록 조회조건 정보가 담긴 VO
	 * @param status
	 * @return "forward:/egovSampleList.do"
	 * @exception Exception
	 */
	@RequestMapping(value = "/addPort.do", method = RequestMethod.POST)
	public String addPort(@ModelAttribute("searchVO") SaSystemDefaultVO searchVO, SaSystemVO saSystemVO, BindingResult bindingResult, Model model, SessionStatus status, HttpServletRequest request)
			throws Exception {
		HttpSession session = request.getSession();
	    String ids = (String)session.getAttribute("id");
	    String auth = (String)session.getAttribute("auth");
	    if((ids == null || ids.equals(""))) {
			return "forward:/login.do";
		}

		saSystemService.insertPort(saSystemVO);
		status.setComplete();
		return "forward:/portList.do";
	}
}
