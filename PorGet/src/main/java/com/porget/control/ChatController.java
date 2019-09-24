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
//		System.out.println("list4All>>>>"+list2);
//		System.out.println("므야"+list2.get(0));
//		for (int i = 0; i < list2.get(0).size(); i++) {
//			for (int j = 1; j < list2.get(0).size(); j++) {
//				System.out.println("나왓i"+list2.get(0).get(i));
//				System.out.println("나왓22"+list2.get(0).get(i).get("SENDERUNAME"));
//				System.out.println("나왓222"+list2.get(0).get(i).get("TOUNAME"));
//				
//				System.out.println("나왓j"+list2.get(0).get(j));
//				System.out.println("나왓33"+list2.get(0).get(j).get("SENDERUNAME"));
//				System.out.println("나왓333"+list2.get(0).get(j).get("TOUNAME"));
//
//				if(list2.get(0).get(i).get("TOUNAME").equals(list2.get(0).get(j).get("SENDERUNAME"))) {
//					if(Integer.parseInt(list2.get(0).get(i).get("SENDDATE"))>list2.get(0).get(j).get("SENDDATE"))
//					list2.get(0).remove(j);
//				}
//			}
//		}
//			for (int n = 0; n < list2.size(); n++) {
//				System.out.println("list22222얌 "+list2.get(n));
//				
//			}
		System.out.println("list4444"+list4);
		m.addAttribute("list4", list4);
		}else {
		m.addAttribute("clear", "clear");
		}
		
		return "portfolio/chatListAll";
	}
	
	
	
}
