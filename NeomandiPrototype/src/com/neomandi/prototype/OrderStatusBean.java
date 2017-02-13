package com.neomandi.prototype;

public class OrderStatusBean {
String lotnum;
String produce;
String qualitygrade;
String quantityavailable;
String quantityneeded;
String slotnumber;
String lotcost;
String commission;
String marketcess;
String transportation;
String quantityassigned;
public String getQuantityavailable() {
	return quantityavailable;
}
public void setQuantityavailable(String quantityavailable) {
	this.quantityavailable = quantityavailable;
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
public String getTransportation() {
	return transportation;
}
public void setTransportation(String transportation) {
	this.transportation = transportation;
}
public String getQuantityassigned() {
	return quantityassigned;
}
public void setQuantityassigned(String quantityassigned) {
	this.quantityassigned = quantityassigned;
}
String marketcode;
String bestbid;
String bidprice;
String myfinalcost;
String farmeraccept;



public String getFarmeraccept() {
	return farmeraccept;
}
public void setFarmeraccept(String farmeraccept) {
	this.farmeraccept = farmeraccept;
}
@Override
public int hashCode() {
	final int prime = 31;
	int result = 1;
	result = prime * result + ((bestbid == null) ? 0 : bestbid.hashCode());
	result = prime * result + ((bidprice == null) ? 0 : bidprice.hashCode());
	result = prime * result + ((commission == null) ? 0 : commission.hashCode());
	result = prime * result + ((farmeraccept == null) ? 0 : farmeraccept.hashCode());
	result = prime * result + ((lotcost == null) ? 0 : lotcost.hashCode());
	result = prime * result + ((lotnum == null) ? 0 : lotnum.hashCode());
	result = prime * result + ((marketcess == null) ? 0 : marketcess.hashCode());
	result = prime * result + ((marketcode == null) ? 0 : marketcode.hashCode());
	result = prime * result + ((myfinalcost == null) ? 0 : myfinalcost.hashCode());
	result = prime * result + ((produce == null) ? 0 : produce.hashCode());
	result = prime * result + ((qualitygrade == null) ? 0 : qualitygrade.hashCode());
	result = prime * result + ((quantityassigned == null) ? 0 : quantityassigned.hashCode());
	result = prime * result + ((quantityavailable == null) ? 0 : quantityavailable.hashCode());
	result = prime * result + ((quantityneeded == null) ? 0 : quantityneeded.hashCode());
	result = prime * result + ((this.result == null) ? 0 : this.result.hashCode());
	result = prime * result + ((slotnumber == null) ? 0 : slotnumber.hashCode());
	result = prime * result + ((transportation == null) ? 0 : transportation.hashCode());
	result = prime * result + ((volumesold == null) ? 0 : volumesold.hashCode());
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
	OrderStatusBean other = (OrderStatusBean) obj;
	if (bestbid == null) {
		if (other.bestbid != null)
			return false;
	} else if (!bestbid.equals(other.bestbid))
		return false;
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
	if (farmeraccept == null) {
		if (other.farmeraccept != null)
			return false;
	} else if (!farmeraccept.equals(other.farmeraccept))
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
	if (marketcode == null) {
		if (other.marketcode != null)
			return false;
	} else if (!marketcode.equals(other.marketcode))
		return false;
	if (myfinalcost == null) {
		if (other.myfinalcost != null)
			return false;
	} else if (!myfinalcost.equals(other.myfinalcost))
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
	if (quantityassigned == null) {
		if (other.quantityassigned != null)
			return false;
	} else if (!quantityassigned.equals(other.quantityassigned))
		return false;
	if (quantityavailable == null) {
		if (other.quantityavailable != null)
			return false;
	} else if (!quantityavailable.equals(other.quantityavailable))
		return false;
	if (quantityneeded == null) {
		if (other.quantityneeded != null)
			return false;
	} else if (!quantityneeded.equals(other.quantityneeded))
		return false;
	if (result == null) {
		if (other.result != null)
			return false;
	} else if (!result.equals(other.result))
		return false;
	if (slotnumber == null) {
		if (other.slotnumber != null)
			return false;
	} else if (!slotnumber.equals(other.slotnumber))
		return false;
	if (transportation == null) {
		if (other.transportation != null)
			return false;
	} else if (!transportation.equals(other.transportation))
		return false;
	if (volumesold == null) {
		if (other.volumesold != null)
			return false;
	} else if (!volumesold.equals(other.volumesold))
		return false;
	return true;
}
@Override
public String toString() {
	return "OrderStatusBean [lotnum=" + lotnum + ", produce=" + produce + ", qualitygrade=" + qualitygrade
			+ ", quantityavailable=" + quantityavailable + ", quantityneeded=" + quantityneeded + ", slotnumber="
			+ slotnumber + ", lotcost=" + lotcost + ", commission=" + commission + ", marketcess=" + marketcess
			+ ", transportation=" + transportation + ", quantityassigned=" + quantityassigned + ", marketcode="
			+ marketcode + ", bestbid=" + bestbid + ", bidprice=" + bidprice + ", myfinalcost=" + myfinalcost
			+ ", farmeraccept=" + farmeraccept + ", volumesold=" + volumesold + ", result=" + result + "]";
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
public String getLotcost() {
	return lotcost;
}
public void setLotcost(String lotcost) {
	this.lotcost = lotcost;
}
public String getBestbid() {
	return bestbid;
}
public void setBestbid(String bestbid) {
	this.bestbid = bestbid;
}
public String getBidprice() {
	return bidprice;
}
public void setBidprice(String bidprice) {
	this.bidprice = bidprice;
}
public String getMyfinalcost() {
	return myfinalcost;
}
public void setMyfinalcost(String myfinalcost) {
	this.myfinalcost = myfinalcost;
}
public String getVolumesold() {
	return volumesold;
}
public void setVolumesold(String volumesold) {
	this.volumesold = volumesold;
}
public String getResult() {
	return result;
}
public void setResult(String result) {
	this.result = result;
}
String volumesold;
String result;
}
