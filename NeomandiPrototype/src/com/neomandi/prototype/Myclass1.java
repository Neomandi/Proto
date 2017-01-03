package com.neomandi.prototype;

public class Myclass1 {

	String bidprice;
	String lotcost;
	String marketcess;
	String commission; 
	String myfinalcost;
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((bidprice == null) ? 0 : bidprice.hashCode());
		result = prime * result + ((commission == null) ? 0 : commission.hashCode());
		result = prime * result + ((lotcost == null) ? 0 : lotcost.hashCode());
		result = prime * result + ((marketcess == null) ? 0 : marketcess.hashCode());
		result = prime * result + ((myfinalcost == null) ? 0 : myfinalcost.hashCode());
		return result;
	}
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Myclass1 other = (Myclass1) obj;
		if (bidprice == null) {
			if (other.bidprice != null)
				return false;
		} else if (!bidprice.equals(other.bidprice))
			return false;
		if (commission == null) {
			if (other.commission != null)
				return false;
		} else if (!commission.equals(other.commission))
			return false;
		if (lotcost == null) {
			if (other.lotcost != null)
				return false;
		} else if (!lotcost.equals(other.lotcost))
			return false;
		if (marketcess == null) {
			if (other.marketcess != null)
				return false;
		} else if (!marketcess.equals(other.marketcess))
			return false;
		if (myfinalcost == null) {
			if (other.myfinalcost != null)
				return false;
		} else if (!myfinalcost.equals(other.myfinalcost))
			return false;
		return true;
	}
	@Override
	public String toString() {
		return "Myclass1 [bidprice=" + bidprice + ", lotcost=" + lotcost + ", marketcess=" + marketcess
				+ ", commission=" + commission + ", myfinalcost=" + myfinalcost + "]";
	}
	public String getBidprice() {
		return bidprice;
	}
	public void setBidprice(String bidprice) {
		this.bidprice = bidprice;
	}
	public String getLotcost() {
		return lotcost;
	}
	public void setLotcost(String lotcost) {
		this.lotcost = lotcost;
	}
	public String getMarketcess() {
		return marketcess;
	}
	public void setMarketcess(String marketcess) {
		this.marketcess = marketcess;
	}
	public String getCommission() {
		return commission;
	}
	public void setCommission(String commission) {
		this.commission = commission;
	}
	public String getMyfinalcost() {
		return myfinalcost;
	}
	public void setMyfinalcost(String myfinalcost) {
		this.myfinalcost = myfinalcost;
	} 
}
