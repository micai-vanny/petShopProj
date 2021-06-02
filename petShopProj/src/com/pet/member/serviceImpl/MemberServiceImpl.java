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
	
	//id,password 체크 Login
	public MemberVO loginCheck(MemberVO vo) {
		String sql = "select * from member where user_id = ? and passwd = ?";
		MemberVO mvo = null;
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, vo.getId());
			psmt.setString(2, vo.getPassword());
			rs = psmt.executeQuery();
			if(rs.next()) {
				mvo = new MemberVO();
				mvo.setName(rs.getString("user_name"));
				mvo.setId(rs.getString("user_id"));
				mvo.setPassword(rs.getString("passwd"));
				mvo.setAddress(rs.getString("address"));
				mvo.setEmail(rs.getString("email"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close();
		}
		return mvo;
	}
	//Id 중복체크
	public boolean idCheck(String id) {
		String sql = "select user_id from member where user_id = ?";
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
	public MemberVO selectMember(String id) {
		String sql = "select * from member where user_id=?";
		MemberVO vo = new MemberVO();
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, id);
			rs = psmt.executeQuery();
			if(rs.next()) {
				vo.setId(rs.getString("user_id"));
				vo.setName(rs.getString("user_name"));
				vo.setAddress(rs.getString("address"));
				vo.setEmail(rs.getString("email"));
				vo.setPassword(rs.getString("passwd"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close();
		}
		return vo;
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
		String sql = "update member set email = ?, address = ? where user_id = ? ";
		// TODO Auto-generated method stub
		int update = 0;
		
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, vo.getEmail());
			psmt.setString(2, vo.getAddress());
			psmt.setString(3, vo.getId());
			
			update = psmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return update;
	}
	
	@Override
	public int deleteMember(MemberVO vo) {
		String sql = "delete from member where user_id=?";
		int delete = 0;
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, vo.getId());
			
			delete = psmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close();
		}
		return delete;
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
