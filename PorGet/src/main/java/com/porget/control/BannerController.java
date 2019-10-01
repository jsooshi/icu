package com.porget.control;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.porget.service.BannerService;

@Controller
@RequestMapping("/banner")
public class BannerController {
	
	@Autowired
	BannerService service;
	
	@RequestMapping("/selectBanner")
	public @ResponseBody Map selectBanner() {
		Map<String,Object> map = service.selectBannerPortfolio();
		return map;
	}
	
	@RequestMapping("/insertBanner")
	public @ResponseBody boolean insertBanner(int pfnum) {
		return service.insertBanner(pfnum);
	}
}
