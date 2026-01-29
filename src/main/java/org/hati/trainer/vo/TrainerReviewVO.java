package org.hati.trainer.vo;

import java.sql.Date;

public class TrainerReviewVO {
	private int userAccountId;        // 리뷰 작성자
	private int trainerAccountId;     // 리뷰 대상 트레이너
	private String content;           // 리뷰 내용
	private Date createdAt;           // 리뷰 작성 날짜
	private Date updatedAt;           // 리뷰 수정 날짜
	
	public TrainerReviewVO() {}
	
	public int getUserAccountId() {
        return userAccountId;
    }

    public void setUserAccountId(int userAccountId) {
        this.userAccountId = userAccountId;
    }

    public int getTrainerAccountId() {
        return trainerAccountId;
    }

    public void setTrainerAccountId(int trainerAccountId) {
        this.trainerAccountId = trainerAccountId;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Date getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(Date createdAt) {
        this.createdAt = createdAt;
    }

    public Date getUpdatedAt() {
        return updatedAt;
    }

    public void setUpdatedAt(Date updatedAt) {
        this.updatedAt = updatedAt;
    }
	
}
