package com.porget.handler;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import java.util.concurrent.ConcurrentHashMap;

import javax.inject.Inject;

import org.springframework.web.socket.CloseStatus;

import org.springframework.web.socket.TextMessage;

import org.springframework.web.socket.WebSocketSession;

import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.google.gson.Gson;
import com.porget.domain.ChatVO;
import com.porget.persistence.ChatDAO;

public class ChatWebSocketHandler extends TextWebSocketHandler {

	@Inject
	private ChatDAO dao;

	private List<WebSocketSession> connectedUsers;
	Map<String, WebSocketSession> userSessions = new HashMap<>(); //접속된 애들
	

	public ChatWebSocketHandler() {
		connectedUsers = new ArrayList<WebSocketSession>();
	}

	private Map<String, WebSocketSession> users = new ConcurrentHashMap<String, WebSocketSession>();

	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		System.out.println("afterConnectionEstablished:" + session);
		log(session.getId() + " 연결 됨!!");
		
		String senderId = getId(session);
		users.put(senderId, session);
		connectedUsers.add(session);
	}

	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {

		log(session.getId() + " 연결 종료됨");
		connectedUsers.remove(session);
		String senderId = getId(session);
		users.remove(senderId);

	}

	private String getId(WebSocketSession session) {
		Map<String, Object> httpSession = session.getAttributes();
		String loginUser = (String)httpSession.get("uname");	
		if(null==loginUser)
			return session.getId();
		else 
			return loginUser;
	}
	
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {

		System.out.println(message.getPayload());// 사용자가 보낸 메세지

		Map<String, Object> map = null;

		ChatVO chatVO = ChatVO.convertMessage(message.getPayload());
		System.out.println(chatVO.getChatContext());
		System.out.println(chatVO.getToUname());
		System.out.println(chatVO.getSenderUname());

		if (dao.insertChat(chatVO) == 1) {
			System.out.println("추가성공");
		} else {
			System.out.println("추가실패");
		}

		System.out.println("1 : " + chatVO.toString());

		/*
		 * ChatRoomVO roomVO = new ChatRoomVO();
		 * roomVO.setCLASS_class_id(chatVO.getCLASS_class_id()); //클래스
		 * roomVO.setTUTOR_USER_user_id(chatVO.getTUTOR_USER_user_id()); //튜터
		 * roomVO.setUSER_user_id(chatVO.getUSER_user_id()); //유저
		 * 
		 * ChatRoomVO croom =null;
		 * if(!chatVO.getUSER_user_id().equals(chatVO.getTUTOR_USER_user_id())) {
		 * System.out.println("a");
		 * 
		 * 
		 * 
		 * if(dao.isRoom(roomVO) == null ) { System.out.println("b");
		 * dao.createRoom(roomVO); System.out.println("d"); croom = dao.isRoom(roomVO);
		 * 
		 * }else { System.out.println("C"); croom = dao.isRoom(roomVO); } }else {
		 * 
		 * croom = dao.isRoom(roomVO); }
		 * 
		 * chatVO.setCHATROOM_chatroom_id(croom.getChatroom_id());
		 * if(croom.getUSER_user_id().equals(chatVO.getMessage_sender())) {
		 * 
		 * chatVO.setMessage_receiver(roomVO.getTUTOR_USER_user_id()); }else {
		 * chatVO.setMessage_receiver(roomVO.getUSER_user_id()); }
		 */
		
		/*
		 * Gson gson = new Gson(); String msgJson = gson.toJson(chatVO);
		 * users.get(chatVO.getToUname()).sendMessage(new TextMessage(msgJson));
		 */
		Gson gson = new Gson(); 
		String msgJson = gson.toJson(chatVO);
		WebSocketSession web = users.get(chatVO.getToUname());
		users.get(chatVO.getSenderUname()).sendMessage(new TextMessage(msgJson));
		if(web!=null) {
			web.sendMessage(new TextMessage(msgJson));
		}

		  
//		
//		  for (WebSocketSession websocketSession : connectedUsers) { map =
//		  websocketSession.getAttributes();
//		  
//			/* UserVO login = (UserVO) map.get("login"); */
//		  
//		  //받는사람 if (login.getUser_id().equals(messageVO.getMessage_sender())) {
//		  
//		  Gson gson = new Gson(); String msgJson = gson.toJson(chatVO);
//		  websocketSession.sendMessage(new TextMessage(msgJson)); // }
//		 
		  
		  }
		

	@Override
	public void handleTransportError(

			WebSocketSession session, Throwable exception) throws Exception {

		log(session.getId() + " 익셉션 발생: " + exception.getMessage());

	}

	private void log(String logmsg) {

		System.out.println(new Date() + " : " + logmsg);

	}

}
