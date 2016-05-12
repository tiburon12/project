package com.project.members.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.project.controller.Controller;
import com.project.dao.PickDAO;

public class DelPickProcController implements Controller {
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String p_num = request.getParameter("p_num");
		PickDAO dao = new PickDAO();
		int af = dao.delPickP_num(p_num);

		if (af > 0) {
			return "redirect:/ProjectMVC2/pickList.do";
		} else {
			System.out.println("픽 제거중 오류 발생");
			return null;
		}
	}

}
