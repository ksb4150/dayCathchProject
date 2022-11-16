package com.springboot.common.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class ViewNameInterceptor extends HandlerInterceptorAdapter {
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object Handler) throws Exception {
		String viewName = getViewName(request);
		
		if(viewName != null) {
			request.setAttribute("viewName", viewName);
		}
		return true;
	}
	
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object Handler, ModelAndView modelAndView) throws Exception {
		
	}
	
	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object Handler, Exception ex) throws Exception {
		
	}
	
	private String getViewName(HttpServletRequest request) throws Exception {
		String contextPath = request.getContextPath();
		String uri = (String)request.getAttribute("javax.servlet.include.request_uri");
			System.out.println(uri);
		
		if(uri == null || uri.trim().equals("")) {
			uri = request.getRequestURI();
			System.out.println(uri);
		}
		
		int begin = 0;
		if(!((contextPath==null) || ("".equals(contextPath)))) {
			begin = contextPath.length(); //������Ʈ
			System.out.println(contextPath);
		}
		System.out.println("begin : "+ begin);
		
		int end = 0;
		if(uri.indexOf(";") != -1) { //��û uri�� ;�� ���� ���
			end = uri.indexOf(";"); 
			System.out.println("end : "+ end);
		} else if(uri.indexOf("?") != -1) { //�䫊 uri�� ?�� ���� ��� -> �Ķ���͸� ���� ���ΰ�?
			end = uri.indexOf("?");
			System.out.println("end : "+ end);
		} else {
			end = uri.length();
			System.out.println("end : "+ end);
		}
		
		
		String viewName = uri.substring(begin, end);
			System.out.println("viewName : " + viewName );
			
		if(viewName.indexOf(".") != -1) {
			viewName = viewName.substring(0, viewName.lastIndexOf("."));
			// ���� ������ .�� ��ġ�� ���� ��, .�� ���ڿ��� ����
		}
		
		if(viewName.lastIndexOf("/") != -1) {
			System.out.println(viewName.lastIndexOf("/",1));
			viewName = viewName.substring(viewName.lastIndexOf("/",1), viewName.length());
			// ���� ������ /�� ��ġ�� ���� ��, / ���������� ���ڿ��� ����
		}
		
		return viewName; //����� ���� �̸��� ��ȯ
	}
}
