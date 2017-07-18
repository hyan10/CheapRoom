package kr.co.bit.cr.hotel;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class HotelDAO {
	@Autowired
	SqlSessionTemplate sqlSession;

	public int registerHotel(HotelVO hotel){
		return sqlSession.insert("hotel.dao.HotelDAO.registerHotel", hotel);
	}
	
	public int updateHotel(HotelVO hotel){
		return sqlSession.update("hotel.dao.HotelDAO.updateHotel",hotel);
	}
	
	public HotelVO selectHotelByNo(HotelVO hotel){
		return sqlSession.selectOne("hotel.dao.HotelDAO.selectHotelByNo", hotel.getNo());
	}
	
	public int deleteHotelByNo(HotelVO hotel){
		return sqlSession.delete("hotel.dao.HotelDAO.deleteHotelByNo", hotel.getNo());
	}
	
	public List<HotelVO> selectHotelByCno(int cNo){
		return sqlSession.selectList("hotel.dao.HotelDAO.selectHotelByCno", cNo);
	}
}
