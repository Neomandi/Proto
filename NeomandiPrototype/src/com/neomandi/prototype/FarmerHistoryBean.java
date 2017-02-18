package com.neomandi.prototype;

import java.io.InputStream;

public class FarmerHistoryBean {
	private String farmerid;
	private String lotnumber;
	private String kindofpro;
	private String produce;
	private String quantity;
	private String Date;
	private String time;
	private String grade;
	private String marketcode;
	private String slotnumber;
	private String averageprice;
	private String quantitybidfor;
	private String finalprice;
	private String earnings;
	private String deduction;
	private String status;
	private InputStream photo;
	private String crdate;
	public FarmerHistoryBean(){
		System.out.println("in FarmerHistoryBean");
	}
	public String getCrdate() {
		return crdate;
	}
	public void setCrdate(String crdate) {
		this.crdate = crdate;
		System.out.println("crdate="+crdate);
	}
	public String getFarmerid() {
		return farmerid;
	}
	public void setFarmerid(String farmerid) {
		this.farmerid = farmerid;
		System.out.println("farmerid="+farmerid);
	}
	public String getLotnumber() {
		return lotnumber;
	}
	public void setLotnumber(String lotnumber) {
		this.lotnumber = lotnumber;
	}
	public String getKindofpro() {
		return kindofpro;
	}
	public void setKindofpro(String kindofpro) {
		this.kindofpro = kindofpro;
	}
	public String getProduce() {
		return produce;
	}
	public void setProduce(String produce) {
		this.produce = produce;
	}
	public String getQuantity() {
		return quantity;
	}
	public void setQuantity(String quantity) {
		this.quantity = quantity;
	}
	public String getDate() {
		return Date;
	}
	public void setDate(String date) {
		Date = date;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	public String getGrade() {
		return grade;
	}
	public void setGrade(String grade) {
		this.grade = grade;
	}
	public String getMarketcode() {
		return marketcode;
	}
	public void setMarketcode(String marketcode) {
		this.marketcode = marketcode;
	}
	public String getSlotnumber() {
		return slotnumber;
	}
	public void setSlotnumber(String slotnumber) {
		this.slotnumber = slotnumber;
	}
	public String getAverageprice() {
		return averageprice;
	}
	public void setAverageprice(String averageprice) {
		this.averageprice = averageprice;
	}
	public String getQuantitybidfor() {
		return quantitybidfor;
	}
	public void setQuantitybidfor(String quantitybidfor) {
		this.quantitybidfor = quantitybidfor;
	}
	public String getFinalprice() {
		return finalprice;
	}
	public void setFinalprice(String finalprice) {
		this.finalprice = finalprice;
	}
	public String getEarnings() {
		return earnings;
	}
	public void setEarnings(String earnings) {
		this.earnings = earnings;
	}
	public String getDeduction() {
		return deduction;
	}
	public void setDeduction(String deduction) {
		this.deduction = deduction;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public InputStream getPhoto() {
		return photo;
	}
	public void setPhoto(InputStream photo) {
		this.photo = photo;
	}
	
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((Date == null) ? 0 : Date.hashCode());
		result = prime * result + ((averageprice == null) ? 0 : averageprice.hashCode());
		result = prime * result + ((crdate == null) ? 0 : crdate.hashCode());
		result = prime * result + ((deduction == null) ? 0 : deduction.hashCode());
		result = prime * result + ((earnings == null) ? 0 : earnings.hashCode());
		result = prime * result + ((farmerid == null) ? 0 : farmerid.hashCode());
		result = prime * result + ((finalprice == null) ? 0 : finalprice.hashCode());
		result = prime * result + ((grade == null) ? 0 : grade.hashCode());
		result = prime * result + ((kindofpro == null) ? 0 : kindofpro.hashCode());
		result = prime * result + ((lotnumber == null) ? 0 : lotnumber.hashCode());
		result = prime * result + ((marketcode == null) ? 0 : marketcode.hashCode());
		result = prime * result + ((photo == null) ? 0 : photo.hashCode());
		result = prime * result + ((produce == null) ? 0 : produce.hashCode());
		result = prime * result + ((quantity == null) ? 0 : quantity.hashCode());
		result = prime * result + ((quantitybidfor == null) ? 0 : quantitybidfor.hashCode());
		result = prime * result + ((slotnumber == null) ? 0 : slotnumber.hashCode());
		result = prime * result + ((status == null) ? 0 : status.hashCode());
		result = prime * result + ((time == null) ? 0 : time.hashCode());
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
		FarmerHistoryBean other = (FarmerHistoryBean) obj;
		if (Date == null) {
			if (other.Date != null)
				return false;
		} else if (!Date.equals(other.Date))
			return false;
		if (averageprice == null) {
			if (other.averageprice != null)
				return false;
		} else if (!averageprice.equals(other.averageprice))
			return false;
		if (crdate == null) {
			if (other.crdate != null)
				return false;
		} else if (!crdate.equals(other.crdate))
			return false;
		if (deduction == null) {
			if (other.deduction != null)
				return false;
		} else if (!deduction.equals(other.deduction))
			return false;
		if (earnings == null) {
			if (other.earnings != null)
				return false;
		} else if (!earnings.equals(other.earnings))
			return false;
		if (farmerid == null) {
			if (other.farmerid != null)
				return false;
		} else if (!farmerid.equals(other.farmerid))
			return false;
		if (finalprice == null) {
			if (other.finalprice != null)
				return false;
		} else if (!finalprice.equals(other.finalprice))
			return false;
		if (grade == null) {
			if (other.grade != null)
				return false;
		} else if (!grade.equals(other.grade))
			return false;
		if (kindofpro == null) {
			if (other.kindofpro != null)
				return false;
		} else if (!kindofpro.equals(other.kindofpro))
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
		if (quantity == null) {
			if (other.quantity != null)
				return false;
		} else if (!quantity.equals(other.quantity))
			return false;
		if (quantitybidfor == null) {
			if (other.quantitybidfor != null)
				return false;
		} else if (!quantitybidfor.equals(other.quantitybidfor))
			return false;
		if (slotnumber == null) {
			if (other.slotnumber != null)
				return false;
		} else if (!slotnumber.equals(other.slotnumber))
			return false;
		if (status == null) {
			if (other.status != null)
				return false;
		} else if (!status.equals(other.status))
			return false;
		if (time == null) {
			if (other.time != null)
				return false;
		} else if (!time.equals(other.time))
			return false;
		return true;
	}
	@Override
	public String toString() {
		return "FarmerHistoryBean [farmerid=" + farmerid + ", lotnumber=" + lotnumber + ", kindofpro=" + kindofpro
				+ ", produce=" + produce + ", quantity=" + quantity + ", Date=" + Date + ", time=" + time + ", grade="
				+ grade + ", marketcode=" + marketcode + ", slotnumber=" + slotnumber + ", averageprice=" + averageprice
				+ ", quantitybidfor=" + quantitybidfor + ", finalprice=" + finalprice + ", earnings=" + earnings
				+ ", deduction=" + deduction + ", status=" + status + ", photo=" + photo + ", crdate=" + crdate + "]";
	}
	
	
}
