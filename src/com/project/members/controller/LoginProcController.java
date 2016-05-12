package com.project.members.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.project.controller.Controller;
import com.project.dao.MemberDAO;
import com.project.vo.Member;

public class LoginProcController implements Controller {
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String mid = request.getParameter("mid");
		String pwd = request.getParameter("pwd");

		// db�ڵ�

		MemberDAO dao = new MemberDAO();
		Member m = dao.getMember(mid);

		if (m == null) {
			// String error = "ID is not exist.";
			// response.sendRedirect("index.jsp?error=" + error);

			// request.setAttribute("error", "���̵� �������� �ʽ��ϴ�.");
			// request.getRequestDispatcher("login.jsp").forward(request,
			// response);
			return "redirect:/ProjectMVC2/login.do?error=id";

		} else if (!pwd.equals(m.getPwd())) {
			// String error = "incorrect PassWord.";
			// response.sendRedirect("index.jsp?error=" + error);

			// request.setAttribute("error", "��й�ȣ�� Ʋ�Ƚ��ϴ�.");
			// request.getRequestDispatcher("login.jsp").forward(request,
			// response);
			return "redirect:/ProjectMVC2/login.do?error=pwd";

		} else {
			request.getSession().setAttribute("mid", mid);

			String returnURL = (String) request.getSession().getAttribute("returnURL");
			if (returnURL != null && !returnURL.equals("")) { // �Խ��ǿ��� �� �����
				// String ctName= request.getContextPath();
				// response.sendRedirect(returnURL);
				return "redirect:" + returnURL;
			} else {
				// response.sendRedirect("index.do");
				return "redirect:/ProjectMVC2/index.do";
			}
		}

	}

}
