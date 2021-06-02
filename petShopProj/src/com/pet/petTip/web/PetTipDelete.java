package com.pet.petTip.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.pet.common.DbCommand;
import com.pet.petTip.service.PetTipService;
import com.pet.petTip.serviceImpl.PetTipServiceImpl;
import com.pet.petTip.vo.PetTipVO;

public class PetTipDelete implements DbCommand {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		String id = request.getParameter("id");
		
		PetTipVO vo = new PetTipVO();
		vo.setId(Integer.parseInt(id));
		
		PetTipService service = new PetTipServiceImpl();
		service.deletePetTip(vo);
		
		request.setAttribute("petTip", vo);
		
		return "petTipListPaging.do";
	}

}
