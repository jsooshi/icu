package com.porget.control;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartRequest;

import com.porget.domain.Criteria;
import com.porget.domain.PageDTO;
import com.porget.domain.ReportVO;
import com.porget.service.ReportService;

@Controller
@RequestMapping("test")
public class testController {
	
	@Inject
	private ReportService service;
	
	@RequestMapping(value = "input", method = RequestMethod.GET)
	public String input() {
		return "test/inputFile";
	}
	@RequestMapping(value = "input", method = RequestMethod.POST)
	public String input2(MultipartFile[] uploadFile, HttpServletRequest request) {
		System.out.println("하이");
//		MultipartRequest mr;
		System.out.println("update ajax post.....");
		String uploadFolder = request.getSession().getServletContext().getRealPath("/resources/files");
		System.out.println(uploadFolder);
		System.out.println(request.getSession().getServletContext().getContextPath());
		System.out.println(request.getServletContext().getRealPath("/"));
		System.out.println(request.getServletContext().getRealPath("/").substring(1,request.getServletContext().getRealPath("/").indexOf(".metadata"))+"Test/WebContent");
		for(MultipartFile multipartFile : uploadFile) {
			System.out.println("------------");
			System.out.println("upload file name : " + multipartFile.getOriginalFilename());
			System.out.println("upload file size : " + multipartFile.getSize());
			
			String uploadFileName = multipartFile.getOriginalFilename();
			
			uploadFileName = uploadFileName.substring(uploadFileName.lastIndexOf("\\")+1);
			
			UUID uuid=UUID.randomUUID();
			uploadFileName=uuid.toString()+"_"+uploadFileName;
			
			System.out.println("only file name : "+ uploadFileName);
			File saveFile = new File(uploadFolder,uploadFileName);
			try {
				multipartFile.transferTo(saveFile);
				System.out.println("성공");
			} catch (IllegalStateException | IOException e) {
				System.out.println("icy...");
				e.printStackTrace();
			}
		}
		
		return "redirect:/test/input";
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
	
	@RequestMapping("/reportChatting")
	public String reportChatting() {
		return "admin/report/reportChatting";
	}
	
}
