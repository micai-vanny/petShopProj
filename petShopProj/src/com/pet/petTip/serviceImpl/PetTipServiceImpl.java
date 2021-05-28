package com.pet.petTip.serviceImpl;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.pet.common.DAO;
import com.pet.petTip.service.PetTipService;
import com.pet.petTip.vo.PetTipVO;

public class PetTipServiceImpl extends DAO implements PetTipService {
	PreparedStatement psmt;
	ResultSet rs;
	
	@Override
	public List<PetTipVO> petTipSelectList() {
		String sql = "select * from pet_tip";
		List<PetTipVO> petTipList = new ArrayList<PetTipVO>();
		try {
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();
			while(rs.next()) {
				PetTipVO vo = new PetTipVO();
				vo.setId(rs.getInt("id"));
				vo.setTitle(rs.getString("title"));
				vo.setContent(rs.getString("content"));
				vo.setImage(rs.getString("image"));
				vo.setRegDate(rs.getDate("reg_date"));
				vo.setHit(rs.getInt("hit"));
				petTipList.add(vo);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		
		return petTipList;
	}

	@Override
	public PetTipVO petTipSelect(PetTipVO vo) {
		// 게시글 번호로 게시글 조회
		String sql = "select * from pet_tip where id = ?";
		
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, vo.getId());
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				vo.setId(rs.getInt("id"));
				vo.setTitle(rs.getString("title"));
				vo.setRegDate(rs.getDate("reg_date"));
				vo.setHit(rs.getInt("hit"));
				vo.setContent(rs.getString("content"));
				vo.setImage(rs.getString("image"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		
		return vo;
	}

	@Override
	public int insertPetTip(PetTipVO vo) {
		String sql = "inset into pet_tip values(tip_seq.nextval,?,?,?,sysdate,0)";
		int in = 0;
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, vo.getTitle());
			psmt.setString(2, vo.getContent());
			psmt.setString(3, vo.getImage());
			
			in = psmt.executeUpdate();
			System.out.println(in + "건 등록완료.");
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return in;
	}

	@Override
	public int updatePetTip(PetTipVO vo) {
		String sql = "update pet_tip set title =?, content=?, image=? where id = ?";
		int up = 0;
		
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, vo.getTitle());
			psmt.setString(2, vo.getContent());
			psmt.setString(3, vo.getImage());
			
			up = psmt.executeUpdate();
			System.out.println(up + "건 수정완료.");
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return up;
	}

	@Override
	public int deletePetTip(PetTipVO vo) {
		// TODO Auto-generated method stub
		return 0;
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
