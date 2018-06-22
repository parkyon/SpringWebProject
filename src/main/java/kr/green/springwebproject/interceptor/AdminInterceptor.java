package kr.green.springwebproject.interceptor;



import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import kr.green.springwebproject.dao.User;

public class AdminInterceptor extends HandlerInterceptorAdapter {
	@Override
	public boolean preHandle(HttpServletRequest request, 
			HttpServletResponse response, Object handler)
			throws Exception {
		HttpSession session = request.getSession();
		User user = (User)session.getAttribute("user");
		/*	user.getAdmin() : 문자열
		 * 	비교할 대상 : 문자열(ADMIN)
		 */
		if(user == null || user.getAdmin().compareTo("ADMIN") != 0 && user.getAdmin().compareTo("SUPERADMIN") != 0) {
			///if(user == null || user.getAdmin().compareTo("USER") == 0) 이런방식으로도 됨 유저 값이 널이 아니고 유저가 유저이면 밑에있는 response를 실행해준다.
			response.sendRedirect("/");
			return false;
		}
		return true;
	}
}
