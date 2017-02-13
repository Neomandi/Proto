package com.neomandi.prototype;

public class TraderPostAuctionBean {
	private String aadharnumber;
	private String lotnum;
	private String quantityassigned;
	
	public String getAadharnumber() {
		return aadharnumber;
	}
	public void setAadharnumber(String aadharnumber) {
		this.aadharnumber = aadharnumber;
	}
	public String getLotnum() {
		return lotnum;
	}
	public void setLotnum(String lotnum) {
		this.lotnum = lotnum;
	}
	public String getQuantityassigned() {
		return quantityassigned;
	}
	public void setQuantityassigned(String quantityassigned) {
		this.quantityassigned = quantityassigned;
	}
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((aadharnumber == null) ? 0 : aadharnumber.hashCode());
		result = prime * result + ((lotnum == null) ? 0 : lotnum.hashCode());
		result = prime * result + ((quantityassigned == null) ? 0 : quantityassigned.hashCode());
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
		TraderPostAuctionBean other = (TraderPostAuctionBean) obj;
		if (aadharnumber == null) {
			if (other.aadharnumber != null)
				return false;
		} else if (!aadharnumber.equals(other.aadharnumber))
			return false;
		if (lotnum == null) {
			if (other.lotnum != null)
				return false;
		} else if (!lotnum.equals(other.lotnum))
			return false;
		if (quantityassigned == null) {
			if (other.quantityassigned != null)
				return false;
		} else if (!quantityassigned.equals(other.quantityassigned))
			return false;
		return true;
	}
	@Override
	public String toString() {
		return "TraderPostAuctionBean [aadharnumber=" + aadharnumber + ", lotnum=" + lotnum + ", quantityassigned="
				+ quantityassigned + "]";
	}
	
	
}
