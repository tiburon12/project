package com.project.members.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.project.controller.Controller;
import com.project.dao.PickDAO;
import com.project.dao.SellBorderDAO;
import com.project.vo.Border;
import com.project.vo.Pick;

public class PickUpProcController implements Controller {
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String returnURL = (String) request.getSession().getAttribute("returnURL");
		String mid = (String) request.getSession().getAttribute("mid");
		String seq = request.getParameter("seq");
		PickDAO pdao = new PickDAO();
		List<Pick> plist = null;
		plist = pdao.getPickList(mid);
		System.out.println(plist.size());
		if (plist.size() > 0) {
			for (int i = 0; i < plist.size(); i++) {

				if (plist.get(i).getNotice_seq().equals(seq)) {
					return "redirect:" + returnURL + "&error=exist";
				}
			}
		}
		SellBorderDAO dao = new SellBorderDAO();
		Border b = dao.getBorder(seq);
		int af = 0;
		Pick p = new Pick();
		p.setOwner(mid);
		p.setNotice_seq(seq);
		p.setCategory(b.getCategory());
		p.setTitle(b.getTitle());
		p.setWriter(b.getWriter());
		af = pdao.insertPick(p);

		af = dao.updatePick(seq);

		if (af > 0) {
			return "redirect:" + returnURL;
		} else {
			System.out.println("픽업 프록 에러");
			return null;
		}
	}
}
