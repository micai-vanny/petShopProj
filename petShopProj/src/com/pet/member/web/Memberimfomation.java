package com.pet.member.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.pet.common.DbCommand;
import com.pet.member.serviceImpl.MemberServiceImpl;
import com.pet.member.vo.MemberVO;

public class Memberimfomation implements DbCommand {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {

		String id = request.getParameter("id");
		MemberVO vo = new MemberVO();
		MemberServiceImpl Service = new MemberServiceImpl();
		
		vo.setId(id);
		
		vo = Service.selectMember(id);

		
		request.setAttribute("vo", vo);
		
		return "member/memberimfomation.tiles;";
	}

}
