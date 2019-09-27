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

	public UserVO selectMyPage(String uname) {
		return sqlSession.selectOne("userList.selectMyPage",uname);
	}
	
/* 시큐리티 */
	
	@Override
	public UserVO read(String uemail) {
		return sqlSession.selectOne("userList.read",uemail);
	}
	
	@Override
	public void insertAuth(String uname) {
		sqlSession.insert("userList.insertAuth",uname);
	}
	
	@Override
	public void insertAuth2(String uname) {
		sqlSession.insert("userList.insertAuth2",uname);
	}

/* reply 알람 */
		
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
