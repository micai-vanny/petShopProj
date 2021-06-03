package com.pet.product.serviceImpl;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.pet.common.DAO;
import com.pet.product.service.ProductService;
import com.pet.product.vo.ProductVO;

public class ProductServiceImpl extends DAO implements ProductService {
	PreparedStatement psmt;
	ResultSet rs;
	
	@Override
	public List<ProductVO> dogProductList(String divCode) {
		// 강아지 용품 전체 불러오기
		String sql = "select * from product where div_code = ?";
		List<ProductVO> dogProdList = new ArrayList<ProductVO>();
		
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, divCode);
			rs = psmt.executeQuery();
			while(rs.next()) {
				ProductVO vo = new ProductVO();
				vo.setItemCode(rs.getString("item_code"));
				vo.setItemName(rs.getString("item_name"));
				vo.setItemImage(rs.getString("item_image"));
				vo.setLikeIt(rs.getInt("like_it"));
				vo.setPrice(rs.getInt("price"));
				vo.setSale(rs.getString("sale"));
				vo.setSalePrice(rs.getInt("sale_price"));
				vo.setStock(rs.getInt("stock"));
				dogProdList.add(vo);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return dogProdList;
	}

	@Override
	public List<ProductVO> catProductList(String divCode) {
		// 고양이 용품 전체 불러오기
			String sql = "select * from product where div_code = ?";
			List<ProductVO> dogProdList = new ArrayList<ProductVO>();
				
			try {
				psmt = conn.prepareStatement(sql);
				psmt.setString(1, divCode);
				rs = psmt.executeQuery();
				while(rs.next()) {
					ProductVO vo = new ProductVO();
					vo.setItemCode(rs.getString("item_code"));
					vo.setItemName(rs.getString("item_name"));
					vo.setItemImage(rs.getString("item_image"));
					vo.setLikeIt(rs.getInt("like_it"));
					vo.setPrice(rs.getInt("price"));
					vo.setSale(rs.getString("sale"));
					vo.setSalePrice(rs.getInt("sale_price"));
					vo.setStock(rs.getInt("stock"));
					dogProdList.add(vo);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
			return dogProdList;
	}

	@Override
	public ProductVO catProductSelect(ProductVO vo) {
		// 고양이 용품 상세보기
		String sql = "select * from product where item_code = ?";
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, vo.getItemCode());
			rs=psmt.executeQuery();
			
			if(rs.next()) {
				vo.setItemCode(rs.getString("item_code"));
				vo.setItemImage(rs.getString("item_image"));
				vo.setItemName(rs.getString("item_name"));
				vo.setLikeIt(rs.getInt("like_it"));
				vo.setPrice(rs.getInt("price"));
				vo.setSale(rs.getString("sale"));
				vo.setSalePrice(rs.getInt("sale_price"));
				vo.setItemDesc(rs.getString("item_desc"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return vo;
	}
	
	@Override
	public ProductVO dogProductSelect(ProductVO vo) {
		// 강아지 용품 상세보기
		String sql = "select * from product where item_code=?";
		try {
			psmt=conn.prepareStatement(sql);
			psmt.setString(1, vo.getItemCode());
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				vo.setItemImage(rs.getString("item_image"));
				vo.setItemName(rs.getString("item_name"));
				vo.setLikeIt(rs.getInt("like_it"));
				vo.setPrice(rs.getInt("price"));
				vo.setSale(rs.getString("sale"));
				vo.setSalePrice(rs.getInt("sale_price"));
				vo.setItemDesc(rs.getString("item_desc"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return vo;
	}

	@Override
	public int insertProduct(ProductVO vo) {
		// 상품 등록
		String sql = "insert into product(div_code, item_code, item_name, item_image, price, sale, item_desc, stock) values(?,?,?,?,?,?,?,?)";
		int in =0;
		try {
			psmt=conn.prepareStatement(sql);
			psmt.setString(1, vo.getDivCode());
			psmt.setString(2, vo.getItemCode());
			psmt.setString(3, vo.getItemName());
			psmt.setString(4, vo.getItemImage());
			psmt.setInt(5, vo.getPrice());
			psmt.setString(6, vo.getSale());
			psmt.setString(7, vo.getItemDesc());
			psmt.setInt(8, vo.getStock());
			
			in = psmt.executeUpdate();
			System.out.println("상품 "+in+"건 등록완료.");
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return in;
	}

	@Override
	public int updateProduct(ProductVO vo) {
		// 상품 수정
		String sql ="update product set sale=?, item_name=?, sale_price=?, price=?, item_desc=?, item_image=? where item_code=?";
		int up =0;
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, vo.getSale());
			psmt.setString(2, vo.getItemName());
			psmt.setInt(3, vo.getSalePrice());
			psmt.setInt(4, vo.getPrice());
			psmt.setString(5, vo.getItemDesc());
			psmt.setString(6, vo.getItemImage());
			psmt.setString(7, vo.getItemCode());
			
			up = psmt.executeUpdate();
			System.out.println(up+"건 수정완료.");
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return up;
	}

	@Override
	public int deleteProduct(ProductVO vo) {
		// 상품 삭제
		String sql = "delete from product where item_code=?";
		int del = 0;
		try {
			psmt=conn.prepareStatement(sql);
			psmt.setString(1, vo.getItemCode());
			
			del=psmt.executeUpdate();
			System.out.println(del+"건 삭제완료.");
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return del;
	}
	
	// Cart Info Start
	
	// Cart에 상품 넣기
	public void addCart(String id, String itemCode, int qty) {
		String sql = "insert into cart values(?,?,?)";
		
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, id);
			psmt.setString(2, itemCode);
			psmt.setInt(3, qty);
			
			int add = psmt.executeUpdate();
			System.out.println(add+"건 추가완료");
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
	}
	
	// cart 안에 있는 상품들 보여주기
	public List<ProductVO> selectCart(String id){
		String sql = "select * from\r\n"
				+ "(select user_id, item_code, shipping, sum(item_qty) qty from cart group by user_id, item_code, shipping) cart, product p\r\n"
				+ "where cart.item_code = p.item_code\r\n"
				+ "and cart.user_id = ?";
		List<ProductVO> cartList = new ArrayList<ProductVO>();
		
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, id);
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				ProductVO vo = new ProductVO();
				vo.setUserId(rs.getString("user_id"));
				vo.setItemCode(rs.getString("item_code"));
				vo.setItemQty(rs.getInt("qty"));
				vo.setItemName(rs.getString("item_name"));
				vo.setItemImage(rs.getString("item_image"));
				vo.setPrice(rs.getInt("price"));
				vo.setSale(rs.getString("sale"));
				vo.setSalePrice(rs.getInt("sale_price"));
				vo.setShipping(rs.getInt("shipping"));
				cartList.add(vo);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return cartList;
	}
	
	// 로그인 한 id에 맞게 장바구니에 담아둔 상품의 갯수 보여줌
		public int getCountCart(String id) {
			String sql = "select count(*) from cart where user_id=?";
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
