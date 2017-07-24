package kr.co.bit.cr.review;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ReviewService {
	@Autowired
	ReviewDAO dao;
	
	public int registerReview(ReviewVO reviewVO){
		System.out.println(reviewVO);
		return 0;//dao.registerReview(reviewVO);
	}
	public List<ReviewVO> userReviewList(int userNo){
		return dao.selectReviewByUno(userNo);
	}
	
}
