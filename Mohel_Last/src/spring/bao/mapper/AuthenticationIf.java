package spring.bao.mapper;


import java.util.ArrayList;

import com.google.gson.JsonElement;

import spring.bao.beans.BidBean;
import spring.bao.beans.MemberBean;
import spring.bao.beans.RequestBean;

public interface AuthenticationIf {

   public int isMember(MemberBean memberbean);
   public int insMember(MemberBean memberbean);   
   public MemberBean isAccess(MemberBean memberbean);
   public ArrayList<RequestBean> getRecentList(RequestBean req);
   public ArrayList<RequestBean> getRecentList2(RequestBean req);
   public int insAccess(MemberBean member);
   



}