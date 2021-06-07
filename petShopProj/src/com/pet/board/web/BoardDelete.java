package com.pet.board.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.pet.board.serviceImpl.BoardServiceImpl;
import com.pet.board.vo.BoardVO;
import com.pet.common.DbCommand;

public class BoardDelete implements DbCommand {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		String boardid = request.getParameter("boardid");
		
		BoardVO vo = new BoardVO();
		
		vo.setBoardid(Integer.parseInt(boardid));
		
		BoardServiceImpl service = new BoardServiceImpl();
		
		service.deleteBoard(vo);
		
		return "catProductSelect.do";
	}

}
