package com.porget.control;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

@Controller
@RequestMapping("/uploadImage")
public class UploadTest {
	
	@RequestMapping(value= {"","/"})
	public String uploadImage() {
		return "member/uploadImage";
	}
	
	@RequestMapping("/uploadImageAction")
	public @ResponseBody String uploadImageAction(MultipartFile uploadFile, HttpServletRequest request) {
		
		System.out.println(uploadFile);
		
		String uploadFolder = request.getSession().getServletContext().getRealPath("/resources/files");
		String uploadFileName = uploadFile.getOriginalFilename();
		System.out.println(uploadFileName);
		File saveFile = new File(uploadFolder, uploadFileName);
		try {
			uploadFile.transferTo(saveFile);
		} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
		}
		
		return uploadFileName;
		
	}
}
