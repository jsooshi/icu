package com.porget.handler;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

public class EchoHandler extends TextWebSocketHandler{
	 Map<String, WebSocketSession> sessions =  new HashMap<String, WebSocketSession>();
	 Logger logger = LoggerFactory.getLogger(EchoHandler.class);
	 List<WebSocketSession> connectedUsers;

	 
	    @Override
	    public void afterConnectionEstablished(WebSocketSession session) throws Exception {
	        sessions.put(session.getId(), session);
	         //0번째 중괄호에 session.getId()을 넣으라는뜻
	        logger.info("{} 연결됨", session.getId()); 
	        
	    }


}
