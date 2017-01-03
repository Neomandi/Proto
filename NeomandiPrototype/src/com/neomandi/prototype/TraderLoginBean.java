package com.neomandi.prototype;

public class TraderLoginBean 
{
	private String tname;
	private String tpwd;
	
	public String getTname() {
		return tname;
	}
	public void setTname(String tname) {
		this.tname = tname;
		System.out.println("The Tname: "+tname);
	}
	public String getTpwd() {
		return tpwd;
	}
	public void setTpwd(String tpwd) {
		this.tpwd = tpwd;
		System.out.println("The Tpwd: "+tpwd);
	}
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((tname == null) ? 0 : tname.hashCode());
		result = prime * result + ((tpwd == null) ? 0 : tpwd.hashCode());
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
		TraderLoginBean other = (TraderLoginBean) obj;
		if (tname == null) {
			if (other.tname != null)
				return false;
		} else if (!tname.equals(other.tname))
			return false;
		if (tpwd == null) {
			if (other.tpwd != null)
				return false;
		} else if (!tpwd.equals(other.tpwd))
			return false;
		return true;
	}
	@Override
	public String toString() {
		return "TraderLoginBean [tname=" + tname + ", tpwd=" + tpwd + "]";
	}
	
	
	
}
