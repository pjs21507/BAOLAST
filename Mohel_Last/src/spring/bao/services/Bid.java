package spring.bao.services;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.support.DefaultTransactionDefinition;
import org.springframework.web.context.support.HttpRequestHandlerServlet;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;

import spring.bao.beans.BidBean;
import spring.bao.beans.MemberBean;
import spring.bao.beans.MessageBean;
import spring.bao.beans.RequestBean;
import spring.bao.mapper.BidIf;

@Service
public class Bid {
	
	public Bid() {}
	@Autowired
	private HttpServletRequest request;
	@Autowired
	   private Gson gson;
	   @Autowired
	   private PlatformTransactionManager tran;
	   @Autowired
	   private BidIf BidIf;
	   @Autowired
		HttpServletResponse response;
	   
	public ModelAndView entrance(MemberBean member,RequestBean requestBean, MessageBean messageBean) throws IOException {
		ModelAndView mav = null;
		switch(requestBean.getSCode()) {
		case "PriceDetail":
			mav = this.priceDetailCtl();
			break;
		case "RegisterBid":
			mav = this.registerBidCtl(requestBean, member);
			break;
		case "Accept":
			mav = this.acceptCtl(requestBean, messageBean);
			break;
		case "Reject":
			mav = this.rejectCtl(requestBean, messageBean);
			break;
		}
		return mav;
	}
	
	 private ModelAndView rejectCtl(RequestBean requestbean, MessageBean message) {
	      TransactionStatus status = tran.getTransaction(new DefaultTransactionDefinition());

	      ModelAndView mav = new ModelAndView();
	      
	      
	      ArrayList<RequestBean> everyReject = new ArrayList<RequestBean>();
	      everyReject = this.rejectMInfoStM(requestbean);
	      
	      try {
	         for (int i = 0; i < everyReject.size(); i++) {
	            if (this.updateEveryRejectStatus(requestbean)) {
	            	System.out.println("bi stcode = U 로 변경 완료");//됨
	            }
	         }
	         
	         ArrayList<RequestBean> rejectMsg = new ArrayList<RequestBean>();
	         rejectMsg = this.rejectEveryMInfoMsg(requestbean);
	         
	         for (int i = 0; i < rejectMsg.size(); i++) {
	            message.setBiMmHelper(rejectMsg.get(i).getBiMmHelperview());
	            if (this.insRejectMsg(message)) {
	               System.out.println("거절메시지 전송");
	            }
	         }
	         this.updateRejectRqStatus(requestbean);
	         tran.commit(status);

	      } catch (Exception e) {
	         tran.rollback(status);
	         e.printStackTrace();
	      }
	      mav.setViewName("Deal/reject-after-view");
	      return mav;
	   }


	
	 private ModelAndView acceptCtl(RequestBean requestbean, MessageBean message) { // 수락 누릅니다
	      ModelAndView mav = new ModelAndView();
	      TransactionStatus status = tran.getTransaction(new DefaultTransactionDefinition());	      
	      try {
	         if (this.insBidInfo(requestbean)) {
	            if (this.updateAcceptStatus(requestbean)) { // 상태값 업데이트
	               // 유찰 포문
	               ArrayList<RequestBean> reject = new ArrayList<RequestBean>();
	               reject = this.rejectMInfo(requestbean); // 중복 id 제거 AA BBB CC  = A B C
	               if(reject.size() == 0) {   
	            	   this.insAcceptMsg(message);
	            	   System.out.println("낙찰 성공");
	               }else {
	               for (int i = 0; i < reject.size(); i++) {
	                  if (this.updateRejectStatus(requestbean)) {
	                     System.out.println("유찰 업데이트 ");
	                  }
	               }if (this.insAcceptMsg(message)) {// 메세지
	                  System.out.println("낙찰 메세지 인서트 ");
	                  // 유찰메세지 포문
	                  ArrayList<RequestBean> rejectMsg = new ArrayList<RequestBean>();
	                  rejectMsg = this.rejectMInfoMsg(requestbean);
	                  for (int i = 0; i < rejectMsg.size(); i++) {
	                	  
	                     message.setBiMmHelper(rejectMsg.get(i).getBiMmHelperview());
	                     if (this.insRejectMsg(message)) {
	                        System.out.println("유찰 메세지 인서트 ");
	                     }
	                  }
	               	}
	               }
	               this.updateAcceptRqStatus(requestbean);
	                  tran.commit(status);
	            }
	         }
	      } catch (Exception e) {
	         e.printStackTrace();
	         tran.rollback(status);
	         System.out.println("롤백 ");
	      }

	      mav.setViewName("Deal/ing-wisher");
	      return mav;
	   }

	
	
	private ModelAndView registerBidCtl(RequestBean requestBean, MemberBean member) throws IOException {
		ModelAndView mav = new ModelAndView();
		TransactionStatus status = tran.getTransaction(new DefaultTransactionDefinition());
	     try {
	    	 this.insBi(requestBean);
	    	 response.setContentType("text/html; charset=UTF-8");
	    	 PrintWriter out = response.getWriter();			
	    	 out.println("<script>alert('입찰이 등록되었습니다'); </script>");
	    	 out.flush();
	    	 
	    	 System.out.println(requestBean.getBiCode());
	    	 String json = gson.toJson(this.getbiCode(requestBean));
	            mav.addObject("getbiRqCode", json);
	            tran.commit(status);
	    	 mav.setViewName("Deal/Register-after-view");
	    	 return mav;
	     }catch(Exception e) {
	    	 e.printStackTrace();
	    	 tran.rollback(status);
	    	 return mav;
	     }
    
	      
	   }

	
	private ModelAndView priceDetailCtl() {
		ModelAndView mav = new ModelAndView();

		mav.setViewName("Deal/beforeDeal-helper2");
		return mav;
	}
	
	
	
	 private boolean ConvertToBoolean(int data) {
	      return data==1?true :false;
	   }
	private boolean insBi(RequestBean request) {
	      
	      return ConvertToBoolean(BidIf.insBi(request));
	      
	   }
	private  ArrayList<RequestBean> getbiCode(RequestBean requestBean) {
		      return BidIf.getbiCode(requestBean);
		  }   
	   
	   private ArrayList<RequestBean> rejectMInfo(RequestBean requestbean) {
	      return BidIf.rejectMInfo(requestbean);
	   }

	   private ArrayList<RequestBean> rejectMInfoStM(RequestBean requestbean) {

	      return BidIf.rejectMInfoStM(requestbean);
	   }

	   private ArrayList<RequestBean> rejectMInfoMsg(RequestBean requestbean) {
	      return BidIf.rejectMInfoMsg(requestbean);
	   }

	   private ArrayList<RequestBean> rejectEveryMInfoMsg(RequestBean requestbean) {
	      return BidIf.rejectEveryMInfoMsg(requestbean);
	   }

	   private boolean insBidInfo(RequestBean requestbean) {
	      return ConvertToBoolean(BidIf.insBidInfo(requestbean));

	   }

	   private boolean updateAcceptStatus(RequestBean requestbean) {
	      return ConvertToBoolean(BidIf.updateAcceptStatus(requestbean));

	   }

	   private boolean updateRejectStatus(RequestBean requestbean) {
	      return ConvertToBoolean(BidIf.updateRejectStatus(requestbean));
	   }

	   private boolean updateEveryRejectStatus(RequestBean requestbean) {
	      return ConvertToBoolean(BidIf.updateEveryRejectStatus(requestbean));

	   }

	   private boolean insAcceptMsg(MessageBean message) {
	      return ConvertToBoolean(BidIf.insAcceptMsg(message));
	   }

	   private boolean insRejectMsg(MessageBean message) {
	      return ConvertToBoolean(BidIf.insRejectMsg(message));
	   }
	   
	   private boolean updateAcceptRqStatus(RequestBean requestbean) {
		   return ConvertToBoolean(BidIf.updateAcceptRqStatus(requestbean));			
		}
	   private boolean updateRejectRqStatus(RequestBean requestbean) {
		   return ConvertToBoolean(BidIf.updateRejectRqStatus(requestbean));			
		}

	   
}

