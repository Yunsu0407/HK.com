package controller;

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
			category = "상의";
		}
		
		request.setAttribute("current_category", category);
		RequestDispatcher rd = request.getRequestDispatcher("/pages/category/category.jsp");
		rd.forward(request, response);
	}
}
