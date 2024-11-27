package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/productinfo")
public class ProductInfoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String productId = request.getParameter("productId");
		
		
        // 파라미터 유효성 검사
        if (productId == null || productId.trim().isEmpty()) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "상품 ID가 제공되지 않았습니다. servlet");
            return;
        }

        // productId를 요청 속성으로 설정
        request.setAttribute("productId", productId);

		RequestDispatcher rd = request.getRequestDispatcher("/pages/productInfo/productInfo.jsp");
		rd.forward(request,response);
	}
}
