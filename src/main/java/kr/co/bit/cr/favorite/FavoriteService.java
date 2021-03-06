package kr.co.bit.cr.favorite;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.bit.cr.hotel.HotelVO;
import kr.co.bit.cr.user.UserVO;

@Service
public class FavoriteService {
	@Autowired
	private FavoriteDAO dao;
	
	public String Favorite(FavoriteVO favorite){
		int cnt = dao.selectFavorite(favorite);
		String msg="";
		if(cnt==0){
			if(dao.insertFavorite(favorite)==1){
				msg="Y";
			}else{
				msg=null;
			}
			
		}else{
			if(dao.deleteFavorite(favorite)==1){
				msg="N";
			}else{
				msg=null;
			}
		}
		return msg;
	}

	public List<HotelVO> bookmarkList(Integer no) {
		return dao.bookmarkList(no);
		
	}

	public int Cancel(FavoriteVO favoriteVO) {
		return dao.deleteFavorite(favoriteVO);
	}


}
