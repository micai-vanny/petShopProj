package com.pet.member.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.pet.common.DbCommand;
import com.pet.member.serviceImpl.MemberServiceImpl;
import com.pet.member.vo.MemberVO;

public class MemberUpdate implements DbCommand {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		String email = request.getParameter("email");
		String adr = request.getParameter("address");
		
		MemberVO vo = new MemberVO();
		MemberServiceImpl service = new MemberServiceImpl();
		
		vo.setEmail(email);
		vo.setAddress(adr);
		
		
		
		
		return null;
	}

}
