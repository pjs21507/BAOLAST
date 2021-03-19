package spring.bao.mohel;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.support.DefaultTransactionDefinition;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import spring.bao.beans.BidBean;
import spring.bao.beans.MemberBean;
import spring.bao.beans.MessageBean;
import spring.bao.beans.RequestBean;
import spring.bao.beans.ReviewBean;
import spring.bao.beans.ScheduleBean;
import spring.bao.mapper.ScheduleIf;
import spring.bao.services.Authentication;
import spring.bao.services.Bid;
import spring.bao.services.Deal;
import spring.bao.services.Home;
import spring.bao.services.Messages;
import spring.bao.services.Profiles;
import spring.bao.services.RequestDeal;
import spring.bao.services.Review;
import spring.bao.services.Schedule;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {

	@Autowired
	private Authentication auth;
	@Autowired
	private Profiles pro;
	@Autowired
	private Deal deal;
	@Autowired
	private Schedule schedule;
	@Autowired
	private Review review;
	@Autowired
	private Bid bid;
	@Autowired
	private RequestDeal rqd;
	@Autowired
	private Messages msg;
	@Autowired
	private Home home;
	@Autowired
	private ScheduleIf scMapper;
	@Autowired
	private PlatformTransactionManager tran;
	@Autowired
	private HttpServletRequest request;

	

	@RequestMapping(value = { "/", "/Main" }, method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView Main(@ModelAttribute RequestBean requestBean) {
		ModelAndView mav = new ModelAndView();
		
		mav = home.entrance(requestBean);
		
		return mav;
	}
	
	@RequestMapping(value = { "/LogInForm", "/Login", "/JoinForm", "/Join", "/Logout" }, method = { RequestMethod.GET,RequestMethod.POST })
	public ModelAndView Auth(@ModelAttribute MemberBean memberBean) throws Exception {

		ModelAndView mav = new ModelAndView();
		
		mav = auth.entrance(memberBean);
		
		return mav;
	}


	@RequestMapping(value = { "/MyProfile", "/ModifyProfile", "/UpdateProfile","/ClickProfile" }, method = { RequestMethod.GET,RequestMethod.POST })
	public ModelAndView Profile(@ModelAttribute MemberBean memberBean) throws Exception {
		ModelAndView mav = new ModelAndView();
		mav = pro.entrance(memberBean);
		
		return mav;
	}
	@RequestMapping(value = { "/Detail", "/WaitingHelper","/WaitingWisher", "/IngHelper","/IngWisher", "/EndHelper","/EndWisher", "/Search", "/Filter" }, method = {
	         RequestMethod.GET, RequestMethod.POST })
	   public ModelAndView Deal(@ModelAttribute RequestBean requestBean, MemberBean memberbean) throws Exception {
	      ModelAndView mav = new ModelAndView();
	      requestBean.setSCode(request.getRequestURI().substring(1));

	      mav = deal.entrance(requestBean);
	      return mav;
	   }


	@RequestMapping(value = { "/DealForm", "/ReqSend", "/ModifyForm", "/Modify", "/Delete" }, method = {
			RequestMethod.GET, RequestMethod.POST })
	public ModelAndView RequestDeal(@ModelAttribute RequestBean requestBean, BidBean bidBean) throws Exception {
		ModelAndView mav = new ModelAndView();
		
		mav = rqd.entrance(requestBean, bidBean);
		
		return mav;
	}

	@RequestMapping(value = { "/MovePro","/UpdateSchedule", "/MoveUser", "/AcceptSchedule",
			"/RejectSchedule", "/OkClick" }, method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView Schedule(@ModelAttribute ScheduleBean scheduleBean,MessageBean messageBean) throws IOException {
	
		ModelAndView mav = new ModelAndView();

		mav = schedule.entrance(scheduleBean,messageBean);

		return mav;
	}
	
	@RequestMapping(value = { "/InsSchedule"}, method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView init(@RequestBody List<HashMap<String,Object>> jsondata,ScheduleBean scheduleBean ,MessageBean messageBean) throws IOException {

		ModelAndView mav = new ModelAndView();
		
		mav = schedule.entrance(jsondata,scheduleBean,messageBean);
		
		return mav;
	}
	

	@RequestMapping(value = { "/WriteReview", "/ViewReview", "/ShowReview" }, method = { RequestMethod.GET,RequestMethod.POST })
	public ModelAndView Review(@ModelAttribute ReviewBean reviewBean,BidBean bidBean) {
		ModelAndView mav = new ModelAndView();

		mav = review.entrance(reviewBean, bidBean);
		
		return mav;
	}
	@RequestMapping(value = { "/PriceDetail", "/RegisterBid", "/Accept", "/Reject" }, method = { RequestMethod.GET,RequestMethod.POST })
	   public ModelAndView Bid(@ModelAttribute MemberBean memberbean, RequestBean requestBean, MessageBean massgebean) throws IOException {
	      ModelAndView mav = new ModelAndView();
	      requestBean.setSCode(request.getRequestURI().substring(1));
	      mav = bid.entrance(memberbean, requestBean, massgebean);

	      return mav;
	   }

	@RequestMapping(value = { "/RecBox", "/Title", "/SendBox","/MsgForm","/SendMsg","MsgReplyForm"}, method = {RequestMethod.GET, RequestMethod.POST })
	public ModelAndView Messages(@ModelAttribute MessageBean messageBean) throws Exception {
		ModelAndView mav = new ModelAndView();
		
		mav = msg.entrance(messageBean);
		
		return mav;
	}

}
