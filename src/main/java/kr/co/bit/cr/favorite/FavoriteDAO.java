package kr.co.bit.cr.favorite;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.bit.cr.hotel.HotelVO;

@Repository
public class FavoriteDAO {
	@Autowired 
	SqlSessionTemplate sqlSession;
	
	public int insertFavorite(FavoriteVO favorite){
		return sqlSession.insert("favorite.FavoriteDAO.insertFavorite",favorite);
	}

	public int selectFavorite(FavoriteVO favorite){
		return sqlSession.selectOne("favorite.FavoriteDAO.selectFavorite",favorite);
	}
	
	public int deleteFavorite(FavoriteVO favorite){
		return sqlSession.delete("favorite.FavoriteDAO.deleteFavorite",favorite);
	}

	public List<FavoriteVO> favoriteList(Map<String, Object> map) {
		return sqlSession.selectList("favorite.FavoriteDAO.selectFavoriteList",map);
	}

	public List<HotelVO> bookmarkList(Integer no) {
		return sqlSession.selectList("favorite.FavoriteDAO.bookmarkList", no);
	}

	public int deleteFavoriteByUno(Integer no) {
		return sqlSession.delete("favorite.FavoriteDAO.deleteFavoriteByUno",no);
	}
	
}
