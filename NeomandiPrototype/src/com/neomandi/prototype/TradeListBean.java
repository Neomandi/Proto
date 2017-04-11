package com.neomandi.prototype;

import java.io.Serializable;

@SuppressWarnings("serial")
public class TradeListBean implements Serializable {
String lotnum;
String marketcode;
String produce;
String qualitygrade;
int quantity;
String slotnumber;
String quantityneeded;
String rigid;


public String getRigid() {
	return rigid;
}
public String getQuantityneeded() {
	return quantityneeded;
}
public void setQuantityneeded(String quantityneeded) {
	this.quantityneeded = quantityneeded;
}
public String getSlotnumber() {
	return slotnumber;
}
public void setSlotnumber(String slotnumber) {
	this.slotnumber = slotnumber;
}

public String getLotnum() {
	return lotnum;
}
public void setLotnum(String lotnum) {
	this.lotnum = lotnum;
}
public String getMarketcode() {
	return marketcode;
}
public void setMarketcode(String marketcode) {
	this.marketcode = marketcode;
}
public String getProduce() {
	return produce;
}
public void setProduce(String produce) {
	this.produce = produce;
}
public String getQualitygrade() {
	return qualitygrade;
}
public void setQualitygrade(String qualitygrade) {
	this.qualitygrade = qualitygrade;
}
public int getQuantity() {
	return quantity;
}
public void setQuantity(int quantity) {
	this.quantity = quantity;
}
@Override
public String toString() {
	return "TradeListBean [lotnum=" + lotnum + ", marketcode=" + marketcode + ", produce=" + produce + ", qualitygrade="
			+ qualitygrade + ", quantity=" + quantity + ", slotnumber=" + slotnumber + ", quantityneeded="
			+ quantityneeded + "]";
}
@Override
public int hashCode() {
	final int prime = 31;
	int result = 1;
	result = prime * result + ((lotnum == null) ? 0 : lotnum.hashCode());
	result = prime * result + ((marketcode == null) ? 0 : marketcode.hashCode());
	result = prime * result + ((produce == null) ? 0 : produce.hashCode());
	result = prime * result + ((qualitygrade == null) ? 0 : qualitygrade.hashCode());
	result = prime * result + quantity;
	result = prime * result + ((quantityneeded == null) ? 0 : quantityneeded.hashCode());
	result = prime * result + ((slotnumber == null) ? 0 : slotnumber.hashCode());
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
	TradeListBean other = (TradeListBean) obj;
	if (lotnum == null) {
		if (other.lotnum != null)
			return false;
	} else if (!lotnum.equals(other.lotnum))
		return false;
	if (marketcode == null) {
		if (other.marketcode != null)
			return false;
	} else if (!marketcode.equals(other.marketcode))
		return false;
	if (produce == null) {
		if (other.produce != null)
			return false;
	} else if (!produce.equals(other.produce))
		return false;
	if (qualitygrade == null) {
		if (other.qualitygrade != null)
			return false;
	} else if (!qualitygrade.equals(other.qualitygrade))
		return false;
	if (quantity != other.quantity)
		return false;
	if (quantityneeded == null) {
		if (other.quantityneeded != null)
			return false;
	} else if (!quantityneeded.equals(other.quantityneeded))
		return false;
	if (slotnumber == null) {
		if (other.slotnumber != null)
			return false;
	} else if (!slotnumber.equals(other.slotnumber))
		return false;
	return true;
}
public void setRigid(String rigid) {
	this.rigid = rigid;
}
}
