package com.neomandi.prototype;

import java.io.Serializable;

@SuppressWarnings("serial")
public class ProductSearchResultBean implements Serializable {
	private String lotnumber;
	private String marketcode;
	private String produce;
	private String qualitygrade;
	private String quantity;
	public String getLotnumber() {
		return lotnumber;
	}
	public void setLotnumber(String lotnumber) {
		this.lotnumber = lotnumber;
		System.out.println("Lotnumber: "+lotnumber);
	}
	public String getMarketcode() {
		return marketcode;
	}
	public void setMarketcode(String marketcode) {
		this.marketcode = marketcode;
		System.out.println("Marketcode: "+marketcode);
	}
	public String getProduce() {
		return produce;
	}
	public void setProduce(String produce) {
		this.produce = produce;
		System.out.println("Produce: "+produce);
	}
	public String getQualitygrade() {
		return qualitygrade;
	}
	public void setQualitygrade(String qualitygrade) {
		this.qualitygrade = qualitygrade;
		System.out.println("Qualitygrade: "+qualitygrade);
	}
	public String getQuantity() {
		return quantity;
	}
	public void setQuantity(String quantity) {
		this.quantity = quantity;
		System.out.println("Quantity: "+quantity);
	}
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((lotnumber == null) ? 0 : lotnumber.hashCode());
		result = prime * result + ((marketcode == null) ? 0 : marketcode.hashCode());
		result = prime * result + ((produce == null) ? 0 : produce.hashCode());
		result = prime * result + ((qualitygrade == null) ? 0 : qualitygrade.hashCode());
		result = prime * result + ((quantity == null) ? 0 : quantity.hashCode());
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
		ProductSearchResultBean other = (ProductSearchResultBean) obj;
		if (lotnumber == null) {
			if (other.lotnumber != null)
				return false;
		} else if (!lotnumber.equals(other.lotnumber))
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
		if (quantity == null) {
			if (other.quantity != null)
				return false;
		} else if (!quantity.equals(other.quantity))
			return false;
		return true;
	}
	@Override
	public String toString() {
		return "ProductSearchResultBean [lotnumber=" + lotnumber + ", marketcode=" + marketcode + ", produce=" + produce
				+ ", qualitygrade=" + qualitygrade + ", quantity=" + quantity + "]";
	}
	
	
	
}
