package com.project.members.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.project.controller.Controller;

public class SignUpController implements Controller {
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String error = request.getParameter("error");
		if (error != null && error.equals("")) {
			error = "���̵� �ߺ�Ȯ���� ���ּ���.";
		}

		request.setAttribute("error", error);
		return "/WEB-INF/views/members/signUp.jsp";
	}
}
