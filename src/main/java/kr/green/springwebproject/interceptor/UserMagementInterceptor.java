package kr.green.springwebproject.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import kr.green.springwebproject.dao.User;

public class UserMagementInterceptor extends HandlerInterceptorAdapter {
	@Override
	public boolean preHandle(HttpServletRequest request, 
			HttpServletResponse response, Object handler)
			throws Exception {
		HttpSession session = request.getSession();
		User user = (User)session.getAttribute("user");
		/*	user.getAdmin() : 문자열
		 * 	비교할 대상 : 문자열(ADMIN)
		 */
		if(user == null || user.getAdmin().compareTo("SUPERADMIN") != 0) {
			response.sendRedirect("/admin/board");
			return false;
		}
		return true;
	}
}
