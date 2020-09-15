package com.runoob.test;


import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Word.Lianjie;
import Word.WordTest4;

/**
 * Servlet implementation class HelloServlet
 */
//@WebServlet("/HelloServlet")
public class PinlvServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PinlvServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<List<String>> list1=(List<List<String>>)request.getAttribute("list1");
		if(list1!=null)
		{
			Lianjie.getInstance().selectPinlv(list1);
			System.out.println("hello");
			request.setAttribute("list", list1);
			
		}
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