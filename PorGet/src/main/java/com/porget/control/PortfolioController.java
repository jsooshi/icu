package com.porget.control;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.porget.domain.PortfolioVO;
import com.porget.persistence.PortfolioDAO;

@Controller
@RequestMapping("portfolio")
public class PortfolioController {

	@Autowired
	private PortfolioDAO dao;
	
	
	@RequestMapping("")
	public String portfolio(Model m) {
		List<PortfolioVO> list = dao.allPortfolio();
		System.out.println(list);
		m.addAttribute("list",list);
		return "portfolio/portfolioBoard";
	}
	
	@RequestMapping("post")
	public String portfolioPost() {
		return "portfolio/portfolioPost";
	}
	
	@RequestMapping("insert")
	public String portfolioInsert(PortfolioVO vo) { 
		
		/*
		 * 		INSERT INTO portfolio (uname, pfnum, pfname, pfdate, pfthumb, pfread, pfurl, pffile, pfposition, tagname)
							닉네임, 게시글번호, 제목, 게시날짜, 썸네일, 조회수, 주소, 파일, 포지션, 태그
		 */
		/* 임시 VO 인서트 */
		// pfname, pfurl, pfposition, tagname
		vo.setUname("afterup");
		vo.setPfthumb("cat.jpg");
		vo.setPffile("cat.jpg");
		
		System.out.println(vo);
		if(dao.insertPortfolio(vo)==1) {
			System.out.println("추가성공");
		}else {
			System.out.println("실패");
		}
		return "redirect:/portfolio";
	}
	
	
	
	
}
