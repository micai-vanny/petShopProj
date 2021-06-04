package com.pet.cart.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.pet.cart.service.CartService;
import com.pet.cart.serviceImpl.CartServiceImpl;
import com.pet.cart.vo.CartVO;
import com.pet.common.DbCommand;

public class DelCart implements DbCommand {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		String userId = request.getParameter("userId");
		String itemCode = request.getParameter("itemCode");
		
		CartVO vo = new CartVO();
		vo.setUserId(userId);
		vo.setItemCode(itemCode);
		
		CartService service = new CartServiceImpl();
		service.deleteCart(vo);
		int cartCnt = service.getCountCart(userId);
				
		request.setAttribute("delCart", vo);
		
		HttpSession session = request.getSession();
		session.setAttribute("cartCnt", cartCnt);
		
		return "cartList.do";
	}

}
