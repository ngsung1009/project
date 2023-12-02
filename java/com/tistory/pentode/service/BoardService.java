package com.tistory.pentode.service;

import javax.servlet.http.HttpServletResponse;

public interface BoardService {
	void selectExcelList(HttpServletResponse response) throws Exception;
	
	void testJobMethod();
	
	void packetMethod();
}

