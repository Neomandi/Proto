package com.neomandi.prototype;

public class TraderBlockBean {
String dbbankname;
String ifsc;
String accountnumber;
int balance;
String msg="null";
int block;
String branch;

public String getBranch() {
	return branch;
}
public void setBranch(String branch) {
	this.branch = branch;
}
public int getBlock() {
	return block;
}
public void setBlock(int block) {
	this.block = block;
}
@Override
public int hashCode() {
	final int prime = 31;
	int result = 1;
	result = prime * result + ((accountnumber == null) ? 0 : accountnumber.hashCode());
	result = prime * result + balance;
	result = prime * result + block;
	result = prime * result + ((dbbankname == null) ? 0 : dbbankname.hashCode());
	result = prime * result + ((ifsc == null) ? 0 : ifsc.hashCode());
	result = prime * result + ((msg == null) ? 0 : msg.hashCode());
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
	TraderBlockBean other = (TraderBlockBean) obj;
	if (accountnumber == null) {
		if (other.accountnumber != null)
			return false;
	} else if (!accountnumber.equals(other.accountnumber))
		return false;
	if (balance != other.balance)
		return false;
	if (block != other.block)
		return false;
	if (dbbankname == null) {
		if (other.dbbankname != null)
			return false;
	} else if (!dbbankname.equals(other.dbbankname))
		return false;
	if (ifsc == null) {
		if (other.ifsc != null)
			return false;
	} else if (!ifsc.equals(other.ifsc))
		return false;
	if (msg == null) {
		if (other.msg != null)
			return false;
	} else if (!msg.equals(other.msg))
		return false;
	return true;
}
@Override
public String toString() {
	return "TraderBlockBean [dbbankname=" + dbbankname + ", ifsc=" + ifsc + ", accountnumber=" + accountnumber
			+ ", balance=" + balance + ", msg=" + msg + ", block=" + block + "]";
}
public String getDbbankname() {
	return dbbankname;
}
public void setDbbankname(String dbbankname) {
	this.dbbankname = dbbankname;
}
public String getIfsc() {
	return ifsc;
}
public void setIfsc(String ifsc) {
	this.ifsc = ifsc;
}
public String getAccountnumber() {
	return accountnumber;
}
public String getMsg() {
	System.out.println("inside bean-> getMsg()");
	if(msg==null)
		return "null";
	else
		return msg;
}

public void setAccountnumber(String accountnumber) {
	this.accountnumber = accountnumber;
}
public int getBalance() {
	return balance;
}
public void setBalance(int balance) {
	this.balance = balance;
}

public void setMsg(String msg) {
	this.msg = msg;
}
}
