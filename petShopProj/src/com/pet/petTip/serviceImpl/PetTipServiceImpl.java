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
	
	public List<PetTipVO> petTipListPaging(int page){
		String sql = "select b.* \r\n" //
				+ "from( select rownum rn, a.* \r\n" //
				+ "      from (select * from pet_tip order by id desc)a\r\n" //
				+ "      )b\r\n" //
				+ "where b.rn between ? and ?";
		
		List<PetTipVO> petTipList = new ArrayList<PetTipVO>();

		// 한 페이지 당 10건 씩 노출
		int firstCnt, lastCnt = 0;
		
		firstCnt = (page - 1) * 10 + 1;
		lastCnt = (page * 10);
		
		try {
			psmt= conn.prepareStatement(sql);
			psmt.setInt(1, firstCnt);
			psmt.setInt(2, lastCnt);
			
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				PetTipVO vo = new PetTipVO();
				vo.setId(rs.getInt("id"));
				vo.setTitle(rs.getString("title"));
				vo.setContent(rs.getString("content"));
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
	public List<PetTipVO> petTipSelectList() {
		String sql = "select * from pet_tip order by id desc";
		List<PetTipVO> petTipList = new ArrayList<PetTipVO>();
		try {
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();
			while(rs.next()) {
				PetTipVO vo = new PetTipVO();
				vo.setId(rs.getInt("id"));
				vo.setTitle(rs.getString("title"));
				vo.setContent(rs.getString("content"));
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

	public void hitCount(int id) {
		// 조회수 1건 씩 증가
		String sql = "update pet_tip set hit = hit+1 where id = ?";
		
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, id);
			psmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} 
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
				hitCount(vo.getId());
				vo.setId(rs.getInt("id"));
				vo.setTitle(rs.getString("title"));
				vo.setRegDate(rs.getDate("reg_date"));
				vo.setHit(rs.getInt("hit"));
				vo.setContent(rs.getString("content"));
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
		String sql = "insert into pet_tip(id,title,content,reg_date) values(tip_seq.nextval,?,?,sysdate)";
		int in = 0;
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, vo.getTitle());
			psmt.setString(2, vo.getContent());
			
			in = psmt.executeUpdate();
			System.out.println(in + "건 등록완료.");
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return in;
	}

	@Override
	public int updatePetTip(PetTipVO vo) {
		String sql = "update pet_tip set title =?, content=? where id = ?";
		int up = 0;
		
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, vo.getTitle());
			psmt.setString(2, vo.getContent());
			psmt.setInt(3, vo.getId());
			up = psmt.executeUpdate();
			System.out.println(up + "건 수정완료.");
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return up;
	}

	@Override
	public int deletePetTip(PetTipVO vo) {
		String sql = "delete from pet_tip where id = ?";
		int del = 0;
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, vo.getId());
			
			del = psmt.executeUpdate();
			System.out.println(del+"건 삭제완료.");
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close();
		}
		return del;
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
