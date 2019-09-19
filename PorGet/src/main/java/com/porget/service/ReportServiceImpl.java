package com.porget.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.porget.domain.Criteria;
import com.porget.domain.ReportVO;
import com.porget.persistence.ReportDAO;

@Service
public class ReportServiceImpl implements ReportService{

	@Inject
	private ReportDAO dao;
	
	@Override
	public List<ReportVO> selectReportPage(Criteria cri) {
		return dao.selectReportPage(cri);
	}

	@Override
	public ReportVO selectReport(int reportNum) {
		return dao.selectReport(reportNum);
	}

	@Override
	public boolean updateReport(ReportVO vo) {
		if(dao.updateReport(vo)==1) {
			return true;
		}
		return false;
	}

	@Override
	public int reportTotal(Criteria cri) {
		return dao.reportTotal(cri);
	}

}
