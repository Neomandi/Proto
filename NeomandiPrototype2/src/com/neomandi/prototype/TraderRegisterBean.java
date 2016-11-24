package com.neomandi.prototype;

public class TraderRegisterBean {
	String tradername;
long tradermobile;
long 	traderaadharnum;
@Override
public int hashCode() {
	final int prime = 31;
	int result = 1;
	result = prime * result + ((district == null) ? 0 : district.hashCode());
	result = prime * result + ((pic == null) ? 0 : pic.hashCode());
	result = prime * result + ((state == null) ? 0 : state.hashCode());
	result = prime * result + (int) (traderaadharnum ^ (traderaadharnum >>> 32));
	result = prime * result + (int) (traderbankaccountnum ^ (traderbankaccountnum >>> 32));
	result = prime * result + ((traderbankbranch == null) ? 0 : traderbankbranch.hashCode());
	result = prime * result + ((traderbankname == null) ? 0 : traderbankname.hashCode());
	result = prime * result + ((traderemail == null) ? 0 : traderemail.hashCode());
	result = prime * result + ((traderhobli == null) ? 0 : traderhobli.hashCode());
	result = prime * result + ((traderifsc == null) ? 0 : traderifsc.hashCode());
	result = prime * result + (int) (tradermobile ^ (tradermobile >>> 32));
	result = prime * result + ((tradername == null) ? 0 : tradername.hashCode());
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
	if (district == null) {
		if (other.district != null)
			return false;
	} else if (!district.equals(other.district))
		return false;
	if (pic == null) {
		if (other.pic != null)
			return false;
	} else if (!pic.equals(other.pic))
		return false;
	if (state == null) {
		if (other.state != null)
			return false;
	} else if (!state.equals(other.state))
		return false;
	if (traderaadharnum != other.traderaadharnum)
		return false;
	if (traderbankaccountnum != other.traderbankaccountnum)
		return false;
	if (traderbankbranch == null) {
		if (other.traderbankbranch != null)
			return false;
	} else if (!traderbankbranch.equals(other.traderbankbranch))
		return false;
	if (traderbankname == null) {
		if (other.traderbankname != null)
			return false;
	} else if (!traderbankname.equals(other.traderbankname))
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
	if (tradermobile != other.tradermobile)
		return false;
	if (tradername == null) {
		if (other.tradername != null)
			return false;
	} else if (!tradername.equals(other.tradername))
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
	return "TraderRegister [tradername=" + tradername + ", tradermobile=" + tradermobile + ", traderaadharnum="
			+ traderaadharnum + ", traderemail=" + traderemail + ", state=" + state + ", district=" + district
			+ ", tradertaluk=" + tradertaluk + ", traderhobli=" + traderhobli + ", tradervillage=" + tradervillage
			+ ", pic=" + pic + ", traderbankname=" + traderbankname + ", traderbankaccountnum=" + traderbankaccountnum
			+ ", traderbankbranch=" + traderbankbranch + ", traderifsc=" + traderifsc + ", traderuid=" + traderuid
			+ ", getTradername()=" + getTradername() + ", getTradermobile()=" + getTradermobile()
			+ ", getTraderaadharnum()=" + getTraderaadharnum() + ", getTraderemail()=" + getTraderemail()
			+ ", getState()=" + getState() + ", getDistrict()=" + getDistrict() + ", getTradertaluk()="
			+ getTradertaluk() + ", getTraderhobli()=" + getTraderhobli() + ", getTradervillage()=" + getTradervillage()
			+ ", getPic()=" + getPic() + ", getTraderbankname()=" + getTraderbankname() + ", getTraderbankaccountnum()="
			+ getTraderbankaccountnum() + ", getTraderbankbranch()=" + getTraderbankbranch() + ", getTraderifsc()="
			+ getTraderifsc() + ", getTraderuid()=" + getTraderuid() + ", getClass()=" + getClass() + ", hashCode()="
			+ hashCode() + ", toString()=" + super.toString() + "]";
}
public String getTradername() {
	return tradername;
}
public void setTradername(String tradername) {
	this.tradername = tradername;
	System.out.println(tradername);
}
public long getTradermobile() {
	return tradermobile;
}
public void setTradermobile(long tradermobile) {
	this.tradermobile = tradermobile;
	System.out.println(tradername);

}
public long getTraderaadharnum() {
	return traderaadharnum;
}
public void setTraderaadharnum(long traderaadharnum) {
	this.traderaadharnum = traderaadharnum;
	System.out.println(traderaadharnum);
}
public String getTraderemail() {
	return traderemail;
}
public void setTraderemail(String traderemail) {
	this.traderemail = traderemail;
	System.out.println(traderemail);

}
public String getState() {
	return state;
}
public void setState(String state) {
	this.state = state;
	System.out.println(state);

}
public String getDistrict() {
	return district;
}
public void setDistrict(String district) {
	this.district = district;
	System.out.println(district);

}
public String getTradertaluk() {
	return tradertaluk;
}
public void setTradertaluk(String tradertaluk) {
	this.tradertaluk = tradertaluk;
	System.out.println(tradertaluk);

}
public String getTraderhobli() {
	return traderhobli;
}
public void setTraderhobli(String traderhobli) {
	this.traderhobli = traderhobli;
	System.out.println(traderhobli);

}
public String getTradervillage() {
	return tradervillage;
}
public void setTradervillage(String tradervillage) {
	this.tradervillage = tradervillage;
	System.out.println(tradervillage);

}
public String getPic() {
	return pic;
}
public void setPic(String pic) {
	this.pic = pic;
	System.out.println(pic);

}
public String getTraderbankname() {
	return traderbankname;
}
public void setTraderbankname(String traderbankname) {
	this.traderbankname = traderbankname;
	System.out.println(traderbankname);

}
public long getTraderbankaccountnum() {
	return traderbankaccountnum;
}
public void setTraderbankaccountnum(long traderbankaccountnum) {
	this.traderbankaccountnum = traderbankaccountnum;
	System.out.println(traderbankaccountnum);

}
public String getTraderbankbranch() {
	return traderbankbranch;
}
public void setTraderbankbranch(String traderbankbranch) {
	this.traderbankbranch = traderbankbranch;
	System.out.println(traderbankbranch);

}
public String getTraderifsc() {
	return traderifsc;
}
public void setTraderifsc(String traderifsc) {
	this.traderifsc = traderifsc;
	System.out.println(traderifsc);

}
public String getTraderuid() {
	return traderuid;
}
public void setTraderuid(String traderuid) {
	this.traderuid = traderuid;
	System.out.println(traderuid);

}
String	traderemail;
String	state;
String	district;
String	tradertaluk;
String	traderhobli;
String	tradervillage;
String	pic;
String	traderbankname;
long	traderbankaccountnum;
String	traderbankbranch;
String	traderifsc;
String	traderuid;
}
