package org.hati.trainer.vo;

import java.sql.Date;

/**
 * TrainerVO
 * - accounts 테이블 기반
 * - 트레이너 계정의 기본 정보만 담는 공용 VO
 */
public class TrainerVO {
	
	private int accountId;    // 계정 고유 번호
    private String name;      // 트레이너 이름
    private String region;    // 활동 지역
    private String roleType;  // 역할 타입(TRAINER)
    private String status;    // 계정 상태(ACTIVE / SUSPENDED / DELETED)

    private Date createdAt;   // 계정 생성일
    
    public TrainerVO() {}
    
    public int getAccountId() {
        return accountId;
    }

    public void setAccountId(int accountId) {
        this.accountId = accountId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getRegion() {
        return region;
    }

    public void setRegion(String region) {
        this.region = region;
    }

    public String getRoleType() {
        return roleType;
    }

    public void setRoleType(String roleType) {
        this.roleType = roleType;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public Date getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(Date createdAt) {
        this.createdAt = createdAt;
    }
    
}
