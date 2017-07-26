package kr.co.bit.cr.room;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
	
	public List<RoomVO> joinRoomAndBooking(Map<String,Object> map){
		//sqlSession.selectMap("room.dao.RoomDAO.joinRoomAndBooking", "r.hotel_no", "roomCount");
		//return sqlSession.select("room.dao.RoomDAI.joinRoomAndBooking");
		//map으로 조인결과를 받음.각 호텔의 예약된 방의 개수
		return sqlSession.selectList("room.dao.RoomDAO.joinRoomAndBooking", map);
	}
	
	public int selectRoomSeq(){
		return sqlSession.selectOne("room.dao.RoomDAO.selectRoomSeq");
	}
	
	public RoomVO selectRoomByNo(int no){
		return sqlSession.selectOne("room.dao.RoomDAO.selectRoomByNo",no);
	}

	public List<RoomVO> selectRoomByMap(Map<String, Object> paramMap) {
		return sqlSession.selectList("room.dao.RoomDAO.selectRoomByMap",paramMap);
	}
}
