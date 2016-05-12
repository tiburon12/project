package com.project.controller;

import java.util.HashMap;
import java.util.Map;

import org.xml.sax.Attributes;
import org.xml.sax.SAXException;
import org.xml.sax.helpers.DefaultHandler;

public class XMLParser extends DefaultHandler {
	Map<String, Controller> xmlMap = new HashMap<String, Controller>();

	@Override
	public void startElement(String uri, String localName, String qName, Attributes attributes) throws SAXException {
		if (qName.equals("bean")) {
			String xmluri = attributes.getValue("uri");
			String className = attributes.getValue("class");

			try {
				Controller conObj = (Controller) Class.forName(className).newInstance();
				xmlMap.put(xmluri, conObj);
			} catch (InstantiationException | IllegalAccessException | ClassNotFoundException e) {
				System.out.println("xml파싱중 오류발생");
				e.printStackTrace();
			}
		}
	}
}
