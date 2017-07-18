package kr.co.bit.cr.owner;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class OwnerDAO {
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	public void join(OwnerVO ownerVO){
		sqlSessionTemplate.insert("owner.dao.OwnerDAO.insertOwner", ownerVO);
	}
	public OwnerVO login(OwnerVO ownerVO){
		return sqlSessionTemplate.selectOne("owner.dao.OwnerDAO.loginOwner", ownerVO);
	}
}
