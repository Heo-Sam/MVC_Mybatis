package com.ict.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ict.db.DAO;
import com.ict.db.VO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class WriteOkCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {

		try {
			
			String path = request.getServletContext().getRealPath("/upload");
			
			MultipartRequest mr =
					new MultipartRequest(request, path, 100*1024*1024, "UTF-8", new DefaultFileRenamePolicy());
			
			VO vo = new VO();
			
			vo.setName(mr.getParameter("name"));
			vo.setSubject(mr.getParameter("subject"));
			vo.setContent(mr.getParameter("content"));
			vo.setEmail(mr.getParameter("email"));
			vo.setPwd(mr.getParameter("pwd"));
			
			// 첨부파일이 있을 때와 없을 때를 구분해야 함
			if(mr.getFile("f_name") != null) {
				vo.setF_name(mr.getFilesystemName("f_name"));
			} else {
				vo.setF_name("");
			}
			
			int result = DAO.getInsert(vo);
			if(result>0){
				// response.sendRedirect("list.jsp");
				return "MyController?cmd=list";
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		
		return null;
	}
}
