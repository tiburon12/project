package com.project.members.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.project.controller.Controller;
import com.project.dao.MemberDAO;
import com.project.vo.Member;

public class EditInfoController implements Controller {
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String mid = request.getParameter("mid");
		String error = (String) request.getAttribute("error");

		MemberDAO dao = new MemberDAO();
		Member m = dao.getMember(mid);

		request.setAttribute("m", m);
		request.setAttribute("error", error);
		return "/WEB-INF/views/members/editInfo.jsp";
	}

}
