package com.neomandi.prototype;

import java.io.InputStream;

public class TraderRegisterBean {
	
	
	private String traderName;
	private long traderMobile;
	private long traderAadharnum;
	private String traderEmail;
	private String traderState;
	private String traderDistrict;
	private String traderTaluk;
	private String traderHobli;
	private String traderVillage;
	private String traderBankName;
	private long traderAccountNum;
	private String traderBranch;
	private String traderIfscCode;
	private String traderUid;
	private String traderLicenseNum;
	private String traderPwd;
	private InputStream traderPhoto;
	
	public TraderRegisterBean(String traderName, long traderMobile, long traderAadharnum, String traderEmail,
			String traderState, String traderDistrict, String traderTaluk, String traderHobli, String traderVillage,
			String traderBankName, long traderAccountNum, String traderBranch, String traderIfscCode, String traderUid,
			String traderLicenseNum, String traderPwd, InputStream traderPhoto) {
		super();
		this.traderName = traderName;
		this.traderMobile = traderMobile;
		this.traderAadharnum = traderAadharnum;
		this.traderEmail = traderEmail;
		this.traderState = traderState;
		this.traderDistrict = traderDistrict;
		this.traderTaluk = traderTaluk;
		this.traderHobli = traderHobli;
		this.traderVillage = traderVillage;
		this.traderBankName = traderBankName;
		this.traderAccountNum = traderAccountNum;
		this.traderBranch = traderBranch;
		this.traderIfscCode = traderIfscCode;
		this.traderUid = traderUid;
		this.traderLicenseNum = traderLicenseNum;
		this.traderPwd = traderPwd;
		this.traderPhoto = traderPhoto;
	}

	public String getTraderName() {
		return traderName;
	}

	public void setTraderName(String traderName) {
		this.traderName = traderName;
	}

	public long getTraderMobile() {
		return traderMobile;
	}

	public void setTraderMobile(long traderMobile) {
		this.traderMobile = traderMobile;
	}

	public long getTraderAadharnum() {
		return traderAadharnum;
	}

	public void setTraderAadharnum(long traderAadharnum) {
		this.traderAadharnum = traderAadharnum;
	}

	public String getTraderEmail() {
		return traderEmail;
	}

	public void setTraderEmail(String traderEmail) {
		this.traderEmail = traderEmail;
	}

	public String getTraderState() {
		return traderState;
	}

	public void setTraderState(String traderState) {
		this.traderState = traderState;
	}

	public String getTraderDistrict() {
		return traderDistrict;
	}

	public void setTraderDistrict(String traderDistrict) {
		this.traderDistrict = traderDistrict;
	}

	public String getTraderTaluk() {
		return traderTaluk;
	}

	public void setTraderTaluk(String traderTaluk) {
		this.traderTaluk = traderTaluk;
	}

	public String getTraderHobli() {
		return traderHobli;
	}

	public void setTraderHobli(String traderHobli) {
		this.traderHobli = traderHobli;
	}

	public String getTraderVillage() {
		return traderVillage;
	}

	public void setTraderVillage(String traderVillage) {
		this.traderVillage = traderVillage;
	}

	public String getTraderBankName() {
		return traderBankName;
	}

	public void setTraderBankName(String traderBankName) {
		this.traderBankName = traderBankName;
	}

	public long getTraderAccountNum() {
		return traderAccountNum;
	}

	public void setTraderAccountNum(long traderAccountNum) {
		this.traderAccountNum = traderAccountNum;
	}

	public String getTraderBranch() {
		return traderBranch;
	}

	public void setTraderBranch(String traderBranch) {
		this.traderBranch = traderBranch;
	}

	public String getTraderIfscCode() {
		return traderIfscCode;
	}

	public void setTraderIfscCode(String traderIfscCode) {
		this.traderIfscCode = traderIfscCode;
	}

	public String getTraderUid() {
		return traderUid;
	}

	public void setTraderUid(String traderUid) {
		this.traderUid = traderUid;
	}

	public String getTraderLicenseNum() {
		return traderLicenseNum;
	}

	public void setTraderLicenseNum(String traderLicenseNum) {
		this.traderLicenseNum = traderLicenseNum;
	}

	public String getTraderPwd() {
		return traderPwd;
	}

	public void setTraderPwd(String traderPwd) {
		this.traderPwd = traderPwd;
	}

	public InputStream getTraderPhoto() {
		return traderPhoto;
	}

	public void setTraderPhoto(InputStream traderPhoto) {
		this.traderPhoto = traderPhoto;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + (int) (traderAadharnum ^ (traderAadharnum >>> 32));
		result = prime * result + (int) (traderAccountNum ^ (traderAccountNum >>> 32));
		result = prime * result + ((traderBankName == null) ? 0 : traderBankName.hashCode());
		result = prime * result + ((traderBranch == null) ? 0 : traderBranch.hashCode());
		result = prime * result + ((traderDistrict == null) ? 0 : traderDistrict.hashCode());
		result = prime * result + ((traderEmail == null) ? 0 : traderEmail.hashCode());
		result = prime * result + ((traderHobli == null) ? 0 : traderHobli.hashCode());
		result = prime * result + ((traderIfscCode == null) ? 0 : traderIfscCode.hashCode());
		result = prime * result + ((traderLicenseNum == null) ? 0 : traderLicenseNum.hashCode());
		result = prime * result + (int) (traderMobile ^ (traderMobile >>> 32));
		result = prime * result + ((traderName == null) ? 0 : traderName.hashCode());
		result = prime * result + ((traderPhoto == null) ? 0 : traderPhoto.hashCode());
		result = prime * result + ((traderPwd == null) ? 0 : traderPwd.hashCode());
		result = prime * result + ((traderState == null) ? 0 : traderState.hashCode());
		result = prime * result + ((traderTaluk == null) ? 0 : traderTaluk.hashCode());
		result = prime * result + ((traderUid == null) ? 0 : traderUid.hashCode());
		result = prime * result + ((traderVillage == null) ? 0 : traderVillage.hashCode());
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
		if (traderAadharnum != other.traderAadharnum)
			return false;
		if (traderAccountNum != other.traderAccountNum)
			return false;
		if (traderBankName == null) {
			if (other.traderBankName != null)
				return false;
		} else if (!traderBankName.equals(other.traderBankName))
			return false;
		if (traderBranch == null) {
			if (other.traderBranch != null)
				return false;
		} else if (!traderBranch.equals(other.traderBranch))
			return false;
		if (traderDistrict == null) {
			if (other.traderDistrict != null)
				return false;
		} else if (!traderDistrict.equals(other.traderDistrict))
			return false;
		if (traderEmail == null) {
			if (other.traderEmail != null)
				return false;
		} else if (!traderEmail.equals(other.traderEmail))
			return false;
		if (traderHobli == null) {
			if (other.traderHobli != null)
				return false;
		} else if (!traderHobli.equals(other.traderHobli))
			return false;
		if (traderIfscCode == null) {
			if (other.traderIfscCode != null)
				return false;
		} else if (!traderIfscCode.equals(other.traderIfscCode))
			return false;
		if (traderLicenseNum == null) {
			if (other.traderLicenseNum != null)
				return false;
		} else if (!traderLicenseNum.equals(other.traderLicenseNum))
			return false;
		if (traderMobile != other.traderMobile)
			return false;
		if (traderName == null) {
			if (other.traderName != null)
				return false;
		} else if (!traderName.equals(other.traderName))
			return false;
		if (traderPhoto == null) {
			if (other.traderPhoto != null)
				return false;
		} else if (!traderPhoto.equals(other.traderPhoto))
			return false;
		if (traderPwd == null) {
			if (other.traderPwd != null)
				return false;
		} else if (!traderPwd.equals(other.traderPwd))
			return false;
		if (traderState == null) {
			if (other.traderState != null)
				return false;
		} else if (!traderState.equals(other.traderState))
			return false;
		if (traderTaluk == null) {
			if (other.traderTaluk != null)
				return false;
		} else if (!traderTaluk.equals(other.traderTaluk))
			return false;
		if (traderUid == null) {
			if (other.traderUid != null)
				return false;
		} else if (!traderUid.equals(other.traderUid))
			return false;
		if (traderVillage == null) {
			if (other.traderVillage != null)
				return false;
		} else if (!traderVillage.equals(other.traderVillage))
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "TraderRegisterBean [traderName=" + traderName + ", traderMobile=" + traderMobile + ", traderAadharnum="
				+ traderAadharnum + ", traderEmail=" + traderEmail + ", traderState=" + traderState
				+ ", traderDistrict=" + traderDistrict + ", traderTaluk=" + traderTaluk + ", traderHobli=" + traderHobli
				+ ", traderVillage=" + traderVillage + ", traderBankName=" + traderBankName + ", traderAccountNum="
				+ traderAccountNum + ", traderBranch=" + traderBranch + ", traderIfscCode=" + traderIfscCode
				+ ", traderUid=" + traderUid + ", traderLicenseNum=" + traderLicenseNum + ", traderPwd=" + traderPwd
				+ ", traderPhoto=" + traderPhoto + "]";
	}
}
