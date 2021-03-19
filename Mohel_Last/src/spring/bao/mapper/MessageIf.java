package spring.bao.mapper;

import java.util.ArrayList;

import spring.bao.beans.MessageBean;
import spring.bao.services.Messages;



public interface MessageIf {
	public ArrayList<Messages> getRecList(MessageBean messagebean);
	public ArrayList<Messages> getSendList(MessageBean messagebean);
	public ArrayList<Messages> getMsgDetail(MessageBean messagebean);
	public int insMessage(MessageBean messagebean);
	public int updateStatus(MessageBean messagebean);
}