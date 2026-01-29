package org.hati.trainer.service;

import java.util.List;

public interface TrainerService {
	
	List<TrainerVO> getPopularTrainers(int);   // 검색 전 : 인기 트레이너 목록 조회
	List<TrainerVO> getRecommendedTrainers();  // 검색 전 : 추천 트레이너 목록 조회
	List<TrainerVO> searchTrainers();          // 검색 후 : 조건에 맞는 트레이너 목록 조회(무한 스크롤)
	void addTrainerBookmark(int userAccountId, int trainerAccountId, String content); // 트레이너 찜하기
    void removeTrainerBookmark(int userAccountId, int trainerAccountId);              // 트레이너 찜 취소
    boolean isTrainerBookmarked(int userAccountId, int trainerAccountId);             // 찜 여부
	
	
}
