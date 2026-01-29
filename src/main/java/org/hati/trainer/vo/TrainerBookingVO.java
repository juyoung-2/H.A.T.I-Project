package org.hati.trainer.vo;

import java.sql.Date;

public class TrainerBookingVO {
	private int userAccountId;    // 찜 누른 유저
	private int trainerAccountId; // 찜 대상 트레이너
	private Date createdAt;       // 찜 누른 일시
	private String content;       // 찜 누른 이유
	
	public TrainerBookingVO() {}
	
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

    public Date getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(Date createdAt) {
        this.createdAt = createdAt;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }
	
	
}
