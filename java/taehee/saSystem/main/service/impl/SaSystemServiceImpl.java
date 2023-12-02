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
package taehee.saSystem.main.service.impl;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import egovframework.rte.fdl.idgnr.EgovIdGnrService;
import taehee.saSystem.main.service.SaSystemService;
import taehee.saSystem.main.service.SaSystemDefaultVO;
import taehee.saSystem.main.service.SaSystemJsonVO;
import taehee.saSystem.main.service.SaSystemVO;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.transaction.Transactional;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

/**
 * @Class Name : EgovSampleServiceImpl.java
 * @Description : Sample Business Implement Class
 * @Modification Information
 * @
 * @  수정일      수정자              수정내용
 * @ ---------   ---------   -------------------------------
 * @ 2009.03.16           최초생성
 *
 * @author 개발프레임웍크 실행환경 개발팀
 * @since 2009. 03.16
 * @version 1.0
 * @see
 *
 *  Copyright (C) by MOPAS All right reserved.
 */

@Service("saSystemService")
public class SaSystemServiceImpl extends EgovAbstractServiceImpl implements SaSystemService {

	private static final Logger LOGGER = LoggerFactory.getLogger(SaSystemServiceImpl.class);

	/** SampleDAO */
	// TODO ibatis 사용
	@Resource(name = "saSystemDAO")
	private SaSystemDAO saSystemDAO;
	// TODO mybatis 사용
	//  @Resource(name="sampleMapper")
	//	private SampleMapper sampleDAO;

	/** ID Generation */
	@Resource(name = "egovIdGnrService")
	private EgovIdGnrService egovIdGnrService;

	
	@Inject
	SaSystemDAO adminAccountsMngMapper;

	
	/**
	 * packet list 조회한다.
	 * @param searchVO - 조회할 정보가 담긴 VO
	 * @return 글 목록
	 * @exception Exception
	 */
	@Override
	public List<?> selectPacketList(SaSystemDefaultVO searchVO) throws Exception {
		return saSystemDAO.selectPacketList(searchVO);
	}
	/**
	 * 이더넷 스위치 list 조회한다.
	 * @param searchVO - 조회할 정보가 담긴 VO
	 * @return 글 목록
	 * @exception Exception
	 */
	@Override
	public List<?> selectEthernetSwitchList(SaSystemDefaultVO searchVO) throws Exception {
		return saSystemDAO.selectEthernetSwitchList(searchVO);
	}
	/**
	 * 이더넷 스위치 HIS list 조회한다.
	 * @param searchVO - 조회할 정보가 담긴 VO
	 * @return 글 목록
	 * @exception Exception
	 */
	@Override
	public List<?> selectEthernetSwitchHisList(SaSystemDefaultVO searchVO) throws Exception {
		return saSystemDAO.selectEthernetSwitchHisList(searchVO);
	}
	
	/**
	 * mms HIS list 조회한다.
	 * @param searchVO - 조회할 정보가 담긴 VO
	 * @return 글 목록
	 * @exception Exception
	 */
	@Override
	public List<?> selectMmsHisList(SaSystemDefaultVO searchVO) throws Exception {
		return saSystemDAO.selectMmsHisList(searchVO);
	}
	/**
	 * goose HIS list 조회한다.
	 * @param searchVO - 조회할 정보가 담긴 VO
	 * @return 글 목록
	 * @exception Exception
	 */
	@Override
	public List<?> selectGooseHisList(SaSystemDefaultVO searchVO) throws Exception {
		return saSystemDAO.selectGooseHisList(searchVO);
	}
	//엔지니어링검사
	/**
	 * iet list 조회한다.
	 * @param searchVO - 조회할 정보가 담긴 VO
	 * @return 글 목록
	 * @exception Exception
	 */
	@Override
	public List<?> selectIetList(SaSystemDefaultVO searchVO) throws Exception {
		return saSystemDAO.selectIetList(searchVO);
	}
	//환경설정
	/**
	 * sa 등록한다.
	 * @param vo - 등록할 정보가 담긴 SampleVO
	 * @return 등록 결과
	 * @exception Exception
	 */
	@Override
	public String insertSa(SaSystemVO vo) throws Exception {
		LOGGER.debug(vo.toString());

		/** ID Generation Service */
		String id = vo.getSaName();//egovIdGnrService.getNextStringId();
		vo.setId(id);
		LOGGER.debug(vo.toString());

		saSystemDAO.insertSa(vo);
		return id;
	}
	/**
	 * ied 등록한다.
	 * @param vo - 등록할 정보가 담긴 SampleVO
	 * @return 등록 결과
	 * @exception Exception
	 */
	@Override
	public String insertIed(SaSystemVO vo) throws Exception {
		LOGGER.debug(vo.toString());

		/** ID Generation Service */
		String id = vo.getIedName();//egovIdGnrService.getNextStringId();
		vo.setId(id);
		LOGGER.debug(vo.toString());

		saSystemDAO.insertIed(vo);
		return id;
	}
	/**
	 * ied 수정한다.
	 * @param vo - 수정할 정보가 담긴 SampleVO
	 * @return void형
	 * @exception Exception
	 */
	@Override
	public void updateIed(SaSystemVO vo) throws Exception {
		saSystemDAO.updateIed(vo);
	}
	/**
	 * switch 등록한다.
	 * @param vo - 등록할 정보가 담긴 SampleVO
	 * @return 등록 결과
	 * @exception Exception
	 */
	@Override
	public String insertESwitch(SaSystemVO vo) throws Exception {
		LOGGER.debug(vo.toString());

		/** ID Generation Service */
		String id = vo.getSwitchName();//egovIdGnrService.getNextStringId();
		vo.setId(id);
		LOGGER.debug(vo.toString());

		saSystemDAO.insertESwitch(vo);
		return id;
	}
	/**
	 * sntp 등록한다.
	 * @param vo - 등록할 정보가 담긴 SampleVO
	 * @return 등록 결과
	 * @exception Exception
	 */
	@Override
	public String insertSntp(SaSystemVO vo) throws Exception {
		LOGGER.debug(vo.toString());

		/** ID Generation Service */
		String id = vo.getSntpName();//egovIdGnrService.getNextStringId();
		vo.setId(id);
		LOGGER.debug(vo.toString());

		saSystemDAO.insertSntp(vo);
		return id;
	}
	/**
	 * sntp 등록한다.
	 * @param vo - 등록할 정보가 담긴 SampleVO
	 * @return 등록 결과
	 * @exception Exception
	 */
	@Override
	public String insertPort(SaSystemVO vo) throws Exception {
		LOGGER.debug(vo.toString());

		/** ID Generation Service */
		String id = vo.getSntpNum();//egovIdGnrService.getNextStringId();
		vo.setId(id);
		LOGGER.debug(vo.toString());

		saSystemDAO.insertPort(vo);
		return id;
	}
	/**
	 * ied 정보조회
	 * @param vo - 조회할 정보가 담긴 SampleVO
	 * @return 조회한 글
	 * @exception Exception
	 */
	@Override
	public SaSystemVO selectIed(SaSystemVO vo) throws Exception {
		SaSystemVO resultVO = saSystemDAO.selectIed(vo);
//		if (resultVO == null)
//			throw processException("info.nodata.msg");
		return resultVO;
	}
	/**
	 * equuip list 조회한다.
	 * @param searchVO - 조회할 정보가 담긴 VO
	 * @return 글 목록
	 * @exception Exception
	 */
	@Override
	public List<?> selectEquipList(SaSystemDefaultVO searchVO) throws Exception {
		return saSystemDAO.selectEquipList(searchVO);
	}
	/**
	 * 장비를 삭제한다.
	 * @param vo - 삭제할 정보가 담긴 SampleVO
	 * @return void형
	 * @exception Exception
	 */
	@Override
	public void delIed(SaSystemVO vo) throws Exception {
		saSystemDAO.delIed(vo);
	}
	@Override
	public void delSa(SaSystemVO vo) throws Exception {
		saSystemDAO.delSa(vo);
	}
	@Override
	public void delEs(SaSystemVO vo) throws Exception {
		saSystemDAO.delEs(vo);
	}
	@Override
	public void delSntp(SaSystemVO vo) throws Exception {
		saSystemDAO.delSntp(vo);
	}
	/**
	 * 장비를 패킷수신제외한다.
	 * @param vo - 삭제할 정보가 담긴 SampleVO
	 * @return void형
	 * @exception Exception
	 */
	@Override
	public void exceptPackIed(SaSystemVO vo) throws Exception {
		saSystemDAO.exceptPackIed(vo);
	}
	@Override
	public void exceptPackSa(SaSystemVO vo) throws Exception {
		saSystemDAO.exceptPackSa(vo);
	}
	@Override
	public void exceptPackEs(SaSystemVO vo) throws Exception {
		saSystemDAO.exceptPackEs(vo);
	}
	@Override
	public void exceptPackSntp(SaSystemVO vo) throws Exception {
		saSystemDAO.exceptPackSntp(vo);
	}
	/**
	 * 장비를 패킷수신한다.
	 * @param vo - 삭제할 정보가 담긴 SampleVO
	 * @return void형
	 * @exception Exception
	 */
	@Override
	public void addPackIed(SaSystemVO vo) throws Exception {
		saSystemDAO.addPackIed(vo);
	}
	@Override
	public void addPackSa(SaSystemVO vo) throws Exception {
		saSystemDAO.addPackSa(vo);
	}
	@Override
	public void addPackEs(SaSystemVO vo) throws Exception {
		saSystemDAO.addPackEs(vo);
	}
	@Override
	public void addPackSntp(SaSystemVO vo) throws Exception {
		saSystemDAO.addPackSntp(vo);
	}
	/**
	 * default setting 정보조회
	 * @param vo - 조회할 정보가 담긴 SampleVO
	 * @return 조회한 글
	 * @exception Exception
	 */
	@Override
	public SaSystemVO selectDefault(SaSystemVO vo) throws Exception {
		SaSystemVO resultVO = saSystemDAO.selectDefault(vo);
		return resultVO;
	}
	/**
	 * default setting 등록한다.
	 * @param vo - 등록할 정보가 담긴 SampleVO
	 * @return 등록 결과
	 * @exception Exception
	 */
	@Override
	public String insertDefault(SaSystemVO vo) throws Exception {
		LOGGER.debug(vo.toString());

		/** ID Generation Service */
		String id = vo.getNtpServerIp();//egovIdGnrService.getNextStringId();
		vo.setId(id);
		LOGGER.debug(vo.toString());

		saSystemDAO.insertDefault(vo);
		return id;
	}
	/**
	 * default setting 수정한다.
	 * @param vo - 수정할 정보가 담긴 SampleVO
	 * @return void형
	 * @exception Exception
	 */
	@Override
	public void updateDefault(SaSystemVO vo) throws Exception {
		saSystemDAO.updateDefault(vo);
	}
	/**
	 * 사용자 목록을 조회한다.
	 * @param searchVO - 조회할 정보가 담긴 VO
	 * @return 글 목록
	 * @exception Exception
	 */
	@Override
	public List<?> selectUserList(SaSystemDefaultVO searchVO) throws Exception {
		return saSystemDAO.selectUserList(searchVO);
	}
	/**
	 * 로그인시간 등록한다.
	 * @param vo - 등록할 정보가 담긴 SampleVO
	 * @return 등록 결과
	 * @exception Exception
	 */
	@Override
	public String insertLoginInfo(SaSystemVO vo) throws Exception {
		LOGGER.debug(vo.toString());

		/** ID Generation Service */
		String id = vo.getId();//egovIdGnrService.getNextStringId();
		vo.setId(id);
		LOGGER.debug(vo.toString());

		saSystemDAO.insertLoginInfo(vo);
		return id;
	}
	/**
	 * 로그아웃시간 수정한다.
	 * @param vo - 수정할 정보가 담긴 SampleVO
	 * @return void형
	 * @exception Exception
	 */
	@Override
	public void updateLoginInfo(SaSystemVO vo) throws Exception {
		saSystemDAO.updateLoginInfo(vo);
	}
	/**
	 * main list 조회한다.
	 * @param searchVO - 조회할 정보가 담긴 VO
	 * @return 글 목록
	 * @exception Exception
	 */
	//이상상태요약
	@Override
	public List<?> selectErrorSummList(SaSystemDefaultVO searchVO) throws Exception {
		return saSystemDAO.selectErrorSummList(searchVO);
	}
	//백본스위치(메인)
	@Override
	public List<?> selectBackMainErrorList(SaSystemDefaultVO searchVO) throws Exception {
		return saSystemDAO.selectBackMainErrorList(searchVO);
	}
	//백본스위치(백업)
	@Override
	public List<?> selectBackBackupErrorList(SaSystemDefaultVO searchVO) throws Exception {
		return saSystemDAO.selectBackBackupErrorList(searchVO);
	}
	//엑세스스위치
	@Override
	public List<?> selectAccessErrorList(SaSystemDefaultVO searchVO) throws Exception {
		return saSystemDAO.selectAccessErrorList(searchVO);
	}
	//mms
	@Override
	public List<?> selectMmsErrorList(SaSystemDefaultVO searchVO) throws Exception {
		return saSystemDAO.selectMmsErrorList(searchVO);
	}
	//goose
	@Override
	public List<?> selectGooseErrorList(SaSystemDefaultVO searchVO) throws Exception {
		return saSystemDAO.selectGooseErrorList(searchVO);
	}

	@Override
	@Transactional
	public Map<String, Object> selectErrorDetailList(SaSystemJsonVO vo) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();

		map.put("list", saSystemDAO.selectErrorDetailList(vo));
		
		return map;
	}
	/**
	 * mms 실시간 list 조회한다.
	 * @param searchVO - 조회할 정보가 담긴 VO
	 * @return 글 목록
	 * @exception Exception
	 */
	@Override
	public List<?> selectMmsMessageStatusList(SaSystemDefaultVO searchVO) throws Exception {
		return saSystemDAO.selectMmsMessageStatusList(searchVO);
	}
	/**
	 * 포트연결 list 조회한다.
	 * @param searchVO - 조회할 정보가 담긴 VO
	 * @return 글 목록
	 * @exception Exception
	 */
	@Override
	public List<?> selectEquipConnectList(SaSystemDefaultVO searchVO) throws Exception {
		return saSystemDAO.selectEquipConnectList(searchVO);
	}   
	/**
	 * 사용자 등록한다.
	 * @param vo - 등록할 정보가 담긴 SampleVO
	 * @return 등록 결과
	 * @exception Exception
	 */
	@Override
	public String insertUser(SaSystemVO vo) throws Exception {
		LOGGER.debug(vo.toString());

		/** ID Generation Service */
		String id = vo.getId();//egovIdGnrService.getNextStringId();
		vo.setId(id);
		LOGGER.debug(vo.toString());

		saSystemDAO.insertUser(vo);
		return id;
	}
	@Override
	@Transactional
	public void delFaultRecordDate(SaSystemVO vo) throws Exception {
		
		saSystemDAO.delFaultRecordDate(vo);
	}
	
	
	
	
	
	
	
	
	
	public List<?> xlsExcelReader(MultipartHttpServletRequest req) {
		// 반환할 객체를 생성
		List<SaSystemVO> list = new ArrayList<>();

		MultipartFile file = req.getFile("excel");
		HSSFWorkbook workbook = null;

		try {
				// HSSFWorkbook은 엑셀파일 전체 내용을 담고 있는 객체
				workbook = new HSSFWorkbook(file.getInputStream());

				// 탐색에 사용할 Sheet, Row, Cell 객체
				HSSFSheet curSheet;
				HSSFRow curRow;
				HSSFCell curCell;
				SaSystemVO vo;

				// Sheet 탐색 for문
				for (int sheetIndex = 0; sheetIndex < workbook.getNumberOfSheets(); sheetIndex++) {
					// 현재 sheet 반환
					curSheet = workbook.getSheetAt(sheetIndex);
					// row 탐색 for문
					for (int rowIndex = 0; rowIndex < curSheet.getPhysicalNumberOfRows(); rowIndex++) {
						// row 0은 헤더정보이기 때문에 무시
						if (rowIndex != 0) {
							curRow = curSheet.getRow(rowIndex);
							vo = new SaSystemVO();
							String value;

							// row의 첫번째 cell값이 비어있지 않는 경우만 cell탐색
							if (curRow.getCell(0) != null) {
								if (!"".equals(curRow.getCell(0).getStringCellValue())) {
									// cell 탐색 for문
									for (int cellIndex = 0; cellIndex < curRow.getPhysicalNumberOfCells(); cellIndex++) {
										curCell = curRow.getCell(cellIndex);

										if (true) {
											value = "";
											// cell 스타일이 다르더라도 String으로 반환 받음
											switch (curCell.getCellType()) {
											case HSSFCell.CELL_TYPE_FORMULA:
												value = curCell.getCellFormula();
												break;
											case HSSFCell.CELL_TYPE_NUMERIC:
												value = curCell.getNumericCellValue() + "";
												break;
											case HSSFCell.CELL_TYPE_STRING:
												value = curCell.getStringCellValue() + "";
												break;
											case HSSFCell.CELL_TYPE_BLANK:
												value = curCell.getBooleanCellValue() + "";
												break;
											case HSSFCell.CELL_TYPE_ERROR:
												value = curCell.getErrorCellValue() + "";
												break;
											default:
												value = new String();
												break;
											} // end switch

											// 현재 colum index에 따라서 vo입력
											switch (cellIndex) {
											case 0: // 아이디
												//vo.setCustId(value);
												break;
											case 1: // 이름
												//vo.setCustName(value);
												break;
											case 2: // 나이
												//vo.setCustAge(value);
												break;
											case 3: // 이메일
												//vo.setCustEmail(value);
												break;
											default:
												break;
											}
										} // end if
									} // end for
									// cell 탐색 이후 vo 추가
									list.add(vo);
								} // end
							} // end if
						}

					}
				}
		} catch (IOException e) {
			e.printStackTrace();
		}

		// 디비에 insert
		//adminAccountsMngMapper.insertExcelTest(list);
		return list;
	}

	/**
	* <PRE>
	* 1. MethodName : xlsxExcelReader
	* 2. ClassName : AdminAccountsMngService
	* 3. Commnet : XLLX파일을 분석하여 List<ExcelTestVO>객체로 반환
	* 4. 작성자 : dukking
	* 5. 작성일 : 2016. 8. 11. 오후 2:45:48
	* </PRE>
	*
	* @return List<ExcelTestVO>
	* @param req
	* @return
	*/
	public List<SaSystemVO> xlsxExcelReader(MultipartHttpServletRequest req) {
		// 반환할 객체를 생성
		List<SaSystemVO> list = new ArrayList<>();

		MultipartFile file = req.getFile("excel");
		XSSFWorkbook workbook = null;

		try {
			// HSSFWorkbook은 엑셀파일 전체 내용을 담고 있는 객체
			workbook = new XSSFWorkbook(file.getInputStream());

			// 탐색에 사용할 Sheet, Row, Cell 객체
			XSSFSheet curSheet;
			XSSFRow curRow;
			XSSFCell curCell;
			SaSystemVO vo;

			// Sheet 탐색 for문
			for (int sheetIndex = 0; sheetIndex < workbook.getNumberOfSheets(); sheetIndex++) {
				// 현재 sheet 반환
				curSheet = workbook.getSheetAt(sheetIndex);
				// row 탐색 for문
				for (int rowIndex = 0; rowIndex < curSheet.getPhysicalNumberOfRows(); rowIndex++) {
					// row 0은 헤더정보이기 때문에 무시
					if (rowIndex != 0) {
						curRow = curSheet.getRow(rowIndex);
						vo = new SaSystemVO();
						String value;

						// row의 첫번째 cell값이 비어있지 않는 경우만 cell탐색
						if (curRow.getCell(0) != null) {
							if (!"".equals(curRow.getCell(0).getStringCellValue())) {
								// cell 탐색 for문
								for (int cellIndex = 0; cellIndex < curRow.getPhysicalNumberOfCells(); cellIndex++) {
									curCell = curRow.getCell(cellIndex);

									if (true) {
										value = "";
										// cell 스타일이 다르더라도 String으로 반환 받음
										switch (curCell.getCellType()) {
										case HSSFCell.CELL_TYPE_FORMULA:
											value = curCell.getCellFormula();
											break;
										case HSSFCell.CELL_TYPE_NUMERIC:
											value = curCell.getNumericCellValue() + "";
											break;
										case HSSFCell.CELL_TYPE_STRING:
											value = curCell.getStringCellValue() + "";
											break;
										case HSSFCell.CELL_TYPE_BLANK:
											value = curCell.getBooleanCellValue() + "";
											break;
										case HSSFCell.CELL_TYPE_ERROR:
											value = curCell.getErrorCellValue() + "";
											break;
										default:
											value = new String();
											break;
										} // end switch

										// 현재 colum index에 따라서 vo입력
										switch (cellIndex) {
										case 0: // 아이디
											//vo.setCustId(value);
											break;
										case 1: // 이름
											//vo.setCustName(value);
											break;
										case 2: // 나이
											//vo.setCustAge(value);
											break;
										case 3: // 이메일
											//vo.setCustEmail(value);
											break;
										default:
											break;
										}
									} // end if
								} // end for
								// cell 탐색 이후 vo 추가
								list.add(vo);
							} // end
						} // end if
					}

				}
			}
		} catch (IOException e) {
			e.printStackTrace();
		}

		// 디비에 insert
		//adminAccountsMngMapper.insertExcelTest(list);
		return list;
	}
	/**
	 * 사용자를 삭제한다.
	 * @param vo - 삭제할 정보가 담긴 SampleVO
	 * @return void형
	 * @exception Exception
	 */
	@Override
	public void deleteUser(SaSystemVO vo) throws Exception {
		saSystemDAO.deleteUser(vo);
	}

	/**
	 * 로그인 사용자정보조회
	 * @param vo - 조회할 정보가 담긴 SampleVO
	 * @return 조회한 글
	 * @exception Exception
	 */
	@Override
	public SaSystemVO selectUser(SaSystemVO vo) throws Exception {
		SaSystemVO resultVO = saSystemDAO.selectUser(vo);
//		if (resultVO == null)
//			throw processException("info.nodata.msg");
		return resultVO;
	}
	@Override
	public SaSystemVO selectUserChk(SaSystemVO vo) throws Exception {
		SaSystemVO resultVO = saSystemDAO.selectUser(vo);
		return resultVO;
	}
	/**
	 * packet list 조회한다.
	 * @param searchVO - 조회할 정보가 담긴 VO
	 * @return 글 목록
	 * @exception Exception
	 */
	@Override
	public List<?> selectExtrPacketList(SaSystemDefaultVO searchVO) throws Exception {
		return saSystemDAO.selectExtrPacketList(searchVO);
	}
	/**
	 * 로그인 사용자정보조회
	 * @param vo - 조회할 정보가 담긴 SampleVO
	 * @return 조회한 글
	 * @exception Exception
	 */
	@Override
	public SaSystemVO selectDelDate(SaSystemVO vo) throws Exception {
		SaSystemVO resultVO = saSystemDAO.selectDelDate(vo);
//		if (resultVO == null)
//			throw processException("info.nodata.msg");
		return resultVO;
	}
	
	
	
	
	
	



	

	/**
	 * 글을 수정한다.
	 * @param vo - 수정할 정보가 담긴 SampleVO
	 * @return void형
	 * @exception Exception
	 */
	@Override
	public void updateUser(SaSystemVO vo) throws Exception {
		saSystemDAO.updateUser(vo);
	}

	
	

	/**
	 * 글 총 갯수를 조회한다.
	 * @param searchVO - 조회할 정보가 담긴 VO
	 * @return 글 총 갯수
	 * @exception
	 */
	@Override
	public int selectUserListTotCnt(SaSystemDefaultVO searchVO) {
		return saSystemDAO.selectUserListTotCnt(searchVO);
	}

}
