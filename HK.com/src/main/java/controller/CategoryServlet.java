package controller;

import model.Product;
import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/category")
public class CategoryServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String category = request.getParameter("category");

		if (category == null || category.isEmpty()) {
			category = "top";
		}

		Product[] products = new Product[6];
		
		fakeQueryCategoryData(category, products);
		
		request.setAttribute("current_category", category);
		request.setAttribute("products", products);
		RequestDispatcher rd = request.getRequestDispatcher("/pages/category/category.jsp");
		rd.forward(request, response);
	}

	protected void fakeQueryCategoryData(String category, Product[] products) {
		// 원래는 category를 이용해 정보를 가져와야함
		int def_key;
		if(category == "top") {
			def_key = 1000;
		} else if(category == "bottom") {
			def_key = 2000;
		} else if(category == "shoes") {
			def_key = 3000;
		} else {
			def_key = 1000;
		}
		
		for(int i = 0; i < 6; ++i) {
			int prd_key = def_key + i;
			String prd_name = category + "0" + (i + 1);
			int prd_price = 10000 + i * 1000;
			String prd_imgUrl = "assets/products/" + category + "/" + prd_name + ".png";
			products[i] = new Product(prd_key, prd_name, prd_price, prd_imgUrl);
		}
	}
}
