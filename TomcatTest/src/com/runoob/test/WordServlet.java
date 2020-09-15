package com.runoob.test;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Word.Lianjie;
import Word.WordTest4;

/**
 * Servlet implementation class HelloServlet
 */
//@WebServlet("/HelloServlet")
public class WordServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public WordServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Map<String,Integer> map=(Map<String,Integer>)request.getSession().getAttribute("map");
		if(map!=null)
		{
			Lianjie.getInstance().save(map);
			
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