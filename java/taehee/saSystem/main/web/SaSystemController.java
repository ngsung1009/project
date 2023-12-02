/*
 * Copyright 2008-2009 the original author or authors.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package taehee.saSystem.main.web;

import java.io.BufferedInputStream;
import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.io.StringReader;
import java.nio.ByteBuffer;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.zip.ZipEntry;
import java.util.zip.ZipOutputStream;

import javax.annotation.Resource;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.xpath.XPath;
import javax.xml.xpath.XPathConstants;
import javax.xml.xpath.XPathFactory;

import org.apache.commons.io.IOUtils;
import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
//import org.jnetpcap.ByteBufferHandler;
//import org.jnetpcap.Pcap;
//import org.jnetpcap.PcapDumper;
//import org.jnetpcap.PcapHeader;
//import org.jnetpcap.PcapIf;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.util.Assert;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;
import org.springmodules.validation.commons.DefaultBeanValidator;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;
import org.xml.sax.InputSource;

import com.fasterxml.jackson.annotation.JsonManagedReference;
import com.fasterxml.jackson.annotation.JsonProperty;

import egovframework.rte.fdl.property.EgovPropertyService;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;
import taehee.saSystem.main.service.SaSystemDefaultVO;
import taehee.saSystem.main.service.SaSystemJsonVO;
import taehee.saSystem.main.service.SaSystemService;
import taehee.saSystem.main.service.SaSystemVO;


/**
 * @Class Name : SaSystemController.java
 * @Description : SaSystem Controller Class
 * @Modification Information
 * @
 * @  수정일      수정자              수정내용
 * @ ---------   ---------   -------------------------------
 * @ 2019.11.16           최초생성
 *
 * @author nam
 * @since 2019. 11.16
 * @version 1.0
 * @see
 *
 *  Copyright (C) by TAEHEE All right reserved.
 */

@Controller
public class SaSystemController {

	/** EgovSampleService */
	@Resource(name = "saSystemService")
	private SaSystemService saSystemService;

	/** EgovPropertyService */
	@Resource(name = "propertiesService")
	protected EgovPropertyService propertiesService;

	/** Validator */
	@Resource(name = "beanValidator")
	protected DefaultBeanValidator beanValidator;
	
	//file upload
	@Resource(name = "multipartResolver")
	CommonsMultipartResolver multipartResolver;
	 
//	@Resource(name = "fileUploadProperties")
//	Properties fileUploadProperties;
	
	//xml 파일 저장

	/**
	 * 로그인화면.
	 * @param searchVO - 조회조건 정보가 담긴 VO
	 * @param model
	 * @return "egovRegister"
	 * @exception Exception
	 */
	@SuppressWarnings("null")
	@RequestMapping(value = "/login.do")
	public String login(@ModelAttribute("searchVO") SaSystemDefaultVO searchVO, Model model, HttpServletRequest request) throws Exception {
		System.out.println("---------------------------");
		SaSystemVO saSystemVO = new SaSystemVO();
	    HttpSession session = request.getSession();

	    
	    String ids = (String)session.getAttribute("id");
		if(ids == null || ids.equals("")) {
			saSystemVO.setId("1");
			model.addAttribute("loginInfo", saSystemVO);
			return "main/login";
		}
		return "forward:/main.do";
	}
	/**
	 * 글을 등록한다.
	 * @param sampleVO - 등록할 정보가 담긴 VO
	 * @param searchVO - 목록 조회조건 정보가 담긴 VO
	 * @param status
	 * @return "forward:/egovSampleList.do"
	 * @exception Exception
	 */
	@RequestMapping(value = "/loginResult.do", method=RequestMethod.POST)
	public String login(@RequestParam("id") String id, @RequestParam("password") String password,@ModelAttribute("searchVO") SaSystemDefaultVO searchVO, Model model,SessionStatus status, HttpServletRequest request)
			throws Exception {
		SaSystemVO saSystemVO = new SaSystemVO();
		HttpSession session = request.getSession();
		saSystemVO.setId(id);
		saSystemVO.setPw(password);
		//saSystemService.selectUser(saSystemVO);
		SaSystemVO loginUser = selectUser(saSystemVO,searchVO);
		model.addAttribute("loginInfo",selectUser(saSystemVO, searchVO));
		if(loginUser == null) {
			return "main/login";
		}else {
			saSystemService.insertLoginInfo(saSystemVO);
			status.setComplete();
			session.setAttribute("id", id);
			session.setAttribute("auth",loginUser.getAuth());
			session.setAttribute(id, new SessionListener());
			return "forward:/main.do";
		}

//		if(loginUser.getId() != null) {
//			session.setAttribute("id",id);
//			System.out.println("--------22-------------------"+saSystemVO.getId());
//			return "main/login";
//		}

//
//		saSystemService.insertUser(saSystemVO);
//		status.setComplete();
	}
	/**
	 * 로그아웃화면.
	 * @param searchVO - 조회조건 정보가 담긴 VO
	 * @param model
	 * @return "egovSampleRegister"
	 * @exception Exception
	 */
	@SuppressWarnings("null")
	@RequestMapping(value = "/logout.do")
	public String logout(@ModelAttribute("searchVO") SaSystemDefaultVO searchVO, Model model, HttpServletRequest request,SessionStatus status) throws Exception {

	    HttpSession session = request.getSession();
	    SaSystemVO saSystemVO = new SaSystemVO();
	    String ids = (String)session.getAttribute("id");
	    //로그아웃시간 입력
	    saSystemVO.setId(ids);
	    saSystemService.updateLoginInfo(saSystemVO);
		status.setComplete();
		session.invalidate();
		
		return "forward:/login.do";
	}
	/**
	 * 메인페이지 조회한다. (pageing)
	 * @param searchVO - 조회할 정보가 담긴 SampleDefaultVO
	 * @param model
	 * @return "egovSampleList"
	 * @exception Exception
	 */
	@RequestMapping(value = "/main.do")
	public String main(@ModelAttribute("searchVO") SaSystemDefaultVO searchVO, ModelMap model, HttpServletRequest request) throws Exception {

		HttpSession session = request.getSession();
	    String ids = (String)session.getAttribute("id");
	    if(ids == null || ids.equals("")) {
			return "forward:/login.do";
		}
	    //이상상태요약
	    List<?> selectErrorSummList = saSystemService.selectErrorSummList(searchVO);
	    model.addAttribute("errorSummList", selectErrorSummList);
	    //백본스위치(메인)
	    List<?> selectBackMainErrorList = saSystemService.selectBackMainErrorList(searchVO);
	    model.addAttribute("backMainErrorList", selectBackMainErrorList);
	    //백본스위치(백업)
	    List<?> selectBackBackupErrorList = saSystemService.selectBackBackupErrorList(searchVO);
	    model.addAttribute("backBackupErrorList", selectBackBackupErrorList);
	    //엑세스스위치
	    List<?> selectAccessErrorList = saSystemService.selectAccessErrorList(searchVO);
	    model.addAttribute("accessErrorList", selectAccessErrorList);
	    
	    //mms
	    List<?> selectMmsErrorList = saSystemService.selectMmsErrorList(searchVO);
	    model.addAttribute("mmsErrorList", selectMmsErrorList);
	    //goose
	    List<?> selectGooseErrorList = saSystemService.selectGooseErrorList(searchVO);
	    model.addAttribute("gooseErrorList", selectGooseErrorList);
	    
		return "main/main";
	}
	/**
	 * 에러내용 상세 조회한다. (pageing)
	 * @param searchVO - 조회할 정보가 담긴 SampleDefaultVO
	 * @param model
	 * @return "egovSampleList"
	 * @exception Exception
	 */


	
	//@JsonBackReference
	@JsonManagedReference
	//@JsonManagedReference(value="/errorDetail.do")
	//@JsonBackReference(value="/errorDetail.do")
	//@RequestMapping(value = "/errorDetail.do", method = RequestMethod.POST,consumes = {"application/json"}, 
	//		produces = MediaType.APPLICATION_JSON_VALUE)
	@RequestMapping(value = "/errorDetail.do", method = RequestMethod.POST,consumes = MediaType.APPLICATION_JSON_VALUE,
			produces = MediaType.APPLICATION_JSON_VALUE)//consumes 와 produces를 넣어준다.
	//public @ResponseBody Object errorDetail(@RequestParam(value="jsonData", defaultValue="[]") String jsonData) throws Exception { 
	//public Map<String, Object> test(@RequestBody SaSystemJsonVO vo) throws Exception {
	//public @ResponseBody Map<String, Object> errorDetail(@RequestBody SaSystemJsonVO vo) throws Exception {
	@ResponseBody //이게 없으면 return 값이 안넘어간다
	//RequestBody 가 계속 에러 났는데 dispatcher-servlet.xml 파일에 Bean 수정하니깐됐다. 이건 ajax 에서 넘겨준부분을 받는 명령어다.
	public Map<String, Object> errorDetail(@RequestBody Map<String, Object> param) throws Exception {  
		//		Map<String, Object> result = new HashMap<String, Object>();
//	    Map<String, Object> paramMap = new HashMap<String, Object>();
//	    System.out.println("--------------------------------------4444-----------------"+jsonData);
//	    //직렬화 시켜 가져온 오브젝트 배열을 JSONArray 형식으로 바꿔준다.
//	    JSONArray array = JSONArray.fromObject(jsonData);
//	    List<Map<String, Object>> resendList = new ArrayList<Map<String, Object>>();
//	    System.out.println("--------------------------------------000-----------------"+jsonData);
//	    for(int i=0; i<array.size(); i++){
//	        //JSONArray 형태의 값을 가져와 JSONObject 로 풀어준다.    
//	        JSONObject obj = (JSONObject)array.get(i);
//	        Map<String, Object> resendMap = new HashMap<String, Object>();
//	            
//	        resendMap.put("loginTime", obj.get("loginTime"));
//	        resendMap.put("logoutTime", obj.get("logoutTime"));
//	            
//	        resendList.add(resendMap);
//	    }
//	 
//	    paramMap.put("resendList", resendList);
//	    
//	    //int cnt = saSystemService.selectErrorDetailList(paramMap);
//	    System.out.println("--------------------------------------111-----------------"+paramMap);
//	    result.put("result", "success");
//	    //result.put("cnt", cnt);
//	        
//	    return result;

		//Map<String, Object> jsonObject = new HashMap<String, Object>();
	    //param.put("id", (String) request.getSession().getAttribute("id"));
	    String startTime = (String) param.get("loginTime");
	    String endTime = (String) param.get("logoutTime");
	    System.out.println(param+"--------------------------------------000-----------------"+startTime);
	    SaSystemJsonVO VO = new SaSystemJsonVO();
	    VO.setLoginTime(startTime);
	    VO.setLogoutTime(endTime);
	    System.out.println(param+"--------------------------------------111-----------------"+endTime);
	    //return param;
		return saSystemService.selectErrorDetailList(VO);
	}

	
//	@RequestMapping(
//		    value = "/errorDetail.do",
//		    method = RequestMethod.POST,
//		    produces = MediaType.APPLICATION_JSON_VALUE,
//		    consumes = MediaType.APPLICATION_JSON_VALUE)
//		public ResponseEntity<SaSystemJsonVO> UpdateUserProfile(
//		    @RequestBody User usersNewDetails,
//		    HttpServletRequest request,
//		    HttpServletResponse response
//		) {
//
//	    System.out.println(usersNewDetails+"--------------------------------------000-----------------");
//	    SaSystemJsonVO VO = new SaSystemJsonVO();
//
//		return null;
//	}
	
//	public @ResponseBody List<PatientProfileDto> getPatientDetails(
//		    @RequestParam Map<String, String> name) {
//		   List<PatientProfileDto> list = new ArrayList<PatientProfileDto>();
//		   ...
//		   PatientProfileDto patientProfileDto = mapToPatientProfileDto(mame);
//		   ...
//		   list = service.getPatient(patientProfileDto);
//		   return list;
//		}
//	@RequestMapping(value = "/errorDetail.do", method = RequestMethod.POST,
//	        consumes = MediaType.APPLICATION_FORM_URLENCODED_VALUE, 
//	        produces = {MediaType.APPLICATION_ATOM_XML_VALUE, MediaType.APPLICATION_JSON_VALUE})
//	public @ResponseBody  Relation errorDetail(@PathVariable("email") String anEmailAddress, MultiValueMap paramMap) throws Exception {
//		System.out.println("--------------------------------------000-----------------"+paramMap.get("loginTime"));
//		if(paramMap == null && paramMap.get("loginTime") == null) {
//	        throw new IllegalArgumentException("Password not provided");
//	    }
//	    return null;
//	}
	@RequestMapping(value = "/errorDetail1.do", method = RequestMethod.POST,consumes = MediaType.APPLICATION_JSON_VALUE)
	public Map<String, Object> errorDetail1(@RequestBody Map<String, Object> param,@JsonProperty("loginTime") String loginTime, @JsonProperty("logoutTime") String logoutTime) throws Exception {
		String startTime = (String) param.get("loginTime");
	    String endTime = (String) param.get("logoutTime");
		SaSystemJsonVO VO = new SaSystemJsonVO();
	    VO.setLoginTime(loginTime);
	    VO.setLogoutTime(logoutTime);
	    System.out.println(startTime+"--------------------------------------000-----------------"+loginTime);
		return saSystemService.selectErrorDetailList(VO);
	}
	
//	@RequestMapping(value = "/errorDetail.do", method = RequestMethod.POST,
//	        consumes = MediaType.APPLICATION_FORM_URLENCODED_VALUE, 
//	        produces = {MediaType.APPLICATION_ATOM_XML_VALUE, MediaType.APPLICATION_JSON_VALUE})
//	public @ResponseBody  Representation authenticate(@PathVariable("email") String anEmailAddress, MultiValueMap paramMap) throws Exception {
//	   if(paramMap == null && paramMap.get("password") == null) {
//	        throw new IllegalArgumentException("Password not provided");
//	    }
//	    return null;
//	}
//	@RequestMapping(value = "/errorDetail.do")
//	public void errorDetail(HttpServletResponse resp, @ModelAttribute("searchVO") SaSystemDefaultVO searchVO) throws Exception {
//	//public String errorDetail(@ModelAttribute("searchVO") SaSystemDefaultVO searchVO, ModelMap model, HttpServletRequest request) throws Exception {
//	    //이상상태요약
//	    List<?> selectErrorSummList = saSystemService.selectErrorSummList(searchVO);
//	    JsonObject jso=Json.createObjectBuilder().add("data", (JsonValue) selectErrorSummList).build();      // JASON 객체생성                         // jason은 map구조(키,값), data라는 key로 list데이터를 주입했다. 
//		resp.setContentType("text/html;charset=utf-8");
//		PrintWriter out=resp.getWriter();
//		out.print(jso.toString());        // out.print 내용을 ajax의 dataType이 jason인 놈에게 데이터 쏴줌
//	}
//	
	/**
	 * packet추출
	 * @return 
	 */
//	@SuppressWarnings("deprecation")
//	@RequestMapping(value = "/packCall.do")
//	public String packetMethod(String[] args) {
//		System.out.println("test packet....");
//		// pcap.loop(x, dumpHandler, dumper); x 개 패킷
//		// String ofile = "tmp-capture-file.cap"; tmp-capture-file.cap 파일로 저장
//		
//		
//		SimpleDateFormat format1 = new SimpleDateFormat ( "yyyyMMddHHmmss");		
//		Date time = new Date();	
//		String time1 = format1.format(time);
//		
//		List<PcapIf> allDevs = new ArrayList<PcapIf>(); // Will be filled with
//														// NICs
//		StringBuilder errbuf = new StringBuilder(); // For any error msgs
//		System.out.println("test packet2....");
//		/***************************************************************************
//		 * First get a list of devices on this system
//		 **************************************************************************/
//		int r = Pcap.findAllDevs(allDevs, errbuf);
//		System.out.println("test packet2-1....");
//		if (r == Pcap.NOT_OK || allDevs.isEmpty()) {
//			System.err.printf("Can't read list of devices, error is %s\n", errbuf.toString());
//			//return;
//		}
//		System.out.println("test packet3....");
//		int i = 0;
//		int snaplen = 64 * 1024; // 65536Byte 만큼캡쳐 Capture all packets, no trucation
//		int flags = Pcap.MODE_PROMISCUOUS; // capture all packets
//		int timeout = 10 * 1000; // 10 seconds in millis
//		
//		for(PcapIf device : allDevs) {//탐색된 장비 출력
//			String description = (device.getDescription() != null) ? 
//					device.getDescription() : "장비에대한 설명이 없음";
//			System.out.printf("[%d번]: %s [%s]\n", ++i, device.getName(),description);
//			System.out.println("test packet4....");
//			PcapIf deviceEach = (PcapIf) allDevs.get(i); // We know we have atleast 1 device
//			Pcap pcap = Pcap.openLive(device.getName(), snaplen, flags, timeout, errbuf);
//			if (pcap == null) {
//				System.err.printf("Error while opening device for capture: %s\n", errbuf.toString());
//				//return;
//			}
//			System.out.println("test packet5....");
//			String ofile = "c://태희/pcap/taehee_"+time1+"_"+i+"_"+device.getName()+".pcap";
//			final PcapDumper dumper = pcap.dumpOpen(ofile); // output file
//			System.out.println("test packet6....");
//			ByteBufferHandler<PcapDumper> dumpHandler = new ByteBufferHandler<PcapDumper>() { 
//				@Override
//				public void nextPacket(PcapHeader arg0, ByteBuffer arg1, PcapDumper arg2) { 
//					// TODO Auto-generated method stub 
//					dumper.dump(arg0, arg1); 
//				}
//			};
//			System.out.println("test packet7...."+Pcap.LOOP_INFINATE);
//			pcap.loop(Pcap.LOOP_INFINATE, dumpHandler, dumper);
//			System.out.println("test packet8....");
//			File file = new File(ofile);
//			System.out.printf("%s file has %d bytes in it!\n", ofile, file.length());
//
//			/***************************************************************************
//			 * Last thing to do is close the dumper and pcap handles
//			 **************************************************************************/
//			dumper.close(); // Won't be able to delete without explicit close
//			pcap.close();
//			
//			if (file.exists()) {
//				// file.delete(); // Cleanup
//			}	
//		}
//		
//		
//
//		/***************************************************************************
//		 * Second we open up the selected device
//		 **************************************************************************/
//		
//		
//		
//		/***************************************************************************
//		 * Third we create a PcapDumper and associate it with the pcap capture
//		 ***************************************************************************/
////		 File file = new File("c://태희/pcap/"); 
////		  
////	        // Making file array which is used 
////	        // to access each file 
////	        // inside the folder one-by-one 
////	    File[] files = file.listFiles(); 
//	    
//	    
//		
//		
//		/***************************************************************************
//		 * Fouth we create a packet handler which receives packets and tells the
//		 * dumper to write those packets to its output file
//		 **************************************************************************/
//
//		
//		System.out.println("test packet7....");
//
//
//		/***************************************************************************
//		 * Fifth we enter the loop and tell it to capture 10 packets. We pass in
//		 * the dumper created in step 3
//		 **************************************************************************/
//		
//
//		
//		return "main/main";
//	}
	/**
	 * iet xml파일저장
	 * @return 
	 * @throws IOException 
	 */
	@RequestMapping(value = "/saveXml.do")
	public String saveXml(final MultipartHttpServletRequest request, Model model, SessionStatus status, SaSystemVO saSystemVO,
			SaSystemDefaultVO searchVO, HttpServletRequest request1,HttpServletResponse response)
			throws Exception {
		
		final long startTime = System.nanoTime();

		/*
		 * validate request type
		 */
		Assert.state(request instanceof MultipartHttpServletRequest,
				"request !instanceof MultipartHttpServletRequest");
		final MultipartHttpServletRequest multiRequest = (MultipartHttpServletRequest) request;

		/*
		 * validate text input
		 */
//				Assert.state(request.getParameter("type").equals("genericFileMulti"),
//						"type != genericFileMulti");

		/*
		 * extract files
		 */
		final Map<String, MultipartFile> files = multiRequest.getFileMap();
		Assert.notNull(files, "files is null");
		Assert.state(files.size() > 0, "0 files exist");
	     
		/*
		 * process files
		 */
		String uploadPath = "C:\\IED_File";
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
		String excelFile = "";//엑셀파일
		String sclFileName = "";//scl 파일
		String excelFileName = "";//엑셀파일
		while (itr.hasNext()) {
			Entry<String, MultipartFile> entry = itr.next();
			System.out.println("[" + entry.getKey() + "]");
		 
			file = entry.getValue();//각 파일추출
			if ("sclFile".equals(entry.getKey())) {//scl파일추출
				filePath = uploadPath + "\\" + file.getOriginalFilename();
				file.transferTo(new File(filePath));//파일저장
				//MultipartFile 을 String로 변환
				ByteArrayInputStream stream = new   ByteArrayInputStream(file.getBytes());
				sclFile = IOUtils.toString(stream, "UTF-8");
				sclFileName = file.getOriginalFilename();
				System.out.println("XML to String using BufferedReader : "); 
				//System.out.println(myString); 
			}
			if ("excel".equals(entry.getKey())) {
				filePath = uploadPath + "\\" + file.getOriginalFilename();
				file.transferTo(new File(filePath));//파일저장
				excelFileName = file.getOriginalFilename();
				ByteArrayInputStream stream = new   ByteArrayInputStream(file.getBytes());
				excelFile = IOUtils.toString(stream, "UTF-8");
			}
		}
		
		//엑셀파일 파싱 시작
        FileInputStream file1 = new FileInputStream(filePath);
        @SuppressWarnings("resource")
		XSSFWorkbook workbook = new XSSFWorkbook(file1);

        
       //이부분에서 비교부분 때 갔다...
        
        //엑셀파일 파싱 시작 끝
        

        //scl 파일 파싱 시작
		//String xml = "<root><row><col1 id='c1'>값1</col1><col2 id='c2' val='val2'>값2</col2></row>" +
        //        "<row><col1 id='c3'>값3</col1><col2 id='c4'>값4</col2></row></root>";
		
        // xml 파일에 있는 특수문자제거 -- 안하면 에러난다.
		sclFile = sclFile.replaceAll("[^\\x20-\\x7e]", "");
		// XML Document 객체 생성
		InputSource is = new InputSource(new StringReader(sclFile));
		Document document = DocumentBuilderFactory.newInstance().newDocumentBuilder().parse(is);
		
		
		// 인터넷 상의 XML 문서는 요렇게 생성하면 편리함.
		//Document document = DocumentBuilderFactory.newInstance().newDocumentBuilder()
		//                               .parse("http://www.example.com/test.xml");

		// xpath 생성
		XPath xpath = XPathFactory.newInstance().newXPath();

		// NodeList 가져오기 : row 아래에 있는 모든 col1 을 선택
		NodeList cols = (NodeList)xpath.evaluate("//row/col1", document, XPathConstants.NODESET);
		for( int idx=0; idx<cols.getLength(); idx++ ){
		System.out.println(cols.item(idx).getTextContent());
		}
		// 값1   값3  이 출력됨
		
		// id 가 c2 인 Node의 val attribute 값 가져오기 - ied number 값가져오기
		Node col2 = (Node)xpath.evaluate("//*[@apName='P1']", document, XPathConstants.NODE);
		//configVersion 가져오기
		Node conVer = (Node)xpath.evaluate("//*[@manufacturer='Vitzrotech']", document, XPathConstants.NODE);
		
		System.out.println(col2.getAttributes().getNamedItem("iedName").getTextContent());
		// val2 출력

		// id 가 c3 인 Node 의 value 값 가져오기 - ipAddress 가져오기
		String ipAddr = (String) xpath.evaluate("//*[@type='IP']", document, XPathConstants.STRING);
		String macAddr = (String)xpath.evaluate("//*[@type='MAC-Address']", document, XPathConstants.STRING);
		System.out.println(xpath.evaluate("//*[@type='IP']", document, XPathConstants.STRING));
		// 값3 출력
		//app id가져오기
		String appId = (String)xpath.evaluate("//*[@type='APPID']", document, XPathConstants.STRING);
				
		document.getDocumentElement().normalize();//문서 구조 안정화
	    
		//pubDataSet 비교 - 이거는 다른비교방법 찾아야한다.
//		Node ldInst = (Node)xpath.evaluate("//*[@ldInst='ldInst']", document, XPathConstants.STRING);
//		Node prefix = (Node)xpath.evaluate("//*[@type='prefix']", document, XPathConstants.STRING);
//		Node lnClass = (Node)xpath.evaluate("//*[@type='lnClass']", document, XPathConstants.STRING);
//		Node lnInst = (Node)xpath.evaluate("//*[@type='lnInst']", document, XPathConstants.STRING);
//		Node doName = (Node)xpath.evaluate("//*[@type='doName']", document, XPathConstants.STRING);
//		Node daName = (Node)xpath.evaluate("//*[@type='daName']", document, XPathConstants.STRING);
//		Node fc = (Node)xpath.evaluate("//*[@type='fc']", document, XPathConstants.STRING);
		
/*
		※ evalueate() 메소드 맨 끝에 들어가는 파라메터로

		XPathConstants.NODESET
		XPathConstants.NODE
		XPathConstants.BOOLEAN
		XPathConstants.NUMBER
		XPathConstants.STRING
*/
		//scl 파일 파싱 끝
		
		int rowindex=0;
        int columnindex=0;
        //시트 수 (첫번째에만 존재하므로 0을 준다)
        //만약 각 시트를 읽기위해서는 FOR문을 한번더 돌려준다
        //XSSFSheet sheet=workbook.getSheetAt(0);
        //행의 수
        //int rows=sheet.getPhysicalNumberOfRows();
		//엑셀파일 sheet수 취득
		int sheetCn = workbook.getNumberOfSheets();

		System.out.println("sheet수 : " + sheetCn);
		
		//xml 각 노드이름 가져오기
	    Element root = document.getDocumentElement();
	    //xml DataSet 노드이름을 리스트로 
	    NodeList n_list = root.getElementsByTagName("IED");
	    //xml 하위 엘리먼트를 위한 선언
	    Element el = null;
	    NodeList sub_n_list = null; //sub_n_list
	    Element sub_el = null; //sub_el  
	    Element sub1_el = null; //sub_el 
	    Node v_txt = null;
	    String value1="";
	    String[] tagList = {"DataSet","FCDA"};
	    String ldInst="";
	    String prefix="";
	    String lnClass="";
	    String lnInst="";
	    String doName="";
	    String fc="";

	    int datasetCnt = 0;
	    int fcadCnt = 0;
	    for(int i=0; i<n_list.getLength(); i++) {//태그가 ied인것 찾고
	        el = (Element) n_list.item(i);
            //태크가 여러게일경우 
	        for(int k=0; k< tagList.length; k++) {//그안에 tagList를 찾고 ("DataSet","FCDA" 를 돌려서)
	          sub_n_list = el.getElementsByTagName(tagList[k]);
		          for(int l=0; l< sub_n_list.getLength(); l++) {//tagList "DataSet","FCDA" 를 각각돌려서
		        	  sub_el = (Element) sub_n_list.item(l);//
		        	  if(k==0) {
		        		  datasetCnt++;//dataset 갯수 구한다.
		        	  }
		        	  if(k>0) {
		        		  fcadCnt++;//전체fcad 갯수를 구한다.
		        	  }
		          }
	        } 
	      }
	    System.out.println("::::value2::::value2::::value2::::value2="+fcadCnt);
	    String[] dataSetName = new String[datasetCnt];//dataset을 담을 배열정의 몇개인지
	    String[] fcadNode = new String[fcadCnt];//dataset을 담을 배열정의 몇개인지
	    int ii=0;
	    for(int i=0; i<n_list.getLength(); i++) {//태그가 ied인것 찾고
	        el = (Element) n_list.item(i);
            //태크가 여러게일경우 
	        for(int k=0; k< tagList.length; k++) {//그안에 tagList를 찾고 ("DataSet","FCDA" 를 돌려서)
	          sub_n_list = el.getElementsByTagName(tagList[k]);
	          	  
		          for(int l=0; l< sub_n_list.getLength(); l++) {//tagList "DataSet","FCDA" 를 각각돌려서
		        	  sub_el = (Element) sub_n_list.item(l);//
		        	  if(k==0) {
			        	  dataSetName[l] = sub_el.getAttributes().getNamedItem("name").getNodeValue();
				          System.out.println("::::value2="+sub_el.getAttributes().getNamedItem("name").getNodeValue());
		        	  }
		        	  if(k>0) {
		        		  
				          v_txt = sub_el.getFirstChild();
	//			          value1 = v_txt.getNodeValue();
	//			             
	//			          System.out.println(sub_el.getNodeName() + "::::value4="+value1);
				          if(sub_el.getAttributes().getNamedItem("ldInst")!=null) {
					          ldInst=sub_el.getAttributes().getNamedItem("ldInst").getNodeValue();
				          }else {ldInst="";}
				          if(sub_el.getAttributes().getNamedItem("prefix")!=null) {
					  	      prefix=sub_el.getAttributes().getNamedItem("prefix").getNodeValue();
				          }else {prefix="";}
					  	  if(sub_el.getAttributes().getNamedItem("lnClass")!=null) {
					  	      lnClass=sub_el.getAttributes().getNamedItem("lnClass").getNodeValue();
					  	  }else {lnClass="";}
					  	  if(sub_el.getAttributes().getNamedItem("lnInst")!=null) {
					  		  lnInst=sub_el.getAttributes().getNamedItem("lnInst").getNodeValue();
					  	  }else {lnInst="";}
					  	  if(sub_el.getAttributes().getNamedItem("doName")!=null) {
					  		  doName=sub_el.getAttributes().getNamedItem("doName").getNodeValue();
					  	  }else {doName="";}
					  	  if(sub_el.getAttributes().getNamedItem("fc")!=null) {
					  	      fc=sub_el.getAttributes().getNamedItem("fc").getNodeValue();
					  	  }else {fc="";}
				          fcadNode[ii] = ldInst+";;"+prefix
				        		  +";;"+lnClass+";;"+lnInst
				        		  +";;"+doName+";;"+fc;
				          ii++;
//				          if(sub_el.getAttributes().getNamedItem("ldInst")!=null)
//			            	System.out.println("ldInst="+ sub_el.getAttributes().getNamedItem("ldInst").getNodeValue() );
//			              if(sub_el.getAttributes().getNamedItem("prefix")!=null)
//				            System.out.println("prefix="+ sub_el.getAttributes().getNamedItem("prefix").getNodeValue() );
//			              if(sub_el.getAttributes().getNamedItem("lnClass")!=null)
//				            System.out.println("lnClass="+ sub_el.getAttributes().getNamedItem("lnClass").getNodeValue() );
//			              if(sub_el.getAttributes().getNamedItem("lnInst")!=null)
//				            System.out.println("lnInst="+ sub_el.getAttributes().getNamedItem("lnInst").getNodeValue() );
//			              if(sub_el.getAttributes().getNamedItem("doName")!=null)
//				            System.out.println("doName="+ sub_el.getAttributes().getNamedItem("doName").getNodeValue() );
//			              if(sub_el.getAttributes().getNamedItem("fc")!=null)
//				            System.out.println("fc="+ sub_el.getAttributes().getNamedItem("fc").getNodeValue() );
		        	  }
		          }

	        } 
	      }
	    for(int m=0; m< dataSetName.length; m++) {
        	System.out.println("fc=------------------------"+ dataSetName[m]);
        }
	    for(int n=0; n< fcadNode.length; n++) {
        	System.out.println("fcddd=------------------------"+ fcadNode[n]);
        }
	    
		///비교 시작
		int iedN = 0;
		int ipA = 0;
		int macA = 0;
		int conV = 0;
		int appI = 0;
		int pubD = 0;
		for(int cn = 0; cn < sheetCn; cn++){
			//시트 수 (첫번째에만 존재하면 0을 준다)
	        //만약 각 시트를 읽기위해서는 FOR문을 한번더 돌려준다
			XSSFSheet sheet=workbook.getSheetAt(cn);
			//행의 수
	        int rows=sheet.getPhysicalNumberOfRows();
	        System.out.println("sheet 이름 : " + workbook.getSheetName(cn));
			for(rowindex=0;rowindex<rows;rowindex++){
	            //행을읽는다
	            XSSFRow row=sheet.getRow(rowindex);
	            if(row !=null){
	                //셀의 수
	                int cells=row.getPhysicalNumberOfCells();
	                for(columnindex=0; columnindex<=cells; columnindex++){
	                    //셀값을 읽는다
	                    XSSFCell cell=row.getCell(columnindex);
	                    String value="";
	                    //셀이 빈값일경우를 위한 널체크
	                    if(cell==null){
	                        continue;
	                    }else{
	                        //타입별로 내용 읽기
	                        switch (cell.getCellType()){
	                        case XSSFCell.CELL_TYPE_FORMULA:
	                            value=cell.getCellFormula();
	                            break;
	                        case XSSFCell.CELL_TYPE_NUMERIC:
	                            value=cell.getNumericCellValue()+"";
	                            break;
	                        case XSSFCell.CELL_TYPE_STRING:
	                            value=cell.getStringCellValue()+"";
	                            break;
	                        case XSSFCell.CELL_TYPE_BLANK:
	                            value=cell.getBooleanCellValue()+"";
	                            break;
	                        case XSSFCell.CELL_TYPE_ERROR:
	                            value=cell.getErrorCellValue()+"";
	                            break;
	                        }
	                    }
	                    if(workbook.getSheetName(cn).equals("IED 구성")) {
		                    //System.out.println(rowindex+"번 행 : "+columnindex+"번 열 값은: "+value);
		                    if(col2.getAttributes().getNamedItem("iedName").getTextContent().equals(value)) {
		                    	iedN = 1;
		                    }
		                    if(ipAddr.equals(value)) {
		                    	ipA = 1;
		                    }
		                    if(macAddr.equals(value)) {
		                    	macA = 1;
		                    }
		                    if(appId.equals(value)) {
		                    	appI = 1;
		                    }
		                    if(conVer.getAttributes().getNamedItem("configVersion").getTextContent().equals(value)) {
		                    	conV = 1;
		                    }
	                    }
	                    //pub dataset sheet 비교
//	                    if(workbook.getSheetName(cn).equals("pubDset1")) {
//		                    System.out.println(rowindex+"번 행 : "+columnindex+"번 열 값은: "+value);
//		                    if(ldInst.equals(value) && prefix.equals(value) && lnClass.equals(value) 
//		                    		&& lnInst.equals(value) && doName.equals(value) && daName.equals(value) && fc.equals(value)) {
//		                    	pubD = 1;
//		                    }
//	                    }
	                    
	                }
	
	            }
	        }
		}
		
        if(iedN == 0 || ipA == 0 || macA == 0 || appI == 0 || conV == 0) {
        	response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('기본정보가 일치하지 않습니다.\n다시 확인하시고 등록하시기 바랍니다.'); </script>");
			out.flush();
//        	System.out.println("---------------------"+iedN);
//			saSystemVO.setIedName("1");
//			model.addAttribute("iedInfo", saSystemVO);
			return "main/enviromentList";
		}
        ///비교 끝
        
        
		saSystemVO.setIedName(col2.getAttributes().getNamedItem("iedName").getTextContent());
		saSystemVO.setIedIp((xpath.evaluate("//*[@type='IP']", document, XPathConstants.STRING)).toString());
		saSystemVO.setSclFileName(sclFileName);
		saSystemVO.setIetFileName(excelFileName);
		saSystemVO.setFilePath(uploadPath);

		SaSystemVO iedList = selectIed(saSystemVO, searchVO);
		if(iedList == null) {
			//ied 저장
			saSystemService.insertIed(saSystemVO);
			status.setComplete();
		}else {
			//ied 업데이트.
			saSystemService.updateIed(saSystemVO);
			status.setComplete();
			//session.setAttribute("auth",iedList.getAuth());
		}
		
		
		
		
		
	/*
	
	
	
	
	
		while (itr.hasNext()) {
			Entry<String, MultipartFile> entry = itr.next();
			System.out.println("[" + entry.getKey() + "]");
		 
			file = entry.getValue();
		    
			if (!"".equals(file.getOriginalFilename())) {
				filePath = uploadPath + "\\" + file.getOriginalFilename();
				file.transferTo(new File(filePath));
		 
				SaSystemVO fileInfoVO = new SaSystemVO();
				fileInfoVO.setFilePath(filePath);
				fileInfoVO.setFileName(file.getOriginalFilename());
				fileInfoVO.setFileSize(file.getSize());
				fileInfoList.add(fileInfoVO);
			}
		}
		System.out.println("test fileup7....");
		// 여기서는 DB에 파일관련 정보를 저장하지 않고 단순히 success 페이지로 포워딩 하여 재확인 가능토록 함
		model.addAttribute("fileInfoList", fileInfoList);
		model.addAttribute("uploadPath", uploadPath);
		 
		final long estimatedTime = System.nanoTime() - startTime;
		System.out.println(estimatedTime + " " + getClass().getSimpleName());
		*/
		return "forward:enviromentList.do";

	}
	/**
	 * ied 조회한다.
	 * @param sampleVO - 조회할 정보가 담긴 VO
	 * @param searchVO - 목록 조회조건 정보가 담긴 VO
	 * @param status
	 * @return @ModelAttribute("sampleVO") - 조회한 정보
	 * @exception Exception
	 */
	public SaSystemVO selectIed(SaSystemVO SaSystemVO, @ModelAttribute("searchVO") SaSystemDefaultVO searchVO) throws Exception {
		return saSystemService.selectIed(SaSystemVO);
	}
/*	public ArrayList<String[]> parseXML(String data) {
		ArrayList<String[]> result = new ArrayList<String[]>();
		Document doc = Jsoup.parse(data);
		Elements items = doc.getElementsByTag("item");
		for(Element item : items) {
			 String[] nodes = { item.nodeName(), item.text() };
			 result.add(nodes);
		}
		return result;
	}
	public void saveToSQL(ArrayList<String[]> item) {
		DBConnector db = new DBConnector();
		String tags = "", values = "";
		for(int i = 0; i < item.size() ; i++) {
			 String tag = item.get(i)[0];
			 String value = item.get(i)[1];
			 tag = tag.replaceAll("'", "^");
			 value = "'" + value.replaceAll("'", "^") + "'";
			 db.sendQuery("ALTER TABLE tablename ADD COLUMN " + tag + " TEXT");
			 if(i < item.size() - 1) {
			   tags += ",";
			   values += ",";
			 }
		}

		if(tags.length() != 0 && values.length() != 0) {
			 String query = "INSERT INTO tablename(" + tags + ") VALUES(" + values + ")";
			 db.sendQuery(query);
		}
	}
	*/
	/**
	 * packet추출 backup
	 * @return 
	 */
//	@RequestMapping(value = "/packCallBackup.do")
//	public String packetMethodBackup(String[] args) {
//		System.out.println("test packet....");
//		// pcap.loop(x, dumpHandler, dumper); x 개 패킷
//		// String ofile = "tmp-capture-file.cap"; tmp-capture-file.cap 파일로 저장
//
//		List<PcapIf> allDevs = new ArrayList<PcapIf>(); // Will be filled with
//														// NICs
//		StringBuilder errbuf = new StringBuilder(); // For any error msgs
//		System.out.println("test packet2....");
//		/***************************************************************************
//		 * First get a list of devices on this system
//		 **************************************************************************/
//		int r = Pcap.findAllDevs(allDevs, errbuf);
//		System.out.println("test packet2-1....");
//		if (r == Pcap.NOT_OK || allDevs.isEmpty()) {
//			System.err.printf("Can't read list of devices, error is %s\n", errbuf.toString());
//			//return;
//		}
//		System.out.println("test packet3....");
//		int i = 0;
//		for(PcapIf device : allDevs) {//탐색된 장비 출력
//			String description = (device.getDescription() != null) ? 
//					device.getDescription() : "장비에대한 설명이 없음";
//			System.out.printf("[%d번]: %s [%s]\n", ++i, device.getName(),description);
//		}
//		System.out.println("test packet4....");
//		PcapIf device = (PcapIf) allDevs.get(0); // We know we have atleast 1 device
//
//		/***************************************************************************
//		 * Second we open up the selected device
//		 **************************************************************************/
//		int snaplen = 64 * 1024; // 65536Byte 만큼캡쳐 Capture all packets, no trucation
//		int flags = Pcap.MODE_PROMISCUOUS; // capture all packets
//		int timeout = 10 * 1000; // 10 seconds in millis
//		Pcap pcap = Pcap.openLive(device.getName(), snaplen, flags, timeout, errbuf);
//		if (pcap == null) {
//			System.err.printf("Error while opening device for capture: %s\n", errbuf.toString());
//			//return;
//		}
//		System.out.println("test packet5....");
//		/***************************************************************************
//		 * Third we create a PcapDumper and associate it with the pcap capture
//		 ***************************************************************************/
////		 File file = new File("c://태희/pcap/"); 
////		  
////	        // Making file array which is used 
////	        // to access each file 
////	        // inside the folder one-by-one 
////	    File[] files = file.listFiles(); 
//	    
//	    
//		String ofile = "c://태희/pcap/tmp-capture-file.pcap";
//		final PcapDumper dumper = pcap.dumpOpen(ofile); // output file
//		System.out.println("test packet6....");
//		/***************************************************************************
//		 * Fouth we create a packet handler which receives packets and tells the
//		 * dumper to write those packets to its output file
//		 **************************************************************************/
//
//		ByteBufferHandler<PcapDumper> dumpHandler = new ByteBufferHandler<PcapDumper>() { 
//			@Override
//			public void nextPacket(PcapHeader arg0, ByteBuffer arg1, PcapDumper arg2) { 
//				// TODO Auto-generated method stub 
//				dumper.dump(arg0, arg1); 
//			}
//		};
//		System.out.println("test packet7....");
//
//
//		/***************************************************************************
//		 * Fifth we enter the loop and tell it to capture 10 packets. We pass in
//		 * the dumper created in step 3
//		 **************************************************************************/
//		pcap.loop(10, dumpHandler, dumper);
//		System.out.println("test packet8....");
//		File file = new File(ofile);
//		System.out.printf("%s file has %d bytes in it!\n", ofile, file.length());
//
//		/***************************************************************************
//		 * Last thing to do is close the dumper and pcap handles
//		 **************************************************************************/
//		dumper.close(); // Won't be able to delete without explicit close
//		pcap.close();
//
//		if (file.exists()) {
//			// file.delete(); // Cleanup
//		}	
//		return "main/main";
//	}
	/**
	 * 글 목록을 조회한다. (pageing)
	 * @param searchVO - 조회할 정보가 담긴 SampleDefaultVO
	 * @param model
	 * @return "egovSampleList"
	 * @exception Exception
	 */
	@RequestMapping(value = "/userList.do")
	public String selectUserList(@ModelAttribute("searchVO") SaSystemDefaultVO searchVO, ModelMap model) throws Exception {

		/** EgovPropertyService.sample */
		searchVO.setPageUnit(propertiesService.getInt("pageUnit"));
		searchVO.setPageSize(propertiesService.getInt("pageSize"));

		/** pageing setting */
		PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(searchVO.getPageIndex());
		paginationInfo.setRecordCountPerPage(searchVO.getPageUnit());
		paginationInfo.setPageSize(searchVO.getPageSize());

		searchVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
		searchVO.setLastIndex(paginationInfo.getLastRecordIndex());
		searchVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());

		List<?> userList = saSystemService.selectUserList(searchVO);
		model.addAttribute("resultList", userList);

		int totCnt = saSystemService.selectUserListTotCnt(searchVO);
		paginationInfo.setTotalRecordCount(totCnt);
		model.addAttribute("paginationInfo", paginationInfo);

		return "main/userList";
	}
	/**
	 * 컴퓨터를 종료한다..
	 * @param searchVO - 조회조건 정보가 담긴 VO
	 * @param model
	 * @return ""
	 * @exception Exception
	 */
	@RequestMapping(value = "/windowsTurnOff.do")
	public void main(String arg[]) throws IOException{
		System.out.println("--------windowsTurnOff-------------------");
	    Runtime runtime = Runtime.getRuntime();
	    Process proc = runtime.exec("shutdown -s -f -t 0");
	    System.out.println("--------windowsTurnOff11-------------------");
	    System.exit(0);
	}
	/**
	 * 컴퓨터를 종료한다..
	 * @param searchVO - 조회조건 정보가 담긴 VO
	 * @param model
	 * @exception Exception
	 */
	@RequestMapping(value = "/windowsRestart.do")
	public void main1(String arg[]) throws IOException{
		System.out.println("--------windowsRestart-------------------");
	    Runtime runtime = Runtime.getRuntime();
	    Process proc = runtime.exec("shutdown -r -f -t 0");
	    System.out.println("--------windowsRestart11-------------------");
	    System.exit(0);
	}
	/**
	 * 로그인사용자조회한다.
	 * @param sampleVO - 조회할 정보가 담긴 VO
	 * @param searchVO - 목록 조회조건 정보가 담긴 VO
	 * @param status
	 * @return @ModelAttribute("sampleVO") - 조회한 정보
	 * @exception Exception
	 */
	public SaSystemVO selectUser(SaSystemVO SaSystemVO, @ModelAttribute("searchVO") SaSystemDefaultVO searchVO) throws Exception {
		return saSystemService.selectUser(SaSystemVO);
	}
	/**
	 * 파일다운로드.
	 * @param sampleVO - 조회할 정보가 담긴 VO
	 * @param searchVO - 목록 조회조건 정보가 담긴 VO
	 * @param status
	 * @return @ModelAttribute("sampleVO") - 조회한 정보
	 * @exception Exception
	 */
	
//	@Resource(name = "fileUploadProperties")
//	Properties fileUploadProperties;
 
	@RequestMapping(value = "/downloadFile.do")
	public void downloadFile(SaSystemVO SaSystemVO, @ModelAttribute("searchVO") SaSystemDefaultVO searchVO,
			HttpServletResponse response, HttpServletRequest request) throws Exception {
 
		
		
		 
		int bufferSize = 1024 * 2;
		SimpleDateFormat format1 = new SimpleDateFormat ( "yyyyMMddHHmmss");		
		Date time = new Date();	
		String time1 = format1.format(time);
		
		String ouputName = "taehee_"+time1;
		String uploadPath = "C:\\Packet_File";        
		ZipOutputStream zos = null;
		            
		try {
		    
			String selectPacket = SaSystemVO.getSelectPacket();
			if(selectPacket != null) {
				selectPacket.toString();
				
				String[] selectedPacket = selectPacket.split(";;");   
			
			    if (request.getHeader("User-Agent").indexOf("MSIE 5.5") > -1) {
			        response.setHeader("Content-Disposition", "filename=" + ouputName + ".zip" + ";");
			    } else {
			        response.setHeader("Content-Disposition", "attachment; filename=" + ouputName + ".zip" + ";");
			    }
			    response.setHeader("Content-Transfer-Encoding", "binary");
			    
			                
			    OutputStream os = response.getOutputStream();
			    zos = new ZipOutputStream(os); // ZipOutputStream
			    zos.setLevel(8); // 압축 레벨 - 최대 압축률은 9, 디폴트 8
			    BufferedInputStream bis = null;
			                
			    
			    String[] filePaths = {uploadPath};//연기 파일경로 배열로 들어가면된다.
			    String[] fileNames = {"D990_C4041.cid"};//여기 파일이름 배열로 들어가면된다.
			    int    i = 0;
			    for(String filePath : filePaths){
			        File sourceFile = new File(filePath);
			        System.out.println(filePath+"---------"+sourceFile+"----------"+fileNames[i]);           
			        bis = new BufferedInputStream(new FileInputStream(sourceFile));
			        ZipEntry zentry = new ZipEntry(fileNames[i]);
			        zentry.setTime(sourceFile.lastModified());
			        zos.putNextEntry(zentry);
			        
			        byte[] buffer = new byte[bufferSize];
			        int cnt = 0;
			        while ((cnt = bis.read(buffer, 0, bufferSize)) != -1) {
			            zos.write(buffer, 0, cnt);
			        }
			        zos.closeEntry();
			 
			        i++;
			    }
			               
			    zos.close();
			    bis.close();
			}     
		                
		} catch(Exception e){
		    e.printStackTrace();
		}
//		String uploadPath = "C:\\Packet_File";//fileUploadProperties.getProperty("file.upload.path");
// 
//		File uFile = new File(uploadPath, requestedFile);
//		int fSize = (int) uFile.length();
// 
//		if (fSize > 0) {
// 
//			BufferedInputStream in = new BufferedInputStream(
//					new FileInputStream(uFile));
//			// String mimetype = servletContext.getMimeType(requestedFile);
//			String mimetype = "text/html";
// 
//			response.setBufferSize(fSize);
//			response.setContentType(mimetype);
//			response.setHeader("Content-Disposition", "attachment; filename=\""
//					+ requestedFile + "\"");
//			response.setContentLength(fSize);
// 
//			FileCopyUtils.copy(in, response.getOutputStream());
//			in.close();
//			response.getOutputStream().flush();
//			response.getOutputStream().close();
//		} else {
//			//setContentType을 프로젝트 환경에 맞추어 변경
//			response.setContentType("application/x-msdownload");
//			response.setContentType("text/html; charset=UTF-8");
//			PrintWriter out = response.getWriter();
//			out.println("<script>alert('존재하지 않는 Packet 파일입니다. 관리자에게 문의하시기 바랍니다.'); </script>");
//			out.flush();
////			PrintWriter printwriter = response.getWriter();
////			printwriter.println("<html>");
////			printwriter.println("<br><br><br><h2>Could not get file name:<br>"
////					+ requestedFile + "</h2>");
////			printwriter
////					.println("<br><br><br><center><h3><a href='javascript: history.go(-1)'>Back</a></h3></center>");
////			printwriter.println("<br><br><br>&copy; webAccess");
////			printwriter.println("</html>");
////			printwriter.flush();
////			printwriter.close();
//		}
	}
	
	
	
	
	
	
	
	
	
	
	/**
	 * 글 수정화면을 조회한다.
	 * @param id - 수정할 글 id
	 * @param searchVO - 목록 조회조건 정보가 담긴 VO
	 * @param model
	 * @return "egovSampleRegister"
	 * @exception Exception
	 */
	@RequestMapping("/updateUserView.do")
	public String updateUserView(@RequestParam("selectedId") String id, @ModelAttribute("searchVO") SaSystemDefaultVO searchVO, Model model) throws Exception {
		SaSystemVO saSystemVO = new SaSystemVO();
		saSystemVO.setId(id);
		// 변수명은 CoC 에 따라 sampleVO
		model.addAttribute(selectUser(saSystemVO, searchVO));
		return "main/userRegister";
	}



	/**
	 * 글을 수정한다.
	 * @param sampleVO - 수정할 정보가 담긴 VO
	 * @param searchVO - 목록 조회조건 정보가 담긴 VO
	 * @param status
	 * @return "forward:/egovSampleList.do"
	 * @exception Exception
	 */
	@RequestMapping("/updateUser.do")
	public String updateUser(@ModelAttribute("searchVO") SaSystemDefaultVO searchVO, SaSystemVO SaSystemVO, BindingResult bindingResult, Model model, SessionStatus status)
			throws Exception {

		beanValidator.validate(SaSystemVO, bindingResult);

		if (bindingResult.hasErrors()) {
			model.addAttribute("SaSystemVO", SaSystemVO);
			return "main/userRegister";
		}

		saSystemService.updateUser(SaSystemVO);
		status.setComplete();
		return "forward:/userList.do";
	}

	


}
