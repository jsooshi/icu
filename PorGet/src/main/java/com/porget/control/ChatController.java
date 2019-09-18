package com.porget.control;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

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
	
}
