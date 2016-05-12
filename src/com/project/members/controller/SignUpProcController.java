package com.project.members.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.project.controller.Controller;
import com.project.dao.MemberDAO;
import com.project.vo.Member;

public class SignUpProcController implements Controller {
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String mid = request.getParameter("mid");
		String pwd = request.getParameter("pwd");
		String pwd2 = request.getParameter("pwd2");
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String phone = request.getParameter("phone");

		MemberDAO dao = new MemberDAO();
		Member m = dao.getMember(mid);
		if (m != null) {
			return "redirect:/ProjectMVC2/editInfo.do?error=id";
		} else {
			Member newm = new Member();
			newm.setMid(mid);
			newm.setPwd(pwd);
			newm.setName(name);
			newm.setEmail(email);
			newm.setPhone(phone);

			int af = dao.addMember(newm);

			if (af > 0) {
				return "redirect:/ProjectMVC2/index.do";
			} else {
				System.out.println("회원가입중 오류발생");
				return null;
			}

		}
	}
}
