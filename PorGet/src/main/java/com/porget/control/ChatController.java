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
	public String chattingView(String toUname, String uname, Model m) {
		System.out.println("toUname>>>"+toUname);
		m.addAttribute("toUname", toUname);
		String toUphoto = dao.selectUphoto(toUname);
		m.addAttribute("toUphoto",toUphoto);
		return "portfolio/chatView4";
	}
	
	@RequestMapping("chatList")
	public String chatList(String toUname, String uname, Model m) {
		ChatVO vo = new ChatVO();
		vo.setToUname(toUname);
		vo.setSenderUname(uname);
		List<List<Map<String, Object>>> list4 = new ArrayList<List<Map<String,Object>>>();
		list4.add(dao.chatList(vo));
		m.addAttribute("list4", list4);
		String toUphoto = dao.selectUphoto(toUname);
		m.addAttribute("toUphoto",toUphoto);
		return "portfolio/chatList";
	}
	
	@RequestMapping("chatListAll")
	public String chatListAll(String uname, Model m) {
		List<List<Map<String, Object>>> list4 = new ArrayList<List<Map<String,Object>>>();
		if(dao.chatListAll(uname)!=null) {
		list4.add(dao.chatListAll(uname));
		m.addAttribute("list4", list4);
		}else {
		m.addAttribute("clear", "clear");
		}
		
		return "portfolio/chatListAll";
	}
	
	
	
}
