package org.hati.trainer.vo;

/**
 * TrainerSummaryVO
 * - 트레이너 목록, 검색, 인기 트레이너 화면용 VO
 * - 여러 테이블 JOIN 결과를 담는다
 */
public class TrainerSummaryVO {

	private int trainerAccountId;  // 트레이너 계정 고유 번호
	private String name;           // 트레이너 이름
	private String region;         // 활동 지역
	private int minPrice;          // 최저가
	private int bookmarkCount;     // 트레이너 찜 수
	private boolean bookmarked;    // 로그인 유저 기준 찜 여부
	
	public TrainerSummaryVO() {}
	
	public int getTrainerAccountId() {
        return trainerAccountId;
    }

    public void setTrainerAccountId(int trainerAccountId) {
        this.trainerAccountId = trainerAccountId;
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

    public int getMinPrice() {
        return minPrice;
    }

    public void setMinPrice(int minPrice) {
        this.minPrice = minPrice;
    }

    public int getBookmarkCount() {
        return bookmarkCount;
    }

    public void setBookmarkCount(int bookmarkCount) {
        this.bookmarkCount = bookmarkCount;
    }

    public boolean isBookmarked() {
        return bookmarked;
    }

    public void setBookmarked(boolean bookmarked) {
        this.bookmarked = bookmarked;
    }
}
