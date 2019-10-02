package com.porget.control;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.porget.domain.ChatVO;
import com.porget.domain.Criteria;
import com.porget.domain.PageDTO;
import com.porget.domain.ReportVO;
import com.porget.persistence.ReportDAO;
import com.porget.service.ReportService;

@Controller
@RequestMapping("report")
public class ReportController {
	
	@Autowired
	ReportService service;
	
	
	
	@GetMapping("/insert")
	public String get() {
		
		return "/reportList";
	}
	
	@PostMapping("/insert")
	public String postReport(ReportVO rvo, RedirectAttributes attrs) {
		System.out.println("ggg");
		
		System.out.println(rvo);
		
		int reportNum = service.insert(rvo);
		attrs.addFlashAttribute("result",reportNum);
		
		return "redirect:/portfolio";
	}
	
	
	@RequestMapping("/remove")
	public String portfolioDelete(int pfnum, RedirectAttributes attr) {// 게시글 삭제후 게시판으로 이동

		if(service.removePortpolio(pfnum)) {
			attr.addFlashAttribute("result","success");
		}
		return "redirect:/portfolio";
	}
	@RequestMapping(value="reportList")
	public String reportList(Model model,Criteria cri) {
		model.addAttribute("list", service.selectReportPage(cri));
		model.addAttribute("pageMaker",new PageDTO(cri, service.reportTotal(cri)));
		
		return "admin/report/reportList";
	}
	
	@RequestMapping("/selectReport")
	public @ResponseBody ReportVO selectReport(int reportNum) {
		System.out.println(reportNum);
		ReportVO vo = service.selectReport(reportNum);
		System.out.println(vo.getReportContext());
		System.out.println(vo);
		return vo;
	}
	
	@RequestMapping("/removeUser")
	public @ResponseBody String removeUser(String uname) {
		if(service.removeUser(uname)) return uname+"님이 삭제되었습니다.";
		else return "삭제에 실패했습니다.";
	}
	
	@RequestMapping("/reportChatting")
	public String reportChatting(String reporter,String defendant,Model model) {
		model.addAttribute("reporter", reporter);
		model.addAttribute("defendant", defendant);
		return "admin/report/reportChatting";
	}
	
	@RequestMapping("/selectChatContext")
	public @ResponseBody List<ChatVO> selectChatContext(String reporter, String defendant){
		return service.selectChatContext(reporter, defendant);
	}
	
	@RequestMapping("/updateResult")
	public @ResponseBody boolean updateResult(int reportNum) {
		return service.updateReport(reportNum);
	}

}
