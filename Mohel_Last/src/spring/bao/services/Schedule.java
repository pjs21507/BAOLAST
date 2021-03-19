package spring.bao.services;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.support.DefaultTransactionDefinition;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;

import spring.bao.beans.MessageBean;
import spring.bao.beans.ScheduleBean;
import spring.bao.mapper.ScheduleIf;

@Service
public class Schedule {

	public Schedule() {
	}

	@Autowired
	private HttpServletRequest request;
	@Autowired
	private ScheduleIf mapper;
	@Autowired
	private Gson gson;
	@Autowired
	private PlatformTransactionManager tran;

	public ModelAndView entrance(ScheduleBean scheduleBean, MessageBean messageBean) throws IOException {

		ModelAndView mav = null;

		switch (request.getRequestURI().substring(1)) {
		case "MovePro":
			mav = this.moveProCtl(scheduleBean);
			break;
		case "MoveUser":
			mav = this.moveUserCtl(scheduleBean);
			break;
		case "AcceptSchedule":
			mav = this.acceptCtl(scheduleBean, messageBean);
			break;
		case "RejectSchedule":
			mav=this.rejectCtl(messageBean);
			break;
		case "OkClick":
			mav=this.okCtl(scheduleBean,messageBean);
			break;
		}
		return mav;
	}
	public ModelAndView entrance(List<HashMap<String,Object>> jsondata,ScheduleBean scheduleBean, MessageBean messageBean) throws IOException {

		ModelAndView mav = null;

		switch (request.getRequestURI().substring(1)) {
		
		case "InsSchedule":
			mav = this.insScheduleCtl(jsondata,scheduleBean);
			break;
		case "UpdateSchedule":
			this.updateScheduleCtl();
			break;
		}
		return mav;
	}
	
	

	private ModelAndView okCtl(ScheduleBean scheduleBean,MessageBean messageBean) {
		TransactionStatus status = tran.getTransaction(new DefaultTransactionDefinition());

		ModelAndView mav = new ModelAndView();
		
	
		messageBean.setMsRecipient(scheduleBean.getScHelper());
		messageBean.setMsSender(scheduleBean.getScWisher());
		
		try {
		if(this.acceptItem(scheduleBean)) {
			if(this.itemMsg(messageBean)) {
				tran.commit(status);
				
			}
		}
		}catch(Exception e) {
			tran.rollback(status);
			e.printStackTrace();
		}
		mav.setViewName("Message/sendBox");
		return mav;
	}

	private ModelAndView rejectCtl(MessageBean messageBean){
		TransactionStatus status = tran.getTransaction(new DefaultTransactionDefinition());

		ModelAndView mav = new ModelAndView();
		messageBean.setMsRecipient("PPP");
		messageBean.setMsSender("DOYOUNG");

		try {
			if (this.insRejectMessage(messageBean)) {
				tran.commit(status);
				System.out.println("ok");
				mav.setViewName("Deal/ing-wisher");
			}
		} catch (Exception e) {
			tran.rollback(status);
			e.printStackTrace();
		}
		return mav;
	}

	private ModelAndView acceptCtl(ScheduleBean scheduleBean, MessageBean messageBean) {
		TransactionStatus status = tran.getTransaction(new DefaultTransactionDefinition());

		ModelAndView mav = new ModelAndView();
		scheduleBean.setScCode("4000210305090348");
		messageBean.setMsRecipient("PPP");
		messageBean.setMsSender("DOYOUNG");
		try {
			if (this.insFixSchedule(scheduleBean)) {
				if (this.insMessage(messageBean)) {
					tran.commit(status);
					mav.setViewName("Deal/ing-wisher");
				}
			}
		} catch (Exception e) {
			tran.rollback(status);
			e.printStackTrace();

		}

		return mav;
	}

	private ModelAndView moveUserCtl(ScheduleBean scheduleBean) {
		String scInfo = gson.toJson(this.getSchedule(scheduleBean));
		String bidInfo = gson.toJson(this.getBidInfo(scheduleBean));

		ModelAndView mav = new ModelAndView();

		if (!scInfo.equals("[]")) {
			mav.addObject("scInfo", scInfo);
			mav.setViewName("Schedule/conditionUser");

		} else {
			mav.addObject("scInfo", bidInfo);
			mav.setViewName("Deal/ing-wisher");
		}
		
		return mav;
	}

	private ModelAndView updateScheduleCtl() {
		ModelAndView mav = new ModelAndView();
//		this.updateSchedule();
		return mav;
	}

	private ModelAndView insScheduleCtl(List<HashMap<String,Object>> jsondata,ScheduleBean scheduleBean) {
		TransactionStatus status = tran.getTransaction(new DefaultTransactionDefinition());
		ModelAndView mav = new ModelAndView();
		
		scheduleBean.setScCode(jsondata.get(0).get("scCode").toString());
		scheduleBean.setScHelper(jsondata.get(0).get("scHelper").toString());
		scheduleBean.setScStatus("S");
		
		try {
			if (this.insSchedule(scheduleBean)) {
				for(int i=0;i<jsondata.size();i++) {
					if(!this.insDetailSchedule(jsondata.get(i))) {
						tran.rollback(status);
						break;
					}
				}
				tran.commit(status);
				mav.setViewName("Authentication/main");
			}
		} catch (Exception e) {
			tran.rollback(status);
			e.getMessage();
			e.printStackTrace();
			System.out.println(e);
			mav.setViewName("Schedule/conditionPro");
		}

		return mav;
	}

	private ModelAndView moveProCtl(ScheduleBean scheduleBean) {
		String scInfo = gson.toJson(this.getSchedule(scheduleBean));
		String bidInfo = gson.toJson(this.getBidInfo(scheduleBean));

		ModelAndView mav = new ModelAndView();

		if (!scInfo.equals("[]")) {
			mav.addObject("scInfo", scInfo);
		} else {
			mav.addObject("scInfo", bidInfo);
		}
		mav.setViewName("Schedule/conditionPro");

		return mav;
	}

	private boolean convertToBoolean(int data) {
		return data == 1 ? true : false;
	}
	private boolean itemMsg(MessageBean messageBean) {
		return convertToBoolean(mapper.itemMsg(messageBean));
	}
	private boolean acceptItem(ScheduleBean scheduleBean) {
		return convertToBoolean(mapper.acceptItem(scheduleBean));
	}
	private boolean insRejectMessage(MessageBean messageBean) {
		return convertToBoolean(mapper.insRejectMessage(messageBean));
	}
	private boolean insMessage(MessageBean messageBean) {
		return convertToBoolean(mapper.insMessage(messageBean));
	}

	private boolean insFixSchedule(ScheduleBean scheduleBean) {
		return convertToBoolean(mapper.insFixSchedule(scheduleBean));
	}

	private boolean insSchedule(ScheduleBean scheduleBean) {
		return convertToBoolean(mapper.insSchedule(scheduleBean));
	}

	private boolean insDetailSchedule(HashMap<String, Object> jsondata) {
		return convertToBoolean(mapper.insDetailSchedule(jsondata));
	}
	private ArrayList<ScheduleBean> getBidInfo(ScheduleBean scheduleBean) {
		return mapper.getBidInfo(scheduleBean);
	}

	private ArrayList<ScheduleBean> getSchedule(ScheduleBean scheduleBean) {
		return mapper.getSchedule(scheduleBean);
	}
	

}