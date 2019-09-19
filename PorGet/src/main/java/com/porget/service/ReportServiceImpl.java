package com.porget.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.porget.domain.ReportVO;
import com.porget.persistence.ReportDAO;

@Service
public class ReportServiceImpl implements ReportService{
	
	@Autowired
	private ReportDAO dao;

	@Override
	public int insert(ReportVO rvo) {
		int reportNum = dao.selectReportNum();
		rvo.setReportNum(reportNum);
		dao.insert(rvo);
		return reportNum;
	}

	@Override
	public ReportVO get(int reportNum) {
		return null;
	}




}
