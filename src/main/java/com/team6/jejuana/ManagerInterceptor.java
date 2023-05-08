package com.team6.jejuana;
import org.springframework.lang.Nullable;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
/*
 * interceptor 처리할 클래스
 * 반드시 HandlerInterceptorAdapter클래스를 상속받아서 만들어야 함
 * */
public class ManagerInterceptor extends HandlerInterceptorAdapter {
    //컨트롤러가 호출되기 전에 실행된다.
    @Override
    public boolean preHandle(HttpServletRequest req, HttpServletResponse res, Object handler) throws Exception{
        //관리자 유무를 확인하고 관리자인 경우 호출한 매핑주소로 이동하고,
        //관리자가 아닌 경우 메인페이지 폼으로 실행이 이동된다.
        HttpSession session = req.getSession();
        int member_type = (int)session.getAttribute("member_type");
        if(member_type!=1){ //관리자가 아닌 경우 -> 메인페이지로 보낸다.
            res.sendRedirect(req.getContextPath()+"/");
            return false;
        }
        //반환형이 false이면 매핑을 변경하고
        //반환형이 true면 매핑을 지속한다.
        return true;
    }
    //컨트롤러가 실행후 View로 이동하기 전에 실행되는 메소드
    @Override
    public void postHandle(HttpServletRequest req, HttpServletResponse res, Object handler, @Nullable ModelAndView mav ) throws Exception {
    }
    // 컨트롤러가 실행 후 호출되는 메소드
    @Override
    public void afterCompletion(HttpServletRequest req, HttpServletResponse res, Object handler, @Nullable Exception ex) throws Exception{
    }
}