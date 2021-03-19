package spring.bao.services;


import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.support.DefaultTransactionDefinition;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.JsonElement;

import spring.bao.beans.BidBean;
import spring.bao.beans.ReviewBean;
import spring.bao.mapper.ReviewIf;

@Service
public class Review {
   
   public Review() {}
   
   @Autowired
   private HttpServletRequest request;
   @Autowired
   private Gson gson;
   @Autowired
   private ReviewIf mapper;
   @Autowired
   private PlatformTransactionManager tran;
   

   public ModelAndView entrance(ReviewBean rev, BidBean bid) {
      ModelAndView mav = new ModelAndView();
      switch(rev.getSCode()) {
      
      case "WriteReview":
         mav = this.WriteReviewCtl(rev);
         
         break;
      case "WirteReviewForm":
         mav = this.writeReviewFormCtl(rev, bid);
         break;
      case "ShowReview":
         mav = this.showReviewCtl(rev);
         break;
      
      }
         return mav;
   }

   // 리뷰 보기 
   private ModelAndView showReviewCtl(ReviewBean rev) {
      ModelAndView mav = new ModelAndView();
      
      rev.setRvHelper("JUN");
      rev.setRvWirqCode("6000210305090301");
      rev.setRvStar("1");
          System.out.println("보여주기완료");
          String jsonData = gson.toJson(this.getReview(rev));
          mav.addObject("info",jsonData);   
          mav.setViewName("Review/viewReview");
         
       
      return mav;
   }

   



   



   private ModelAndView writeReviewFormCtl(ReviewBean rev, BidBean bid) {
      ModelAndView mav = new ModelAndView();
      
//      bid.setWiHelper("JUN");
//      bid.setWiRqCode("6000210305090301");
//      
//      System.out.println(bid.getWiRqCode());
//      
//      String jsonData = gson.toJson(this.getCH(bid));
//      System.out.println(jsonData);
//       mav.addObject("info",jsonData);
//       System.out.println();
//      mav.setViewName("Review/writeReview");
//      
      return mav;
      
   }


   private ModelAndView WriteReviewCtl(ReviewBean rev) {
      ModelAndView mav = new ModelAndView();
      TransactionStatus status = tran.getTransaction(new DefaultTransactionDefinition());
      //쓰기
      
      rev.setRvStar("1");
      if(this.isReview(rev)) { 
          System.out.println("리뷰 존재");
          mav.setViewName("Review/write-after-view");
      }else if(this.insReview(rev)) {
         System.out.println("ins");
            tran.commit(status);
            mav.setViewName("Review/write-after-view");
         }
      return mav;
}   


   private ArrayList<ReviewBean> getReview(ReviewBean rev) {
      return mapper.getReview(rev);
   }
   private ArrayList<BidBean> getCH(BidBean bid) {
      return mapper.getCH(bid);
   }
   private boolean convetToBoolean(int data) {
      return data ==1 ? true : false;
   }
   
   private boolean insReview(ReviewBean rev) {
      return this.convetToBoolean(mapper.insReview(rev));
   }
   private boolean isReview(ReviewBean rev) {
      return this.convetToBoolean(mapper.isReview(rev));
   }
      
   }

   
   
   
   
