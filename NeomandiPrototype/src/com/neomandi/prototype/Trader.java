package com.neomandi.prototype;


public class Trader {
	
	private int vol;
	private int price;
	private String tid;
	
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
	@Override
	public String toString() {
		return "Trader [vol=" + vol + ", price=" + price + ", tid=" + tid + "]";
	}
	
	
}
