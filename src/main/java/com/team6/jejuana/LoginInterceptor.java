package com.team6.jejuana;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.lang.Nullable;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class LoginInterceptor extends HandlerInterceptorAdapter {
	//컨트롤러가 호출되기 전 실행
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		//로그인 유무 확인, 로그인된 경우 호출한 매핑주소로 이동	
		//로그인 안 된 경우 로그인 폼으로 이동
		HttpSession session = request.getSession();
		
		String logId = (String)session.getAttribute("logId");
		String logStatus = (String)session.getAttribute("logStatus");
	
		if(logStatus==null || !logStatus.equals("Y")) {
			response.sendRedirect(request.getContextPath()+"/loginForm");
			return false;
		}
		
		//반환형이 false면 매핑 변경 true면 매핑 지속
		return true;
	}
}
