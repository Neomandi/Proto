package com.neomandi.prototype;

import java.io.InputStream;

public class FarmerRegisterBean {
	
	private String farmername;
	private long farmermobile;
	private long farmeraadharnum;
	private String farmeremail;
	private String farmerstate;
	private String farmerdistrict;
	private String farmertaluk;
	private String farmerhobli;
	private String farmervillage;
	private String farmerbankname;
	private long farmeraccountnum;
	private String farmerbranch;
	private String farmerifsccode;
	private InputStream farmerphoto;
	private String password;
	private String pin;
	private String address;
	
	public String getPin(){
		return pin;
	}
	public void setPin(String pin){
		this.pin=pin;
		System.out.println("pin="+pin);
	}
	public String getAddress(){
		return address;
	}
	public void setAddress(String address){
		this.address=pin;
		System.out.println("address="+address);
	}
	public String getPassword(){
		return password;
	}
	public void setPassword(String password){
		this.password=password;
		System.out.println("password="+password);
	}
	public String getFarmerbankname() {
		// TODO Auto-generated method stub
		return farmerbankname;
	}
	public void setFarmerbankname(String farmerbankname){
		this.farmerbankname=farmerbankname;
	}
	
	public String getFarmername() {
		return farmername;
	}
	public void setFarmername(String farmername) {
		this.farmername = farmername;
		System.out.println("inside set fname"+farmername);
	}
	public long getFarmermobile() {
		return farmermobile;
	}
	public void setFarmermobile(long farmermobile) {
		this.farmermobile = farmermobile;
		System.out.println("inside set fmob"+farmermobile);
	}
	public long getFarmeraadharnum() {
		return farmeraadharnum;
	}
	public void setFarmeraadharnum(long farmeraadharnum) {
		this.farmeraadharnum = farmeraadharnum;
		System.out.println("inside set fmob"+farmeraadharnum);
	}
	public String getFarmeremail() {
		return farmeremail;
	}
	public void setFarmeremail(String farmeremail) {
		this.farmeremail = farmeremail;
		System.out.println("inside set fmob"+farmeremail);
	}
	public String getFarmerstate() {
		return farmerstate;
	}
	public void setFarmerstate(String farmerstate) {
		this.farmerstate = farmerstate;
		System.out.println("inside set fmob"+farmerstate);
	}
	public String getFarmerdistrict() {
		return farmerdistrict;
	}
	public void setFarmerdistrict(String farmerdistrict) {
		this.farmerdistrict = farmerdistrict;
		System.out.println("inside set fmob"+farmerdistrict);
	}
	public String getFarmertaluk() {
		return farmertaluk;
	}
	public void setFarmertaluk(String farmertaluk) {
		this.farmertaluk = farmertaluk;
		System.out.println("inside set fmob"+farmertaluk);
	}
	public String getFarmerhobli() {
		return farmerhobli;
		
	}
	public void setFarmerhobli(String farmerhobli) {
		this.farmerhobli = farmerhobli;
	}
	public String getFarmervillage() {
		return farmervillage;
	}
	public void setFarmervillage(String farmervillage) {
		this.farmervillage = farmervillage;
	}
	public String getFarmerbankbame() {
		return farmerbankname;
	}
	public void setFarmerbankbame(String farmerbankname) {
		this.farmerbankname = farmerbankname;
	}
	public long getFarmeraccountnum() {
		return farmeraccountnum;
	}
	public void setFarmeraccountnum(long farmeraccountnum) {
		this.farmeraccountnum = farmeraccountnum;
	}
	public String getFarmerbranch() {
		return farmerbranch;
	}
	public void setFarmerbranch(String farmerbranch) {
		this.farmerbranch = farmerbranch;
	}
	public String getFarmerifsccode() {
		return farmerifsccode;
	}
	public void setFarmerifsccode(String farmerifsccode) {
		this.farmerifsccode = farmerifsccode;
	}
	public InputStream getFarmerphoto() {
		return farmerphoto;
	}
	public void setFarmerphoto(InputStream farmerphoto) {
		this.farmerphoto = farmerphoto;
	}
	@Override
	public String toString() {
		return "FarmerRegisterBean [farmername=" + farmername + ", farmermobile=" + farmermobile + ", farmeraadharnum="
				+ farmeraadharnum + ", farmeremail=" + farmeremail + ", farmerstate=" + farmerstate
				+ ", farmerdistrict=" + farmerdistrict + ", farmertaluk=" + farmertaluk + ", farmerhobli=" + farmerhobli
				+ ", farmervillage=" + farmervillage + ", farmerbankbame=" + farmerbankname + ", farmeraccountnum="
				+ farmeraccountnum + ", farmerbranch=" + farmerbranch + ", farmerifsccode=" + farmerifsccode
				+ ", farmerphoto=" + farmerphoto + "]";
	}
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + (int) (farmeraadharnum ^ (farmeraadharnum >>> 32));
		result = prime * result + (int) (farmeraccountnum ^ (farmeraccountnum >>> 32));
		result = prime * result + ((farmerbankname == null) ? 0 : farmerbankname.hashCode());
		result = prime * result + ((farmerbranch == null) ? 0 : farmerbranch.hashCode());
		result = prime * result + ((farmerdistrict == null) ? 0 : farmerdistrict.hashCode());
		result = prime * result + ((farmeremail == null) ? 0 : farmeremail.hashCode());
		result = prime * result + ((farmerhobli == null) ? 0 : farmerhobli.hashCode());
		result = prime * result + ((farmerifsccode == null) ? 0 : farmerifsccode.hashCode());
		result = prime * result + (int) (farmermobile ^ (farmermobile >>> 32));
		result = prime * result + ((farmername == null) ? 0 : farmername.hashCode());
		result = prime * result + ((farmerphoto == null) ? 0 : farmerphoto.hashCode());
		result = prime * result + ((farmerstate == null) ? 0 : farmerstate.hashCode());
		result = prime * result + ((farmertaluk == null) ? 0 : farmertaluk.hashCode());
		result = prime * result + ((farmervillage == null) ? 0 : farmervillage.hashCode());
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
		FarmerRegisterBean other = (FarmerRegisterBean) obj;
		if (farmeraadharnum != other.farmeraadharnum)
			return false;
		if (farmeraccountnum != other.farmeraccountnum)
			return false;
		if (farmerbankname == null) {
			if (other.farmerbankname != null)
				return false;
		} else if (!farmerbankname.equals(other.farmerbankname))
			return false;
		if (farmerbranch == null) {
			if (other.farmerbranch != null)
				return false;
		} else if (!farmerbranch.equals(other.farmerbranch))
			return false;
		if (farmerdistrict == null) {
			if (other.farmerdistrict != null)
				return false;
		} else if (!farmerdistrict.equals(other.farmerdistrict))
			return false;
		if (farmeremail == null) {
			if (other.farmeremail != null)
				return false;
		} else if (!farmeremail.equals(other.farmeremail))
			return false;
		if (farmerhobli == null) {
			if (other.farmerhobli != null)
				return false;
		} else if (!farmerhobli.equals(other.farmerhobli))
			return false;
		if (farmerifsccode == null) {
			if (other.farmerifsccode != null)
				return false;
		} else if (!farmerifsccode.equals(other.farmerifsccode))
			return false;
		if (farmermobile != other.farmermobile)
			return false;
		if (farmername == null) {
			if (other.farmername != null)
				return false;
		} else if (!farmername.equals(other.farmername))
			return false;
		if (farmerphoto == null) {
			if (other.farmerphoto != null)
				return false;
		} else if (!farmerphoto.equals(other.farmerphoto))
			return false;
		if (farmerstate == null) {
			if (other.farmerstate != null)
				return false;
		} else if (!farmerstate.equals(other.farmerstate))
			return false;
		if (farmertaluk == null) {
			if (other.farmertaluk != null)
				return false;
		} else if (!farmertaluk.equals(other.farmertaluk))
			return false;
		if (farmervillage == null) {
			if (other.farmervillage != null)
				return false;
		} else if (!farmervillage.equals(other.farmervillage))
			return false;
		return true;
	}
	
	
	
}