package com.porget.control;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.porget.domain.PortfolioVO;
import com.porget.domain.UserVO;
import com.porget.persistence.MyPageDAO;

@Controller
@RequestMapping("/mypage")
public class MyPageController {
	
	@Autowired
	private MyPageDAO dao;
	
	@GetMapping(value={"","/"})
	public String selectMyPage(HttpSession session, Model m) {
		String uname = (String)session.getAttribute("uname");
		UserVO vo = dao.selectUser(uname);
		System.out.println(vo);
		m.addAttribute("vo",vo);
		
		List<PortfolioVO> portfolioVO = dao.userPortfolio(uname);
		System.out.println(portfolioVO);
		for (int i=0;i<portfolioVO.size();i++) {
			PortfolioVO pvo =portfolioVO.get(i);
			pvo.setPfthumb(pvo.getPfthumb().split("\\|")[0]);
		}
		m.addAttribute("pvo",portfolioVO);
		return "member/myPage";
	}
	
	@PostMapping("/changeuname")
	public String changeUname(String uname) { //추후 변경
		System.out.println(uname);
		if(dao.changeUname(uname)==1) {
			return "수정되었습니다.";
		}else {
			return "오류가 발생하였습니다.";
		}
	}
	
	
	
}
