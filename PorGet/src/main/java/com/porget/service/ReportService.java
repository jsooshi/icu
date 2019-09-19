package com.porget.service;

import java.util.List;

import com.porget.domain.ReportVO;

public interface ReportService {
	
	public int insert(ReportVO rvo);
	public ReportVO get(int reportNum);

}
