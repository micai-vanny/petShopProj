package com.pet.petTip.web;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.pet.common.DbCommand;
import com.pet.common.Paging;
import com.pet.petTip.serviceImpl.PetTipServiceImpl;
import com.pet.petTip.vo.PetTipVO;

public class PetTipListPaging implements DbCommand {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		String page = request.getParameter("page");	// 페이지 번호
		if(page == null) {
			page="1";
		}
		int pageCnt = Integer.parseInt(page);
		
		PetTipServiceImpl service = new PetTipServiceImpl();
		List<PetTipVO> total = service.petTipSelectList();
		
		service = new PetTipServiceImpl();
		List<PetTipVO> list = service.petTipListPaging(pageCnt);
		
		Paging paging = new Paging();
		paging.setPageNo(pageCnt);
		paging.setPageSize(10);
		paging.setTotalCount(total.size());
		
		request.setAttribute("list", list);
		request.setAttribute("paging", paging);		
		
		return "petTip/petTipListPaging.tiles";
	}

}
