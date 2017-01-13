package com.neomandi.prototype;

import java.io.Serializable;

@SuppressWarnings("serial")
public class MyFinalCostBean implements Serializable{
String lotcost;
String commission;
String marketcess;
String myfinalcost;
String price;
String msg;
String finalcosts;
String lotnum;
String bestbid;
String quantityassigned;
String quantityneeded;

public String getQuantityneeded() {
	return quantityneeded;
}
public void setQuantityneeded(String quantityneeded) {
	this.quantityneeded = quantityneeded;
}
public String getQuantityassigned() {
	return quantityassigned;
}
public void setQuantityassigned(String quantityassigned) {
	this.quantityassigned = quantityassigned;
}
public String getBestbid() {
	return bestbid;
}
public void setBestbid(String bestbid) {
	this.bestbid = bestbid;
}
public String getLotnum() {
	return lotnum;
}
public void setLotnum(String lotnum) {
	this.lotnum = lotnum;
}
public String getFinalcosts() {
	return finalcosts;
}
public void setFinalcosts(String finalcosts) {
	this.finalcosts = finalcosts;
}
public String getLotcost() {
	return lotcost;
}
public void setLotcost(String lotcost) {
	this.lotcost = lotcost;
}
public String getCommission() {
	return commission;
}
public void setCommission(String commission) {
	this.commission = commission;
}
public String getMarketcess() {
	return marketcess;
}
public void setMarketcess(String marketcess) {
	this.marketcess = marketcess;
}
public String getMyfinalcost() {
	return myfinalcost;
}
public void setMyfinalcost(String myfinalcost) {
	this.myfinalcost = myfinalcost;
}
public String getPrice() {
	return price;
}
public void setPrice(String price) {
	this.price = price;
}
public String getMsg() {
	return msg;
}
public void setMsg(String msg) {
	this.msg = msg;
}
@Override
public String toString() {
	return "MyFinalCostBean [lotcost=" + lotcost + ", commission=" + commission + ", marketcess=" + marketcess
			+ ", myfinalcost=" + myfinalcost + ", price=" + price + ", msg=" + msg + ", finalcosts=" + finalcosts
			+ ", lotnum=" + lotnum + ", bestbid=" + bestbid + ", quantityneeded=" + quantityassigned + "]";
}
@Override
public int hashCode() {
	final int prime = 31;
	int result = 1;
	result = prime * result + ((bestbid == null) ? 0 : bestbid.hashCode());
	result = prime * result + ((commission == null) ? 0 : commission.hashCode());
	result = prime * result + ((finalcosts == null) ? 0 : finalcosts.hashCode());
	result = prime * result + ((lotcost == null) ? 0 : lotcost.hashCode());
	result = prime * result + ((lotnum == null) ? 0 : lotnum.hashCode());
	result = prime * result + ((marketcess == null) ? 0 : marketcess.hashCode());
	result = prime * result + ((msg == null) ? 0 : msg.hashCode());
	result = prime * result + ((myfinalcost == null) ? 0 : myfinalcost.hashCode());
	result = prime * result + ((price == null) ? 0 : price.hashCode());
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
	MyFinalCostBean other = (MyFinalCostBean) obj;
	if (bestbid == null) {
		if (other.bestbid != null)
			return false;
	} else if (!bestbid.equals(other.bestbid))
		return false;
	if (commission == null) {
		if (other.commission != null)
			return false;
	} else if (!commission.equals(other.commission))
		return false;
	if (finalcosts == null) {
		if (other.finalcosts != null)
			return false;
	} else if (!finalcosts.equals(other.finalcosts))
		return false;
	if (lotcost == null) {
		if (other.lotcost != null)
			return false;
	} else if (!lotcost.equals(other.lotcost))
		return false;
	if (lotnum == null) {
		if (other.lotnum != null)
			return false;
	} else if (!lotnum.equals(other.lotnum))
		return false;
	if (marketcess == null) {
		if (other.marketcess != null)
			return false;
	} else if (!marketcess.equals(other.marketcess))
		return false;
	if (msg == null) {
		if (other.msg != null)
			return false;
	} else if (!msg.equals(other.msg))
		return false;
	if (myfinalcost == null) {
		if (other.myfinalcost != null)
			return false;
	} else if (!myfinalcost.equals(other.myfinalcost))
		return false;
	if (price == null) {
		if (other.price != null)
			return false;
	} else if (!price.equals(other.price))
		return false;
	if (quantityassigned == null) {
		if (other.quantityassigned != null)
			return false;
	} else if (!quantityassigned.equals(other.quantityassigned))
		return false;
	return true;
}
}
