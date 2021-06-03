package com.pet.product.web;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.pet.board.serviceImpl.BoardServiceImpl;
import com.pet.board.vo.BoardVO;
import com.pet.common.DbCommand;
import com.pet.common.Paging;
import com.pet.product.service.ProductService;
import com.pet.product.serviceImpl.ProductServiceImpl;
import com.pet.product.vo.ProductVO;

public class DogProductSelect implements DbCommand {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		String itemCode = request.getParameter("itemCode");
		String page = request.getParameter("page");
		
		ProductVO vo = new ProductVO();
		BoardVO bvo = new BoardVO();
		
		if(page == null) {
			page="1";
		}
		int pageCnt = Integer.parseInt(page);
		
		vo.setItemCode(itemCode);
		bvo.setItemcode(itemCode);
		
		ProductService service = new ProductServiceImpl();
		BoardServiceImpl bservice = new BoardServiceImpl();
		
		service.dogProductSelect(vo);
		List<BoardVO> total = bservice.selectBoardList(bvo);
		bservice = new BoardServiceImpl();
		List<BoardVO> list = bservice.boardPaging(pageCnt, itemCode);
		
		Paging paging = new Paging();
		paging.setPageNo(pageCnt);
		paging.setPageSize(5);
		paging.setTotalCount(total.size());
		
		request.setAttribute("list", list);
		request.setAttribute("paging", paging);		
		request.setAttribute("dogProd", vo);
		
		return "product/dogProductSelect.tiles";
	}

}
