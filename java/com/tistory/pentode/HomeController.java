package com.tistory.pentode;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.tistory.pentode.service.BoardService;

/**
 * 컨트롤더
 */
@Controller
public class HomeController {
	
	@Resource(name = "boardService")
	private BoardService boardService;
	
	@RequestMapping(value = "/excel.do")
	public void excel(HttpServletResponse response) throws Exception {
		boardService.selectExcelList(response);
	}

	@RequestMapping(value = "/home.do", method = RequestMethod.GET)
	public String home() {
		return "home";
	}
}
