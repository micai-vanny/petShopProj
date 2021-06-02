package com.pet.petTip.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.pet.common.DbCommand;
import com.pet.petTip.service.PetTipService;
import com.pet.petTip.serviceImpl.PetTipServiceImpl;
import com.pet.petTip.vo.PetTipVO;

public class PetTipUpdate implements DbCommand {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		// 파라미터로 넘어온 3개 값 받고 service -> updatePetTip 호출
		
		String id = request.getParameter("id");
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		
		PetTipVO vo = new PetTipVO();
		vo.setId(Integer.parseInt(id));
		vo.setTitle(title);
		vo.setContent(content);
		
		PetTipService service = new PetTipServiceImpl();
		service.updatePetTip(vo);
		
		request.setAttribute("petTip", vo);
		
		
		return "petTipListPaging.do";
	}

}
