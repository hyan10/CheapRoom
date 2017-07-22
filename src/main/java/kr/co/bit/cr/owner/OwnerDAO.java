package kr.co.bit.cr.owner;

import java.util.List;

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
	
	public List<OwnerVO> selectOnwerByType(String type){
		return sqlSessionTemplate.selectList("owner.dao.OwnerDAO.selectOnwerByType",type);
	}
	
	public int updateOnwerType(int ownerNo){
		return sqlSessionTemplate.update("owner.dao.OwnerDAO.updateOnwerType", ownerNo);
	}
}
