package com.neomandi.prototype;

public class FarmerLoginBean {
	private String fname;
	private String fpwd;
	
	public String getFname() {
		return fname;
	}
	public void setFname(String fname) {
		this.fname = fname;
		System.out.println("Fname: "+fname);
	}
	public String getFpwd() {
		return fpwd;
	}
	public void setFpwd(String fpwd) {
		this.fpwd = fpwd;
		System.out.println("Fpwd: "+fpwd);
	}
	
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((fname == null) ? 0 : fname.hashCode());
		result = prime * result + ((fpwd == null) ? 0 : fpwd.hashCode());
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
		FarmerLoginBean other = (FarmerLoginBean) obj;
		if (fname == null) {
			if (other.fname != null)
				return false;
		} else if (!fname.equals(other.fname))
			return false;
		if (fpwd == null) {
			if (other.fpwd != null)
				return false;
		} else if (!fpwd.equals(other.fpwd))
			return false;
		return true;
	}
	@Override
	public String toString() {
		return "FarmerLoginBean [fname=" + fname + ", fpwd=" + fpwd + "]";
	}
	
	
}
