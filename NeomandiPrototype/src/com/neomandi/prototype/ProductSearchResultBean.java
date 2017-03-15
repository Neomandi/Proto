package com.neomandi.prototype;

import java.io.InputStream;
import java.io.Serializable;
import java.sql.Blob;

@SuppressWarnings("serial")
public class ProductSearchResultBean implements Serializable {
	private String lotnumber;
	private String marketcode;
	private String produce;
	private String qualitygrade;
	private String quantity;
	private String photo;
	private String slotnumber;
	public String getSlotnumber() {
		return slotnumber;
	}
	public void setSlotnumber(String slotnumber) {
		this.slotnumber = slotnumber;
	}
	public ProductSearchResultBean(){
//		System.out.println("inside no arg cons of psrb");
	}
	public String getLotnumber() {
		return lotnumber;
	}
	public void setLotnumber(String lotnumber) {
		this.lotnumber = lotnumber;
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
	public String getQuantity() {
		return quantity;
	}
	public void setQuantity(String quantity) {
		this.quantity = quantity;
	}
	public String getPhoto() {
		return photo;
	}
	public void setPhoto(String photo) {
		this.photo = photo;
	//	System.out.println("in psrb photo="+photo);
	}
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((lotnumber == null) ? 0 : lotnumber.hashCode());
		result = prime * result + ((marketcode == null) ? 0 : marketcode.hashCode());
		result = prime * result + ((photo == null) ? 0 : photo.hashCode());
		result = prime * result + ((produce == null) ? 0 : produce.hashCode());
		result = prime * result + ((qualitygrade == null) ? 0 : qualitygrade.hashCode());
		result = prime * result + ((quantity == null) ? 0 : quantity.hashCode());
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
		if (photo == null) {
			if (other.photo != null)
				return false;
		} else if (!photo.equals(other.photo))
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
		if (slotnumber == null) {
			if (other.slotnumber != null)
				return false;
		} else if (!slotnumber.equals(other.slotnumber))
			return false;
		return true;
	}
	@Override
	public String toString() {
		return "ProductSearchResultBean [lotnumber=" + lotnumber + ", marketcode=" + marketcode + ", produce=" + produce
				+ ", qualitygrade=" + qualitygrade + ", quantity=" + quantity + ", photo=" + photo + ", slotnumber="
				+ slotnumber + "]";
	}
	public ProductSearchResultBean(String lotnumber, String marketcode, String produce, String qualitygrade,
			String quantity, String photo) {
		super();
		this.lotnumber = lotnumber;
		this.marketcode = marketcode;
		this.produce = produce;
		this.qualitygrade = qualitygrade;
		this.quantity = quantity;
		this.photo = photo;
	}

}
