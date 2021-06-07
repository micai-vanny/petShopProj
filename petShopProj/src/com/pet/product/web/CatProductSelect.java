package com.pet.product.web;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.pet.board.service.BoardService;
import com.pet.board.serviceImpl.BoardServiceImpl;
import com.pet.board.vo.BoardVO;
import com.pet.cart.serviceImpl.CartServiceImpl;
import com.pet.cart.vo.CartVO;
import com.pet.common.DbCommand;
import com.pet.common.Paging;
import com.pet.product.service.ProductService;
import com.pet.product.serviceImpl.ProductServiceImpl;
import com.pet.product.vo.ProductVO;

public class CatProductSelect implements DbCommand {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		
		String id = (String) session.getAttribute("id");
		String itemCode = request.getParameter("itemCode");
		String page = request.getParameter("page");

		System.out.println(id);
		ProductVO vo = new ProductVO();
		CartVO cvo = new CartVO();
		BoardVO bvo = new BoardVO();
		
		if(page == null) {
			page="1";
		}
		int pageCnt = Integer.parseInt(page);
		
		vo.setItemCode(itemCode);
		bvo.setItemcode(itemCode);
		cvo.setItemCode(itemCode);
		cvo.setUserId(id);
		
		ProductService service = new ProductServiceImpl();
		BoardServiceImpl bservice = new BoardServiceImpl();
		CartServiceImpl cservice = new CartServiceImpl();
		
		CartVO cvo2 = cservice.selectCartMember(cvo);
		
		service.catProductSelect(vo);
		List<BoardVO> total = bservice.selectBoardList(bvo);
		bservice = new BoardServiceImpl();
		List<BoardVO> list = bservice.boardPaging(pageCnt, itemCode);
		
		Paging paging = new Paging();
		paging.setPageNo(pageCnt);
		paging.setPageSize(5);
		paging.setTotalCount(total.size());
		
		String path= "";
		
		if(cvo2 == null) {
			request.setAttribute("catProd", vo);
			request.setAttribute("list", list);
			request.setAttribute("paging", paging);	
			path =  "catProducttiles.do";
		} else {
			request.setAttribute("cart", cvo);
			request.setAttribute("catProd", vo);
			request.setAttribute("list", list);
			request.setAttribute("paging", paging);	
			path = "catProducttiles.do";
		}
		
		return path;
	}

}
