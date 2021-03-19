package spring.bao.mapper;

import java.util.ArrayList;

import spring.bao.beans.MemberBean;
import spring.bao.beans.RequestBean;
import spring.bao.services.Bid;

public interface DealIf {

   public ArrayList<RequestBean> filterList(RequestBean reqBean); //대분류 요청글 최신정보 겟
   
   public ArrayList<RequestBean> BestFilterList(RequestBean reqBean); // 대분류 요청글 베스트정보 겟 

   public ArrayList<RequestBean> searchList(RequestBean reqBean); // 검색(검색어있음)
   
   public ArrayList<RequestBean> BestSearchList(RequestBean reqBean); // 베스트검색(검색어있음)

   public ArrayList<RequestBean> allSearchList(RequestBean reqBean); // 검색(검색에없음)
   
   public ArrayList<RequestBean> BestallSearchList(RequestBean reqBean);//베스트 검색(검색어 없음)

   public ArrayList<RequestBean> getDetail(RequestBean reqBean);  // 요청글 상세정보 정보 겟 
   
   public ArrayList<RequestBean> getDetailAD(RequestBean reqBean);  // 요청글 AD상세정보 정보 겟 

   public ArrayList<RequestBean> getWwisherList(RequestBean reqBean); // 내요청리스트 wisher정보 겟
   
   public ArrayList<RequestBean> getWhelperList(RequestBean reqBean); // 내요청리스트 helper정보 겟

   public ArrayList<RequestBean> getIngWisherList(RequestBean reqBean); //거래진행중 wisher정보 겟 
   
   public ArrayList<RequestBean> getIngHelperList(RequestBean reqBean); //거래진행중 helper정보 겟 

   public ArrayList<RequestBean> getEndHelperList(RequestBean reqBean); // 거래완료 helper정보 겟 

   public ArrayList<RequestBean> getEndWisherList(RequestBean reqBean); // 거래완료 wisher정보 겟 

   public ArrayList<RequestBean> getReq(RequestBean reqBean);
   
   public ArrayList<MemberBean> getReq2(MemberBean memberbean);
   
   public ArrayList<RequestBean> bidList(RequestBean reqBean);
   
   

   
}