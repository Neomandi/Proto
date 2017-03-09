package com.neomandi.prototype;

public class EmployeeLoginBean {
	private String ename;
	private String epwd;
	
	public EmployeeLoginBean() {
		// TODO Auto-generated constructor stub
	}
	public String getEname() {
		return ename;
	}
	public void setEname(String ename) {
		this.ename = ename;
		//System.out.println("Ename: "+ename);
	}
	public String getEpwd() {
		return epwd;
	}
	public void setEpwd(String epwd) {
		this.epwd = epwd;
	}
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((ename == null) ? 0 : ename.hashCode());
		result = prime * result + ((epwd == null) ? 0 : epwd.hashCode());
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
		EmployeeLoginBean other = (EmployeeLoginBean) obj;
		if (ename == null) {
			if (other.ename != null)
				return false;
		} else if (!ename.equals(other.ename))
			return false;
		if (epwd == null) {
			if (other.epwd != null)
				return false;
		} else if (!epwd.equals(other.epwd))
			return false;
		return true;
	}
	@Override
	public String toString() {
		return "EmployeeLoginBean [ename=" + ename + ", epwd=" + epwd + "]";
	}
	
	
}
