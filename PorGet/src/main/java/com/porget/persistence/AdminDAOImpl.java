package com.porget.persistence;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.porget.domain.Criteria;

@Repository
public class AdminDAOImpl implements AdminDAO {

	
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List<Map<String,Object>> selectAll(Criteria cri) {
		return sqlSession.selectList("admin.selectAll",cri);
	}
	
	@Override
	public int getTotal(Criteria cri) {
		return sqlSession.selectOne("admin.getTotal",cri);
	}

	@Override
	public int delete(String uname) {
		return sqlSession.delete("admin.delete", uname);
	}

}
