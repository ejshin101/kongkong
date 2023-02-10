package com.kongkong.flight.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kongkong.flight.dao.IFlightDao;
import com.kongkong.flight.vo.FlightVO;
@Service
public class FlightServiceImpl implements IFlightService{
	private Logger logger = LoggerFactory.getLogger(getClass());
	@Autowired
	IFlightDao flightDao;
	@Override
	public List<String> getkName() {
		return flightDao.getkName();
	}
	public List<String> geteName() {
		return flightDao.geteName();
	}
	@Override
	public String getCode(String airportName) {
		return 	flightDao.getCode(airportName);
	}
	@Override
	public void saveChat(String message) {
		String arr[]=message.split(":");
		FlightVO msg = new FlightVO();
		msg.setChatId(arr[0]);
		msg.setText(arr[1]);
		flightDao.saveChat(msg);
	}
	@Override
	public List<FlightVO> getChat() {
		List<FlightVO> msg = flightDao.getChat();
		return msg;
	}
}
