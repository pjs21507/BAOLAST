package spring.bao.mapper;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import spring.bao.beans.MessageBean;
import spring.bao.beans.ScheduleBean;
import spring.bao.services.Schedule;

public interface ScheduleIf {
	public ArrayList<ScheduleBean> getSchedule(ScheduleBean scheduleBean);
	public ArrayList<ScheduleBean> getBidInfo(ScheduleBean scheduleBean);
	public int insSchedule(ScheduleBean scheduleBean);
	public int insFixSchedule(ScheduleBean scheduleBean);
	public int insMessage(MessageBean messagBean);
	public int insRejectMessage(MessageBean messagBean);
	public int acceptItem(ScheduleBean scheduleBean);
	public int itemMsg(MessageBean messagBean);
	public int insDetailSchedule(HashMap<String, Object> jsondata);

}