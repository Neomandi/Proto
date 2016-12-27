package com.neomandi.prototype;

import java.io.InputStream;

public class FarmerRegisterBean {
	
	private String farmerName;
	private long farmerMobile;
	private long farmerAadharnum;
	private String farmerEmail;
	private String farmerState;
	private String farmerDistrict;
	private String farmerTaluk;
	private String farmerHobli;
	private String farmerVillage;
	private String farmerBankName;
	private long farmerAccountNum;
	private String farmerBranch;
	private String farmerIfscCode;
	private InputStream farmerPhoto;
	
	
	
	public FarmerRegisterBean(String farmerName, long farmerMobile, long farmerAadharnum, String farmerEmail,
			String farmerState, String farmerDistrict, String farmerTaluk, String farmerHobli, String farmerVillage,
			String farmerBankName, long farmerAccountNum, String farmerBranch, String farmerIfscCode,
			InputStream farmerPhoto) {
		super();
		this.farmerName = farmerName;
		this.farmerMobile = farmerMobile;
		this.farmerAadharnum = farmerAadharnum;
		this.farmerEmail = farmerEmail;
		this.farmerState = farmerState;
		this.farmerDistrict = farmerDistrict;
		this.farmerTaluk = farmerTaluk;
		this.farmerHobli = farmerHobli;
		this.farmerVillage = farmerVillage;
		this.farmerBankName = farmerBankName;
		this.farmerAccountNum = farmerAccountNum;
		this.farmerBranch = farmerBranch;
		this.farmerIfscCode = farmerIfscCode;
		this.farmerPhoto = farmerPhoto;
	}
	public String getFarmerName() {
		return farmerName;
	}
	public void setFarmerName(String farmerName) {
		this.farmerName = farmerName;
	}
	public long getFarmerMobile() {
		return farmerMobile;
	}
	public void setFarmerMobile(long farmerMobile) {
		this.farmerMobile = farmerMobile;
	}
	public long getFarmerAadharnum() {
		return farmerAadharnum;
	}
	public void setFarmerAadharnum(long farmerAadharnum) {
		this.farmerAadharnum = farmerAadharnum;
	}
	public String getFarmerEmail() {
		return farmerEmail;
	}
	public void setFarmerEmail(String farmerEmail) {
		this.farmerEmail = farmerEmail;
	}
	public String getFarmerState() {
		return farmerState;
	}
	public void setFarmerState(String farmerState) {
		this.farmerState = farmerState;
	}
	public String getFarmerDistrict() {
		return farmerDistrict;
	}
	public void setFarmerDistrict(String farmerDistrict) {
		this.farmerDistrict = farmerDistrict;
	}
	public String getFarmerTaluk() {
		return farmerTaluk;
	}
	public void setFarmerTaluk(String farmerTaluk) {
		this.farmerTaluk = farmerTaluk;
	}
	public String getFarmerHobli() {
		return farmerHobli;
	}
	public void setFarmerHobli(String farmerHobli) {
		this.farmerHobli = farmerHobli;
	}
	public String getFarmerVillage() {
		return farmerVillage;
	}
	public void setFarmerVillage(String farmerVillage) {
		this.farmerVillage = farmerVillage;
	}
	public String getFarmerBankName() {
		return farmerBankName;
	}
	public void setFarmerBankName(String farmerBankName) {
		this.farmerBankName = farmerBankName;
	}
	public long getFarmerAccountNum() {
		return farmerAccountNum;
	}
	public void setFarmerAccountNum(long farmerAccountNum) {
		this.farmerAccountNum = farmerAccountNum;
	}
	public String getFarmerBranch() {
		return farmerBranch;
	}
	public void setFarmerBranch(String farmerBranch) {
		this.farmerBranch = farmerBranch;
	}
	public String getFarmerIfscCode() {
		return farmerIfscCode;
	}
	public void setFarmerIfscCode(String farmerIfscCode) {
		this.farmerIfscCode = farmerIfscCode;
	}
	public InputStream getFarmerPhoto() {
		return farmerPhoto;
	}
	public void setFarmerPhoto(InputStream farmerPhoto) {
		this.farmerPhoto = farmerPhoto;
	}
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + (int) (farmerAadharnum ^ (farmerAadharnum >>> 32));
		result = prime * result + (int) (farmerAccountNum ^ (farmerAccountNum >>> 32));
		result = prime * result + ((farmerBankName == null) ? 0 : farmerBankName.hashCode());
		result = prime * result + ((farmerBranch == null) ? 0 : farmerBranch.hashCode());
		result = prime * result + ((farmerDistrict == null) ? 0 : farmerDistrict.hashCode());
		result = prime * result + ((farmerEmail == null) ? 0 : farmerEmail.hashCode());
		result = prime * result + ((farmerHobli == null) ? 0 : farmerHobli.hashCode());
		result = prime * result + ((farmerIfscCode == null) ? 0 : farmerIfscCode.hashCode());
		result = prime * result + (int) (farmerMobile ^ (farmerMobile >>> 32));
		result = prime * result + ((farmerName == null) ? 0 : farmerName.hashCode());
		result = prime * result + ((farmerPhoto == null) ? 0 : farmerPhoto.hashCode());
		result = prime * result + ((farmerState == null) ? 0 : farmerState.hashCode());
		result = prime * result + ((farmerTaluk == null) ? 0 : farmerTaluk.hashCode());
		result = prime * result + ((farmerVillage == null) ? 0 : farmerVillage.hashCode());
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
		if (farmerAadharnum != other.farmerAadharnum)
			return false;
		if (farmerAccountNum != other.farmerAccountNum)
			return false;
		if (farmerBankName == null) {
			if (other.farmerBankName != null)
				return false;
		} else if (!farmerBankName.equals(other.farmerBankName))
			return false;
		if (farmerBranch == null) {
			if (other.farmerBranch != null)
				return false;
		} else if (!farmerBranch.equals(other.farmerBranch))
			return false;
		if (farmerDistrict == null) {
			if (other.farmerDistrict != null)
				return false;
		} else if (!farmerDistrict.equals(other.farmerDistrict))
			return false;
		if (farmerEmail == null) {
			if (other.farmerEmail != null)
				return false;
		} else if (!farmerEmail.equals(other.farmerEmail))
			return false;
		if (farmerHobli == null) {
			if (other.farmerHobli != null)
				return false;
		} else if (!farmerHobli.equals(other.farmerHobli))
			return false;
		if (farmerIfscCode == null) {
			if (other.farmerIfscCode != null)
				return false;
		} else if (!farmerIfscCode.equals(other.farmerIfscCode))
			return false;
		if (farmerMobile != other.farmerMobile)
			return false;
		if (farmerName == null) {
			if (other.farmerName != null)
				return false;
		} else if (!farmerName.equals(other.farmerName))
			return false;
		if (farmerPhoto == null) {
			if (other.farmerPhoto != null)
				return false;
		} else if (!farmerPhoto.equals(other.farmerPhoto))
			return false;
		if (farmerState == null) {
			if (other.farmerState != null)
				return false;
		} else if (!farmerState.equals(other.farmerState))
			return false;
		if (farmerTaluk == null) {
			if (other.farmerTaluk != null)
				return false;
		} else if (!farmerTaluk.equals(other.farmerTaluk))
			return false;
		if (farmerVillage == null) {
			if (other.farmerVillage != null)
				return false;
		} else if (!farmerVillage.equals(other.farmerVillage))
			return false;
		return true;
	}
	@Override
	public String toString() {
		return "FarmerRegisterBean [farmerName=" + farmerName + ", farmerMobile=" + farmerMobile + ", farmerAadharnum="
				+ farmerAadharnum + ", farmerEmail=" + farmerEmail + ", farmerState=" + farmerState
				+ ", farmerDistrict=" + farmerDistrict + ", farmerTaluk=" + farmerTaluk + ", farmerHobli=" + farmerHobli
				+ ", farmerVillage=" + farmerVillage + ", farmerBankName=" + farmerBankName + ", farmerAccountNum="
				+ farmerAccountNum + ", farmerBranch=" + farmerBranch + ", farmerIfscCode=" + farmerIfscCode
				+ ", farmerPhoto=" + farmerPhoto + "]";
	}
	
	
}
