package com.neomandi.prototype;

public class ProductEntryBean {
	private String farmerid;
	private String marketcode;
	private String kproduce;
	private String produce;
	private String quality;
	private String quantity;
	private String lotnumber;
	private String photo;
	public String getFarmerid() {
		return farmerid;
	}
	public void setFarmerid(String farmerid) {
		this.farmerid = farmerid;
	}
	public String getMarketcode() {
		return marketcode;
	}
	public void setMarketcode(String marketcode) {
		this.marketcode = marketcode;
	}
	public String getKproduce() {
		return kproduce;
	}
	public void setKproduce(String kproduce) {
		this.kproduce = kproduce;
	}
	public String getProduce() {
		return produce;
	}
	public void setProduce(String produce) {
		this.produce = produce;
	}
	public String getQuality() {
		return quality;
	}
	public void setQuality(String quality) {
		this.quality = quality;
	}
	public String getQuantity() {
		return quantity;
	}
	public void setQuantity(String quantity) {
		this.quantity = quantity;
	}
	public String getlotnumber() {
		return lotnumber;
	}
	public void setlotnumber(String lotnumber) {
		this.lotnumber = lotnumber;
	}
	public String getPhoto() {
		return photo;
	}
	public void setPhoto(String photo) {
		this.photo = photo;
	}
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((farmerid == null) ? 0 : farmerid.hashCode());
		result = prime * result + ((kproduce == null) ? 0 : kproduce.hashCode());
		result = prime * result + ((lotnumber == null) ? 0 : lotnumber.hashCode());
		result = prime * result + ((marketcode == null) ? 0 : marketcode.hashCode());
		result = prime * result + ((photo == null) ? 0 : photo.hashCode());
		result = prime * result + ((produce == null) ? 0 : produce.hashCode());
		result = prime * result + ((quality == null) ? 0 : quality.hashCode());
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
		ProductEntryBean other = (ProductEntryBean) obj;
		if (farmerid == null) {
			if (other.farmerid != null)
				return false;
		} else if (!farmerid.equals(other.farmerid))
			return false;
		if (kproduce == null) {
			if (other.kproduce != null)
				return false;
		} else if (!kproduce.equals(other.kproduce))
			return false;
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
		if (quality == null) {
			if (other.quality != null)
				return false;
		} else if (!quality.equals(other.quality))
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
		return "ProductEntryBean [farmerid=" + farmerid + ", marketcode=" + marketcode + ", kproduce=" + kproduce
				+ ", produce=" + produce + ", quality=" + quality + ", quantity=" + quantity + ", lotnumber=" + lotnumber
				+ ", photo=" + photo + "]";
	}
	public ProductEntryBean(String farmerid, String marketcode, String kproduce, String produce, String quality,
			String quantity, String lotnumber, String photo) {
		super();
		this.farmerid = farmerid;
		this.marketcode = marketcode;
		this.kproduce = kproduce;
		this.produce = produce;
		this.quality = quality;
		this.quantity = quantity;
		this.lotnumber = lotnumber;
		this.photo = photo;
	}
	
	
}
