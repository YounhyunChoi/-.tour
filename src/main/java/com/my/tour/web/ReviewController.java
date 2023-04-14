package com.my.tour.web;

import java.io.File;
import java.io.IOException;
import java.time.LocalDate;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.lang.Nullable;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.my.tour.domain.Reservation;
import com.my.tour.domain.Review;
import com.my.tour.domain.ReviewDto;
import com.my.tour.service.ReviewService;

import jakarta.servlet.http.HttpSession;

@RestController
@RequestMapping("review")
public class ReviewController {
	@Autowired private ReviewService reviewService;
	@Value("${attachPath}") private String attachPath;
	
	@GetMapping("my")
	@LoginAccess
	public ModelAndView my(ModelAndView mv, HttpSession session, 
							@Nullable String reviewErrMsg) {
		mv.setViewName("review/myReview");
		
		return mv;
	}
	
	@GetMapping("getMyReviews")
	public List<ReviewDto> getMyReviews(HttpSession session) {
		List<ReviewDto> reviews = reviewService.getMyReviews((String) session.getAttribute("userId"));
		for(ReviewDto review : reviews) {
			if(reviewService.getReviewImages(review.getReviewNum()).size() != 0) {
				review.setReviewImageName(
						reviewService.getReviewImages(review.getReviewNum()).get(0).getReviewImageName());
			}
		}
		
		return reviews;
	}
	
	@GetMapping("getReviewByResv")
	public List<Review> getReviewByResv(int resvNum) {
		return reviewService.getReviews(resvNum);
	}
	
	@GetMapping("add")
	@LoginAccess
	public ModelAndView addReview(ModelAndView mv, HttpSession session, int tourNum, int resvNum) {		
		for(Reservation reservation: 
			reviewService.getReservations((String) session.getAttribute("userId"))) {
			if(reservation.getTourNum() == tourNum && 
					reviewService.getTour(tourNum).get(0).getTourEDate().isBefore(LocalDate.now())) {
				mv.setViewName("review/addReview");
				break;
			}
		}
		
		if(mv.getViewName() == null) {
			mv.setViewName("redirect:/review/my");
			mv.addObject("reviewErrMsg", "작성하려는 리뷰의 여행코스가 예약 내역에 없거나, 여행코스 종료일이 지나지 않았습니다. 다시 확인해주세요.");
		} else if(reviewService.getMyReview((String) session.getAttribute("userId"), tourNum).size() != 0) {
			mv.setViewName("redirect:/review/my");
			mv.addObject("reviewErrMsg", "이미 작성된 여행코스 리뷰입니다.");
		}
		
		return mv;
	}
	
	@PostMapping("add")
	public void addReview(String reviewTitle, String reviewContent, double score,
						HttpSession session, int tourNum, int resvNum) {
		reviewService.addReview(reviewTitle, reviewContent, score,
				(String) session.getAttribute("userId"), tourNum, resvNum);
	}
	
	@PostMapping("addReviewImages")
	public boolean addReviewImages(@RequestParam("reviewImage") List<MultipartFile> reviewImage, HttpSession session) {	
		if(reviewImage.size() > 4) {
			return false;
		} else {
			int reviewNum = reviewService.getMyReviews((String) session.getAttribute("userId")).get(0).getReviewNum();
			String filename = "";
		 
			reviewService.delReviewImage(reviewNum);
		 
			for(MultipartFile multipartfile: reviewImage) {
				filename = "review" + multipartfile.getOriginalFilename();
				if(!filename.equals("review")) {
					saveFile(attachPath + "/" + filename, multipartfile);
					reviewService.addReviewImage(filename, reviewNum);
				}
			}
			
			return true;
		}
	}

   private void saveFile(String filename, MultipartFile file) {
      try {
         file.transferTo(new File(filename));
      } catch(IOException e) {}
   }
	
	@GetMapping("get")
	public ModelAndView getReview(ModelAndView mv) {
		mv.setViewName("review/getReview");
		return mv;
	}
	
	@PostMapping("get")
	public List<Review> getReviews() {
		return reviewService.getReviews();
	}
	
	@GetMapping("fix")
	public ModelAndView fixReview(ModelAndView mv) {
		mv.setViewName("review/fixReview");
		return mv;
	}
	
	@PutMapping("fix")
	public void fixReview(String reviewTitle, String reviewContent, int score) {
		reviewService.fixReview(reviewTitle, reviewContent, score);
	}
	
	@DeleteMapping("del")
	public void delReview(int reviewNum) {
		reviewService.delReview(reviewNum);
	}
}
