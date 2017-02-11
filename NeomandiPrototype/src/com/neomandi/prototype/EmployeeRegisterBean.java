package com.neomandi.prototype;

public class EmployeeRegisterBean {
	
	private String employeename;
	private String employeenum;
	private String employeepwd;
	
	public String getEmployeename() {
		return employeename;
	}
	public void setEmployeename(String employeename) {
		this.employeename = employeename;
	}
	public String getEmployeenum() {
		return employeenum;
	}
	public void setEmployeenum(String employeenum) {
		this.employeenum = employeenum;
	}
	public String getEmployeepwd() {
		return employeepwd;
	}
	public void setEmployeepwd(String employeepwd) {
		this.employeepwd = employeepwd;
	}
	
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((employeename == null) ? 0 : employeename.hashCode());
		result = prime * result + ((employeenum == null) ? 0 : employeenum.hashCode());
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
		if (employeename == null) {
			if (other.employeename != null)
				return false;
		} else if (!employeename.equals(other.employeename))
			return false;
		if (employeenum == null) {
			if (other.employeenum != null)
				return false;
		} else if (!employeenum.equals(other.employeenum))
			return false;
		if (employeepwd == null) {
			if (other.employeepwd != null)
				return false;
		} else if (!employeepwd.equals(other.employeepwd))
			return false;
		return true;
	}
	
	@Override
	public String toString() {
		return "EmployeeRegisterBean [employeename=" + employeename + ", employeenum=" + employeenum + ", employeepwd="
				+ employeepwd + "]";
	}
}
