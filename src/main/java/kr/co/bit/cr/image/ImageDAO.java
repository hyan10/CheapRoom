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
	
	public int updateImage(List<ImageVO> images){
		
		int cnt=0;
		for(ImageVO image : images){
			cnt = sqlSession.update("image.dao.ImageDAO.updateImage", image);
		}
		
		return cnt;
	}
	
	public List<ImageVO> selectImageByRno(int rNo){
		return sqlSession.selectList("image.dao.ImageDAO.selectImageByRno", rNo);
	}
	
	public int deleteImageByNo(ImageVO image){
		return sqlSession.delete("image.dao.ImageDAO.deleteImageByNo", image);
	}
}
