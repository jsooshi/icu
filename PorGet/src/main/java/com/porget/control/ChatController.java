package com.porget.control;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

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
		String toUphoto = dao.selectUphoto(toUname);
		m.addAttribute("toUphoto",toUphoto);
		return "portfolio/chatView4";
	}
	
	@RequestMapping("chatList")
	public String chatList(String toUname, String uname, Model m, int base) {
		ChatVO vo = new ChatVO();
		System.out.println("uname>>>>>>"+uname);
		System.out.println("tooouname>>>>>>"+toUname);
		vo.setToUname(toUname);
		vo.setSenderUname(uname);
		int bound = dao.chatListCount(vo);
		List<List<Map<String, Object>>> list4 = new ArrayList<List<Map<String,Object>>>();
		list4.add(dao.chatList(vo, base, bound));
		m.addAttribute("list4", list4);
		String toUphoto = dao.selectUphoto(toUname);
		m.addAttribute("toUphoto",toUphoto);
		return "portfolio/chatList";
	}
	
	@RequestMapping("chatListClick")
	public String chatListClick(String toUname, String uname, Model m, int base) {
		ChatVO vo = new ChatVO();
		System.out.println("uname>>>>>>"+uname);
		System.out.println("tooouname>>>>>>"+toUname);
		vo.setToUname(toUname);
		vo.setSenderUname(uname);
		int bound = dao.chatListCount(vo);
		List<List<Map<String, Object>>> list4 = new ArrayList<List<Map<String,Object>>>();
		list4.add(dao.chatList(vo, base, bound));
		m.addAttribute("list4", list4);
		String toUphoto = dao.selectUphoto(toUname);
		m.addAttribute("toUphoto",toUphoto);
		return "portfolio/chatListClick";
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
	
	@RequestMapping("/deleteChat")
	public String deleteChat(String toUname, String uname, Model m, HttpServletResponse response) throws IOException {
		System.out.println("유네임"+uname);
		System.out.println("튜넴"+toUname);
		ChatVO vo = new ChatVO();
		vo.setSenderUname(uname);
		vo.setToUname(toUname);
		if(dao.deleteChat(vo)>0) {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			response.getWriter().print("<script>alert('삭제되었습니다.');</script>");
			out.flush();
			List<Map<String, Object>> list = dao.deleteChattoUname(uname);
				
			String ToUname = (String) list.get(0).get("CHATUSER");
			System.out.println("최근 나온이름"+ToUname);
			m.addAttribute("toUname", ToUname);
			String toUphoto = dao.selectUphoto(ToUname);
			m.addAttribute("toUphoto",toUphoto);
		}else {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			response.getWriter().print("<script>alert('삭제 실패하였습니다.');</script>");
			out.flush();
		}
		return "portfolio/chatView4";
	}
	
	
	
}
