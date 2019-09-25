package com.porget.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.porget.domain.ChatVO;
import com.porget.domain.Criteria;
import com.porget.domain.ReportVO;
import com.porget.persistence.ReportDAO;

@Service
public class ReportServiceImpl implements ReportService{

	@Inject
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

	@Override
	public List<ChatVO> selectChatContext(String reporter, String defendant) {
		Map<String,String> map = new HashMap<>();
		
		map.put("reporter", reporter);
		map.put("defendant", defendant);
		return dao.selectChatContext(map);
	}
	

	@Override
	public boolean removePortpolio(int pfnum) {
		if(dao.delete(pfnum)==1) return true;
		return false;
	}

	@Override
	public boolean removeUser(String uname) {
		if(dao.deleteUser(uname)==1) return true;
		return false;
	}
}
