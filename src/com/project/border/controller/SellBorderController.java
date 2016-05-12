package com.project.border.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.project.controller.Controller;
import com.project.dao.SellBorderDAO;
import com.project.vo.Border;

public class SellBorderController implements Controller {
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int pages = 1;
		String _pages = request.getParameter("pages");

		if (_pages != null && !_pages.equals("")) {
			pages = Integer.parseInt(_pages);
		}

		List<Border> list = null;
		SellBorderDAO dao = new SellBorderDAO();
		list = dao.getSellBorderList(pages);

		int cnt = dao.getCount();
		int startPageNum = pages - (pages - 1) % 5;
		int endPageNum = cnt / 15 + (cnt % 15 == 0 ? 0 : 1);

		request.getSession().setAttribute("returnURL", "sellBorder.jsp?pages=" + pages);
		request.setAttribute("cnt", cnt);
		request.setAttribute("list", list);
		request.setAttribute("startPageNum", startPageNum);
		request.setAttribute("endPageNum", endPageNum);
		request.setAttribute("pages", pages);

		return "/WEB-INF/views/border/sellBorder.jsp";
	}

}
