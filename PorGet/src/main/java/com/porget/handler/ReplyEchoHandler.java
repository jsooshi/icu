package com.porget.handler;

import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;
;



public class ReplyEchoHandler extends TextWebSocketHandler {
	
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception { //connection이 연결됐을 때
		System.out.println("afterConnectionEstablished"+session );
	}
	
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception { //메세지 보냈을 때
	
	}
	
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception { //close됐을 때
		
	}

}
