package com.pet.board.serviceImpl;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.pet.board.service.BoardService;
import com.pet.board.vo.BoardVO;
import com.pet.common.DAO;

public class BoardServiceImpl extends DAO implements BoardService{

	PreparedStatement psmt;
	ResultSet rs;
	
	
	// 리뷰게시글 전체리스트 
	
	@Override
	public List<BoardVO> selectBoardList(BoardVO bvo) {
		List<BoardVO> list = new ArrayList<>();
		String sql = "select * from review where item_Code = ?";
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, bvo.getItemcode());
			System.out.println(bvo.getItemcode());
			rs = psmt.executeQuery();
			while(rs.next()) {
				BoardVO vo = new BoardVO();
				vo.setBoardid(rs.getInt("board_id"));
				vo.setUserId(rs.getString("user_id"));
				vo.setUserName(rs.getString("user_name"));
				vo.setTitle(rs.getString("title"));
				vo.setContent(rs.getString("content"));
				vo.setDate(rs.getDate("reg_date"));
				vo.setImage(rs.getString("image"));
				vo.setAppraisal(rs.getInt("appraisal"));
				vo.setItemcode(rs.getString("item_code"));
				list.add(vo);
				System.out.println(vo.getAppraisal() + vo.getBoardid());
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return list;
	}

	@Override
	public int insertBoard(BoardVO vo) {
		String sql = "insert into review values(review_seq.nextval,?,?,?,?,?,sysdate,?,?)";
		int insert = 0;
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, vo.getUserName());
			psmt.setString(2, vo.getTitle());
			psmt.setString(3, vo.getContent());
			psmt.setInt(4, vo.getAppraisal());
			psmt.setString(5, vo.getImage());
			psmt.setString(6,vo.getUserId());
			psmt.setString(7,vo.getItemcode());
			
			insert = psmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close();
		}
		
		return insert;
	}

	// 리뷰게시글 수정
	@Override
	public int updateBoard(BoardVO vo) {
		String sql = "update review set title = ?, content = ? image = ? where board_id = ? ";
		int update = 0;
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, vo.getTitle());
			psmt.setString(2, vo.getContent());
			psmt.setString(3, vo.getImage());
			
			update = psmt.executeUpdate();
			System.out.println(update + "건 수정완료");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close();
		}
		return update;
	}

	@Override
	public int deleteBoard(BoardVO vo) {
		String sql = "delete from review where board id = ?";
		int delete = 0;
		
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, vo.getBoardid());
			
			delete = psmt.executeUpdate();
			System.out.println(delete + "건 삭제됌");
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
			} catch (SQLException e) {
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

	@Override
	public BoardVO selectBoard() {
		// TODO Auto-generated method stub
		return null;
	}
}
