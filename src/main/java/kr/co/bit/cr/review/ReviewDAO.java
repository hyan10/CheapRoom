package kr.co.bit.cr.review;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ReviewDAO {
	@Autowired
	SqlSessionTemplate sqlSession;
	
	public int registerReview(ReviewVO reviewVO){
		return sqlSession.insert("review.dao.ReviewDAO.registerReview", reviewVO);
	}
	public List<ReviewVO> selectReviewByUno(int userNo){
		return sqlSession.selectList("review.dao.ReviewDAO.selectReviewByUno", userNo);
	}
}
