package com.porget.control;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartRequest;

@Controller
@RequestMapping("test")
public class testController {
	
	@RequestMapping(value = "input", method = RequestMethod.GET)
	public String input() {
		return "test/inputFile";
	}
	@RequestMapping(value = "input", method = RequestMethod.POST)
	public String input2(MultipartFile[] uploadFile) {
		System.out.println("하이");
//		MultipartRequest mr;
		System.out.println("update ajax post.....");
		String uploadFolder = "/resources/files";
		for(MultipartFile multipartFile : uploadFile) {
			System.out.println("------------");
			System.out.println("upload file name : " + multipartFile.getOriginalFilename());
			System.out.println("upload file size : " + multipartFile.getSize());
			
			String uploadFileName = multipartFile.getOriginalFilename();
			
			uploadFileName = uploadFileName.substring(uploadFileName.lastIndexOf("\\")+1);
			System.out.println("only file name : "+ uploadFileName);
			File saveFile = new File(uploadFolder,uploadFileName);
			try {
				multipartFile.transferTo(saveFile);
			} catch (IllegalStateException | IOException e) {
				e.printStackTrace();
				System.out.println("icy...");
			}
		}
		
		return "redirect:test/inputFile";
	}
}
