package com.porget.persistence;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.porget.domain.ReplyVO;
import com.porget.domain.UserVO;

@Repository
public class UserDAOImpl implements UserDAO{
	
	@Autowired
	private SqlSession sqlSession;

	@Override
	public void insert(UserVO vo) {
		System.out.println("입력>"+vo);
		sqlSession.insert("userList.insert",vo);
		
	}

	@Override
	public Map login(UserVO vo) {
		return sqlSession.selectOne("userList.login",vo);
	}

	@Override
	public int idCheck(String uname) {
		System.out.println("sqlSession="+ sqlSession+", uname="+uname);
		return sqlSession.selectOne("userList.idCheck",uname);
	}

	@Override
	public int emailCheck(String uemail) {
		return sqlSession.selectOne("userList.emailCheck",uemail);
	}

/* 마이페이지 */

	public UserVO selectUser(String uname) {
		return sqlSession.selectOne("userList.selectUser",uname);
	}

	@Override
	public int countUnread(String uname) {
		
		return sqlSession.selectOne("reply.unread",uname);
	}

	@Override
	public List<ReplyVO> replyNotification(String uname) {
		
		return sqlSession.selectList("reply.notification", uname);
	}

	@Override
	public void checked(String uname) {
		
		sqlSession.update("reply.checked", uname);
	}
}
