package com.neomandi.prototype;

public class NewTrader {
	private int vol;
	private int price;
	private String tid;
	private int assvol;
	private int bbid;
	public int getVol() {
		return vol;
	}
	public void setVol(int vol) {
		this.vol = vol;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getTid() {
		return tid;
	}
	public void setTid(String tid) {
		this.tid = tid;
	}
	public int getAssvol() {
		return assvol;
	}
	public void setAssvol(int assvol) {
		this.assvol = assvol;
	}
	public int getBbid() {
		return bbid;
	}
	public void setBbid(int bbid) {
		this.bbid = bbid;
	}
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + assvol;
		result = prime * result + bbid;
		result = prime * result + price;
		result = prime * result + ((tid == null) ? 0 : tid.hashCode());
		result = prime * result + vol;
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
		NewTrader other = (NewTrader) obj;
		if (assvol != other.assvol)
			return false;
		if (bbid != other.bbid)
			return false;
		if (price != other.price)
			return false;
		if (tid == null) {
			if (other.tid != null)
				return false;
		} else if (!tid.equals(other.tid))
			return false;
		if (vol != other.vol)
			return false;
		return true;
	}
	@Override
	public String toString() {
		return "NewTrader [vol=" + vol + ", price=" + price + ", tid=" + tid + ", assvol=" + assvol + ", bbid=" + bbid
				+ "]";
	}
	
	
}
