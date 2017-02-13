package com.neomandi.prototype;

import java.io.Serializable;

@SuppressWarnings("serial")
public class DispatchBean implements Serializable{
String lotnum;
String aadharnumber;
String quantityassigned;
String name;
public String getName() {
	return name;
}
public void setName(String name) {
	this.name = name;
}
@Override
public int hashCode() {
	final int prime = 31;
	int result = 1;
	result = prime * result + ((aadharnumber == null) ? 0 : aadharnumber.hashCode());
	result = prime * result + ((lotnum == null) ? 0 : lotnum.hashCode());
	result = prime * result + ((name == null) ? 0 : name.hashCode());
	result = prime * result + ((quantityassigned == null) ? 0 : quantityassigned.hashCode());
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
	DispatchBean other = (DispatchBean) obj;
	if (aadharnumber == null) {
		if (other.aadharnumber != null)
			return false;
	} else if (!aadharnumber.equals(other.aadharnumber))
		return false;
	if (lotnum == null) {
		if (other.lotnum != null)
			return false;
	} else if (!lotnum.equals(other.lotnum))
		return false;
	if (name == null) {
		if (other.name != null)
			return false;
	} else if (!name.equals(other.name))
		return false;
	if (quantityassigned == null) {
		if (other.quantityassigned != null)
			return false;
	} else if (!quantityassigned.equals(other.quantityassigned))
		return false;
	return true;
}
@Override
public String toString() {
	return "DispatchBean [lotnum=" + lotnum + ", aadharnumber=" + aadharnumber + ", quantityassigned="
			+ quantityassigned + ", name=" + name + "]";
}
public String getLotnum() {
	return lotnum;
}
public void setLotnum(String lotnum) {
	this.lotnum = lotnum;
}

public String getAadharnumber() {
	return aadharnumber;
}
public void setAadharnumber(String aadharnumber) {
	this.aadharnumber = aadharnumber;
}
public String getQuantityassigned() {
	return quantityassigned;
}
public void setQuantityassigned(String quantityassigned) {
	this.quantityassigned = quantityassigned;
}
}
