package com.pet.board.service;

import java.util.List;

import com.pet.board.vo.BoardVO;


public interface BoardService {

	BoardVO selectBoard();
	public int insertBoard(BoardVO vo);
	public int updateBoard(BoardVO vo);
	public int deleteBoard(BoardVO vo);
	List<BoardVO> selectBoardList(BoardVO bvo);
	
}
