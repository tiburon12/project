package com.project.members.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.project.controller.Controller;

public class LogoutProcController implements Controller {
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.getSession().invalidate();

		// response.sendRedirect("index.jsp");

		return "redirect:/ProjectMVC2/index.do";
	}

}
