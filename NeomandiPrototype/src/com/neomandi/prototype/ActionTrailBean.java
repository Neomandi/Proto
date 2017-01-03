package com.neomandi.prototype;

public class ActionTrailBean {
	
	private int v1;
	private int av1;
	private int b1;
	private int bb1;
	
	private int v2;
	private int av2;
	private int b2;
	private int bb2;
	
	private int v3;
	private int av3;
	private int b3;
	private int bb3;
	
	private int v4;
	private int av4;
	private int b4;
	private int bb4;

	private int v5;
	private int av5;
	private int b5;
	private int bb5;
	
	private int v6;
	private int av6;
	private int b6;
	private int bb6;
	
	private int v7;
	private int av7;
	private int b7;
	private int bb7;
	
	private int v8;
	private int av8;
	private int b8;
	private int bb8;
	
	private int maxvol;
	
	
	public int getMaxvol() {
		return maxvol;
	}
	public void setMaxvol(int maxvol) {
		System.out.println("Maxvol: "+maxvol);
		this.maxvol = maxvol;
	}
	public int getV1() {
		return v1;
	}
	public void setV1(int v1) {
		System.out.println("V1: "+v1);
		this.v1 = v1;
	}
	public int getAv1() {
		return av1;
	}
	public void setAv1(int av1) {
		this.av1 = av1;
	}
	public int getB1() {
		return b1;
	}
	public void setB1(int b1) {
		this.b1 = b1;
	}
	public int getBb1() {
		return bb1;
	}
	public void setBb1(int bb1) {
		this.bb1 = bb1;
	}
	public int getV2() {
		return v2;
	}
	public void setV2(int v2) {
		System.out.println("V2: "+v2);
		this.v2 = v2;
	}
	public int getAv2() {
		return av2;
	}
	public void setAv2(int av2) {
		this.av2 = av2;
	}
	public int getB2() {
		return b2;
	}
	public void setB2(int b2) {
		this.b2 = b2;
	}
	public int getBb2() {
		return bb2;
	}
	public void setBb2(int bb2) {
		this.bb2 = bb2;
	}
	public int getV3() {
		return v3;
	}
	public void setV3(int v3) {
		System.out.println("V3: "+v3);
		this.v3 = v3;
	}
	public int getAv3() {
		return av3;
	}
	public void setAv3(int av3) {
		this.av3 = av3;
	}
	public int getB3() {
		return b3;
	}
	public void setB3(int b3) {
		this.b3 = b3;
	}
	public int getBb3() {
		return bb3;
	}
	public void setBb3(int bb3) {
		this.bb3 = bb3;
	}
	public int getV4() {
		return v4;
	}
	public void setV4(int v4) {
		System.out.println("V4: "+v4);
		this.v4 = v4;
	}
	public int getAv4() {
		return av4;
	}
	public void setAv4(int av4) {
		this.av4 = av4;
	}
	public int getB4() {
		return b4;
	}
	public void setB4(int b4) {
		this.b4 = b4;
	}
	public int getBb4() {
		return bb4;
	}
	public void setBb4(int bb4) {
		this.bb4 = bb4;
	}
	public int getV5() {
		return v5;
	}
	public void setV5(int v5) {
		System.out.println("V5: "+v5);
		this.v5 = v5;
	}
	public int getAv5() {
		return av5;
	}
	public void setAv5(int av5) {
		this.av5 = av5;
	}
	public int getB5() {
		return b5;
	}
	public void setB5(int b5) {
		this.b5 = b5;
	}
	public int getBb5() {
		return bb5;
	}
	public void setBb5(int bb5) {
		this.bb5 = bb5;
	}
	public int getV6() {
		return v6;
	}
	public void setV6(int v6) {
		System.out.println("V6: "+v6);
		this.v6 = v6;
	}
	public int getAv6() {
		return av6;
	}
	public void setAv6(int av6) {
		this.av6 = av6;
	}
	public int getB6() {
		return b6;
	}
	public void setB6(int b6) {
		this.b6 = b6;
	}
	public int getBb6() {
		return bb6;
	}
	public void setBb6(int bb6) {
		this.bb6 = bb6;
	}
	public int getV7() {
		return v7;
	}
	public void setV7(int v7) {
		System.out.println("V7: "+v7);
		this.v7 = v7;
	}
	public int getAv7() {
		return av7;
	}
	public void setAv7(int av7) {
		this.av7 = av7;
	}
	public int getB7() {
		return b7;
	}
	public void setB7(int b7) {
		this.b7 = b7;
	}
	public int getBb7() {
		return bb7;
	}
	public void setBb7(int bb7) {
		this.bb7 = bb7;
	}
	public int getV8() {
		return v8;
	}
	public void setV8(int v8) {
		System.out.println("V8: "+v8);
		this.v8 = v8;
	}
	public int getAv8() {
		return av8;
	}
	public void setAv8(int av8) {
		this.av8 = av8;
	}
	public int getB8() {
		return b8;
	}
	public void setB8(int b8) {
		this.b8 = b8;
	}
	public int getBb8() {
		return bb8;
	}
	public void setBb8(int bb8) {
		this.bb8 = bb8;
	}
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + av1;
		result = prime * result + av2;
		result = prime * result + av3;
		result = prime * result + av4;
		result = prime * result + av5;
		result = prime * result + av6;
		result = prime * result + av7;
		result = prime * result + av8;
		result = prime * result + b1;
		result = prime * result + b2;
		result = prime * result + b3;
		result = prime * result + b4;
		result = prime * result + b5;
		result = prime * result + b6;
		result = prime * result + b7;
		result = prime * result + b8;
		result = prime * result + bb1;
		result = prime * result + bb2;
		result = prime * result + bb3;
		result = prime * result + bb4;
		result = prime * result + bb5;
		result = prime * result + bb6;
		result = prime * result + bb7;
		result = prime * result + bb8;
		result = prime * result + maxvol;
		result = prime * result + v1;
		result = prime * result + v2;
		result = prime * result + v3;
		result = prime * result + v4;
		result = prime * result + v5;
		result = prime * result + v6;
		result = prime * result + v7;
		result = prime * result + v8;
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
		ActionTrailBean other = (ActionTrailBean) obj;
		if (av1 != other.av1)
			return false;
		if (av2 != other.av2)
			return false;
		if (av3 != other.av3)
			return false;
		if (av4 != other.av4)
			return false;
		if (av5 != other.av5)
			return false;
		if (av6 != other.av6)
			return false;
		if (av7 != other.av7)
			return false;
		if (av8 != other.av8)
			return false;
		if (b1 != other.b1)
			return false;
		if (b2 != other.b2)
			return false;
		if (b3 != other.b3)
			return false;
		if (b4 != other.b4)
			return false;
		if (b5 != other.b5)
			return false;
		if (b6 != other.b6)
			return false;
		if (b7 != other.b7)
			return false;
		if (b8 != other.b8)
			return false;
		if (bb1 != other.bb1)
			return false;
		if (bb2 != other.bb2)
			return false;
		if (bb3 != other.bb3)
			return false;
		if (bb4 != other.bb4)
			return false;
		if (bb5 != other.bb5)
			return false;
		if (bb6 != other.bb6)
			return false;
		if (bb7 != other.bb7)
			return false;
		if (bb8 != other.bb8)
			return false;
		if (maxvol != other.maxvol)
			return false;
		if (v1 != other.v1)
			return false;
		if (v2 != other.v2)
			return false;
		if (v3 != other.v3)
			return false;
		if (v4 != other.v4)
			return false;
		if (v5 != other.v5)
			return false;
		if (v6 != other.v6)
			return false;
		if (v7 != other.v7)
			return false;
		if (v8 != other.v8)
			return false;
		return true;
	}
	@Override
	public String toString() {
		return "ActionTrailBean [v1=" + v1 + ", av1=" + av1 + ", b1=" + b1 + ", bb1=" + bb1 + ", v2=" + v2 + ", av2="
				+ av2 + ", b2=" + b2 + ", bb2=" + bb2 + ", v3=" + v3 + ", av3=" + av3 + ", b3=" + b3 + ", bb3=" + bb3
				+ ", v4=" + v4 + ", av4=" + av4 + ", b4=" + b4 + ", bb4=" + bb4 + ", v5=" + v5 + ", av5=" + av5
				+ ", b5=" + b5 + ", bb5=" + bb5 + ", v6=" + v6 + ", av6=" + av6 + ", b6=" + b6 + ", bb6=" + bb6
				+ ", v7=" + v7 + ", av7=" + av7 + ", b7=" + b7 + ", bb7=" + bb7 + ", v8=" + v8 + ", av8=" + av8
				+ ", b8=" + b8 + ", bb8=" + bb8 + ", maxvol=" + maxvol + "]";
	}
	
	
	
	
}
