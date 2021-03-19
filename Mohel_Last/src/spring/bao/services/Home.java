package spring.bao.services;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;

import spring.bao.beans.RequestBean;
import spring.bao.mapper.AuthenticationIf;

@Service

public class Home {
	
	public Home() {}
	@Autowired
	private Gson gson;
	@Autowired
	private AuthenticationIf mapper;
	
	public ModelAndView entrance(RequestBean requestBean) {
		ModelAndView mav = new ModelAndView();
	
				mav = this.mainCtl(requestBean);
	
				return mav;
	}

//전체 수정 
	   private ModelAndView mainCtl(RequestBean req) {
		      ModelAndView mav = new ModelAndView();

		      String jsonData = gson.toJson(this.getRecentList(req));
		      String jsonData2 = gson.toJson(this.getRecentList2(req));		   
		      mav.addObject("jsonData",jsonData);
		      mav.addObject("list2", jsonData2);
		      
		      mav.setViewName("Authentication/main");
		      
		      return mav;
		   }

		   private ArrayList<RequestBean> getRecentList(RequestBean req) {
		      return mapper.getRecentList(req);
		   }
		   private ArrayList<RequestBean> getRecentList2(RequestBean req) {
		      return mapper.getRecentList2(req);
		   }

}


