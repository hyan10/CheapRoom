package kr.co.bit.cr.hotel;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class HotelDAO {
	@Autowired
	SqlSessionTemplate sqlSession;

	/**
	 * 호텔 등록
	 * @param hotel
	 * @return
	 */
	public int registerHotel(HotelVO hotel){
		return sqlSession.insert("hotel.dao.HotelDAO.registerHotel", hotel);
	}
}
