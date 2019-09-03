package com.porget.control;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.porget.domain.ChatVO;
import com.porget.persistence.ChatDAO;

@Controller
public class ChatController {

	@Autowired
	private ChatDAO dao;
	
	@RequestMapping("/chatting")
	public String chatStart() {
		return "test/chat";
	}
	
	@RequestMapping("/sendMessage")
	public @ResponseBody String sendMessage(Model m, String fromID, String toID, String chatContent) {
		if(fromID==null||fromID.equals("")||toID==null||toID.equals("")||chatContent==null||chatContent.equals("")) {
			return "0";
		}else {
			ChatVO vo = new ChatVO();
			vo.setFromID(fromID);
			vo.setToID(toID);
			vo.setChatContent(chatContent);
			dao.send(vo);
			return "1";
		}
	}
	
	@RequestMapping("/getListChat")
	public @ResponseBody String getListChat(Model m, String fromID, String toID, String listType) {
		if(fromID==null||fromID.equals("")||toID==null||toID.equals("")||listType==null||listType.equals("")) {
			return "";
		}else if(listType.equals("ten")){
			
			StringBuffer result = new StringBuffer("");
			result.append("{\"result\":[");
			ChatVO vo = new ChatVO();
			vo.setFromID(fromID);
			vo.setToID(toID);
			List<ChatVO> chatList = dao.chatListRecent(vo, 10);
			
			if(chatList.size()==0) return "";
			for (int i = 0; i < chatList.size(); i++) {
				result.append("[{\"value\": \""+ chatList.get(i).getFromID()+"\"},");
				result.append("{\"value\": \""+ chatList.get(i).getToID()+"\"},");
				result.append("{\"value\": \""+ chatList.get(i).getChatContent()+"\"},");
				result.append("{\"value\": \""+ chatList.get(i).getChatTime()+"\"}]");
				if(i != chatList.size()-1) result.append(",");
			}
			result.append("], \"last\":\""+chatList.get(chatList.size()-1).getChatID()+"\"}");
			
			
			return result.toString();
		}
		return "";
//		else {
//			StringBuffer result = new StringBuffer("");
//			result.append("{\"result\":[");
//			ChatVO vo = new ChatVO();
//			vo.setFromID(fromID);
//			vo.setToID(toID);
//			//vo.setChatID(chatID);
//			List<ChatVO> chatList = dao.getChatList(vo);
//			
//			if(chatList.size()==0) return "";
//			for (int i = 0; i < chatList.size(); i++) {
//				result.append("[{\"value\": \""+ chatList.get(i).getFromID()+"\"},");
//				result.append("{\"value\": \""+ chatList.get(i).getToID()+"\"},");
//				result.append("{\"value\": \""+ chatList.get(i).getChatContent()+"\"},");
//				result.append("{\"value\": \""+ chatList.get(i).getChatTime()+"\"}]");
//				if(i != chatList.size()-1) result.append(",");
//			}
//			result.append("], \"last\":\""+chatList.get(chatList.size()-1).getChatID()+"\"}");
//			
//			return result.toString();
//		}
	}
	
//	@RequestMapping("/getTen")
//	public String getTen(String fromID, String toID) {
//		StringBuffer result = new StringBuffer("");
//		result.append("{\"result\":[");
//		ChatVO vo = new ChatVO();
//		vo.setFromID(fromID);
//		vo.setToID(toID);
//		List<ChatVO> chatList = dao.chatListRecent(vo, 10);
//		
//		if(chatList.size()==0) return "";
//		for (int i = 0; i < chatList.size(); i++) {
//			result.append("[{\"value\": \""+ chatList.get(i).getFromID()+"\"},");
//			result.append("[{\"value\": \""+ chatList.get(i).getToID()+"\"},");
//			result.append("[{\"value\": \""+ chatList.get(i).getChatContent()+"\"},");
//			result.append("[{\"value\": \""+ chatList.get(i).getChatTime()+"\"}");
//			if(i != chatList.size()-1) result.append(",");
//		}
//		result.append("], \"last\":\""+chatList.get(chatList.size()-1).getChatID()+"\"}");
//		result.toString();
//	}
//
//	@RequestMapping("/getID")
//	public String getID(String fromID, String toID, int chatID) {
//		StringBuffer result = new StringBuffer("");
//		result.append("{\"result\":[");
//		ChatVO vo = new ChatVO();
//		vo.setFromID(fromID);
//		vo.setToID(toID);
//		vo.setChatID(chatID);
//		List<ChatVO> chatList = dao.getChatList(vo);
//		
//		if(chatList.size()==0) return "";
//		for (int i = 0; i < chatList.size(); i++) {
//			result.append("[{\"value\": \""+ chatList.get(i).getFromID()+"\"},");
//			result.append("[{\"value\": \""+ chatList.get(i).getToID()+"\"},");
//			result.append("[{\"value\": \""+ chatList.get(i).getChatContent()+"\"},");
//			result.append("[{\"value\": \""+ chatList.get(i).getChatTime()+"\"}");
//			if(i != chatList.size()-1) result.append(",");
//		}
//		result.append("], \"last\":\""+chatList.get(chatList.size()-1).getChatID()+"\"}");
//		result.toString();
//	}

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
