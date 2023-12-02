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

import java.util.List;

import egovframework.rte.psl.dataaccess.EgovAbstractDAO;
import taehee.saSystem.main.service.SaSystemDefaultVO;
import taehee.saSystem.main.service.SaSystemJsonVO;
import taehee.saSystem.main.service.SaSystemVO;

import org.springframework.stereotype.Repository;

/**
 * @Class Name : SampleDAO.java
 * @Description : Sample DAO Class
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

@Repository("saSystemDAO")
public class SaSystemDAO extends EgovAbstractDAO {

	//지정한 xml에서 id="insertExcelTest" 애를 찾겟지
	//@KoreaMapperScan
	public interface AdminAccountsMngMapper {

		void insertExcelTest(List<SaSystemVO> list);

	}

	
	/**
	 * packet list 조회한다.
	 * @param searchMap - 조회할 정보가 담긴 Map
	 * @return 글 목록
	 * @exception Exception
	 */
	public List<?> selectPacketList(SaSystemDefaultVO searchVO) throws Exception {
		return list("saSystemDAO.selectPacketList", searchVO);
	}
	/**
	 * 이더넷스위치 list 조회한다.
	 * @param searchMap - 조회할 정보가 담긴 Map
	 * @return 글 목록
	 * @exception Exception
	 */
	public List<?> selectEthernetSwitchList(SaSystemDefaultVO searchVO) throws Exception {
		return list("saSystemDAO.selectEthernetSwitchList", searchVO);
	}
	/**
	 * 이더넷스위치 HIS list 조회한다.
	 * @param searchMap - 조회할 정보가 담긴 Map
	 * @return 글 목록
	 * @exception Exception
	 */
	public List<?> selectEthernetSwitchHisList(SaSystemDefaultVO searchVO) throws Exception {
		return list("saSystemDAO.selectEthernetSwitchHisList", searchVO);
	}
	/**
	 * mms HIS list 조회한다.
	 * @param searchMap - 조회할 정보가 담긴 Map
	 * @return 글 목록
	 * @exception Exception
	 */
	public List<?> selectMmsHisList(SaSystemDefaultVO searchVO) throws Exception {
		return list("saSystemDAO.selectMmsHisList", searchVO);
	}
	/**
	 * mms HIS list 조회한다.
	 * @param searchMap - 조회할 정보가 담긴 Map
	 * @return 글 목록
	 * @exception Exception
	 */
	public List<?> selectGooseHisList(SaSystemDefaultVO searchVO) throws Exception {
		return list("saSystemDAO.selectGooseHisList", searchVO);
	}
	//엔지니어링검사
	/**
	 * iet list 조회한다.
	 * @param searchMap - 조회할 정보가 담긴 Map
	 * @return 글 목록
	 * @exception Exception
	 */
	public List<?> selectIetList(SaSystemDefaultVO searchVO) throws Exception {
		return list("saSystemDAO.selectIetList", searchVO);
	}
	//환경설정
	/**
	 * sa 등록한다.
	 * @param vo - 등록할 정보가 담긴 SampleVO
	 * @return 등록 결과
	 * @exception Exception
	 */
	public String insertSa(SaSystemVO vo) throws Exception {
		return (String) insert("saSystemDAO.insertSa", vo);
	}
	/**
	 * ied 등록한다.
	 * @param vo - 등록할 정보가 담긴 SampleVO
	 * @return 등록 결과
	 * @exception Exception
	 */
	public String insertIed(SaSystemVO vo) throws Exception {
		return (String) insert("saSystemDAO.insertIed", vo);
	}
	
	/**
	 * 글을 조회한다.
	 * @param vo - 조회할 정보가 담긴 SampleVO
	 * @return 조회한 글
	 * @exception Exception
	 */
	public SaSystemVO selectIed(SaSystemVO vo) throws Exception {
		return (SaSystemVO) select("saSystemDAO.selectIed", vo);
	}
	/**
	 * ied 수정한다.
	 * @param vo - 수정할 정보가 담긴 SampleVO
	 * @return void형
	 * @exception Exception
	 */
	public void updateIed(SaSystemVO vo) throws Exception {
		update("saSystemDAO.updateIed", vo);
	}
	/**
	 * switch 등록한다.
	 * @param vo - 등록할 정보가 담긴 SampleVO
	 * @return 등록 결과
	 * @exception Exception
	 */
	public String insertESwitch(SaSystemVO vo) throws Exception {
		return (String) insert("saSystemDAO.insertESwitch", vo);
	}
	/**
	 * sntp 등록한다.
	 * @param vo - 등록할 정보가 담긴 SampleVO
	 * @return 등록 결과
	 * @exception Exception
	 */
	public String insertSntp(SaSystemVO vo) throws Exception {
		return (String) insert("saSystemDAO.insertSntp", vo);
	}
	/**
	 * port 등록한다.
	 * @param vo - 등록할 정보가 담긴 SampleVO
	 * @return 등록 결과
	 * @exception Exception
	 */
	public String insertPort(SaSystemVO vo) throws Exception {
		return (String) insert("saSystemDAO.insertPort", vo);
	}
	/**
	 * equip list 조회한다.
	 * @param searchMap - 조회할 정보가 담긴 Map
	 * @return 글 목록
	 * @exception Exception
	 */
	public List<?> selectEquipList(SaSystemDefaultVO searchVO) throws Exception {
		return list("saSystemDAO.selectEquipList", searchVO);
	}
	/**
	 * 장비를 삭제한다.
	 * @param vo - 삭제할 정보가 담긴 SampleVO
	 * @return void형
	 * @exception Exception
	 */
	public void delIed(SaSystemVO vo) throws Exception {
		delete("saSystemDAO.delIed", vo);
	}
	public void delSa(SaSystemVO vo) throws Exception {
		delete("saSystemDAO.delSa", vo);
	}
	public void delEs(SaSystemVO vo) throws Exception {
		delete("saSystemDAO.delEs", vo);
	}
	public void delSntp(SaSystemVO vo) throws Exception {
		delete("saSystemDAO.delSntp", vo);
	}
	/**
	 * 장비를 패킷수신제외한다.
	 * @param vo - 삭제할 정보가 담긴 SampleVO
	 * @return void형
	 * @exception Exception
	 */
	public void exceptPackIed(SaSystemVO vo) throws Exception {
		delete("saSystemDAO.exceptPackIed", vo);
	}
	public void exceptPackSa(SaSystemVO vo) throws Exception {
		delete("saSystemDAO.exceptPackSa", vo);
	}
	public void exceptPackEs(SaSystemVO vo) throws Exception {
		delete("saSystemDAO.exceptPackEs", vo);
	}
	public void exceptPackSntp(SaSystemVO vo) throws Exception {
		delete("saSystemDAO.exceptPackSntp", vo);
	}
	/**
	 * 장비를 패킷수신한다.
	 * @param vo - 삭제할 정보가 담긴 SampleVO
	 * @return void형
	 * @exception Exception
	 */
	public void addPackIed(SaSystemVO vo) throws Exception {
		delete("saSystemDAO.addPackIed", vo);
	}
	public void addPackSa(SaSystemVO vo) throws Exception {
		delete("saSystemDAO.addPackSa", vo);
	}
	public void addPackEs(SaSystemVO vo) throws Exception {
		delete("saSystemDAO.addPackEs", vo);
	}
	public void addPackSntp(SaSystemVO vo) throws Exception {
		delete("saSystemDAO.addPackSntp", vo);
	}
	/**
	 * default setting 조회한다.
	 * @param vo - 조회할 정보가 담긴 SampleVO
	 * @return 조회한 글
	 * @exception Exception
	 */
	public SaSystemVO selectDefault(SaSystemVO vo) throws Exception {
		return (SaSystemVO) select("saSystemDAO.selectDefault", vo);
	}
	/**
	 * default setting 등록한다.
	 * @param vo - 등록할 정보가 담긴 SampleVO
	 * @return 등록 결과
	 * @exception Exception
	 */
	public String insertDefault(SaSystemVO vo) throws Exception {
		return (String) insert("saSystemDAO.insertDefault", vo);
	}
	/**
	 * default setting 수정한다.
	 * @param vo - 수정할 정보가 담긴 SampleVO
	 * @return void형
	 * @exception Exception
	 */
	public void updateDefault(SaSystemVO vo) throws Exception {
		update("saSystemDAO.updateDefault", vo);
	}
	/**
	 * 사용자 목록을 조회한다.
	 * @param searchMap - 조회할 정보가 담긴 Map
	 * @return 글 목록
	 * @exception Exception
	 */
	public List<?> selectUserList(SaSystemDefaultVO searchVO) throws Exception {
		return list("saSystemDAO.selectUserList", searchVO);
	}
	/**
	 * 로그인시간 등록한다.
	 * @param vo - 등록할 정보가 담긴 SampleVO
	 * @return 등록 결과
	 * @exception Exception
	 */
	public String insertLoginInfo(SaSystemVO vo) throws Exception {
		return (String) insert("saSystemDAO.insertLoginInfo", vo);
	}
	/**
	 * default setting 수정한다.
	 * @param vo - 수정할 정보가 담긴 SampleVO
	 * @return void형
	 * @exception Exception
	 */
	public void updateLoginInfo(SaSystemVO vo) throws Exception {
		update("saSystemDAO.updateLoginInfo", vo);
	}
	/**
	 * main list 조회한다.
	 * @param searchMap - 조회할 정보가 담긴 Map
	 * @return 글 목록
	 * @exception Exception
	 */
	public List<?> selectErrorSummList(SaSystemDefaultVO searchVO) throws Exception {
		return list("saSystemDAO.selectErrorSummList", searchVO);
	}
	public List<?> selectBackMainErrorList(SaSystemDefaultVO searchVO) throws Exception {
		return list("saSystemDAO.selectBackMainErrorList", searchVO);
	}
	public List<?> selectBackBackupErrorList(SaSystemDefaultVO searchVO) throws Exception {
		return list("saSystemDAO.selectBackBackupErrorList", searchVO);
	}
	public List<?> selectAccessErrorList(SaSystemDefaultVO searchVO) throws Exception {
		return list("saSystemDAO.selectAccessErrorList", searchVO);
	}
	public List<?> selectMmsErrorList(SaSystemDefaultVO searchVO) throws Exception {
		return list("saSystemDAO.selectMmsErrorList", searchVO);
	}
	public List<?> selectGooseErrorList(SaSystemDefaultVO searchVO) throws Exception {
		return list("saSystemDAO.selectGooseErrorList", searchVO);
	}
	public List<?> selectErrorDetailList (SaSystemJsonVO searchVO) throws Exception {
		return list("saSystemDAO.selectErrorDetailList", searchVO);
	}
	/**
	 * mms 실시간 조회한다.
	 * @param searchMap - 조회할 정보가 담긴 Map
	 * @return 글 목록
	 * @exception Exception
	 */
	public List<?> selectMmsMessageStatusList(SaSystemDefaultVO searchVO) throws Exception {
		return list("saSystemDAO.selectMmsMessageStatusList", searchVO);
	}
	/**
	 * 포트연결 list 조회한다.
	 * @param searchMap - 조회할 정보가 담긴 Map
	 * @return 글 목록
	 * @exception Exception
	 */
	public List<?> selectEquipConnectList(SaSystemDefaultVO searchVO) throws Exception {
		return list("saSystemDAO.selectEquipConnectList", searchVO);
	}
	/**
	 * 사용자 등록한다.
	 * @param vo - 등록할 정보가 담긴 SampleVO
	 * @return 등록 결과
	 * @exception Exception
	 */
	public String insertUser(SaSystemVO vo) throws Exception {
		return (String) insert("saSystemDAO.insertUser", vo);
	}
	/**
	 * 사용자 삭제한다.
	 * @param vo - 삭제할 정보가 담긴 SampleVO
	 * @return void형
	 * @exception Exception
	 */
	public void deleteUser(SaSystemVO vo) throws Exception {
		delete("saSystemDAO.deleteUser", vo);
	}
	/**
	 * packet 추츨 list 조회한다.
	 * @param searchMap - 조회할 정보가 담긴 Map
	 * @return 글 목록
	 * @exception Exception
	 */
	public List<?> selectExtrPacketList(SaSystemDefaultVO searchVO) throws Exception {
		return list("saSystemDAO.selectExtrPacketList", searchVO);
	}
	/**
	 * fault record 삭제기준날짜 설정한다.
	 * @param searchMap - 조회할 정보가 담긴 Map
	 * @return 글 목록
	 * @exception Exception
	 */
	public void delFaultRecordDate (SaSystemVO searchVO) throws Exception {
		update("saSystemDAO.delFaultRecordDate", searchVO);
	}
	/**
	 * 사용자을 조회한다.
	 * @param vo - 조회할 정보가 담긴 SampleVO
	 * @return 조회한 글
	 * @exception Exception
	 */
	public SaSystemVO selectDelDate(SaSystemVO vo) throws Exception {
		return (SaSystemVO) select("saSystemDAO.selectDelDate", vo);
	}
	
	
	
	
	
	
	
	
	
	

	/**
	 * 글을 수정한다.
	 * @param vo - 수정할 정보가 담긴 SampleVO
	 * @return void형
	 * @exception Exception
	 */
	public void updateUser(SaSystemVO vo) throws Exception {
		update("saSystemDAO.updateUser", vo);
	}

	

	/**
	 * 사용자을 조회한다.
	 * @param vo - 조회할 정보가 담긴 SampleVO
	 * @return 조회한 글
	 * @exception Exception
	 */
	public SaSystemVO selectUser(SaSystemVO vo) throws Exception {
		return (SaSystemVO) select("saSystemDAO.selectUser", vo);
	}
	public SaSystemVO selectUserChk(SaSystemVO vo) throws Exception {
		return (SaSystemVO) select("saSystemDAO.selectUserChk", vo);
	}
	

	/**
	 * 글 총 갯수를 조회한다.
	 * @param searchMap - 조회할 정보가 담긴 Map
	 * @return 글 총 갯수
	 * @exception
	 */
	public int selectUserListTotCnt(SaSystemDefaultVO searchVO) {
		return (Integer) select("saSystemDAO.selectUserListTotCnt", searchVO);
	}

}
