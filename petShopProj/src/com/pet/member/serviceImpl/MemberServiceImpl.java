package com.pet.member.serviceImpl;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import com.pet.common.DAO;
import com.pet.member.service.MemberService;
import com.pet.member.vo.MemberVO;

public class MemberServiceImpl extends DAO implements MemberService {
	
	PreparedStatement psmt;
	ResultSet rs;
	
	
	//Id 중복체크
	public boolean idCheck(String id) {
		String sql = "select id from member where id = ?";
		boolean idCheck = false;
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, id);
			
			rs = psmt.executeQuery();
			if(rs.next()) {
				idCheck = true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return idCheck;
	}
	@Override
	public List<MemberVO> selectMemberList() {
		// TODO Auto-generated method stub
		return null;
	}
	
	@Override
	public MemberVO selectMember() {
		// TODO Auto-generated method stub
		return null;
	}
	
	@Override
	public int insertMember(MemberVO vo) {
		// 회원 가입
		String sql = "insert into member values(?,?,?,?,?)";
		
		int insert = 0;
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, vo.getId());
			psmt.setString(2, vo.getPassword());
			psmt.setString(3, vo.getName());
			psmt.setString(4, vo.getAddress());
			psmt.setString(5, vo.getEmail());
			
			insert = psmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close();
		}
		return insert;
	}
	
	@Override
	public int updateMember(MemberVO vo) {
		// TODO Auto-generated method stub
		return 0;
	}
	
	@Override
	public int deleteMember(MemberVO vo) {
		// TODO Auto-generated method stub
		return 0;
	}
	public void close() {
		
		if (rs != null) {
			try {
				rs.close();
			} catch(SQLException e) {
				e.printStackTrace();
			}
		}
		if (psmt != null) {
			try {
				psmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		if (conn != null) {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
	
	

}
