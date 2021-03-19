package spring.bao.mapper;

import java.util.ArrayList;
import spring.bao.beans.BidBean;
import spring.bao.beans.RequestBean;

public interface RequestDealIf {
	public int isBidder(BidBean bid);
	public ArrayList<RequestBean> getReqDetail(RequestBean request);
	public int insReqSend(RequestBean request);
	public int updateReqDetail(RequestBean request);
	public int deleteReqDetail(RequestBean request);
	
}
