package com.pet.product.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.pet.common.DbCommand;
import com.pet.product.serviceImpl.ProductServiceImpl;

public class AddCart implements DbCommand {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		// cart table에 1건 추가하기
		HttpSession session = request.getSession();
		
		String id = request.getParameter("id");
		String itemCode = request.getParameter("itemCode");
		int qty = 1; // 수량
		
		ProductServiceImpl service = new ProductServiceImpl();
		service.addCart(id, itemCode, qty);
		
		ProductServiceImpl serv = new ProductServiceImpl();
		int cartCnt = serv.getCountCart(id);
		
		session.setAttribute("cartCnt", cartCnt);
		
		String path = "";
		
		if(itemCode.startsWith("c")) {	// itemCode가 c로 시작하면
			path = "/catProductList.do";	// 고양이 상품 목록 반환
		} else {
			path = "/dogProductList.do";
		}
		return path;
	}

}
