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
		return dao.selectOwnerByType(type);
	}
	
	public int updateOwnerType(int ownerNo){
		return dao.updateOwnerType(ownerNo);
	}
	
	public int deleteOwnerByNo(int ownerNo){
		return dao.deleteOwnerByNo(ownerNo);
	}
}
