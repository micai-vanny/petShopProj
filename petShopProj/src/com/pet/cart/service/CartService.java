package com.pet.cart.service;

import java.util.List;

import com.pet.cart.vo.CartVO;

public interface CartService {
	List<CartVO> selectCartList(String id);
	public boolean selectCart(CartVO vo);
	public int addCart(CartVO vo); 	// 중복상품 검증
	public int updateCart(CartVO vo);	// 중복상품 존재시 qty +1
	public int editCart(CartVO vo); // 카트 정보 수정
	public int deleteCart(CartVO vo);	// 상품 1개 삭제
	public int getCountCart(String id);	// 장바구니에 들어있는 상품개수 카운트
}
