package kr.co.bit.cr.image;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ImageDAO {
	@Autowired
	SqlSessionTemplate sqlSession;
	
	public int registerImage(List<ImageVO> images){
		
		int cnt=0;
		for(ImageVO image : images){
			cnt = sqlSession.insert("image.dao.ImageDAO.registerImage", image);
		}
		
		return cnt;
	}
}
