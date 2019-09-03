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

import com.porget.domain.UserVO;
;



public class ReplyEchoHandler extends TextWebSocketHandler {
	
	List<WebSocketSession> sessions = new ArrayList<>();
	Map<String, WebSocketSession> userSessions = new HashMap<>();
	
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception { //connection이 연결됐을 때
		sessions.add(session);
		String senderId = getId(session);
		System.out.println("★★★[보내기아이디:"+senderId+"]afterConnectionEstablished"+session );
		
		userSessions.put(senderId, session);
	}
	
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception { //메세지 보냈을 때
		System.out.println("handleTextMessage: "+session + " : " + message );
		String senderid = getId(session);
		/*for(WebSocketSession sess: sessions) {
			sess.sendMessage(new TextMessage(senderid+ ": "+message.getPayload()));
			
		}*/
		
		String msg = message.getPayload();
		System.out.println("msg?>>>"+msg);
				String[] strs = msg.split(",");
			for(WebSocketSession sess: sessions) { 
				sess.sendMessage(new TextMessage(senderid + "님이 댓글을 작성하셨습니다"));
								
			}
			System.out.println("strs.length>>>"+ strs.length);
			if(strs != null && strs.length==5) {
				String cmd = strs[0];
				String replyWriter = strs[1];
				String boardWriter = strs[2];
				String pfnum = strs[3];
				System.out.println("너는 세션 어디에.."+userSessions);
				System.out.println("lime키="+userSessions.get("lime"));
				System.out.println("id키="+userSessions.get("id"));
				System.out.println("uri키="+userSessions.get("uri"));
				WebSocketSession boardWriterSession = userSessions.get(boardWriter);
				System.out.println("reply equals>>>"+ cmd + ", boardWriterSession>>>"+ boardWriterSession);;
				if("reply".equals(cmd)&&boardWriterSession!=null) {
					TextMessage txm =new TextMessage( replyWriter+"님이"+pfnum+"게시글에 댓글을 달았습니다");
					boardWriterSession.sendMessage(txm);
				
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
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception { //close됐을 때
		System.out.println("afterConnectionClosed: "+session + " : " + status );
	}

}
