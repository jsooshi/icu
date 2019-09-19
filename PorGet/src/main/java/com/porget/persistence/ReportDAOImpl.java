package com.porget.persistence;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.porget.domain.ReportVO;

@Repository
public class ReportDAOImpl implements ReportDAO{

	@Autowired
	private SqlSession Sqlsession;

	@Override
	public void insert(ReportVO rvo) {
		Sqlsession.insert("report.insert",rvo);
	}

	@Override
	public int selectReportNum() {
		return 0;
	}
	


}
