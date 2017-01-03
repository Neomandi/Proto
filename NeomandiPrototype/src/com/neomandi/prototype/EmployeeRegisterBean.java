package com.neomandi.prototype;

public class EmployeeRegisterBean {
	
	private String employeename;
	private long employeemob;
	private long employeeaadharnum;
	private String employeeemail;
	private String employeestate;
	private String employeedistrict;
	private String employeeuid;
	private String employeepwd;
	
	public String getEmployeename() {
		return employeename;
	}
	public void setEmployeename(String employeename) {
		this.employeename = employeename;
		System.out.println("Employee name: "+employeename);
	}
	public long getEmployeemob() {
		return employeemob;
	}
	public void setEmployeemob(long employeemob) {
		this.employeemob = employeemob;
		System.out.println("Employee mob: "+employeemob);
	}
	public long getEmployeeaadharnum() {
		return employeeaadharnum;
	}
	public void setEmployeeaadharnum(long employeeaadharnum) {
		this.employeeaadharnum = employeeaadharnum;
		System.out.println("Employee aadharnum: "+employeeaadharnum);
	}
	public String getEmployeeemail() {
		return employeeemail;
	}
	public void setEmployeeemail(String employeeemail) {
		this.employeeemail = employeeemail;
		System.out.println("Employee email: "+employeeemail);
	}
	public String getEmployeestate() {
		return employeestate;
	}
	public void setEmployeestate(String employeestate) {
		this.employeestate = employeestate;
		System.out.println("Employee state: "+employeestate);
	}
	public String getEmployeedistrict() {
		return employeedistrict;
	}
	public void setEmployeedistrict(String employeedistrict) {
		this.employeedistrict = employeedistrict;
		System.out.println("Employee district: "+employeedistrict);
	}
	public String getEmployeeuid() {
		return employeeuid;
	}
	public void setEmployeeuid(String employeeuid) {
		this.employeeuid = employeeuid;
		System.out.println("Employee uid: "+employeeuid);
	}
	public String getEmployeepwd() {
		return employeepwd;
	}
	public void setEmployeepwd(String employeepwd) {
		this.employeepwd = employeepwd;
		System.out.println("Employee pwd: "+employeepwd);
	}
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + (int) (employeeaadharnum ^ (employeeaadharnum >>> 32));
		result = prime * result + ((employeedistrict == null) ? 0 : employeedistrict.hashCode());
		result = prime * result + ((employeeemail == null) ? 0 : employeeemail.hashCode());
		result = prime * result + (int) (employeemob ^ (employeemob >>> 32));
		result = prime * result + ((employeename == null) ? 0 : employeename.hashCode());
		result = prime * result + ((employeepwd == null) ? 0 : employeepwd.hashCode());
		result = prime * result + ((employeestate == null) ? 0 : employeestate.hashCode());
		result = prime * result + ((employeeuid == null) ? 0 : employeeuid.hashCode());
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
		if (employeeaadharnum != other.employeeaadharnum)
			return false;
		if (employeedistrict == null) {
			if (other.employeedistrict != null)
				return false;
		} else if (!employeedistrict.equals(other.employeedistrict))
			return false;
		if (employeeemail == null) {
			if (other.employeeemail != null)
				return false;
		} else if (!employeeemail.equals(other.employeeemail))
			return false;
		if (employeemob != other.employeemob)
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
		if (employeestate == null) {
			if (other.employeestate != null)
				return false;
		} else if (!employeestate.equals(other.employeestate))
			return false;
		if (employeeuid == null) {
			if (other.employeeuid != null)
				return false;
		} else if (!employeeuid.equals(other.employeeuid))
			return false;
		return true;
	}
	
	@Override
	public String toString() {
		return "EmployeeRegisterBean [employeename=" + employeename + ", employeemob=" + employeemob
				+ ", employeeaadharnum=" + employeeaadharnum + ", employeeemail=" + employeeemail + ", employeestate="
				+ employeestate + ", employeedistrict=" + employeedistrict + ", employeeuid=" + employeeuid
				+ ", employeepwd=" + employeepwd + "]";
	}
	
	
	
}
