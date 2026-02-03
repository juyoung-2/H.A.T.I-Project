package org.hati.trainer.service;

import java.util.List;

import org.hati.trainer.mapper.TrainerMapper;
import org.hati.trainer.vo.TrainerSearchConditionVO;
import org.hati.trainer.vo.TrainerSummaryVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class TrainerServiceImpl implements TrainerService{
	
	@Autowired
	private TrainerMapper trainerMapper;

	@Override
	public List<TrainerSummaryVO> getPopularTrainers(Integer loginAccountId) {
		 TrainerSearchConditionVO condition = new TrainerSearchConditionVO();
	        condition.setLoginAccountId(loginAccountId);

	        // 인기 트레이너는 고정 노출
	        condition.setOffset(0);
	        condition.setLimit(6);

	        return trainerMapper.selectPopularTrainers(condition);
	}

	@Override
	public List<TrainerSummaryVO> getMatchedTrainers(Integer loginAccountId) {
		TrainerSearchConditionVO condition = new TrainerSearchConditionVO();
        condition.setLoginAccountId(loginAccountId);

        // 맞춤 트레이너도 고정 노출
        condition.setOffset(0);
        condition.setLimit(6);

        return trainerMapper.selectMatchedTrainers(condition);
	}

	@Override
	public List<TrainerSummaryVO> searchTrainers(TrainerSearchConditionVO condition) {
		// 방어 코드 (limit 안 넘어왔을 때)
        if (condition.getLimit() == 0) {
            condition.setLimit(12);
        }

        return trainerMapper.selectTrainerList(condition);
	}

    @Transactional
	@Override
	public void toggleBookmark(int accountId, int trainerAccountId) {
    	// 먼저 현재 찜 상태 확인
        int exists = trainerMapper.existsTrainerBookmark(accountId, trainerAccountId);

        if (exists == 1) {
        	// 이미 찜 되어 있으면 삭제(찜 취소) 
            trainerMapper.deleteTrainerBookmark(accountId, trainerAccountId);
        } else {
        	// 안 되어 있으면 추가 (찜)
            trainerMapper.insertTrainerBookmark(accountId, trainerAccountId);
        }
		
	}
	
	
}
