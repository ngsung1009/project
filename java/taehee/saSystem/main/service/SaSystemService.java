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
package taehee.saSystem.main.service;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartHttpServletRequest;
/**
 * @Class Name : EgovSampleService.java
 * @Description : EgovSampleService Class
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
public interface SaSystemService {
	
	List<?> xlsExcelReader(MultipartHttpServletRequest req) throws Exception;
	List<?> xlsxExcelReader(MultipartHttpServletRequest req) throws Exception;
	
	/**
	 * packetList 조회한다.
	 * @param searchVO - 조회할 정보가 담긴 VO
	 * @return 글 목록
	 * @exception Exception
	 */
	List<?> selectPacketList(SaSystemDefaultVO searchVO) throws Exception;
	/**
	 * 이더넷 스위치 list 조회한다.
	 * @param searchVO - 조회할 정보가 담긴 VO
	 * @return 글 목록
	 * @exception Exception
	 */
	List<?> selectEthernetSwitchList(SaSystemDefaultVO searchVO) throws Exception;
	
	///fault record
	/**
	 * 이더넷 스위치 HIS  list 조회한다.
	 * @param searchVO - 조회할 정보가 담긴 VO
	 * @return 글 목록
	 * @exception Exception
	 */
    List<?> selectEthernetSwitchHisList(SaSystemDefaultVO searchVO) throws Exception;/**
	 /**
	 * mms HIS  list 조회한다.
	 * @param searchVO - 조회할 정보가 담긴 VO
	 * @return 글 목록
	 * @exception Exception
	 */
    List<?> selectMmsHisList(SaSystemDefaultVO searchVO) throws Exception;
    /** 
    * goose HIS  list 조회한다.
	 * @param searchVO - 조회할 정보가 담긴 VO
	 * @return 글 목록
	 * @exception Exception
	 */
   List<?> selectGooseHisList(SaSystemDefaultVO searchVO) throws Exception;
    //엔지니어링검사
   /** 
    * iet list 조회한다.
	 * @param searchVO - 조회할 정보가 담긴 VO
	 * @return 글 목록
	 * @exception Exception
	 */
   List<?> selectIetList(SaSystemDefaultVO searchVO) throws Exception;
   //환경설정
   /**
	 * sa 등록한다.
	 * @param vo - 등록할 정보가 담긴 SampleVO
	 * @return 등록 결과
	 * @exception Exception
	 */
   String insertSa(SaSystemVO vo) throws Exception;
   /**
	 * ied 등록한다.
	 * @param vo - 등록할 정보가 담긴 SampleVO
	 * @return 등록 결과
	 * @exception Exception
	 */
  String insertIed(SaSystemVO vo) throws Exception;
  /**
	 * switch 등록한다.
	 * @param vo - 등록할 정보가 담긴 SampleVO
	 * @return 등록 결과
	 * @exception Exception
	 */
  String insertESwitch(SaSystemVO vo) throws Exception;
  /**
	 * sntp 등록한다.
	 * @param vo - 등록할 정보가 담긴 SampleVO
	 * @return 등록 결과
	 * @exception Exception
	 */
  String insertSntp(SaSystemVO vo) throws Exception;
  /**
	 * ied  조회한다.
	 * @param vo - 조회할 정보가 담긴 SampleVO
	 * @return 조회한 글
	 * @exception Exception
	 */
	SaSystemVO selectIed(SaSystemVO vo) throws Exception;
	/**
	 * 글을 수정한다.
	 * @param vo - 수정할 정보가 담긴 SampleVO
	 * @return void형
	 * @exception Exception
	 */
	void updateIed(SaSystemVO vo) throws Exception;
	
	/** 
	    * equip list 조회한다.
		 * @param searchVO - 조회할 정보가 담긴 VO
		 * @return 글 목록
		 * @exception Exception
		 */
	List<?> selectEquipList(SaSystemDefaultVO searchVO) throws Exception;
	
	/**
	 * 리스트의 ied장치를 삭제한다.
	 * @param vo - 삭제할 정보가 담긴 SampleVO
	 * @return void형
	 * @exception Exception
	 */
	void delIed(SaSystemVO vo) throws Exception;
	/**
	 * 리스트의 sa장치를 삭제한다.
	 * @param vo - 삭제할 정보가 담긴 SampleVO
	 * @return void형
	 * @exception Exception
	 */
	void delSa(SaSystemVO vo) throws Exception;
	/**
	 * 리스트의 이더넷스위치장치를 삭제한다.
	 * @param vo - 삭제할 정보가 담긴 SampleVO
	 * @return void형
	 * @exception Exception
	 */
	void delEs(SaSystemVO vo) throws Exception;
	/**
	 * sntp 장치를 삭제한다.
	 * @param vo - 삭제할 정보가 담긴 SampleVO
	 * @return void형
	 * @exception Exception
	 */
	void delSntp(SaSystemVO vo) throws Exception;
	/**
	 * 장치를 패킷수신제외한다.
	 * @param vo - 삭제할 정보가 담긴 SampleVO
	 * @return void형
	 * @exception Exception
	 */
	void exceptPackIed(SaSystemVO vo) throws Exception;
	void exceptPackSa(SaSystemVO vo) throws Exception;
	void exceptPackEs(SaSystemVO vo) throws Exception;
	void exceptPackSntp(SaSystemVO vo) throws Exception;
	/**
	 * 장치를 패킷수신한다.
	 * @param vo - 삭제할 정보가 담긴 SampleVO
	 * @return void형
	 * @exception Exception
	 */
	void addPackIed(SaSystemVO vo) throws Exception;
	void addPackSa(SaSystemVO vo) throws Exception;
	void addPackEs(SaSystemVO vo) throws Exception;
	void addPackSntp(SaSystemVO vo) throws Exception;
	
	/**
	 * DEFAULT SETTING  조회한다.
	 * @param vo - 조회할 정보가 담긴 SampleVO
	 * @return 조회한 글
	 * @exception Exception
	 */
	SaSystemVO selectDefault(SaSystemVO vo) throws Exception;
	/**
	 * default setting 등록한다.
	 * @param vo - 등록할 정보가 담긴 SampleVO
	 * @return 등록 결과
	 * @exception Exception
	 */
   String insertDefault(SaSystemVO vo) throws Exception;
	/**
	 * default setting 수정한다.
	 * @param vo - 수정할 정보가 담긴 SampleVO
	 * @return void형
	 * @exception Exception
	 */
	void updateDefault(SaSystemVO vo) throws Exception;
	/**
	 * 사용자 목록을 조회한다.
	 * @param searchVO - 조회할 정보가 담긴 VO
	 * @return 글 목록
	 * @exception Exception
	 */
	List<?> selectUserList(SaSystemDefaultVO searchVO) throws Exception;
	
	
	/**
	 * 로그인시간을 등록 한다.
	 * @param vo - 등록할 정보가 담긴 SampleVO
	 * @return 등록 결과
	 * @exception Exception
	 */
  String insertLoginInfo(SaSystemVO vo) throws Exception;
  /**
	 * 로그아웃정보 수정한다.
	 * @param vo - 수정할 정보가 담긴 SampleVO
	 * @return void형
	 * @exception Exception
	 */
	void updateLoginInfo(SaSystemVO vo) throws Exception;
	/**
	 * main list 조회한다.
	 * @param searchVO - 조회할 정보가 담긴 VO
	 * @return 글 목록
	 * @exception Exception
	 */
	//이상상태요약
	List<?> selectErrorSummList(SaSystemDefaultVO searchVO) throws Exception;
    //백본스위치(메인)
    List<?> selectBackMainErrorList(SaSystemDefaultVO searchVO) throws Exception;
    //백본스위치(백업)
    List<?> selectBackBackupErrorList(SaSystemDefaultVO searchVO) throws Exception;
    //엑세스스위치
    List<?> selectAccessErrorList(SaSystemDefaultVO searchVO) throws Exception;
    //mms
    List<?> selectMmsErrorList(SaSystemDefaultVO searchVO) throws Exception;
    //goose
    List<?> selectGooseErrorList(SaSystemDefaultVO searchVO) throws Exception;
    /**
	 * error detail 조회한다.
	 * @param searchVO - 조회할 정보가 담긴 VO
	 * @return 글 목록
	 * @exception Exception
	 */
    Map<String, Object> selectErrorDetailList(SaSystemJsonVO vo) throws Exception;
    /**
	 * mms 실시간 조회한다.
	 * @param searchVO - 조회할 정보가 담긴 VO
	 * @return 글 목록
	 * @exception Exception
	 */
    List<?> selectMmsMessageStatusList(SaSystemDefaultVO searchVO) throws Exception;
    /**
	 * 포크연결리스트  조회한다.
	 * @param searchVO - 조회할 정보가 담긴 VO
	 * @return 글 목록
	 * @exception Exception
	 */
    List<?> selectEquipConnectList(SaSystemDefaultVO searchVO) throws Exception;
    /**
	 * port 등록한다.
	 * @param vo - 등록할 정보가 담긴 SampleVO
	 * @return 등록 결과
	 * @exception Exception
	 */
   String insertPort(SaSystemVO vo) throws Exception;
   /**
	 * 사용자 등록한다.
	 * @param vo - 등록할 정보가 담긴 SampleVO
	 * @return 등록 결과
	 * @exception Exception
	 */
   String insertUser(SaSystemVO vo) throws Exception;
   /**
	 * fault record 삭제시간 업데이트 한다.
	 * @param searchVO - 조회할 정보가 담긴 VO
	 * @return 글 목록
	 * @exception Exception
	 */
   void delFaultRecordDate(SaSystemVO vO) throws Exception;
   SaSystemVO selectDelDate(SaSystemVO vo) throws Exception;
   
   
	
	
   
   
   
   
	
	
    

	/**
	 * 글을 수정한다.
	 * @param vo - 수정할 정보가 담긴 SampleVO
	 * @return void형
	 * @exception Exception
	 */
	void updateUser(SaSystemVO vo) throws Exception;

	/**
	 * 글을 삭제한다.
	 * @param vo - 삭제할 정보가 담긴 SampleVO
	 * @return void형
	 * @exception Exception
	 */
	void deleteUser(SaSystemVO vo) throws Exception;

	/**
	 * 사용자를  조회한다.
	 * @param vo - 조회할 정보가 담긴 SampleVO
	 * @return 조회한 글
	 * @exception Exception
	 */
	SaSystemVO selectUser(SaSystemVO vo) throws Exception;
	SaSystemVO selectUserChk(SaSystemVO vo) throws Exception;
	

	/**
	 * 글 총 갯수를 조회한다.
	 * @param searchVO - 조회할 정보가 담긴 VO
	 * @return 글 총 갯수
	 * @exception
	 */
	int selectUserListTotCnt(SaSystemDefaultVO searchVO);
	
	/**
	 * selectExtrPacketList 패킷추출 조회한다.
	 * @param searchVO - 조회할 정보가 담긴 VO
	 * @return 글 목록
	 * @exception Exception
	 */
	List<?> selectExtrPacketList(SaSystemDefaultVO searchVO) throws Exception;

}
