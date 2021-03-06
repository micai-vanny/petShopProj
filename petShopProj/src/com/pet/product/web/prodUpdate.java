package com.pet.product.web;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Enumeration;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.pet.common.DbCommand;
import com.pet.product.service.ProductService;
import com.pet.product.serviceImpl.ProductServiceImpl;
import com.pet.product.vo.ProductVO;

public class prodUpdate implements DbCommand {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		response.setCharacterEncoding("UTF-8");
		
		int size = 10 * 1024 * 1024;
		String path = "c:/tmp";
						//  ┌> request로 넘어오니까 이렇게
		ServletContext sc = request.getServletContext();
		path = sc.getRealPath("upload"); // 서버 상의 경로

		System.out.println("hhhh: " + path);
		String fileName = "";

		MultipartRequest multi = null;

		try {
			multi = new MultipartRequest(request, path, size, "utf-8", new DefaultFileRenamePolicy());

			Enumeration files = multi.getFileNames();
			// item image가 input type file로 넘어오기 때문에 여기서 함 처리해줌.
			while (files.hasMoreElements()) {
				String itemImage = (String) files.nextElement();
				fileName = multi.getFilesystemName(itemImage);
				// fileName에 itemImage값이 들어가있다.
				System.out.println("fileName: " + fileName);
			}

		} catch (IOException e) {
			e.printStackTrace();
		}
		
		String itemCode = multi.getParameter("itemCode");
		String sale = multi.getParameter("sale");
		String itemName= multi.getParameter("itemName");
		String salePrice = multi.getParameter("salePrice");
		String price = multi.getParameter("price");
		String itemDesc = multi.getParameter("itemDesc");

		// DB 가즈아
		ProductVO vo = new ProductVO();
		vo.setItemCode(itemCode);
		vo.setSale(sale);
		vo.setItemName(itemName);
		vo.setSalePrice(Integer.parseInt(salePrice));
		vo.setPrice(Integer.parseInt(price));
		vo.setItemDesc(itemDesc);
		vo.setItemImage(fileName);
		
		ProductService service = new ProductServiceImpl();
		int up = service.updateProduct(vo);
		
		String go = "";

		if (up > 0) {
			if(itemCode.startsWith("c")) {	// itemCode가 c로 시작하면
				go = "/catProductList.do";	// 고양이 상품 목록 반환
			} else {
				go = "/dogProductList.do";
			}
		} else {
			PrintWriter script;
			try {
				script = response.getWriter();
				script.println("<script>");
				script.println("window.alert('수정에 실패했습니다.')");
				script.println("history.go(-1)");
				script.println("</script>");
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		return go;
	}

}
