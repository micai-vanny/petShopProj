package com.pet.petTip.web;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.pet.common.DbCommand;
import com.pet.petTip.service.PetTipService;
import com.pet.petTip.serviceImpl.PetTipServiceImpl;
import com.pet.petTip.vo.PetTipVO;

public class PetTipList implements DbCommand {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		PetTipService service = new PetTipServiceImpl();
		List<PetTipVO> list = service.petTipSelectList();
		
		request.setAttribute("list", list);
		
		return "petTip/petTipList.tiles";
	}

}
