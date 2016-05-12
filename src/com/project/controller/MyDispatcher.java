package com.project.controller;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.xml.parsers.ParserConfigurationException;
import javax.xml.parsers.SAXParser;
import javax.xml.parsers.SAXParserFactory;

import org.xml.sax.SAXException;

public class MyDispatcher extends HttpServlet {
	Map<String, Controller> conMap = new HashMap<String, Controller>();

	@Override
	public void init(ServletConfig config) throws ServletException {
		String path = config.getInitParameter("xmlPath");
		SAXParserFactory spf = SAXParserFactory.newInstance();
		try {
			SAXParser sp = spf.newSAXParser();
			XMLParser xp = new XMLParser();
			sp.parse(new File(path), xp);
			conMap = xp.xmlMap;
		} catch (ParserConfigurationException | SAXException | IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String requestURI = request.getRequestURI();
		System.out.println(requestURI);
		Controller controller = null;

		controller = conMap.get(requestURI);

		String toMove = controller.execute(request, response);
		System.out.println("toMove: " + toMove);
		String[] toMoves = toMove.split(":");
		if (toMoves[0].equals("redirect")) {
			response.sendRedirect(toMoves[1]);
		} else {
			request.getRequestDispatcher(toMove).forward(request, response);
		}
	}

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		super.doGet(request, response);
		service(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		super.doPost(request, response);
		service(request, response);
	}
}
