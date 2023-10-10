package com.twitter.main;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("mainService")
public class MainService {

	@Autowired
	private MainDAO mainDAO;

	public void write(MainDTO dto) {

		mainDAO.write(dto);
	}

	public List<MainDTO> mainList() {

		return mainDAO.mainList();
	}

	public Map<String, Object> detail(int tno) {

		return mainDAO.detail(tno);
	}

	public void delete(MainDTO dto) {

		mainDAO.delete(dto);

	}

	public void edit(MainDTO dto) {
		mainDAO.edit(dto);
	}

	public int likeup(int tno) {

		return mainDAO.likeup(tno);
	}
	
	public int hateup(int tno) {

		return mainDAO.hateup(tno);
	}

	public int cdel(Map<String, Object> map) {
		
		return mainDAO.cdel(map);
	}

	public int cedit(Map<String, Object> map) {
		
		return mainDAO.cedit(map);
	}

	public List<MainDTO> commentList(int tno) {
		
		return mainDAO.commentList(tno);
	}
	
	

}
