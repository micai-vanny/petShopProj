package com.pet.petTip.web;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.pet.common.DbCommand;
import com.pet.petTip.service.PetTipService;
import com.pet.petTip.serviceImpl.PetTipServiceImpl;
import com.pet.petTip.vo.PetTipVO;

public class PetTipInsert implements DbCommand {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		
		PetTipVO vo = new PetTipVO();
		vo.setTitle(title);
		vo.setContent(content);
		
		PetTipService service = new PetTipServiceImpl();
		int in = service.insertPetTip(vo);
		
		String path = "";
		
		if(in > 0) {
			path = "/petTipListPaging.do";
		} else {
			PrintWriter script;
			try {
				script = response.getWriter();
				script.println("<script>");
				script.println("window.alert('등록에 실패했습니다.')");
				script.println("history.go(-1)");
				script.println("</script>");
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		
		return path;
	}

}
