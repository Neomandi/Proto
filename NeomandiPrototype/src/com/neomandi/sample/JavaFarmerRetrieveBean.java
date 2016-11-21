package com.neomandi.sample;

public class JavaFarmerRetrieveBean {

	private String name;
	private String mobile;
	private String aadharnum;
	private String email;
	private String state;
	private  String district;
	private String taluk;
	private String hobli;
	private String village;
	
	public JavaFarmerRetrieveBean(String name, String mobile, String aadharnum, String email, String state,
			String district, String taluk, String hobli, String village) {
		super();
		this.name = name;
		this.mobile = mobile;
		this.aadharnum = aadharnum;
		this.email = email;
		this.state = state;
		this.district = district;
		this.taluk = taluk;
		this.hobli = hobli;
		this.village = village;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getMobile() {
		return mobile;
	}

	public void setMobile(String mobile) {
		this.mobile = mobile;
	}

	public String getAadharnum() {
		return aadharnum;
	}

	public void setAadharnum(String aadharnum) {
		this.aadharnum = aadharnum;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public String getDistrict() {
		return district;
	}

	public void setDistrict(String district) {
		this.district = district;
	}

	public String getTaluk() {
		return taluk;
	}

	public void setTaluk(String taluk) {
		this.taluk = taluk;
	}

	public String getHobli() {
		return hobli;
	}

	public void setHobli(String hobli) {
		this.hobli = hobli;
	}

	public String getVillage() {
		return village;
	}

	public void setVillage(String village) {
		this.village = village;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((aadharnum == null) ? 0 : aadharnum.hashCode());
		result = prime * result + ((district == null) ? 0 : district.hashCode());
		result = prime * result + ((email == null) ? 0 : email.hashCode());
		result = prime * result + ((hobli == null) ? 0 : hobli.hashCode());
		result = prime * result + ((mobile == null) ? 0 : mobile.hashCode());
		result = prime * result + ((name == null) ? 0 : name.hashCode());
		result = prime * result + ((state == null) ? 0 : state.hashCode());
		result = prime * result + ((taluk == null) ? 0 : taluk.hashCode());
		result = prime * result + ((village == null) ? 0 : village.hashCode());
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
		JavaFarmerRetrieveBean other = (JavaFarmerRetrieveBean) obj;
		if (aadharnum == null) {
			if (other.aadharnum != null)
				return false;
		} else if (!aadharnum.equals(other.aadharnum))
			return false;
		if (district == null) {
			if (other.district != null)
				return false;
		} else if (!district.equals(other.district))
			return false;
		if (email == null) {
			if (other.email != null)
				return false;
		} else if (!email.equals(other.email))
			return false;
		if (hobli == null) {
			if (other.hobli != null)
				return false;
		} else if (!hobli.equals(other.hobli))
			return false;
		if (mobile == null) {
			if (other.mobile != null)
				return false;
		} else if (!mobile.equals(other.mobile))
			return false;
		if (name == null) {
			if (other.name != null)
				return false;
		} else if (!name.equals(other.name))
			return false;
		if (state == null) {
			if (other.state != null)
				return false;
		} else if (!state.equals(other.state))
			return false;
		if (taluk == null) {
			if (other.taluk != null)
				return false;
		} else if (!taluk.equals(other.taluk))
			return false;
		if (village == null) {
			if (other.village != null)
				return false;
		} else if (!village.equals(other.village))
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "JavaFarmerRetrieveBean [name=" + name + ", mobile=" + mobile + ", aadharnum=" + aadharnum + ", email="
				+ email + ", state=" + state + ", district=" + district + ", taluk=" + taluk + ", hobli=" + hobli
				+ ", village=" + village + "]";
	}
}
