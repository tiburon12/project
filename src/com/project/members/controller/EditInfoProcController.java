package com.project.members.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.project.controller.Controller;
import com.project.dao.MemberDAO;
import com.project.vo.Member;

public class EditInfoProcController implements Controller {
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String mid = (String) request.getSession().getAttribute("mid");
		String pwd = request.getParameter("pwd");
		String email = request.getParameter("email");
		String phone = request.getParameter("phone");

		MemberDAO dao = new MemberDAO();
		Member m = dao.getMember(mid);

		if (!m.getPwd().equals(pwd)) {
			return "redirect:/ProjectMVC2/editInfo.do?error=pwd";
		} else {
			Member newm = new Member();
			newm.setMid(mid);
			newm.setEmail(email);
			newm.setPhone(phone);
			int af = dao.updateMember(newm);

			if (af > 0) {
				return "redirect:/ProjectMVC2/myInfo.do";
			} else {
				System.out.println("회원수정 실패");
				return null;
			}
		}
	}
}
