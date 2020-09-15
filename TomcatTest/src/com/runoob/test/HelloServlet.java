package com.runoob.test;

import java.io.IOException;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Word.WordTest4;

/**
 * Servlet implementation class HelloServlet
 */
//@WebServlet("/HelloServlet")
public class HelloServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public HelloServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html;charset=utf-8");
		//解决请求过来的数据乱码
		request.setCharacterEncoding("utf-8");
		// 获取请求过来的参数
		String content = request.getParameter("content");
		WordTest4 wordTest4 =new WordTest4(content);
		Map<String,Integer> map=wordTest4.getMap();
		request.getSession().setAttribute("map", map);
		//request.setAttribute("map", map);
		request.getRequestDispatcher("/test.jsp").forward(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpspServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
