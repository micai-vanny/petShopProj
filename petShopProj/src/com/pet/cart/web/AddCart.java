package com.pet.cart.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.pet.cart.service.CartService;
import com.pet.cart.serviceImpl.CartServiceImpl;
import com.pet.cart.vo.CartVO;
import com.pet.common.DbCommand;
import com.pet.product.serviceImpl.ProductServiceImpl;
import com.pet.product.vo.ProductVO;

public class AddCart implements DbCommand {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		// cart table에 1건 추가하기
		HttpSession session = request.getSession();
		
		String id = request.getParameter("id");
		String itemCode = request.getParameter("itemCode");
		
		CartVO vo = new CartVO();
		vo.setUserId(id);
		vo.setItemCode(itemCode);
		
		CartService service = new CartServiceImpl();
		if(service.selectCart(vo)) {
			service.updateCart(vo);
			System.out.println("중복 상품 존재, 수량 수정 완료.");
		} else {
			service.addCart(vo);
			System.out.println("중복이 없습니다. DB에 추가합니다.");
		}
		
		int cartCnt = service.getCountCart(id);
		
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
