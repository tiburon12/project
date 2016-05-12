package com.project.members.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.project.controller.Controller;
import com.project.dao.SellBorderDAO;
import com.project.vo.Border;

public class MyNoticeController implements Controller {
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String mid = null;
		List<Border> list = null;
		request.getSession().setAttribute("returnURL", "pickList.do");
		if (request.getSession().getAttribute("mid") == null) {
			// 로그인 상태 아님 ->로그인 페이지로 이동
			return "redirect:/ProjectMVC2/login.do";
		} else {
			mid = (String) request.getSession().getAttribute("mid");
		}
		SellBorderDAO dao = new SellBorderDAO();
		list = dao.getSellBorderWriter(mid);
		request.setAttribute("list", list);
		return "/WEB-INF/views/members/myNotice.jsp";
	}

}
