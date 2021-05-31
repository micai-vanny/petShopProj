package com.pet.member.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.pet.common.DbCommand;
import com.pet.member.serviceImpl.MemberServiceImpl;
import com.pet.member.vo.MemberVO;

public class MemberJoin implements DbCommand {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		String id = request.getParameter("memberId");
		String pwd = request.getParameter("password");
		String name = request.getParameter("name");
		String adr = request.getParameter("adr");
		String email = request.getParameter("email");
		
		MemberVO vo = new MemberVO();
		vo.setId(id);
		vo.setName(name);
		vo.setAddress(adr);
		vo.setEmail(email);
		vo.setPassword(pwd);
		
		MemberServiceImpl service = new MemberServiceImpl();
		service.insertMember(vo);
		
		session.setAttribute("id", id);
		session.setAttribute("member", vo);
		
		return "index.do";
		

	}

}
