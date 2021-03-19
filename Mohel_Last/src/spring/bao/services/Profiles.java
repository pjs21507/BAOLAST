package spring.bao.services;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.support.DefaultTransactionDefinition;
import org.springframework.web.servlet.ModelAndView;

import spring.bao.beans.MemberBean;
import com.google.gson.Gson;

import spring.bao.mapper.ProfileIf;
import spring.bao.utils.ProjectUtils;

@Service
public class Profiles {

	public Profiles() {
	}

	@Autowired
	private HttpServletRequest request;
	@Autowired
	private ProfileIf mapper;
	@Autowired
	private PlatformTransactionManager tran;
	@Autowired
	private Gson gson;
	@Autowired
	private ProjectUtils pu;

	public ModelAndView entrance(MemberBean memberbean) throws Exception {

		ModelAndView mav = new ModelAndView();

		switch (request.getRequestURI().substring(1)) {

		case "MyProfile":
			mav = this.myProfileCtl(memberbean);
			break;
		case "ModifyProfile":
			mav = this.modifyProfileCtl(memberbean);
			break;
		case "UpdateProfile":
			mav = this.updateProfileCtl(memberbean);
			break;
		case "ClickProfile":
			mav = this.clickProfileCtl(memberbean);
			break;
			
		}

		return mav;

	}

	
	private ModelAndView clickProfileCtl(MemberBean memberbean) {
		System.out.println(memberbean.getMId());
		ModelAndView mav = new ModelAndView();
		String json = gson.toJson(this.getClickProfile(memberbean));
		mav.addObject("clickPro",json);
		mav.setViewName("Profile/profileClick");
		return mav;
	}
	
	private ModelAndView updateProfileCtl(MemberBean memberbean) {
		ModelAndView mav = new ModelAndView();
		TransactionStatus status = tran.getTransaction(new DefaultTransactionDefinition());
		memberbean.setMId("PPP");

		try {
			if (this.updateProfile(memberbean)) {
					String json = gson.toJson(this.getProfile(memberbean));
					mav.addObject("getProfile", json);
					tran.commit(status);
				}
		} catch (Exception e) {
			tran.rollback(status);

		}
		mav.setViewName("Profile/profile");
		return mav;
	}

	private ModelAndView modifyProfileCtl(MemberBean memberbean) {
		ModelAndView mav = new ModelAndView();
		memberbean.setMId("PPP");

		String json = gson.toJson(this.getProfile(memberbean));
		mav.addObject("getProfile", json);

		mav.setViewName("Profile/profileModify");
		return mav;

	}

	private ModelAndView myProfileCtl(MemberBean memberbean) throws Exception {
	      
	      ModelAndView mav = new ModelAndView();
	      //memberbean.setMId((String)pu.getAttribute("mId"));
	      //System.out.println(memberbean.getMId());
	      


	      if(pu.getAttribute("mId") != null) {
	         memberbean.setMId((String)pu.getAttribute("mId"));
	         if(this.isRgNameCheck(memberbean)) {
	            String json = gson.toJson(this.getProfile(memberbean));
	            mav.addObject("getProfile", json);
	            mav.setViewName("Profile/profile");
	         }else {
	         String json = gson.toJson(this.getProfile(memberbean));
	         mav.addObject("getProfile", json);
	         mav.setViewName("Profile/profile");
	         
	         }
	      } else {
	         mav.setViewName("Authentication/login");
	      }
	   
	      
	      
	      return mav;

	   }

	private boolean convertToBoolean(int data) {
		return data == 1 ? true : false;
	}

	private boolean updateProfile(MemberBean memberbean) {
		return convertToBoolean(mapper.updateProfile(memberbean));
	}
	
	private boolean isRgNameCheck(MemberBean memberbean) {
		return convertToBoolean(mapper.isRgNameCheck(memberbean));
	}
	
	private ArrayList<MemberBean> getProfile(MemberBean memberbean) {
		return mapper.getProfile(memberbean);
	}
	
	private ArrayList<MemberBean> getClickProfile(MemberBean memberbean) {
		return mapper.getProfile(memberbean);
	}
	
}
