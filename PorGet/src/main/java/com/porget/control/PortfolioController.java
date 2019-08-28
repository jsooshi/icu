package com.porget.control;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.porget.persistence.PortfolioDAO;

@Controller
public class PortfolioController {
	
	@Inject
	private PortfolioDAO dao;
	
	@RequestMapping("/popularView")
	public String showPopularView() { //인기포트폴리오 게시판 뷰 보기
		return "portfolio/popularBoard";
	}
	
	@RequestMapping("/partPopular")
	public String showPopularPart(Model m, int base) {
		List<Map<String, Object>> list = dao.showPopularPart(base);
		System.out.println(list);
		m.addAttribute("list", list);
		return "portfolio/popularBoardPart";
	}
	
}
