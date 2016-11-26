package com.neomandi.prototype;

public class TraderRegisterBean {
	
	
	private String tradername;
	private long tradermob;
	private long traderaadharnum;
	private String traderemail;
	private String traderstate;
	private String traderdistrict;
	private String tradertaluk;
	private String traderhobli;
	private String tradervillage;
	private String traderbankname;
	private long traderaccountnum;
	private String traderbranch;
	private String traderifsc;
	private String traderuid;
	private String traderlicensenum;
	private String traderpwd;
	
	
	public String getTradername() {
		return tradername;
	}
	public void setTradername(String tradername) {
		this.tradername = tradername;
		System.out.println("Tradername: "+tradername);
	}
	public long getTradermob() {
		return tradermob;
	}
	public void setTradermob(long tradermob) {
		this.tradermob = tradermob;
		System.out.println("Tradermob: "+tradermob);
	}
	public long getTraderaadharnum() {
		return traderaadharnum;
	}
	public void setTraderaadharnum(long traderaadharnum) {
		this.traderaadharnum = traderaadharnum;
		System.out.println("Traderaadhar: "+traderaadharnum);	
	}
	public String getTraderemail() {
		return traderemail;
	}
	public void setTraderemail(String traderemail) {
		this.traderemail = traderemail;
		System.out.println("Traderemail: "+traderemail);
	}
	public String getTraderstate() {
		return traderstate;
	}
	public void setTraderstate(String traderstate) {
		this.traderstate = traderstate;
		System.out.println("Traderstate: "+traderstate);
	}
	public String getTraderdistrict() {
		return traderdistrict;
	}
	public void setTraderdistrict(String traderdistrict) {
		this.traderdistrict = traderdistrict;
		System.out.println("Traderdistrict: "+traderdistrict);
	}
	public String getTradertaluk() {
		return tradertaluk;
	}
	public void setTradertaluk(String tradertaluk) {
		this.tradertaluk = tradertaluk;
		System.out.println("Tradertaluk: "+tradertaluk);
	}
	public String getTraderhobli() {
		return traderhobli;
	}
	public void setTraderhobli(String traderhobli) {
		this.traderhobli = traderhobli;
		System.out.println("Traderhobli: "+traderhobli);
	}
	public String getTradervillage() {
		return tradervillage;
	}
	public void setTradervillage(String tradervillage) {
		this.tradervillage = tradervillage;
		System.out.println("Tradervillage: "+tradervillage);
	}
	public String getTraderbankname() {
		return traderbankname;
	}
	public void setTraderbankname(String traderbankname) {
		this.traderbankname = traderbankname;
		System.out.println("Traderbankname: "+traderbankname);
	}
	public long getTraderaccountnum() {
		return traderaccountnum;
	}
	public void setTraderaccountnum(long traderaccountnum) {
		this.traderaccountnum = traderaccountnum;
		System.out.println("Traderacc: "+traderaccountnum);
	}
	public String getTraderbranch() {
		return traderbranch;
	}
	public void setTraderbranch(String traderbranch) {
		this.traderbranch = traderbranch;
		System.out.println("Traderbranch: "+traderbranch);
	}
	public String getTraderifsc() {
		return traderifsc;
	}
	public void setTraderifsc(String traderifsc) {
		this.traderifsc = traderifsc;
		System.out.println("Traderifsc: "+traderifsc);
	}
	public String getTraderuid() {
		return traderuid;
	}
	public void setTraderuid(String traderuid) {
		this.traderuid = traderuid;
		System.out.println("Traderuid: "+traderuid);
	}
	public String getTraderlicensenum() {
		return traderlicensenum;
	}
	public void setTraderlicensenum(String traderlicensenum) {
		this.traderlicensenum = traderlicensenum;
		System.out.println("Traderlics: "+traderlicensenum);
	}
	public String getTraderpwd() {
		return traderpwd;
	}
	public void setTraderpwd(String traderpwd) {
		this.traderpwd = traderpwd;
		System.out.println("Traderpwd: "+traderpwd);
	}
	
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + (int) (traderaadharnum ^ (traderaadharnum >>> 32));
		result = prime * result + (int) (traderaccountnum ^ (traderaccountnum >>> 32));
		result = prime * result + ((traderbankname == null) ? 0 : traderbankname.hashCode());
		result = prime * result + ((traderbranch == null) ? 0 : traderbranch.hashCode());
		result = prime * result + ((traderdistrict == null) ? 0 : traderdistrict.hashCode());
		result = prime * result + ((traderemail == null) ? 0 : traderemail.hashCode());
		result = prime * result + ((traderhobli == null) ? 0 : traderhobli.hashCode());
		result = prime * result + ((traderifsc == null) ? 0 : traderifsc.hashCode());
		result = prime * result + ((traderlicensenum == null) ? 0 : traderlicensenum.hashCode());
		result = prime * result + (int) (tradermob ^ (tradermob >>> 32));
		result = prime * result + ((tradername == null) ? 0 : tradername.hashCode());
		result = prime * result + ((traderpwd == null) ? 0 : traderpwd.hashCode());
		result = prime * result + ((traderstate == null) ? 0 : traderstate.hashCode());
		result = prime * result + ((tradertaluk == null) ? 0 : tradertaluk.hashCode());
		result = prime * result + ((traderuid == null) ? 0 : traderuid.hashCode());
		result = prime * result + ((tradervillage == null) ? 0 : tradervillage.hashCode());
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
		TraderRegisterBean other = (TraderRegisterBean) obj;
		if (traderaadharnum != other.traderaadharnum)
			return false;
		if (traderaccountnum != other.traderaccountnum)
			return false;
		if (traderbankname == null) {
			if (other.traderbankname != null)
				return false;
		} else if (!traderbankname.equals(other.traderbankname))
			return false;
		if (traderbranch == null) {
			if (other.traderbranch != null)
				return false;
		} else if (!traderbranch.equals(other.traderbranch))
			return false;
		if (traderdistrict == null) {
			if (other.traderdistrict != null)
				return false;
		} else if (!traderdistrict.equals(other.traderdistrict))
			return false;
		if (traderemail == null) {
			if (other.traderemail != null)
				return false;
		} else if (!traderemail.equals(other.traderemail))
			return false;
		if (traderhobli == null) {
			if (other.traderhobli != null)
				return false;
		} else if (!traderhobli.equals(other.traderhobli))
			return false;
		if (traderifsc == null) {
			if (other.traderifsc != null)
				return false;
		} else if (!traderifsc.equals(other.traderifsc))
			return false;
		if (traderlicensenum == null) {
			if (other.traderlicensenum != null)
				return false;
		} else if (!traderlicensenum.equals(other.traderlicensenum))
			return false;
		if (tradermob != other.tradermob)
			return false;
		if (tradername == null) {
			if (other.tradername != null)
				return false;
		} else if (!tradername.equals(other.tradername))
			return false;
		if (traderpwd == null) {
			if (other.traderpwd != null)
				return false;
		} else if (!traderpwd.equals(other.traderpwd))
			return false;
		if (traderstate == null) {
			if (other.traderstate != null)
				return false;
		} else if (!traderstate.equals(other.traderstate))
			return false;
		if (tradertaluk == null) {
			if (other.tradertaluk != null)
				return false;
		} else if (!tradertaluk.equals(other.tradertaluk))
			return false;
		if (traderuid == null) {
			if (other.traderuid != null)
				return false;
		} else if (!traderuid.equals(other.traderuid))
			return false;
		if (tradervillage == null) {
			if (other.tradervillage != null)
				return false;
		} else if (!tradervillage.equals(other.tradervillage))
			return false;
		return true;
	}
	
	@Override
	public String toString() {
		return "TraderRegisterBean [tradername=" + tradername + ", tradermob=" + tradermob + ", traderaadharnum="
				+ traderaadharnum + ", traderemail=" + traderemail + ", traderstate=" + traderstate
				+ ", traderdistrict=" + traderdistrict + ", tradertaluk=" + tradertaluk + ", traderhobli=" + traderhobli
				+ ", tradervillage=" + tradervillage + ", traderbankname=" + traderbankname + ", traderaccountnum="
				+ traderaccountnum + ", traderbranch=" + traderbranch + ", traderifsc=" + traderifsc + ", traderuid="
				+ traderuid + ", traderlicensenum=" + traderlicensenum + ", traderpwd=" + traderpwd + "]";
	}

	
}
