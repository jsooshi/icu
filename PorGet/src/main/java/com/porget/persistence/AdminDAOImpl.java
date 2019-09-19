package com.porget.persistence;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.porget.domain.Criteria;
import com.porget.domain.UserVO;

@Repository
public class AdminDAOImpl implements AdminDAO {

	
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List<UserVO> selectAll(Criteria cri) {
		return sqlSession.selectList("admin.selectAll",cri);
	}
	
	@Override
	public int getTotal(Criteria cri) {
		return sqlSession.selectOne("admin.getTotal",cri);
	}
	

	
	@Override
	public UserVO select(String uemail) {
		return sqlSession.selectOne("admin.select", uemail);
	}

	@Override
	public void delete(String uname) {
		sqlSession.delete("admin.delete", uname);
		
	}

	
	@Override
	public void update(UserVO vo) {
		sqlSession.update("admin.update", vo);
		
	}
	@Override
	public List<UserVO> listAll(int base) {
		RowBounds bounds = new RowBounds((base-1)*10, 10);
		return sqlSession.selectList("admin.listAll", null, bounds);
	}
	
	

}
