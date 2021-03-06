package kr.co.bit.cr.hotel;

import java.math.BigDecimal;
import java.math.BigInteger;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.bit.cr.search.SearchVO;

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
	
	public HotelVO selectHotelByNo(int no){
		return sqlSession.selectOne("hotel.dao.HotelDAO.selectHotelByNo", no);
	}
	public List<HotelVO> selectHotelListByOno(int ownerNo){
		return sqlSession.selectList("hotel.dao.HotelDAO.selectHotelListByOno", ownerNo);
	}
	public int deleteHotelByNo(HotelVO hotel){
		return sqlSession.delete("hotel.dao.HotelDAO.deleteHotelByNo", hotel.getNo());
	}
	
	public List<HotelVO> selectHotelByCno(int cNo){
		return sqlSession.selectList("hotel.dao.HotelDAO.selectHotelByCno", cNo);
	}
	
	public int selectHotelSeq(){
		return sqlSession.selectOne("hotel.dao.HotelDAO.selectHotelSeq");
	}
	
	public Map<Integer, Integer> joinHotelAndBooking(SearchVO search){
		List<Map<String,Integer>> list = new ArrayList<>();
		Map<Integer,Integer> resultMap = new HashMap<>();
		list = sqlSession.selectList("hotel.dao.HotelDAO.joinHotelAndBooking",search);
		System.out.println("list size: "+list.size());
		for(Map<String,Integer> map : list){
			//key hotelNo value count  roomCount = map.get(hotelNo)
			//resultMap.put(map.get(key), roomCount);
			Iterator<String> iterator = map.keySet().iterator();
			int hotelNo=0,roomCount=0;
			
		    iterator.hasNext();
		    String key = (String) iterator.next();
		    System.out.print("key="+key);
		    System.out.println(" value="+map.get(key));
		    hotelNo=Integer.parseInt(String.valueOf(map.get(key)));
		        
		    iterator.hasNext();
		    key = (String) iterator.next();
		    System.out.print("key="+key);
		    System.out.println(" value="+map.get(key));
		    roomCount=Integer.parseInt(String.valueOf(map.get(key)));
		    resultMap.put(hotelNo, roomCount);
		        
		    
		}
		return resultMap;
	}
	
	public List<String> selectHotelNameByOno(int ownerNo){
		return sqlSession.selectList("hotel.dao.HotelDAO.selectHotelNameByOno",ownerNo);
	}
}
