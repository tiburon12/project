package com.project.members.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.project.controller.Controller;
import com.project.dao.PickDAO;
import com.project.vo.Pick;

public class PickListController implements Controller {
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String mid = null;
		List<Pick> list = null;
		request.getSession().setAttribute("returnURL", "pickList.do");
		if (request.getSession().getAttribute("mid") == null) {
			// �α��� ���� �ƴ� ->�α��� �������� �̵�
			return "redirect:/ProjectMVC2/login.do";
		} else {
			mid = (String) request.getSession().getAttribute("mid");
		}
		PickDAO dao = new PickDAO();
		list = dao.getPickList(mid);
		request.setAttribute("list", list);
		return "/WEB-INF/views/members/pickList.jsp";
	}

}
