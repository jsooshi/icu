package com.porget.control;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.porget.domain.PortfolioVO;
import com.porget.persistence.PortfolioDAO;

@Controller
@RequestMapping("/portfolio")
public class PortfolioController {

	@Autowired
	private PortfolioDAO dao;

	
	@RequestMapping("")
	public String portfolio(Model m) { // <임시 매핑. 추후 뷰 컨트롤러로 이동> 포트폴리오 게시판 이동. 포폴 전체리스트 출력
		List<PortfolioVO> list = dao.allPortfolio();
		System.out.println(list);
		m.addAttribute("list", list);
		return "portfolio/portfolioBoard";
	}


	@GetMapping("/post")
	public String portfolioPost() { // 글생성 창
		return "portfolio/portfolioPost";
	}
	
	@PostMapping("/post")
	public String portfolioInsert(PortfolioVO vo) { // 글 생성 후 포트폴리오 게시판으로 이동
		// vo=> pfname, pfurl, pfposition, tagname

		/* 임시로 추가하는 VO */
		vo.setUname("afterup"); // 세션 아이디값
		vo.setPfthumb("cat.jpg"); // 썸네일
		vo.setPffile("cat.jpg"); // 사진파일경로

		System.out.println(vo);
		if (dao.insertPortfolio(vo) == 1) {
			System.out.println("추가성공");
		} else {
			System.out.println("추가실패");
		}
		return "redirect:/portfolio";
	}


	@RequestMapping("/view")
	public String portfolioView(int pfnum, Model m) {// 게시글 클릭시 포트폴리오 뷰

		List<PortfolioVO> list = dao.onePortfolio(pfnum);
		System.out.println(list.get(0));
		m.addAttribute("list", list.get(0));
		return "portfolio/portfolioView";
	}

	@GetMapping("/update")
	public String portfolioUpdateView(int pfnum, Model m) {// 게시글 수정뷰

		List<PortfolioVO> list = dao.onePortfolio(pfnum);
		System.out.println(list.get(0));
		m.addAttribute("p", list.get(0));
		return "portfolio/portfolioUpdate";
	}

	@PostMapping("/update")
	public String portfolioUpdate(PortfolioVO vo, int pfnum, Model m) {// 게시글 수정완료 후 본인글로 이동

		/* 임시로 추가하는 VO */
		vo.setPfthumb("dog.jpg"); // 썸네일
		vo.setPffile("dog.jpg"); // 사진파일경로

		if (dao.updatePortfolio(vo) == 1) {
			System.out.println("수정성공");
		} else {
			System.out.println("수정실패");
		}
		return "redirect:/portfolio/view?pfnum=" + pfnum;
	}

	@RequestMapping("/delete")
	public String portfolioDelete(int pfnum) {// 게시글 삭제후 게시판으로 이동

		if (dao.deletePortfolio(pfnum) == 1) {
			System.out.println("삭제성공");
		} else {
			System.out.println("삭제실패");
		}
		return "redirect:/portfolio";
	}
	
	/*   좋아요 기능   */
	@RequestMapping("/recommend")
	public String recommend(int pfnum, String uname) {
		
		return "";
	}
	

}
