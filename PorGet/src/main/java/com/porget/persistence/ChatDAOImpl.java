package com.porget.persistence;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.porget.domain.ChatVO;
import com.porget.domain.PortfolioVO;

@Repository
public class ChatDAOImpl implements ChatDAO{

	@Inject
	private SqlSession sqlSession;

	@Override
	public int insertChat(ChatVO vo) {
		return sqlSession.insert("chat.insertChat", vo);
	}

	@Override
	public List<Map<String, Object>> chatList(ChatVO vo) {
		return sqlSession.selectList("chat.chatList", vo);
	}

	@Override
	public String selectUphoto(String uname) {
		return sqlSession.selectOne("chat.selectUphoto", uname);
	}

	@Override
	public List<Map<String, Object>> chatListAll(String uname) {
		return sqlSession.selectList("chat.chatListAll", uname);
	}



}
