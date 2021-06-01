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
		return 0;
	}

	@Override
	public int updateProduct(ProductVO vo) {
		// 상품 수정
		return 0;
	}

	@Override
	public int deleteProduct(ProductVO vo) {
		// 상품 삭제
		return 0;
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
				+ "(select user_id, item_code, sum(item_qty) qty from cart group by user_id, item_code) cart, product p\r\n"
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
				cartList.add(vo);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return cartList;
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
