package com.pet.board.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.pet.board.serviceImpl.BoardServiceImpl;
import com.pet.board.vo.BoardVO;
import com.pet.common.DbCommand;

public class BoardInsert implements DbCommand {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		String title = request.getParameter("title");
		String username = request.getParameter("username");
		String content = request.getParameter("content");
		String id = request.getParameter("id");
		String itemcode = request.getParameter("itemcode");
		String appraisal = request.getParameter("appraisal");

		BoardVO vo = new BoardVO();
		BoardServiceImpl service = new BoardServiceImpl();
		
		String path = "";
		
		vo.setTitle(title);
		vo.setUserName(username);
		vo.setContent(content);
		vo.setUserId(id);
		vo.setItemcode(itemcode);
		vo.setAppraisal(Integer.parseInt(appraisal));
		System.out.println(itemcode);
		int n = service.insertBoard(vo);
		if(n != 0) {
			request.setAttribute("itemCode", itemcode);
			path = "catProductSelect.do";
		} else {
			path = "index.do";
		}
		
		return path;
	}

}
