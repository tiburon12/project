package com.project.border.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.project.controller.Controller;
import com.project.dao.BuyBorderDAO;
import com.project.dao.CommentDAO;
import com.project.dao.SellBorderDAO;
import com.project.vo.Border;
import com.project.vo.Comment;

public class DetailController implements Controller {
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String mid = null;
		Border b = null;
		List<Comment> list = null;
		String error = (String) request.getAttribute("error");
		String pages = request.getParameter("pages");
		String border = request.getParameter("border");
		String seq = request.getParameter("seq");
		request.setAttribute("error", error);
		request.getSession().setAttribute("returnURL",
				"detail.do?border=" + border + "&seq=" + seq + "&pages=" + pages);
		int c_pages = 1;
		if (request.getSession().getAttribute("mid") == null) {
			// 로그인 상태 아님 ->로그인 페이지로 이동
			// response.sendRedirect("login.jsp");
			return "redirect:/ProjectMVC2/login.do";
		} else {
			mid = (String) request.getSession().getAttribute("mid");
			if (border.equals("buy")) {
				BuyBorderDAO dao = new BuyBorderDAO();
				b = dao.getBorder(seq);
				CommentDAO cdao = new CommentDAO();
				list = new ArrayList<Comment>();
				list = cdao.getCommentList(border, c_pages, seq);
			} else if (border.equals("sell")) {
				SellBorderDAO dao = new SellBorderDAO();
				b = dao.getBorder(seq);
				CommentDAO cdao = new CommentDAO();
				list = new ArrayList<Comment>();
				list = cdao.getCommentList(border, c_pages, seq);
			}

			request.setAttribute("mid", mid);
			request.setAttribute("pages", pages);
			request.setAttribute("border", border);
			request.setAttribute("seq", seq);
			request.setAttribute("b", b);
			request.setAttribute("list", list);

			return "/WEB-INF/views/border/detail.jsp";

		}
	}

}
