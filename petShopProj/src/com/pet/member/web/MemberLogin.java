package com.pet.member.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.pet.common.DbCommand;
import com.pet.member.serviceImpl.MemberServiceImpl;
import com.pet.member.vo.MemberVO;

public class MemberLogin implements DbCommand {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		
		String id = request.getParameter("userid");
		String pwd = request.getParameter("memberPwd");
		
		MemberVO vo = new MemberVO();
		
		vo.setId(id);
		vo.setPassword(pwd);
		
		MemberServiceImpl service = new MemberServiceImpl();
		MemberVO mvo = service.loginCheck(vo);
		String path="";
		
		if(mvo == null) {
			// 받아온 ID/PASSWORD 일치하지않을때 (실패)
			path = "member/memberLoginFail.tiles";
		} else {
			// 받아온 ID/PASSWORD 값을 받아왔을때 (성공)
			session.setAttribute("id", mvo.getId());
			session.setAttribute("name", mvo.getName());
			request.setAttribute("vo", mvo);
			path = "member/memberLoginSuccess.tiles";
			
		}
		
		return path;
	}

}
