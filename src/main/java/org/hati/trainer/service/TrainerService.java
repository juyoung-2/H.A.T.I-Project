package org.hati.trainer.service;

import java.util.List;

import org.hati.trainer.vo.TrainerSearchConditionVO;
import org.hati.trainer.vo.TrainerSummaryVO;

public interface TrainerService {
	
	// 검색 전
    List<TrainerSummaryVO> getPopularTrainers(Integer loginAccountId);  // 인기 트레이너
    List<TrainerSummaryVO> getMatchedTrainers(Integer loginAccountId);  // 맞춤 트레이너

    // 검색 후
    List<TrainerSummaryVO> searchTrainers(TrainerSearchConditionVO condition);

    // 찜
    void toggleBookmark(int accountId, int trainerAccountId);
	
}
