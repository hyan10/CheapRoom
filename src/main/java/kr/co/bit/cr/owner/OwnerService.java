package kr.co.bit.cr.owner;

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
}
