package com.neomandi.prototype;

public class ProductSearchBean {
private String kproduce;
private String produce;
private String quality;
@Override
public int hashCode() {
	final int prime = 31;
	int result = 1;
	result = prime * result + ((kproduce == null) ? 0 : kproduce.hashCode());
	result = prime * result + ((produce == null) ? 0 : produce.hashCode());
	result = prime * result + ((quality == null) ? 0 : quality.hashCode());
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
	ProductSearchBean other = (ProductSearchBean) obj;
	if (kproduce == null) {
		if (other.kproduce != null)
			return false;
	} else if (!kproduce.equals(other.kproduce))
		return false;
	if (produce == null) {
		if (other.produce != null)
			return false;
	} else if (!produce.equals(other.produce))
		return false;
	if (quality == null) {
		if (other.quality != null)
			return false;
	} else if (!quality.equals(other.quality))
		return false;
	return true;
}
@Override
public String toString() {
	return "ProductSearchBean [kproduce=" + kproduce + ", produce=" + produce + ", quality=" + quality + "]";
}
public String getKproduce() {
	return kproduce;
}
public void setKproduce(String kproduce) {
	this.kproduce = kproduce;
	System.out.println("kproduce is "+kproduce);
}
public String getProduce() {
	return produce;
}
public void setProduce(String produce) {
	this.produce = produce;
	System.out.println("produce is "+produce);
}
public String getQuality() {
	
	return quality;
}
public void setQuality(String quality) {
	System.out.println("quality is "+quality);
	this.quality = quality;
}

}
