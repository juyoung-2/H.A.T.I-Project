package org.hati.trainer.mapper;

import java.util.List;

import org.hati.trainer.vo.TrainerSearchConditionVO;
import org.hati.trainer.vo.TrainerSummaryVO;

public interface TrainerMapper {

	// 검색 전
    List<TrainerSummaryVO> selectPopularTrainers(TrainerSearchConditionVO condition); // 인기 트레이너
    List<TrainerSummaryVO> selectMatchedTrainers(TrainerSearchConditionVO condition); // 맞춤 트레이너

    // 검색 후 (필터 + 무한스크롤)
    List<TrainerSummaryVO> selectTrainerList(TrainerSearchConditionVO condition);

    // 찜 토글
    int insertTrainerBookmark(int accountId, int trainerAccountId);
    int deleteTrainerBookmark(int accountId, int trainerAccountId);
    int existsTrainerBookmark(int accountId, int trainerAccountId);
}
