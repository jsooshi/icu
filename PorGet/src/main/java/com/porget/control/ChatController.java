package com.porget.control;

import java.util.ArrayList;
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
		List<List<Map<String, Object>>> list4 = new ArrayList<List<Map<String,Object>>>();
		//List<Map<String, Object>> list=null;
		list4.add(dao.chatList(vo));
		System.out.println("List4 >>>"+list4 );
		m.addAttribute("list4", list4);
		return "portfolio/chatList";
	}
	
	
	
}
