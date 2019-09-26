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
	public List<Map<String, Object>> chatList(ChatVO vo, int base, int bound) {
		RowBounds bounds = new RowBounds(bound-10*base, 10);
		return sqlSession.selectList("chat.chatList", vo, bounds);
	}

	@Override
	public String selectUphoto(String uname) {
		return sqlSession.selectOne("chat.selectUphoto", uname);
	}

	@Override
	public List<Map<String, Object>> chatListAll(String uname) {
		return sqlSession.selectList("chat.chatListAll", uname);
	}

	@Override
	public int chatListCount(ChatVO vo) {
		return sqlSession.selectOne("chat.chatListCount", vo);
	}

	@Override
	public int deleteChat(ChatVO vo) {
		return sqlSession.delete("chat.deleteChat", vo);
	}

	@Override
	public List<Map<String, Object>> deleteChattoUname(String uname) {
		RowBounds bounds = new RowBounds(0, 1);
		return sqlSession.selectList("chat.chatListAll", uname, bounds);
	}



}
