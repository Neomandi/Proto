package com.neomandi.prototype;

public class TradeSummaryBean {
String lotnum;
String quantity;
String quantityneeded;
String bidprice;
String myfinalcost;
String volumesold;
String result;
@Override
public int hashCode() {
	final int prime = 31;
	int result = 1;
	result = prime * result + ((bidprice == null) ? 0 : bidprice.hashCode());
	result = prime * result + ((lotnum == null) ? 0 : lotnum.hashCode());
	result = prime * result + ((myfinalcost == null) ? 0 : myfinalcost.hashCode());
	result = prime * result + ((quantity == null) ? 0 : quantity.hashCode());
	result = prime * result + ((quantityneeded == null) ? 0 : quantityneeded.hashCode());
	result = prime * result + ((this.result == null) ? 0 : this.result.hashCode());
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
	TradeSummaryBean other = (TradeSummaryBean) obj;
	if (bidprice == null) {
		if (other.bidprice != null)
			return false;
	} else if (!bidprice.equals(other.bidprice))
		return false;
	if (lotnum == null) {
		if (other.lotnum != null)
			return false;
	} else if (!lotnum.equals(other.lotnum))
		return false;
	if (myfinalcost == null) {
		if (other.myfinalcost != null)
			return false;
	} else if (!myfinalcost.equals(other.myfinalcost))
		return false;
	if (quantity == null) {
		if (other.quantity != null)
			return false;
	} else if (!quantity.equals(other.quantity))
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
	if (volumesold == null) {
		if (other.volumesold != null)
			return false;
	} else if (!volumesold.equals(other.volumesold))
		return false;
	return true;
}
@Override
public String toString() {
	return "TradeSummaryBean [lotnum=" + lotnum + ", quantity=" + quantity + ", quantityneeded=" + quantityneeded
			+ ", bidprice=" + bidprice + ", myfinalcost=" + myfinalcost + ", volumesold=" + volumesold + ", result="
			+ result + "]";
}
public String getLotnum() {
	return lotnum;
}
public void setLotnum(String lotnum) {
	this.lotnum = lotnum;
}
public String getQuantity() {
	return quantity;
}
public void setQuantity(String quantity) {
	this.quantity = quantity;
}
public String getQuantityneeded() {
	return quantityneeded;
}
public void setQuantityneeded(String quantityneeded) {
	this.quantityneeded = quantityneeded;
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
}
