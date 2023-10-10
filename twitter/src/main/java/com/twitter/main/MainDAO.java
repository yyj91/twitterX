package com.twitter.main;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("mainDAO")
public class MainDAO {

	@Autowired
	private SqlSession sqlSession;
	
	
	
	public void write(MainDTO dto) {
	
	  sqlSession.insert("main.write", dto);
		
	}

	public List<MainDTO> mainList(){
		return sqlSession.selectList("main.mainList");
		
	}

	public Map<String, Object> detail(int tno) {
		
		return sqlSession.selectOne("main.detail2", tno);
	}

	public void delete(MainDTO dto) {
		
		sqlSession.update("main.delete", dto);
	}

	public void edit(MainDTO dto) {
		sqlSession.update("main.edit", dto);
		
	}

	public int likeup(int tno) {
		return sqlSession.update("main.likeup", tno);
	}
	public int hateup(int tno) {
		return sqlSession.update("main.hateup", tno);
	}
	
	
	
public int cdel(Map<String, Object> map) {
		
		return sqlSession.update("main.cdel", map);
	}

	public int cedit(Map<String, Object> map) {
		
		return sqlSession.update("main.cedit", map);
	}

	public List<MainDTO> commentList(int tno) {
		
		return sqlSession.selectList("main.commentList", tno);
	}
	
	
}
