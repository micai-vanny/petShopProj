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
		String email = request.getParameter("email");
		
		String adr1 = request.getParameter("postcode");
		String adr2 = request.getParameter("roadAddress");
		String adr3 = request.getParameter("detailAddress");
		String adr4 = request.getParameter("extraAddress");
		
		String totaladr = "(" + adr1 + ")" +adr2+adr3+adr4;
		//
		MemberVO vo = new MemberVO();
		vo.setId(id);
		vo.setName(name);
		vo.setAddress(totaladr);
		vo.setEmail(email);
		vo.setPassword(pwd);
		
		MemberServiceImpl service = new MemberServiceImpl();
		service.insertMember(vo);
		
		session.setAttribute("id", id);
		session.setAttribute("member", vo);
		
		return "index.do";
		

	}

}
