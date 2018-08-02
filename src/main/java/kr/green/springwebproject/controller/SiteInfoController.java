package kr.green.springwebproject.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value="/siteInfo/*")
public class SiteInfoController {

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String sitemain(Model model, HttpServletRequest request) {
				
		return "siteInfo";
	}
	
	
	@RequestMapping(value = "siteInfo", method = RequestMethod.GET)
	public String siteInfoGet(Model model, HttpServletRequest request) {
				
		return "siteInfo/siteInfo";
	}
	
			
	@RequestMapping(value = "siteInfo1", method = RequestMethod.GET)
	public String siteInfoGet1(Model model, HttpServletRequest request) {
				
		return "siteInfo/siteInfo1";
	}		
	
	
	@RequestMapping(value = "recBookInfo", method = RequestMethod.GET)
	public String recBookInfo(Model model, HttpServletRequest request) {
				
		return "siteInfo/recBookInfo";
	}
	@RequestMapping(value = "monthsRecBook", method = RequestMethod.GET)
	public String monthsRecBook(Model model, HttpServletRequest request) {
				
		return "siteInfo/monthsRecBook";
	}
	@RequestMapping(value = "makepeople", method = RequestMethod.GET)
	public String Makepeople(Model model, HttpServletRequest request) {
				
		return "siteInfo/makepeople";
	}
	@RequestMapping(value = "libraryInfo", method = RequestMethod.GET)
	public String libraryInfo(Model model, HttpServletRequest request) {
				
		return "siteInfo/libraryInfo";
	}
	@RequestMapping(value = "event", method = RequestMethod.GET)
	public String event(Model model, HttpServletRequest request) {
				
		return "siteInfo/event";
	}
	@RequestMapping(value = "copyRight", method = RequestMethod.GET)
	public String copyRight(Model model, HttpServletRequest request) {
				
		return "siteInfo/copyRight";
	}
	@RequestMapping(value = "boardInfo", method = RequestMethod.GET)
	public String boardInfo(Model model, HttpServletRequest request) {
				
		return "siteInfo/boardInfo";
	}
	
	
	@RequestMapping(value = "/notloginSiteHome", method = RequestMethod.GET)
	public String notloginSiteHome(Model model, HttpServletRequest request) {
				
		return "siteInfo/notloginSiteHome";
	}
}
