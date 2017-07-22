package kr.co.bit.cr.owner;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class OwnerService {
	@Autowired
	OwnerDAO dao;
	
	public void join(OwnerVO ownerVO){
		dao.join(ownerVO);
	}
	public OwnerVO login(OwnerVO ownerVO){
		return dao.login(ownerVO); 
	}
	
	public List<OwnerVO> selectOwnerByType(String type){
		return dao.selectOnwerByType(type);
	}
	
	public int updateOnwerType(int ownerNo){
		return dao.updateOnwerType(ownerNo);
	}
}
