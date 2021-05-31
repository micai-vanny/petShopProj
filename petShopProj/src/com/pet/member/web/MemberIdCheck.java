package com.pet.member.web;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.pet.member.serviceImpl.MemberServiceImpl;

@WebServlet("/MemberIdCheck")
public class MemberIdCheck extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String id = req.getParameter("id");
		
		MemberServiceImpl service = new MemberServiceImpl();
		
		int idCheck = 0;
		if (service.idCheck(id)) {
			idCheck = 1;
		}
		resp.getWriter().print(idCheck);
	}
}
