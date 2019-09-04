package com.porget.handler;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.util.StringUtils;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

public class ReplyEchoHandler extends TextWebSocketHandler {
	
	List<WebSocketSession> sessions = new ArrayList<WebSocketSession>();
	Map<String, WebSocketSession> userSessions = new HashMap<>(); //접속된 애들
	
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		sessions.add(session);
		String senderId = getId(session);
		userSessions.put(senderId, session);
	}
	
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		String senderId = getId(session);
		String msg = message.getPayload(); //message 
		//출력글: cmd(reply), 댓글작성자, 게시글작성자, 게시글번호
		
		if(!StringUtils.isEmpty(msg) ) {
		String[] strs = msg.split(","); //메세지
		if(strs!=null && strs.length==4) {
			String cmd = strs[0];
			String replywriter = strs[1];
			String boardWriter = strs[2];
			String bno = strs[3];
			
			WebSocketSession boardWriterSession = userSessions.get(boardWriter);
			if("reply".equals(cmd) && boardWriterSession != null ) {
				TextMessage txtMsg = new TextMessage(replywriter + "님께서 " + 
							"<a href='/porget/portfolio/view?pfnum="+bno+ "'>" + bno + "</a>번 글에 댓글을 달았습니다.");
				boardWriterSession.sendMessage(txtMsg);
			}
			
		}
		
		}
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
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		
		super.afterConnectionClosed(session, status);
	}
}
