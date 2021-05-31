package com.pet.product.web;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.pet.common.DbCommand;
import com.pet.product.service.ProductService;
import com.pet.product.serviceImpl.ProductServiceImpl;
import com.pet.product.vo.ProductVO;

public class DogProductList implements DbCommand {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		String divCode = "D";
		
		ProductService service = new ProductServiceImpl();
		List<ProductVO> list = service.dogProductList(divCode);
		
		request.setAttribute("list", list);
		return "product/dogProductList.tiles";
	}

}
