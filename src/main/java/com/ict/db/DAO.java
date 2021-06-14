package com.ict.db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

public class DAO {
	private static SqlSession ss;
	private synchronized static SqlSession getSession() {
		if (ss == null) {
			// ss = DBService.getFactory().openSession();
			// ss = DBService.getFactory().openSession(true);
			ss = DBService.getFactory().openSession(false); // 수동Commit();
		}
		return ss;
	}
	
	// 방명록 목록 List
	// 파라미터값 없음
	public static List<VO> getSelectAll() {
		List<VO> list = new ArrayList<VO>();
		list = getSession().selectList("list");
		return list;
	}

	public static VO getSelectOne(String idx) {
		VO vo = null;
		vo = getSession().selectOne("onelist", idx);
		return vo;
	}
	
	// 방명록 데이터 삽입
	public static int getInsert(VO vo) {
		int result = 0;
		result = getSession().insert("insert", vo);
		ss.commit();
		return result;
	}
	
	public static int getUpdate(VO vo) {
		int result = 0;
		result = getSession().update("update", vo);
		ss.commit();
		return result;
	}
	
	
	public static int getDelete(VO vo) {
		int result = 0;
		result = getSession().delete("delete", vo);
		ss.commit();
		return result;
		
	}
}
