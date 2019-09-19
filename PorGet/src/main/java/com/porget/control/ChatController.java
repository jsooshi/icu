package com.porget.control;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.porget.domain.ChatVO;
import com.porget.persistence.ChatDAO;

@Controller
public class ChatController {
	
	@Autowired
	private ChatDAO dao;
	
	@RequestMapping("chatting")
	public String chattingView(String toUname, Model m) {
		System.out.println("toUname>>>"+toUname);
		
		m.addAttribute("toUname", toUname);
		return "portfolio/chatView4";
	}
	
	@RequestMapping("chatList")
	public String chatList(String toUname, String uname, Model m) {
		System.out.println("toUname toUname>>>"+toUname);
		System.out.println("uname uname>>>"+uname);
		ChatVO vo = new ChatVO();
		vo.setToUname(toUname);
		vo.setSenderUname(uname);
		List<Map<String, Object>> list = dao.chatList(vo);
		System.out.println("List<>>>"+list.get(0));
		m.addAttribute("list", list);
		return "portfolio/chatList";
	}
	
	
	
}
