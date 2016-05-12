package com.project.border.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.project.controller.Controller;
import com.project.dao.BuyBorderDAO;
import com.project.dao.FreeBorderDAO;
import com.project.dao.SellBorderDAO;
import com.project.vo.Border;
import com.project.vo.FreeBorder;

public class IndexController implements Controller {
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String mid = (String) request.getSession().getAttribute("mid");
		BuyBorderDAO bdao = new BuyBorderDAO();
		SellBorderDAO sdao = new SellBorderDAO();
		FreeBorderDAO fdao = new FreeBorderDAO();
		List<Border> blist = bdao.getBuyBorderList(1);
		List<Border> slist = sdao.getSellBorderList(1);
		List<Border> slist2 = sdao.getNewList();
		List<FreeBorder> flist = fdao.getFreeBorderList(1);
		// request.getSession().setAttribute("returnURL", "index.jsp");

		request.setAttribute("blist", blist);
		request.setAttribute("slist", slist);
		request.setAttribute("slist2", slist2);
		request.setAttribute("flist", flist);

		return "/WEB-INF/views/border/index.jsp";
	}

}
