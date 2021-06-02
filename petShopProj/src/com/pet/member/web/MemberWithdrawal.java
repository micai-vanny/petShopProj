package com.pet.member.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.pet.common.DbCommand;
import com.pet.member.serviceImpl.MemberServiceImpl;
import com.pet.member.vo.MemberVO;

public class MemberWithdrawal implements DbCommand {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		
		String userId = request.getParameter("id");
		MemberVO vo = new MemberVO();
		
		vo.setId(userId);
		
		MemberServiceImpl service = new MemberServiceImpl();
		service.deleteMember(vo);
		
		session.invalidate();
		
		return "index.do";
	}

}
