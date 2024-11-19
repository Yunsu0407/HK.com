package controller;

import model.Product;
import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/main")
public class MainServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Product[] products = new Product[9];
		int arr_index = 0;
		int cat_key = 0;
		String cat_name = "top";
		String[] arr_cat_name = { "top", "bottom", "shoes" };

		for (int i = 0; i < 3; ++i) {
			cat_key = cat_key + 1000;
			cat_name = arr_cat_name[i];
			setDummy(arr_index, cat_key, cat_name, products);
			arr_index = arr_index + 3;
		}
		
		request.setAttribute("products", products);
		RequestDispatcher rd = request.getRequestDispatcher("/pages/main/main.jsp");
		rd.forward(request,response);
	}

	protected void setDummy(int arr_index, int cat_key, String name, Product[] products) {
		for (int i = 0; i < 3; ++i) {
			int p_key = cat_key + i;
			String p_name = name + "0" + (i + 1);
			int p_price = 10000 + i * 1000;
			String p_imgUrl = "assets/products/" + name + "/" + p_name + ".png";
			products[arr_index + i] = new Product(p_key, p_name, p_price, p_imgUrl);
		}
	}
}
