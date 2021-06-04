package com.pet.board.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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

		System.out.println(title + username + content + id + itemcode + appraisal);
		
		return null;
	}

}
