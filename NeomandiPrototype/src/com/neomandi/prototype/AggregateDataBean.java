package com.neomandi.prototype;

public class AggregateDataBean {
	
	private long aadharnumber;
	private int bidprice;
	private int quantityneeded;
	private String rgBid;
	public long getAadharnumber() {
		return aadharnumber;
	}
	public void setAadharnumber(long aadharnumber) {
		this.aadharnumber = aadharnumber;
	}
	public int getBidprice() {
		return bidprice;
	}
	public void setBidprice(int bidprice) {
		this.bidprice = bidprice;
	}
	public int getQuantityneeded() {
		return quantityneeded;
	}
	public void setQuantityneeded(int quantityneeded) {
		this.quantityneeded = quantityneeded;
	}
	public String getRgBid() {
		return rgBid;
	}
	public void setRgBid(String rgBid) {
		this.rgBid = rgBid;
	}
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + (int) (aadharnumber ^ (aadharnumber >>> 32));
		result = prime * result + bidprice;
		result = prime * result + quantityneeded;
		result = prime * result + ((rgBid == null) ? 0 : rgBid.hashCode());
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
		AggregateDataBean other = (AggregateDataBean) obj;
		if (aadharnumber != other.aadharnumber)
			return false;
		if (bidprice != other.bidprice)
			return false;
		if (quantityneeded != other.quantityneeded)
			return false;
		if (rgBid == null) {
			if (other.rgBid != null)
				return false;
		} else if (!rgBid.equals(other.rgBid))
			return false;
		return true;
	}
	@Override
	public String toString() {
		return "AggregateDataBean [aadharnumber=" + aadharnumber + ", bidprice=" + bidprice + ", quantityneeded="
				+ quantityneeded + ", rgBid=" + rgBid + "]";
	}
	
	
	
}
