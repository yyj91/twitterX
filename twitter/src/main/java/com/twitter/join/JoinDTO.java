package com.twitter.join;

public class JoinDTO {
private int mno;
private long mpn;
private String mid, mpw, mname, tnick;

public int getMno() {
	return mno;
}

public void setMno(int mno) {
	this.mno = mno;
}

public String getMid() {
	return mid;
}

public void setMid(String mid) {
	this.mid = mid;
}

public String getMpw() {
	return mpw;
}

public void setMpw(String mpw) {
	this.mpw = mpw;
}

public String getMname() {
	return mname;
}

public void setMname(String mname) {
	this.mname = mname;
}

public long getMpn() {
	return mpn;
}

public void setMpn(long mpn) {
	this.mpn = mpn;
}

public String getTnick() {
	return tnick;
}

public void setTnick(String tnick) {
	this.tnick = tnick;
}


}
