package com.pet.cart.serviceImpl;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.pet.cart.service.CartService;
import com.pet.cart.vo.CartVO;
import com.pet.common.DAO;

public class CartServiceImpl extends DAO implements CartService {
	PreparedStatement psmt;
	ResultSet rs;
	
	@Override
	public List<CartVO> selectCartList(String id) {
		String sql = "select * from\r\n"
				+ "(select user_id, item_code, sum(item_qty) qty from cart group by user_id, item_code) cart, product p\r\n"
				+ "where cart.item_code = p.item_code\r\n"
				+ "and cart.user_id = ?";
		List<CartVO> cartList = new ArrayList<CartVO>();
		
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, id);
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				CartVO vo = new CartVO();
				vo.setUserId(rs.getString("user_id"));
				vo.setItemCode(rs.getString("item_code"));
				vo.setItemQty(rs.getInt("qty"));
				vo.setItemName(rs.getString("item_name"));
				vo.setItemImage(rs.getString("item_image"));
				vo.setPrice(rs.getInt("price"));
				vo.setSale(rs.getString("sale"));
				vo.setSalePrice(rs.getInt("sale_price"));
				cartList.add(vo);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return cartList;
	}
	@Override
	public boolean selectCart(CartVO vo) {
		// 장바구니 중복 상품 검증
		boolean exist = false;
		String sql = "select * from cart where user_id=? and item_code=?";
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, vo.getUserId());
			psmt.setString(2, vo.getItemCode());
			rs = psmt.executeQuery();
			if(rs.next()) {
				exist = true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} 
		return exist;
	}
	@Override
	public int addCart(CartVO vo) {
		// 중복 상품 없을 시 DB에 새로 추가
		String sql = "insert into cart(user_id, item_code) values(?,?)";
		int add = 0;
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, vo.getUserId());
			psmt.setString(2, vo.getItemCode());
			
			add = psmt.executeUpdate();
			System.out.println(add+"건 추가완료");
		} catch (SQLException e) {
			e.printStackTrace();
		} 
		return add;
	}
	@Override
	public int updateCart(CartVO vo) {
		// 중복 상품 있을 시 qty + 1
		String sql = "update cart set item_qty= item_qty+1 where user_id=? and item_code=?";
		int up = 0;
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, vo.getUserId());
			psmt.setString(2, vo.getItemCode());
			
			up = psmt.executeUpdate();
			System.out.println("상품 수량 "+up+"건 수정 완료");
		} catch (SQLException e) {
			e.printStackTrace();
		} 
		return up;
	}
	
	@Override
	public int editCart(CartVO vo) {
		// 장바구니에 담겨져있는 수량 수정
		String sql = "update cart set item_qty = ? where user_id = ? and item_code=?";
		int uq = 0;
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, vo.getItemQty());
			psmt.setString(2, vo.getUserId());
			psmt.setString(3, vo.getItemCode());
			
			uq = psmt.executeUpdate();
			System.out.println(uq+"건 수정 완료");
		} catch (SQLException e) {
			e.printStackTrace();
		} 
		return uq;
	}
	@Override
	public int deleteCartAll(CartVO vo) {
		// 장바구니 전체 삭제
		String sql = "delete from cart where user_id=?";
		int allD = 0;
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, vo.getUserId());
			allD = psmt.executeUpdate();
			System.out.println(allD+"삭제 완료");
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return allD;
	}
	
	@Override
	public int deleteCart(CartVO vo) {
		// 장바구니 1건 삭제
		String sql = "delete from cart where user_id=? and item_code=?";
		int del = 0;
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, vo.getUserId());
			psmt.setString(2, vo.getItemCode());
			
			del=psmt.executeUpdate();
			System.out.println(del+"삭제 완료");
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return del;
	}

	@Override
	public int getCountCart(String id) {
		String sql = "select sum(item_qty) from cart where user_id=?";
		int rCnt = 0;
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, id);
			rs = psmt.executeQuery();
			if(rs.next()) {
				rCnt = rs.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}// 카트에 담긴 갯수를 리턴.
		return rCnt;
	}
	// user_id 에 cart가 담겨있는지 확인
	public CartVO selectCartMember(CartVO vo) {
		String sql = "select * from cart where user_id = ? and item_code = ?";
		CartVO cvo = null;
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, vo.getUserId());
			psmt.setString(2, vo.getItemCode());
			rs = psmt.executeQuery();
			if(rs.next()) {
				cvo = new CartVO();
				cvo.setUserId(rs.getString("user_id"));
				cvo.setItemCode(rs.getString("item_code"));
				/*
				 * System.out.println(rs.getString("user_id"));
				 * System.out.println(rs.getString("item_code"));
				 */

			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return cvo;
		
	}
	
	// 닫아주기
	private void close() {
		if(rs != null) {
			try {
				rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		if(psmt != null) {
			try {
				psmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		if(conn != null) {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
}
