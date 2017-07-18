package kr.co.bit.cr.room;


import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class RoomDAO {
	@Autowired
	SqlSessionTemplate sqlSession;
	
	public int registerRoom(RoomVO room){
		return sqlSession.insert("room.dao.RoomDAO.registerRoom", room); 
	}
	
	public int updateRoom(RoomVO room){
		return sqlSession.update("room.dao.RoomDAO.updateRoom", room);
	}
	
	public List<RoomVO> selectRoomByHno(int hNo){
		return sqlSession.selectList("room.dao.RoomDAO.selectRoomByHno",hNo);
	}
	
	public int deleteRoomByNo(RoomVO room){
		return sqlSession.delete("room.dao.RoomDAO.deleteRoomByNo", room.getNo());
	}
}
