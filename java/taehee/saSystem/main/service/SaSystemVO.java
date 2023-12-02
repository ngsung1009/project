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

import org.springframework.web.multipart.MultipartFile;

/**
 * @Class Name : SampleVO.java
 * @Description : SampleVO Class
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
public class SaSystemVO extends SaSystemDefaultVO {

	private static final long serialVersionUID = 1L;
	/** 아이디 */
	private String id;
	/** 이름 */
	private String name;
	/** 비밀번호 */
	private String pw;
	/** 사용여부 */
	private String useYn;
	/** 삭제여부 */
	private String delYn;
		/** 권한 */
	private String auth;
	private String fileName;
	private MultipartFile file;
	private String filePath;
	private long fileSize;
	private String iedNo;
	private String saName;
	private String saIp;
	private String saPort;
	private String iPort;
	private String iedName;
	private String iedIp;
	private String sclFileName;
	private String ietFileName;
	private int num;
	private String regDt;
	private String fnlDt;
	private String switchName;
	private String switchIp;
	private String sntpName;
	private String sntpIp;
	private String ip;
	private String equipType;
	private String equipNum;
	private String selectEquip;
	private String ntpServerIp;
	private String ntpTime;
	private String hdd;
	private String reportMis;
	private String gooseMis;
	private String reportScan;
	private String reportTime;
	private String outsideNic;
	private MultipartFile outsideScl;
	private String ietData;
	private String dataStart;
	private String signalRow;
	private String title1;
	private String title2;
	
	
	private String loginTime;
	private String logoutTime;
	private String eventDate;
	private String switchType;
	private String port;
	private String connectEquip;
	private String status;

	private String iedNum;
	private String iedConnStatus;
	private String saStatus;
	private String mainEquipStatus;
	private String subEquipStatus;
	private String reportStatus;

	private String address;
	private String gooseTime;
	private String statusNum;
	private String macAddress;
	private String faultCnt;
	
	private String backMain;
	private String backBackup;
	private String access;
	private String mms;
	private String goose;
	private String service;
	
	
	private String sntpNum;
	private String sntpPort;
	private String saNum;
	private String switchNum;
	private String ipAddress;
	private String selectUser;
	private String startDate = "";
	private String endDate = "";
	private String nowTime = "";
	/** start time */
	private String startTime = "";
	/** end time */
	private String endTime = "";
	private String selectPacket;
	private String saveMonth;
	
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getRegDt() {
		return regDt;
	}
	public void setRegDt(String regDt) {
		this.regDt = regDt;
	}
	public String getFnlDt() {
		return fnlDt;
	}
	public void setFnlDt(String fnlDt) {
		this.fnlDt = fnlDt;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public String getUseYn() {
		return useYn;
	}
	public void setUseYn(String useYn) {
		this.useYn = useYn;
	}
	public String getDelYn() {
		return delYn;
	}
	public void setDelYn(String delYn) {
		this.delYn = delYn;
	}
	public String getAuth() {
		return auth;
	}
	public void setAuth(String auth) {
		this.auth = auth;
	}
	public void setRegUser(String delYn) {
		this.delYn = delYn;
	}
	public String getFilePath() {
		return filePath;
	}
	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	public long getFileSize() {
		return fileSize;
	}
	public void setFileSize(long fileSize) {
		this.fileSize = fileSize;
	}
	public MultipartFile getFile() {
		return file;
	}
	public void setFile(MultipartFile file) {
		this.file = file;
	}
	public String getIedNo() {
		return iedNo;
	}
	public void setIedNo(String iedNo) {
		this.iedNo = iedNo;
	}
	public String getSaName() {
		return saName;
	}
	public void setSaName(String saName) {
		this.saName = saName;
	}
	public String getSaIp() {
		return saIp;
	}
	public void setSaIp(String saIp) {
		this.saIp = saIp;
	}
	public String getSaPort() {
		return saPort;
	}
	public void setSaPort(String saPort) {
		this.saPort = saPort;
	}
	public String getIPort() {
		return iPort;
	}
	public void setIPort(String iPort) {
		this.iPort = iPort;
	}
	public String getIedName() {
		return iedName;
	}
	public void setIedName(String iedName) {
		this.iedName = iedName;
	}
	public String getIedIp() {
		return iedIp;
	}
	public void setIedIp(String iedIp) {
		this.iedIp = iedIp;
	}
	public String getSclFileName() {
		return sclFileName;
	}
	public void setSclFileName(String sclFileName) {
		this.sclFileName = sclFileName;
	}
	public String getIetFileName() {
		return ietFileName;
	}
	public void setIetFileName(String ietFileName) {
		this.ietFileName = ietFileName;
	}
	public String getSwitchName() {
		return switchName;
	}
	public void setSwitchName(String switchName) {
		this.switchName = switchName;
	}
	public String getSwitchIp() {
		return switchIp;
	}
	public void setSwitchIp(String switchIp) {
		this.switchIp = switchIp;
	}
	public String getSntpName() {
		return sntpName;
	}
	public void setSntpName(String sntpName) {
		this.sntpName = sntpName;
	}
	public String getSntpIp() {
		return sntpIp;
	}
	public void setSntpIp(String sntpIp) {
		this.sntpIp = sntpIp;
	}
	public String getIp() {
		return ip;
	}
	public void setIp(String ip) {
		this.ip = ip;
	}
	
	public String getEquipType() {
		return equipType;
	}
	public void setEquipType(String equipType) {
		this.equipType = equipType;
	}
	public String getEquipNum() {
		return equipNum;
	}
	public void setEquipNum(String equipNum) {
		this.equipNum = equipNum;
	}
	public String getSelectEquip() {
		return selectEquip;
	}
	public void setSelectEquip(String selectEquip) {
		this.selectEquip = selectEquip;
	}
	
	public String getNtpServerIp() {
		return ntpServerIp;
	}
	public void setNtpServerIp(String ntpServerIp) {
		this.ntpServerIp = ntpServerIp;
	}
	public String getNtpTime() {
		return ntpTime;
	}
	public void setNtpTime(String ntpTime) {
		this.ntpTime = ntpTime;
	}
	public String getHdd() {
		return hdd;
	}
	public void setHdd(String hdd) {
		this.hdd = hdd;
	}
	public String getReportMis() {
		return reportMis;
	}
	public void setReportMis(String reportMis) {
		this.reportMis = reportMis;
	}
	public String getGooseMis() {
		return gooseMis;
	}
	public void setGooseMis(String gooseMis) {
		this.gooseMis = gooseMis;
	}
	public String getReportScan() {
		return reportScan;
	}
	public void setReportScan(String reportScan) {
		this.reportScan = reportScan;
	}
	public String getReportTime() {
		return reportTime;
	}
	public void setReportTime(String reportTime) {
		this.reportTime = reportTime;
	}
	public String getOutsideNic() {
		return outsideNic;
	}
	public void setOutsideNic(String outsideNic) {
		this.outsideNic = outsideNic;
	}
	public MultipartFile getOutsideScl() {
		return outsideScl;
	}
	public void setOutsideScl(MultipartFile outsideScl) {
		this.outsideScl = outsideScl;
	}
	public String getIetData() {
		return ietData;
	}
	public void setIetData(String ietData) {
		this.ietData = ietData;
	}
	public String getDataStart() {
		return dataStart;
	}
	public void setDataStart(String dataStart) {
		this.dataStart = dataStart;
	}
	public String getSignalRow() {
		return signalRow;
	}
	public void setSignalRow(String signalRow) {
		this.signalRow = signalRow;
	}
	public String getTitle1() {
		return title1;
	}
	public void setTitle1(String title1) {
		this.title1 = title1;
	}
	public String getTitle2() {
		return title2;
	}
	public void setTitle2(String title2) {
		this.title2 = title2;
	}
	
	
	
	public String getLoginTime() {
		return loginTime;
	}
	public void setLoginTime(String loginTime) {
		this.loginTime = loginTime;
	}
	public String getLogoutTime() {
		return logoutTime;
	}
	public void setLogoutTime(String logoutTime) {
		this.logoutTime = logoutTime;
	}
	public String getEventDate() {
		return eventDate;
	}
	public void setEeventDate(String eventDate) {
		this.eventDate = eventDate;
	}
	public String getSwitchType() {
		return switchType;
	}
	public void setSwitchType(String switchType) {
		this.switchType = switchType;
	}
	public String getPort() {
		return port;
	}
	public void setPort(String port) {
		this.port = port;
	}
	public String getConnectEquip() {
		return connectEquip;
	}
	public void setCconnectEquip(String connectEquip) {
		this.connectEquip = connectEquip;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getIedNum() {
		return iedNum;
	}
	public void setIedNum(String iedNum) {
		this.iedNum = iedNum;
	}
	public String getIedConnStatus() {
		return iedConnStatus;
	}
	public void setIedConnStatus(String iedConnStatus) {
		this.iedConnStatus = iedConnStatus;
	}
	public String getSaStatus() {
		return saStatus;
	}
	public void setSaStatus(String saStatus) {
		this.saStatus = saStatus;
	}
	public String getMainEquipStatus() {
		return mainEquipStatus;
	}
	public void setMainEquipStatus(String mainEquipStatus) {
		this.mainEquipStatus = mainEquipStatus;
	}
	public String getSubEquipStatus() {
		return subEquipStatus;
	}
	public void setSubEquipStatus(String subEquipStatus) {
		this.subEquipStatus = subEquipStatus;
	}
	public String getReportStatus() {
		return reportStatus;
	}
	public void setReportStatus(String reportStatus) {
		this.reportStatus = reportStatus;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getGooseTime() {
		return gooseTime;
	}
	public void setGooseTime(String gooseTime) {
		this.gooseTime = gooseTime;
	}
	public String getStatusNum() {
		return statusNum;
	}
	public void setStatusNum(String statusNum) {
		this.statusNum = statusNum;
	}
	public String getMacAddress() {
		return macAddress;
	}
	public void setMacAddress(String macAddress) {
		this.macAddress = macAddress;
	}
	public String getFaultCnt() {
		return faultCnt;
	}
	public void setFaultCnt(String faultCnt) {
		this.faultCnt = faultCnt;
	}
	
	public String getBackMain() {
		return backMain;
	}
	public void setBackMain(String backMain) {
		this.backMain = backMain;
	}
	public String getBackBackup() {
		return backBackup;
	}
	public void setBackBackup(String backBackup) {
		this.backBackup = backBackup;
	}
	public String getAccess() {
		return access;
	}
	public void setAccess(String access) {
		this.access = access;
	}
	public String getMms() {
		return mms;
	}
	public void setMms(String mms) {
		this.mms = mms;
	}
	public String getGoose() {
		return goose;
	}
	public void setGoose(String goose) {
		this.goose = goose;
	}
	
	public String getService() {
		return service;
	}
	public void setService(String service) {
		this.service = service;
	}
	
	public String getSntpNum() {
		return sntpNum;
	}
	public void setSntpNum(String sntpNum) {
		this.sntpNum = sntpNum;
	}
	public String getSntpPort() {
		return sntpPort;
	}
	public void setSntpPort(String sntpPort) {
		this.sntpPort = sntpPort;
	}
	public String getSaNum() {
		return saNum;
	}
	public void setSaNum(String saNum) {
		this.saNum = saNum;
	}
	public String getSwitchNum() {
		return switchNum;
	}
	public void setSwitchNum(String switchNum) {
		this.switchNum = switchNum;
	}
	public String getIpAddress() {
		return ipAddress;
	}
	public void setIpAddress(String ipAddress) {
		this.ipAddress = ipAddress;
	}
	public String getSelectUser() {
		return selectUser;
	}
	public void setSelectUser(String selectUser) {
		this.selectUser = selectUser;
	}
	public String getStartDate() {
		return startDate;
	}
	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}
	public String getEndDate() {
		return endDate;
	}
	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}
	public String getNowTime() {
		return nowTime;
	}
	public void setNowTime(String nowTime) {
		this.nowTime = nowTime;
	}
	public String getStartTime() {
		return startTime;
	}

	public void setStartTime(String startTime) {
		this.startTime = startTime;
	}
	public String getEndTime() {
		return endTime;
	}
	public void setEndTime(String endTime) {
		this.endTime = endTime;
	}
	private String equipTypeArray;
	private String numArray;
	public String getEquipTypeArray() {
		return equipTypeArray;
	}
	
	public void setEquipTypeArray(String equipTypeArray) {
		this.equipTypeArray = equipTypeArray;
		
	}
	public String getNumArray() {
		return numArray;
	}
	public void setNumArray(String numArray) {
		this.numArray = numArray;
		
	}
	public String getSelectPacket() {
		return selectPacket;
	}
	public void setSelectPacket(String selectPacket) {
		this.selectPacket = selectPacket;
	}
	public String getSaveMonth() {
		return saveMonth;
	}
	public void setSaveMonth(String saveMonth) {
		this.saveMonth = saveMonth;
	}
}

