package com.pet.cart.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.pet.cart.service.CartService;
import com.pet.cart.serviceImpl.CartServiceImpl;
import com.pet.cart.vo.CartVO;
import com.pet.common.DbCommand;

public class DelCartAll implements DbCommand {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		String userId = request.getParameter("userId");
		
		CartVO vo = new CartVO();
		vo.setUserId(userId);
		
		CartService service = new CartServiceImpl();
		service.deleteCartAll(vo);
		
		request.setAttribute("delCartAll", vo);
		
		return "cartList.do";
	}

}
