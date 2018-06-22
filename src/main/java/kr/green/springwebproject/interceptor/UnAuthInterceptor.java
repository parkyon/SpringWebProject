package kr.green.springwebproject.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class UnAuthInterceptor 
	extends HandlerInterceptorAdapter{
	@Override
	public boolean preHandle(HttpServletRequest request, 
			HttpServletResponse response, Object handler)
			throws Exception {
		/* 세션에 있는 user 정보를 확인 */
		HttpSession session = request.getSession();
		Object user = session.getAttribute("user");
		/* user 정보가 있으면 접근하지 못하도록 
		 *  /board/list로 보냄 */
		if(user != null) {
			response.sendRedirect("/board/list");
			return false;
		}
		/* 없으면 그냥 냅두면됨 */
		return true;
	}
}
