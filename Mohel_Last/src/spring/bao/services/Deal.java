package spring.bao.services;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.JsonElement;

import spring.bao.beans.RequestBean;
import spring.bao.mapper.DealIf;
import spring.bao.utils.ProjectUtils;

@Service
public class Deal {

   public Deal() {
   }

   @Autowired
   private DealIf mapper;
   @Autowired
   private HttpServletRequest request;
   @Autowired
   private Gson gson;
   @Autowired
   private ProjectUtils pu;

   public ModelAndView entrance(RequestBean requestBean) throws Exception {
      ModelAndView mav = new ModelAndView();

      switch (request.getRequestURI().substring(1)) {

      case "Detail":
         mav = this.detailCtl(requestBean);
         break;
      case "WaitingHelper":
         mav = this.waitingHelperCtl(requestBean);
         break;
      case "WaitingWisher":
         mav = this.waitingWisherCtl(requestBean);
         break;
      case "IngHelper":
         mav = this.ingHelperCtl(requestBean);
         break;
      case "IngWisher":
         mav = this.ingWisherCtl(requestBean);
         break;
      case "EndHelper":
         mav = this.endHelperCtl(requestBean);
         break;
      case "EndWisher": 
         mav = this.endWisherCtl(requestBean);
         break;
      case "Search":
         mav = this.searchCtl(requestBean);
         break;
      case "Filter":
         mav = this.filterCtl(requestBean);
         break;
      }
      return mav;
   }

   private ModelAndView filterCtl(RequestBean requestBean) {
      ModelAndView mav = new ModelAndView();
      String json = gson.toJson(this.getFilterList(requestBean));
      String json2 = gson.toJson(this.getBestFilterList(requestBean));
      mav.addObject("requestData", json);
      mav.addObject("requestBestData", json2);
      mav.setViewName("Authentication/main");
      return mav;
   }
   
   private ModelAndView searchCtl(RequestBean requestBean) {
	      ModelAndView mav = new ModelAndView();

	      if (requestBean.getRqWord().equals("")) {
	         String json = gson.toJson(this.getAllSearchList(requestBean));
	         String json2 = gson.toJson(this.getBestAllSearchList(requestBean));
	         mav.addObject("searchData", json);
	         mav.addObject("searchBestData", json2);
	         mav.setViewName("Authentication/main");
	      } else {
	         String json = gson.toJson(this.getSearchList(requestBean));
	         String json2 = gson.toJson(this.getBestSearchList(requestBean));
	         mav.addObject("searchData", json);
	         mav.addObject("searchBestData", json2);
	         mav.setViewName("Deal/search");
	      }
	      return mav;
	   }

   private ModelAndView endWisherCtl(RequestBean requestBean) throws Exception {
      ModelAndView mav = new ModelAndView();
      requestBean.setRqId((String)pu.getAttribute("mId"));

      String json = gson.toJson(this.getEndWisherList(requestBean));
      mav.addObject("endWisherList", json);
      mav.setViewName("Deal/endDate-wisher");
      return mav;
   }
   
   private ModelAndView endHelperCtl(RequestBean requestBean) throws Exception {
	      ModelAndView mav = new ModelAndView();

	      requestBean.setWinHelper((String)pu.getAttribute("mId"));
	      String json = gson.toJson(this.getEndHelperList(requestBean));
	      mav.addObject("endHelperList", json);
	      mav.setViewName("Deal/endDate-helper");
	      return mav;
	   }

   private ModelAndView ingWisherCtl(RequestBean requestBean) throws Exception {
	      ModelAndView mav = new ModelAndView();
	      requestBean.setRqId((String)pu.getAttribute("mId"));
	      String json = gson.toJson(this.getIngWisherList(requestBean));
	      mav.addObject("ingWisherList", json);
	      mav.setViewName("Deal/ing-wisher");

	      return mav;
	   }
   private ModelAndView ingHelperCtl(RequestBean requestBean) throws Exception {
	      ModelAndView mav = new ModelAndView();
	      requestBean.setWinHelper((String)pu.getAttribute("mId"));
	      String json = gson.toJson(this.getIngHelperList(requestBean));
	      mav.addObject("ingHelperList", json);
	      mav.setViewName("Deal/ing-helper");

	      return mav;
	   }
   private ModelAndView waitingWisherCtl(RequestBean requestBean) throws Exception {
	      ModelAndView mav = new ModelAndView();
	      requestBean.setRqId((String)pu.getAttribute("mId"));
	      String json = gson.toJson(this.getWwisherList(requestBean));
	      mav.addObject("wWisherList", json);
	      mav.setViewName("Deal/waiting-wisher");
	      return mav;
	   }
   
   private ModelAndView waitingHelperCtl(RequestBean requestBean) throws Exception {
	      ModelAndView mav = new ModelAndView();
	      requestBean.setBiHelper((String)pu.getAttribute("mId"));
	      System.out.println(requestBean.getBiHelper());
	      String json = gson.toJson(this.getWhelperList(requestBean));
	      mav.addObject("wHelperList", json);
	      mav.setViewName("Deal/waiting-helper");
	      return mav;
	   }

   private ModelAndView detailCtl(RequestBean requestBean) throws Exception {
	      ModelAndView mav = new ModelAndView();
	      if(pu.getAttribute("mId") == null) {
	    	  mav.setViewName("Authentication/login");
	      }else {
	         if(pu.getAttribute("mId").equals(requestBean.getRqId())) {
	        	 String jsonz = gson.toJson(this.getDetail(requestBean));
	        	 mav.addObject("detail", jsonz);
		        	String bidListz = gson.toJson(this.bidList(requestBean));
			         mav.addObject("bidList", bidListz);
			         mav.setViewName("Deal/beforeDeal-wisher");
		        }else {
		        	
	         if(pu.getAttribute("mId") != null) {
	    	   
	      if(requestBean.getRqDetailSelect().equals("bh")) {
	         String json = gson.toJson(this.getDetail(requestBean));         
	         mav.addObject("detail", json);         
	         String bidList = gson.toJson(this.bidList(requestBean));
	         mav.addObject("bidList", bidList);
	         mav.setViewName("Deal/beforeDeal-helper");
	        
	      }else if(requestBean.getRqDetailSelect().equals("bw")){
	         String json = gson.toJson(this.getDetail(requestBean));
	         mav.addObject("detail", json);
	         String bidList = gson.toJson(this.bidList(requestBean));
	         mav.addObject("bidList", bidList);
	         mav.setViewName("Deal/beforeDeal-wisher");
	     
	      }else if(requestBean.getRqDetailSelect().equals("ad")){
	         String json = gson.toJson(this.getDetailAD(requestBean));
	         mav.addObject("detailAd", json);
	         mav.setViewName("Deal/afterDeal");
	        }   
	      } else {
	    	  mav.setViewName("Authentication/login");
	      }
		       }
	      }
	      return mav;
	   
   }
   
   private ArrayList<RequestBean> bidList(RequestBean requestBean) {
	return mapper.bidList(requestBean);
}

private ArrayList<RequestBean> getBestFilterList(RequestBean requestBean) {
      return mapper.BestFilterList(requestBean);
   }

   private ArrayList<RequestBean> getFilterList(RequestBean requestBean) {
      return mapper.filterList(requestBean);
   }
   
   private ArrayList<RequestBean> getBestAllSearchList(RequestBean requestBean) {
	   return mapper.BestallSearchList(requestBean);
   }

   private ArrayList<RequestBean> getAllSearchList(RequestBean requestBean) {
      return mapper.allSearchList(requestBean);
   }

   private ArrayList<RequestBean> getSearchList(RequestBean requestBean) {
	  return mapper.searchList(requestBean);
   }
   
   private ArrayList<RequestBean> getBestSearchList(RequestBean requestBean) {
	  return mapper.BestSearchList(requestBean);
   }
   
   private ArrayList<RequestBean> getEndWisherList(RequestBean requestBean) {
	   return mapper.getEndWisherList(requestBean);
   }
   
   private ArrayList<RequestBean> getEndHelperList(RequestBean requestBean) {
	    return mapper.getEndHelperList(requestBean);
   }


   private ArrayList<RequestBean> getIngWisherList(RequestBean requestBean) {
      return mapper.getIngWisherList(requestBean);
   }

   private ArrayList<RequestBean> getIngHelperList(RequestBean requestBean) {
      return mapper.getIngHelperList(requestBean);
   }

   private ArrayList<RequestBean> getWhelperList(RequestBean requestBean) {
      return mapper.getWhelperList(requestBean);
   }

   private ArrayList<RequestBean> getWwisherList(RequestBean requestBean) {
      return mapper.getWwisherList(requestBean);
   }

  
   private ArrayList<RequestBean> getDetail(RequestBean requestBean) {
      return mapper.getDetail(requestBean);
   }
   private  ArrayList<RequestBean> getDetailAD(RequestBean requestBean) {
	   return mapper.getDetailAD(requestBean);
  }

}