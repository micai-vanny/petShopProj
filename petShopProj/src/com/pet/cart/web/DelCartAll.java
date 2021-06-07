package com.pet.cart.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.pet.cart.service.CartService;
import com.pet.cart.serviceImpl.CartServiceImpl;
import com.pet.cart.vo.CartVO;
import com.pet.common.DbCommand;

public class DelCartAll implements DbCommand {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		String userId = request.getParameter("userId");
		
		CartVO vo = new CartVO();
		vo.setUserId(userId);
		
		CartService service = new CartServiceImpl();
		service.deleteCartAll(vo);
		int cartCnt = service.getCountCart(userId);
		
		request.setAttribute("delCartAll", vo);
		session.setAttribute("cartCnt", cartCnt);
		return "cartList.do";
	}

}
