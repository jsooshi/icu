package com.porget.control;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.porget.domain.ReplyVO;
import com.porget.persistence.ReplyDAOImpl;

@Controller
@RequestMapping("replies")
public class ReplyController {
	@Autowired
	ReplyDAOImpl dao;
	
	@RequestMapping("show")
	public String replyShow() { //게시글 누르면 댓글작성창 및 댓글리스트보이기 
		
		return "portfolio/portfolioView";
	}
	
	@RequestMapping("save")
	public String replySave(ReplyVO vo) { //댓글 저장 눌렀을 시, 리다이렉트 이동
		dao.replySave(vo);
		return "redirect:/replies/show";
	}

}
