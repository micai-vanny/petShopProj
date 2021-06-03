package com.pet.product.web;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.pet.common.DbCommand;
import com.pet.product.serviceImpl.ProductServiceImpl;
import com.pet.product.vo.ProductVO;

public class CartList implements DbCommand {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		String id = request.getParameter("uid");
		
		ProductServiceImpl service = new ProductServiceImpl();
		List<ProductVO> cartList = service.selectCart(id);
		
		request.setAttribute("cartList", cartList);
		
		return "product/cartList.tiles";
	}

}
