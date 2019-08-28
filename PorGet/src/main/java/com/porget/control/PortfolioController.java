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
	public String showPopularPart(Model m, int base) { //인기포트폴리오 게시판 스크롤 내려가면 그 다음 목록 검색해서 뿌려주기
		List<Map<String, Object>> list = dao.showPopularPart(base);
		System.out.println(list);
		m.addAttribute("list", list);
		return "portfolio/popularBoardPart";
	}
	
	@RequestMapping("/showSearch")
	public String showSearch() {  //테스트용으로 검색창 띄우기 원래는 메인에 있음
		return "portfolio/searchInputTest";
	}
	
	
	@RequestMapping("/searchKeyword")
	public String searchKeyword(Model m, String keyword) { //검색창에서 연관검색어 가져오기
		//System.out.println("keyword>>"+keyword);
		List<String> list = dao.searchKeyword(keyword);
		m.addAttribute("list", list);
		return "portfolio/searchInputPartTest";
	}
	
	
	@RequestMapping("/searchButton")
	public String searchButton(String keyword, Model m) {//검색버튼 눌렀을시 검색결과 가져오기
		List<Map<String, Object>> list = dao.searchResult(keyword);
		m.addAttribute("list", list);
		return "portfolio/searchResult";
	}
	
	
	
	
	
	
	
}
