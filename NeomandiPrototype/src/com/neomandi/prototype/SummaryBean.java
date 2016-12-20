package com.neomandi.prototype;

public class SummaryBean {
	private String lotnumber;
	private String lotsize;
	private String quantitysold;
	private String averageprice;
	private String finalprice;
	private String status;
	private String accountnum;
	public SummaryBean(){
		System.out.println("in summary bean no arg cons");
	}
	public String getLotnumber() {
		return lotnumber;
	}
	public void setLotnumber(String lotnumber) {
		this.lotnumber = lotnumber;
	}
	public String getLotsize() {
		return lotsize;
	}
	public void setLotsize(String lotsize) {
		this.lotsize = lotsize;
	}
	public String getQuantitysold() {
		return quantitysold;
	}
	public void setQuantitysold(String quantitysold) {
		this.quantitysold = quantitysold;
	}
	public String getAverageprice() {
		return averageprice;
	}
	public void setAverageprice(String averageprice) {
		this.averageprice = averageprice;
	}
	public String getFinalprice() {
		return finalprice;
	}
	public void setFinalprice(String finalprice) {
		this.finalprice = finalprice;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getAccountnum() {
		return accountnum;
	}
	public void setAccountnum(String accountnum) {
		this.accountnum = accountnum;
	}
	@Override
	public String toString() {
		return "SummaryBean [lotnumber=" + lotnumber + ", lotsize=" + lotsize + ", quantitysold=" + quantitysold
				+ ", averageprice=" + averageprice + ", finalprice=" + finalprice + ", status=" + status
				+ ", accountnum=" + accountnum + "]";
	}
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((accountnum == null) ? 0 : accountnum.hashCode());
		result = prime * result + ((averageprice == null) ? 0 : averageprice.hashCode());
		result = prime * result + ((finalprice == null) ? 0 : finalprice.hashCode());
		result = prime * result + ((lotnumber == null) ? 0 : lotnumber.hashCode());
		result = prime * result + ((lotsize == null) ? 0 : lotsize.hashCode());
		result = prime * result + ((quantitysold == null) ? 0 : quantitysold.hashCode());
		result = prime * result + ((status == null) ? 0 : status.hashCode());
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
		SummaryBean other = (SummaryBean) obj;
		if (accountnum == null) {
			if (other.accountnum != null)
				return false;
		} else if (!accountnum.equals(other.accountnum))
			return false;
		if (averageprice == null) {
			if (other.averageprice != null)
				return false;
		} else if (!averageprice.equals(other.averageprice))
			return false;
		if (finalprice == null) {
			if (other.finalprice != null)
				return false;
		} else if (!finalprice.equals(other.finalprice))
			return false;
		if (lotnumber == null) {
			if (other.lotnumber != null)
				return false;
		} else if (!lotnumber.equals(other.lotnumber))
			return false;
		if (lotsize == null) {
			if (other.lotsize != null)
				return false;
		} else if (!lotsize.equals(other.lotsize))
			return false;
		if (quantitysold == null) {
			if (other.quantitysold != null)
				return false;
		} else if (!quantitysold.equals(other.quantitysold))
			return false;
		if (status == null) {
			if (other.status != null)
				return false;
		} else if (!status.equals(other.status))
			return false;
		return true;
	}
	public SummaryBean(String lotnumber, String lotsize, String quantitysold, String averageprice, String finalprice,
			String status, String accountnum) {
		super();
		this.lotnumber = lotnumber;
		this.lotsize = lotsize;
		this.quantitysold = quantitysold;
		this.averageprice = averageprice;
		this.finalprice = finalprice;
		this.status = status;
		this.accountnum = accountnum;
	}
	
}
