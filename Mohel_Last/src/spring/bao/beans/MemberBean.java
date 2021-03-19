package spring.bao.beans;

import lombok.Data;

@Data
public class MemberBean {
	private String sCode;
	private String mId;
	private String mName;
	private String mPw;
	private String mEmail;
	private String mCareer;
	private String mDivision;
	private String mStCode;
	private String mAccess;
	private String mRgRcCode;
	private String mRegionName;

	
	
	//추가
	private String mRcName;
	private String mRcCode;
	private String mPwC;
	private String alMmid;
}
