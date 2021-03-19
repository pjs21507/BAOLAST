package spring.bao.mapper;

import java.util.ArrayList;

import spring.bao.beans.BidBean;
import spring.bao.beans.MessageBean;
import spring.bao.beans.RequestBean;

public interface BidIf {
	
	public ArrayList<BidBean> getPriceDetail(BidBean bidbean);

	public int insBi(RequestBean request);
	
	public ArrayList<RequestBean> getbiCode(RequestBean requestbean);
	
	public ArrayList<RequestBean> rejectMInfo(RequestBean requestbean);
    
    public ArrayList<RequestBean> rejectMInfoStM(RequestBean requestbean);

    public ArrayList<RequestBean> rejectMInfoMsg(RequestBean requestbean);
    
//    public ArrayList<RequestBean> reqMmid(RequestBean requestbean);
    
    public int insBidInfo(RequestBean requestbean);

    public int updateAcceptStatus(RequestBean requestbean);

    public int updateRejectStatus(RequestBean requestbean);
    
    public int updateEveryRejectStatus(RequestBean requestbean);
    
    public ArrayList<RequestBean> rejectEveryMInfoMsg(RequestBean requestbean);
    
    public int insAcceptMsg(MessageBean message);

    public int insRejectMsg(MessageBean message);

	public int updateAcceptRqStatus(RequestBean requestbean);
	
	public int updateRejectRqStatus(RequestBean requestbean);
	
	
    

}
