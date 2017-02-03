package com.neomandi.prototype;

public class EmployeeRegisterBean {
	
	private String employeename;
	private String employeemob;
	private String employeepwd;
	private String cemployeepwd;
	 
	public EmployeeRegisterBean(){
		System.out.println("in no argument constructor of EmployeeRegisterBean");
	}

	public String getEmployeename() {
		return employeename;
	}

	public void setEmployeename(String employeename) {
		this.employeename = employeename;
		//System.out.println("Ename: "+employeename);
	}

	public String getEmployeemob() {
		return employeemob;
	}

	public void setEmployeemob(String employeemob) {
		this.employeemob = employeemob;
		//System.out.println("Emob: "+employeemob);
	}

	public String getEmployeepwd() {
		return employeepwd;
	}

	public void setEmployeepwd(String employeepwd) {
		this.employeepwd = employeepwd;
		//System.out.println("pass: "+employeepwd);
	}

	public String getCemployeepwd() {
		return cemployeepwd;
	}

	public void setCemployeepwd(String cemployeepwd) {
		this.cemployeepwd = cemployeepwd;
		//System.out.println("cpass: "+cemployeepwd);
	}

	@Override
	public String toString() {
		return "EmployeeRegisterBean [employeename=" + employeename + ", employeemob=" + employeemob + ", employeepwd="
				+ employeepwd + ", cemployeepwd=" + cemployeepwd + "]";
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((cemployeepwd == null) ? 0 : cemployeepwd.hashCode());
		result = prime * result + ((employeemob == null) ? 0 : employeemob.hashCode());
		result = prime * result + ((employeename == null) ? 0 : employeename.hashCode());
		result = prime * result + ((employeepwd == null) ? 0 : employeepwd.hashCode());
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
		EmployeeRegisterBean other = (EmployeeRegisterBean) obj;
		if (cemployeepwd == null) {
			if (other.cemployeepwd != null)
				return false;
		} else if (!cemployeepwd.equals(other.cemployeepwd))
			return false;
		if (employeemob == null) {
			if (other.employeemob != null)
				return false;
		} else if (!employeemob.equals(other.employeemob))
			return false;
		if (employeename == null) {
			if (other.employeename != null)
				return false;
		} else if (!employeename.equals(other.employeename))
			return false;
		if (employeepwd == null) {
			if (other.employeepwd != null)
				return false;
		} else if (!employeepwd.equals(other.employeepwd))
			return false;
		return true;
	}

	public EmployeeRegisterBean(String employeename, String employeemob, String employeepwd, String cemployeepwd) {
		super();
		this.employeename = employeename;
		this.employeemob = employeemob;
		this.employeepwd = employeepwd;
		this.cemployeepwd = cemployeepwd;
	}
	
	
	
	
}
