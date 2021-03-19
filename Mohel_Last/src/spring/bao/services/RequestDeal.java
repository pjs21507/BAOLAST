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
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;

import spring.bao.mapper.RequestDealIf;
import spring.bao.utils.ProjectUtils;
import spring.bao.beans.BidBean;
import spring.bao.beans.RequestBean;


@Service
public class RequestDeal {
	
	public RequestDeal() {}
	
	@Autowired
	private PlatformTransactionManager tran;
	@Autowired
	private RequestDealIf dealIf;
	@Autowired
	private Gson gson;
	@Autowired
	private HttpServletResponse response;
	@Autowired
	private HttpServletRequest request;
	@Autowired
	private ProjectUtils pu;
	
	public ModelAndView entrance(RequestBean requestBean, BidBean bid) throws Exception {
		ModelAndView mav = new ModelAndView();
		
		switch(request.getRequestURI().substring(1)) {
		
		case "DealForm":
			mav = this.dealFormCtl(); //완료
			break;
		case "ReqSend":
			mav = this.reqSendCtl(requestBean);
			break;
		case "ModifyForm":
			mav = this.modifyFormCtl(requestBean, bid); //완료
			break;
		case "Modify":
			mav = this.modifyCtl(requestBean); // 반 완료
			break; 
		case "Delete":
			mav = this.deleteCtl(requestBean); //완료
			break;
		}
		return mav;
	}
	// 요청글삭제
	private ModelAndView deleteCtl(RequestBean requestBean) {
		ModelAndView mav = new ModelAndView();
		TransactionStatus status = tran.getTransaction(new DefaultTransactionDefinition());
		requestBean.setRqCode("4000210305090309");
		requestBean.setRqId("DOYOUNG");
		if(this.deleteReqDetail(requestBean)) {
			System.out.println("삭제완료");
			mav.setViewName("main");
			tran.commit(status);
		}else {
			System.out.println("삭제 실패");
			mav.setViewName("main");
		}
		
		return mav;
	}
	// 요청글 수정
	private ModelAndView modifyCtl(RequestBean requestBean) throws IOException  {
		ModelAndView mav = new ModelAndView();
		TransactionStatus status = tran.getTransaction(new DefaultTransactionDefinition());
		requestBean.setRqId("DOYOUNG");
		requestBean.setRqCode("5000210305090319");
		System.out.println(requestBean.getRqRcCode());
		System.out.println(requestBean.getRqPeriod());
		System.out.println(requestBean.getRqTitle());
		System.out.println(requestBean.getRqComment());
		
		if(this.updateReqDetail(requestBean)){
			System.out.println("수정 완료");
			
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('수정 완료하였습니다.'); </script>");
			out.flush();
			
			mav.setViewName("main");
			tran.commit(status);
		}else {
			System.out.println("수정 실패");
			
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('수정을 실패하였습니다.'); </script>");
			out.flush();

			mav.setViewName("requestmodify");
			
		}
		return mav;
	}
	//수정 페이지 이동
	private ModelAndView modifyFormCtl(RequestBean requestBean, BidBean bid) {
		ModelAndView mav = new ModelAndView();
		System.out.println("들어왔다");
		bid.setBiHelper("JUN");
		bid.setBiCode("4000220305090348");
		requestBean.setRqCode("5000210305090319");
		requestBean.setRqId("DOYOUNG");
		if(this.isBidder(bid)) {
			System.out.println("안돼~");
			
			mav.setViewName("test");
		}else {
			String jsonData = gson.toJson(this.getReqDetail(requestBean));
			System.out.println(jsonData);
			mav.addObject("rqd", jsonData);                                                                                                                     
			mav.setViewName("requestmodify");
			
		}
		return mav;
	}
	//거래 등록(전송)
	private ModelAndView reqSendCtl(RequestBean requestBean) throws Exception {
		ModelAndView mav = new ModelAndView();
		
		TransactionStatus status = tran.getTransaction(new DefaultTransactionDefinition());
		
		requestBean.setRqId((String)pu.getAttribute("mId"));
		requestBean.setRqStatus("B");
		
		if(requestBean.getRqSubName().equals("학업")) {
			requestBean.setRqSubCode("10001001");
			System.out.println(requestBean.getRqSubCode());
		}if(requestBean.getRqSubName().equals("외국어")) {
			requestBean.setRqSubCode("10001002");
			System.out.println(requestBean.getRqSubCode());
		}if(requestBean.getRqSubName().equals("음악")) {
			requestBean.setRqSubCode("10001003");
			System.out.println(requestBean.getRqSubCode());
		}if(requestBean.getRqSubName().equals("미술")) {
			requestBean.setRqSubCode("10001004");
			System.out.println(requestBean.getRqSubCode());
		}if(requestBean.getRqSubName().equals("스포츠")) {
			requestBean.setRqSubCode("10001005");
			System.out.println(requestBean.getRqSubCode());
		}if(requestBean.getRqSubName().equals("자격증")) {
			requestBean.setRqSubCode("10001006");
			System.out.println(requestBean.getRqSubCode());
		}if(requestBean.getRqSubName().equals("인테리어")) {
			requestBean.setRqSubCode("20002001");
			System.out.println(requestBean.getRqSubCode());
		}if(requestBean.getRqSubName().equals("이사")) {
			requestBean.setRqSubCode("20002002");
			System.out.println(requestBean.getRqSubCode());
		}if(requestBean.getRqSubName().equals("청소업체")) {
			requestBean.setRqSubCode("20002003");
			System.out.println(requestBean.getRqSubCode());
		}if(requestBean.getRqSubName().equals("야외시공")) {
			requestBean.setRqSubCode("20002004");
			System.out.println(requestBean.getRqSubCode());
		}if(requestBean.getRqSubName().equals("수리")) {
			requestBean.setRqSubCode("20002005");
			System.out.println(requestBean.getRqSubCode());
		}if(requestBean.getRqSubName().equals("가구")) {
			requestBean.setRqSubCode("20002006");
			System.out.println(requestBean.getRqSubCode());
		}if(requestBean.getRqSubName().equals("번역")) {
			requestBean.setRqSubCode("30003001");
			System.out.println(requestBean.getRqSubCode());
		}if(requestBean.getRqSubName().equals("통역")) {
			requestBean.setRqSubCode("30003002");
			System.out.println(requestBean.getRqSubCode());
		}if(requestBean.getRqSubName().equals("마케팅")) {
			requestBean.setRqSubCode("30003003");
			System.out.println(requestBean.getRqSubCode());
		}if(requestBean.getRqSubName().equals("컨설팅")) {
			requestBean.setRqSubCode("30003004");
			System.out.println(requestBean.getRqSubCode());
		}if(requestBean.getRqSubName().equals("문서")) {
			requestBean.setRqSubCode("30003005");
			System.out.println(requestBean.getRqSubCode());
		}if(requestBean.getRqSubName().equals("인쇄")) {
			requestBean.setRqSubCode("30003006");
			System.out.println(requestBean.getRqSubCode());
		}if(requestBean.getRqSubName().equals("일러스트 디자인")) {
			requestBean.setRqSubCode("40004001");
			System.out.println(requestBean.getRqSubCode());
		}if(requestBean.getRqSubName().equals("인쇄물 디자인")) {
			requestBean.setRqSubCode("40004002");
			System.out.println(requestBean.getRqSubCode());
		}if(requestBean.getRqSubName().equals("웹/모바일 디자인")) {
			requestBean.setRqSubCode("40004003");
			System.out.println(requestBean.getRqSubCode());
		}if(requestBean.getRqSubName().equals("제품디자인")) {
			requestBean.setRqSubCode("40004004");
			System.out.println(requestBean.getRqSubCode());
		}if(requestBean.getRqSubName().equals("공간디자인")) {
			requestBean.setRqSubCode("40004005");
			System.out.println(requestBean.getRqSubCode());
		}if(requestBean.getRqSubName().equals("브랜딩")) {
			requestBean.setRqSubCode("40004006");
			System.out.println(requestBean.getRqSubCode());
		}if(requestBean.getRqSubName().equals("게임")) {
			requestBean.setRqSubCode("50005001");
			System.out.println(requestBean.getRqSubCode());
		}if(requestBean.getRqSubName().equals("데이터베이스")) {
			requestBean.setRqSubCode("50005002");
			System.out.println(requestBean.getRqSubCode());
		}if(requestBean.getRqSubName().equals("웹사이트개발")) {
			requestBean.setRqSubCode("50005003");
			System.out.println(requestBean.getRqSubCode());
		}if(requestBean.getRqSubName().equals("모바일웹")) {
			requestBean.setRqSubCode("50005004");
			System.out.println(requestBean.getRqSubCode());
		}if(requestBean.getRqSubName().equals("AI개발")) {
			requestBean.setRqSubCode("50005005");
			System.out.println(requestBean.getRqSubCode());
		}if(requestBean.getRqSubName().equals("보안")) {
			requestBean.setRqSubCode("50005006");
			System.out.println(requestBean.getRqSubCode());
		}if(requestBean.getRqSubName().equals("영양/식단관리")) {
			requestBean.setRqSubCode("60006001");
			System.out.println(requestBean.getRqSubCode());
		}if(requestBean.getRqSubName().equals("심리상담")) {
			requestBean.setRqSubCode("60006002");
			System.out.println(requestBean.getRqSubCode());
		}if(requestBean.getRqSubName().equals("심리치료")) {
			requestBean.setRqSubCode("60006003");
			System.out.println(requestBean.getRqSubCode());
		}if(requestBean.getRqSubName().equals("헤어")) {
			requestBean.setRqSubCode("60006004");
			System.out.println(requestBean.getRqSubCode());
		}if(requestBean.getRqSubName().equals("메이크업")) {
			requestBean.setRqSubCode("60006005");
			System.out.println(requestBean.getRqSubCode());
		}if(requestBean.getRqSubName().equals("피부관리")) {
			requestBean.setRqSubCode("60006006");
			System.out.println(requestBean.getRqSubCode());
		}
		if(this.insReqSend(requestBean)) {
			System.out.println("Insert Complete");
			tran.commit(status);
			response.setContentType("text/html; charset=UTF-8");
	         PrintWriter out = response.getWriter();
	         out.println("<script>alert('거래가 등록되었습니다.'); </script>");
	         out.flush();
			
	         mav.setViewName("Authentication/goMain");
		}else {
			System.out.println("False");
			mav.setViewName("Profile/myProfile");
		}
		return mav;
	}
	//거래 등록 페이지 이동
	private ModelAndView dealFormCtl() throws Exception {   
	      ModelAndView mav = new ModelAndView();
	      
	      if(pu.getAttribute("mId") != null) {
	         mav.setViewName("RequestDeal/request");
	      } else {
	         mav.setViewName("Authentication/login");
	      }
	      
	      return mav;
	   }   
	private boolean convetToBoolean(int data) {
		return data == 1 ? true : false;
	}
	private boolean isBidder(BidBean bid) {
		return this.convetToBoolean(dealIf.isBidder(bid));
	}
	private ArrayList<RequestBean> getReqDetail(RequestBean requestBean) {
		System.out.println("Hi Detail");
		return dealIf.getReqDetail(requestBean);
	}
	private boolean insReqSend(RequestBean requestBean) {
		return this.convetToBoolean(dealIf.insReqSend(requestBean));
	}
	private boolean updateReqDetail(RequestBean requestBean) {
		return this.convetToBoolean(dealIf.updateReqDetail(requestBean));
	}
	private boolean deleteReqDetail(RequestBean requestBean) {
		return this.convetToBoolean(dealIf.deleteReqDetail(requestBean));
	}
}
