package kr.green.springwebproject.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller

public class LoginHomeController {

	
	@RequestMapping(value = "/loginhome", method = RequestMethod.GET)
	public String loginHomeGet(Model model, HttpServletRequest request) {
				
		return "loginhome";
	}
	
	
	
}
