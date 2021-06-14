package com.ict.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ict.model.Command;
import com.ict.model.DeleteCommand;
import com.ict.model.DeleteOkCommand;
import com.ict.model.ListCommand;
import com.ict.model.OnelistCommand;
import com.ict.model.UpdateCommand;
import com.ict.model.UpdateOkCommand;
import com.ict.model.WriteCommand;
import com.ict.model.WriteOkCommand;

@WebServlet("/MyController")
public class MyController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		// index에 cmd 파라미터 값 받아오기
		String cmd = request.getParameter("cmd");
		Command comm = null;
		if (cmd.equalsIgnoreCase("list")) {
			comm = new ListCommand();
		} else if (cmd.equalsIgnoreCase("write")) {
			comm = new WriteCommand();
		} else if (cmd.equalsIgnoreCase("write_ok")) {
			comm = new WriteOkCommand();
		} else if (cmd.equalsIgnoreCase("onelist")) {
			comm = new OnelistCommand();
		} else if (cmd.equalsIgnoreCase("update")) {
			comm = new UpdateCommand();
		} else if (cmd.equalsIgnoreCase("update_ok")) {
			comm = new UpdateOkCommand();
		} else if (cmd.equalsIgnoreCase("delete")) {
			comm = new DeleteCommand();
		} else if (cmd.equalsIgnoreCase("delete_ok")) {
			comm = new DeleteOkCommand();
		}
		
		String path = comm.exec(request, response);
		request.getRequestDispatcher(path).forward(request, response);
	}

}

