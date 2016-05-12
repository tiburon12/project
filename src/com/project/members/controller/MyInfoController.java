package com.project.members.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.project.controller.Controller;
import com.project.dao.MemberDAO;
import com.project.vo.Member;

public class MyInfoController implements Controller {
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String mid = (String) request.getSession().getAttribute("mid");

		MemberDAO dao = new MemberDAO();
		Member m = dao.getMember(mid);

		request.setAttribute("m", m);
		return "/WEB-INF/views/members/myInfo.jsp";
	}

}
