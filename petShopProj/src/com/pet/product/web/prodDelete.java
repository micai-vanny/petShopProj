package com.pet.product.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.pet.common.DbCommand;
import com.pet.product.service.ProductService;
import com.pet.product.serviceImpl.ProductServiceImpl;
import com.pet.product.vo.ProductVO;

public class prodDelete implements DbCommand {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		String itemCode = request.getParameter("itemCode");
		
		ProductVO vo = new ProductVO();
		vo.setItemCode(itemCode);
		
		ProductService service = new ProductServiceImpl();
		service.deleteProduct(vo);
		
		request.setAttribute("Prod", vo);
		
		String path="";
		
		if(itemCode.startsWith("c")) {	// itemCode가 c로 시작하면
			path = "/catProductList.do";	// 고양이 상품 목록 반환
		} else {
			path = "/dogProductList.do";
		}
		
		return path;
	}

}
