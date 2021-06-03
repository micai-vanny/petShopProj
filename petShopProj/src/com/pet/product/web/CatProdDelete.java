package com.pet.product.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.pet.common.DbCommand;
import com.pet.product.service.ProductService;
import com.pet.product.serviceImpl.ProductServiceImpl;
import com.pet.product.vo.ProductVO;

public class CatProdDelete implements DbCommand {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		String itemCode = request.getParameter("itemCode");
		
		ProductVO vo = new ProductVO();
		vo.setItemCode(itemCode);
		
		ProductService service = new ProductServiceImpl();
		service.deleteProduct(vo);
		
		request.setAttribute("catProd", vo);
		
		return "catProductList.do";
	}

}
