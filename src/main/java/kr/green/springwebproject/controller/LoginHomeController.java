package kr.green.springwebproject.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.green.springwebproject.dao.User;
import kr.green.springwebproject.service.UserService;

@Controller

public class LoginHomeController {

	@Autowired
	private UserService userService;
	
	
	@RequestMapping(value = "/loginhome", method = RequestMethod.GET)
	public String loginHomeGet(Model model, HttpServletRequest request) {
				
		HttpSession session = request.getSession();
		User user = (User)session.getAttribute("user");
		
		boolean admin = userService.isAdmin(user);
		model.addAttribute("admin", admin);
		
		return "loginhome";
	}
	
	
	
}
