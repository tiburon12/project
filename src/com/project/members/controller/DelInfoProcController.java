package com.project.members.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.project.controller.Controller;
import com.project.dao.BuyBorderDAO;
import com.project.dao.CommentDAO;
import com.project.dao.FreeBorderDAO;
import com.project.dao.MemberDAO;
import com.project.dao.PickDAO;
import com.project.dao.SellBorderDAO;
import com.project.vo.Member;

public class DelInfoProcController implements Controller {
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("sdfsdfsdf");
		String mid = (String) request.getSession().getAttribute("mid");
		String pwd = request.getParameter("pwd");

		MemberDAO dao = new MemberDAO();
		Member m = dao.getMember(mid);

		if (!m.getPwd().equals(pwd)) {
			return "redirect:/ProjectMVC2/delInfo.do?error=pwd";
		} else {
			CommentDAO cdao = new CommentDAO();
			PickDAO pdao = new PickDAO();
			SellBorderDAO sdao = new SellBorderDAO();
			BuyBorderDAO bdao = new BuyBorderDAO();
			FreeBorderDAO fdao = new FreeBorderDAO();
			cdao.delCommentWriter(mid);
			pdao.delPickMid(mid);
			sdao.delBorderMid(mid);
			bdao.delBorderMid(mid);
			fdao.delBorderMid(mid);

			int af = dao.deleteMember(m);

			if (af > 0) {
				return "redirect:/ProjectMVC2/logoutProc.do";
			}else{
				System.out.println("È¸¿øÅ»Åð ¿À·ù");
				return null;
			}
		}

	}

}
