package com.porget.control;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.porget.domain.ReplyVO;
import com.porget.persistence.ReplyDAOImpl;

@Controller
@RequestMapping("replies")

public class ReplyController {
	@Autowired
	ReplyDAOImpl dao;
	
	@RequestMapping("view")
	public String replyShow() { //게시글 누르면 댓글작성창 및 댓글리스트보이기 
		 
		return "portfolio/portfolioView";
	}
	
	@RequestMapping("save")
	public String replySave(ReplyVO vo) { //댓글 저장 눌렀을 시, 리다이렉트 이동
		dao.replySave(vo);
		return "redirect:/replies/list?pfnum="+vo.getPfnum()+"&uname="+vo.getUname(); //댓글저장돼
	}


	@RequestMapping("list")
	public String replyList(int pfnum, Model m) { //게시글 누르면 댓글작성창 및 댓글리스트보이기 
		m.addAttribute("replyList",dao.replyList(pfnum));
		return "portfolio/replyList";
	}
	
	@RequestMapping("delete")
	public String replyDelete(int rnum, int pfnum, String uname  ) { //댓글삭제하기
		Map<String, Integer> map = new HashMap<>();
				map.put("pfnum", pfnum);
				map.put("rnum",rnum);
		dao.replyDelete(map);
		return "redirect:/replies/list?pfnum="+pfnum+"&uname="+uname;
	}
	
	
}






