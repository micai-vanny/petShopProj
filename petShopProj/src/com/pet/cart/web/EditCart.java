package com.pet.cart.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.pet.cart.service.CartService;
import com.pet.cart.serviceImpl.CartServiceImpl;
import com.pet.cart.vo.CartVO;
import com.pet.common.DbCommand;

public class EditCart implements DbCommand {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		
		String itemQty = request.getParameter("itemQty");
//		String userId = (String)session.getAttribute("id");
		String userId = request.getParameter("userId");
		String itemCode = request.getParameter("itemCode");
		
		System.out.println(itemQty + " " + userId + " " + itemCode);

		CartVO vo = new CartVO();
		vo.setItemQty(Integer.parseInt(itemQty));
		vo.setUserId(userId);
		vo.setItemCode(itemCode);
		
		CartService service = new CartServiceImpl();
		service.editCart(vo);
		int cartCnt = service.getCountCart(userId);
		
		request.setAttribute("editCart", vo);
		session.setAttribute("cartCnt", cartCnt);
		return "cartList.do";
	}

}
