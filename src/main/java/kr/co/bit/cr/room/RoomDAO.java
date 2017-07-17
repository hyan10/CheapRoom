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
		System.out.println("roomDAO");
		System.out.println(room);
		int cnt =sqlSession.insert("room.dao.RoomDAO.registerRoom", room); 
		return cnt;
	}
	
	public int updateRoom(RoomVO room){
		return sqlSession.update("room.dao.RoomDAO.updateRoom", room);
	}
	
	public List<RoomVO> selectRoomByHno(int hNo){
		return sqlSession.selectList("room.dao.RoomDAO.selectRoomByHno",hNo);
	}
}
