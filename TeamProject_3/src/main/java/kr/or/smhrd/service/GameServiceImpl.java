package kr.or.smhrd.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.smhrd.dao.GameDAO;
import kr.or.smhrd.dao.SampleDAO;
import kr.or.smhrd.dto.GameDTO;
import kr.or.smhrd.dto.PagingDTO;
import kr.or.smhrd.dto.SampleDTO;

@Service
public class GameServiceImpl implements GameService {
	@Autowired
	GameDAO dao;

	@Override
	public List<GameDTO> getList() {
		// TODO Auto-generated method stub
		return dao.getList();
	}

	@Override
	public List<GameDTO> resetList() {
		// TODO Auto-generated method stub
		return dao.resetList();
	}

	@Override
	public GameDTO getView(int g_no) {
		// TODO Auto-generated method stub
		return dao.getView(g_no);
	}


}
