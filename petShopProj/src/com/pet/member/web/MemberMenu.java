package com.pet.member.web;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.bind.annotation.SessionAttributes;

import com.pet.cart.service.CartService;
import com.pet.cart.serviceImpl.CartServiceImpl;
import com.pet.cart.vo.CartVO;
import com.pet.common.DbCommand;

public class MemberMenu implements DbCommand {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		
		String id = (String) session.getAttribute("id");
		
		CartService service = new CartServiceImpl();
		List<CartVO> cartList = service.selectCartList(id);
		
		request.setAttribute("cartList", cartList);
		
		return "member/memberMenu.tiles";
	}

}
