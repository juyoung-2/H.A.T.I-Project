package org.hati.trainer.vo;

public class TrainerPassProductVO {
	private int productId;    // 가격 번호
	private int accountId;    // 트레이너 계정 ID
	private int sportId;      // 종류 번호
	private int totalCount;   // 횟수
	private int price;        // 가격
	private int baseFee;      // 방 가격
	
	public TrainerPassProductVO() {}
	
	public int getProductId() {
        return productId;
    }

    public void setProductId(int productId) {
        this.productId = productId;
    }

    public int getAccountId() {
        return accountId;
    }

    public void setAccountId(int accountId) {
        this.accountId = accountId;
    }

    public int getSportId() {
        return sportId;
    }

    public void setSportId(int sportId) {
        this.sportId = sportId;
    }

    public int getTotalCount() {
        return totalCount;
    }

    public void setTotalCount(int totalCount) {
        this.totalCount = totalCount;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public int getBaseFee() {
        return baseFee;
    }

    public void setBaseFee(int baseFee) {
        this.baseFee = baseFee;
    }
}
