package com.pet.common;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.pet.member.web.MemberJoin;
import com.pet.member.web.MemberJoinForm;
import com.pet.member.web.MemberLogOut;
import com.pet.member.web.MemberLogin;
import com.pet.member.web.MemberLoginForm;
import com.pet.member.web.MemberMenu;
import com.pet.member.web.MemberWithdrawal;
import com.pet.petTip.web.PetTipDelete;
import com.pet.petTip.web.PetTipForm;
import com.pet.petTip.web.PetTipInsert;
import com.pet.petTip.web.PetTipList;
import com.pet.petTip.web.PetTipListPaging;
import com.pet.petTip.web.PetTipSelect;
import com.pet.petTip.web.PetTipUpdate;
import com.pet.product.web.CatProductList;
import com.pet.product.web.CatProductSelect;
import com.pet.product.web.DogProductList;
import com.pet.product.web.DogProductSelect;

public class FrontController extends HttpServlet {
	
	private HashMap<String, DbCommand> map = new HashMap<>();
	
	@Override
	public void init(ServletConfig config) throws ServletException {
		// 요청페이지 - 실행컨트롤러
		map.put("/index.do", new IndexPage());
		map.put("/memberJoinForm.do", new MemberJoinForm());
		map.put("/memberJoin.do", new MemberJoin());
		map.put("/memberLoginForm.do", new MemberLoginForm());
		map.put("/memberLogin.do", new MemberLogin());
		map.put("/memberLogOut.do", new MemberLogOut());
		map.put("/memberMenu.do", new MemberMenu());
		
		//회원탈퇴
		map.put("/memberWithdrawal.do", new MemberWithdrawal());
		
		// 강아지 상품페이지
		map.put("/dogProductList.do", new DogProductList());
		map.put("/dogProductSelect.do", new DogProductSelect());
		
		// 고양이 상품페이지
		map.put("/catProductList.do", new CatProductList());
		map.put("/catProductSelect.do", new CatProductSelect());
		
		// Pet tip
		map.put("/petTip.do", new PetTipList());
		map.put("/petTipListPaging.do", new PetTipListPaging());
		map.put("/petTipSelect.do", new PetTipSelect());
		map.put("/petTipUpdate.do", new PetTipUpdate());
		map.put("/petTipDelete.do", new PetTipDelete());
		map.put("/petTipInsert.do", new PetTipInsert());
		map.put("/petTipForm.do", new PetTipForm());
	}
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("utf-8");
		resp.setContentType("text/html;charset=utf-8");
		String uri = req.getRequestURI();
		String cpath = req.getContextPath();
		String path = uri.substring(cpath.length());
		DbCommand command = map.get(path);
		String viewPage = command.execute(req, resp);

		RequestDispatcher rd = req.getRequestDispatcher(viewPage);
		rd.forward(req, resp);
	}
}
