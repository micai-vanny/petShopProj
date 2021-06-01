package com.pet.product.web;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.pet.board.service.BoardService;
import com.pet.board.serviceImpl.BoardServiceImpl;
import com.pet.board.vo.BoardVO;
import com.pet.common.DbCommand;
import com.pet.product.service.ProductService;
import com.pet.product.serviceImpl.ProductServiceImpl;
import com.pet.product.vo.ProductVO;

public class CatProductSelect implements DbCommand {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		String itemCode = request.getParameter("itemCode");
		System.out.println(itemCode);
		ProductVO vo = new ProductVO();
		BoardVO bvo = new BoardVO();
		vo.setItemCode(itemCode);
		bvo.setItemcode(itemCode);
		ProductService service = new ProductServiceImpl();
		BoardService bservice = new BoardServiceImpl();
		
		service.catProductSelect(vo);
		List<BoardVO> list = bservice.selectBoardList(bvo);
		
		request.setAttribute("catProd", vo);
		request.setAttribute("list", list);
		
		return "product/catProductSelect.tiles";
	}

}
