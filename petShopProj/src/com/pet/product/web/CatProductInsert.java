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

public class CatProductInsert implements DbCommand {

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
		//                ┌> multi로 처리되기 때문에 request 아니고 multi
		String divCode = multi.getParameter("divCode");
		String itemName = multi.getParameter("itemName");
		String itemCode = multi.getParameter("itemCode");
		String price = multi.getParameter("price");
		String sale = multi.getParameter("sale");
		String stock = multi.getParameter("stock");
		String itemDesc = multi.getParameter("itemDesc");

		// DB에 넣어주는 작업 ㄱㄱ
		ProductVO vo = new ProductVO();
		vo.setDivCode(divCode);
		vo.setItemCode(itemCode);
		vo.setItemDesc(itemDesc);
		vo.setItemImage(fileName);	// 위에도 설명해놓았지만 더 설명함. fileName에 itemImage값 들어가있음.
		vo.setPrice(Integer.parseInt(price));
		vo.setSale(sale);
		vo.setStock(Integer.parseInt(stock));
		vo.setItemName(itemName);

		System.out.println(vo);

		ProductService service = new ProductServiceImpl();
		int in = service.insertProduct(vo);

		String go = "";

		if (in > 0) {
			go = "/catProductList.do";
		} else {
			PrintWriter script;
			try {
				script = response.getWriter();
				script.println("<script>");
				script.println("window.alert('등록에 실패했습니다.')");
				script.println("history.go(-1)");
				script.println("</script>");
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		return go;
	}

}
