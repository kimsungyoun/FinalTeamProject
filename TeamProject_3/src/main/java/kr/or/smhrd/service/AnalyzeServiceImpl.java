package kr.or.smhrd.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.smhrd.dao.AnalyzeDAO;
import kr.or.smhrd.dao.GameDAO;
import kr.or.smhrd.dto.AnalyzeDTO;
import kr.or.smhrd.dto.GameDTO;
import kr.or.smhrd.dto.PagingDTO;

@Service
public class AnalyzeServiceImpl implements AnalyzeService {
	@Autowired
	AnalyzeDAO dao;

	@Override
	public List<AnalyzeDTO> getList() {
		// TODO Auto-generated method stub
		return dao.getList();
	}

}