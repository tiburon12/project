package com.project.members.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.project.controller.Controller;

public class LoginController implements Controller {
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String error = request.getParameter("error");
		if (error != null && !error.equals("")) {
			if (error.equals("id")) {
				error = "���̵� �������� �ʽ��ϴ�.";
			} else {
				error = "��й�ȣ�� Ʋ�Ƚ��ϴ�.";
			}
		}

		request.setAttribute("error", error);
		return "/WEB-INF/views/members/login.jsp";

	}

}
