package com.pet.petTip.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.pet.common.DbCommand;
import com.pet.petTip.service.PetTipService;
import com.pet.petTip.serviceImpl.PetTipServiceImpl;
import com.pet.petTip.vo.PetTipVO;

public class PetTipSelect implements DbCommand {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		// petTips 게시글 조회 처리
		
		String id = request.getParameter("id");
		
		PetTipVO vo = new PetTipVO();
		vo.setId(Integer.parseInt(id));
		
		PetTipService service = new PetTipServiceImpl();
		service.petTipSelect(vo);
		
		request.setAttribute("petTip", vo);
		
		return "petTip/petTipSelect.tiles";
	}

}
