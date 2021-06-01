package com.pet.product.service;

import java.util.List;

import com.pet.product.vo.ProductVO;

public interface ProductService {
	// 상품 리스트, 상품 상세조회, 등록, 수정, 삭제
	
	List<ProductVO> dogProductList(String divCode);
	List<ProductVO> catProductList(String divCode);
	ProductVO catProductSelect(String itemCode);
	ProductVO dogProductSelect(String itemCode);
	int insertProduct(ProductVO vo);
	int updateProduct(ProductVO vo);
	int deleteProduct(ProductVO vo);
}
