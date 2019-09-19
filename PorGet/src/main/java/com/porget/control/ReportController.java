package com.porget.control;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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
		
		return "admin/report";
	}
	
	@PostMapping("/insert")
	public String postReport(ReportVO rvo, RedirectAttributes attrs) {
		System.out.println("ggg");
		
		System.out.println(rvo);
		
		int reportNum = service.insert(rvo);
		attrs.addFlashAttribute("result",reportNum);
		
		return "redirect:/admin/report";
	}


}
