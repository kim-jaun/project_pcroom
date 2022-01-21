package com.ch.pc.service;
import java.time.LocalTime;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.ch.pc.model.Reservation;
public class ExpiredReservation extends HandlerInterceptorAdapter{
	@Autowired
	private PcService ps;
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		LocalTime now = LocalTime.now();
		int currentmin = now.getMinute();
		int currentHour = now.getHour();
		
		List<Reservation> allreservelist = ps.allReserveList();

		for(Reservation reservation : allreservelist) {
			String endtime = reservation.getEndtime();
			String hour = endtime.substring(0, 2);
			String min = endtime.substring(3, 5);
			int ihour = Integer.parseInt(hour);
			int imin = Integer.parseInt(min);
			int hourToMin = ihour*60;
			int currentHourToMin = currentHour*60;
			
			if(hourToMin + imin <= currentHourToMin+currentmin) {
				ps.expired(reservation.getReserveno());
				System.out.println(reservation.getReserveno()+"가 만료되었습니다.");
			}
		}		
		return true;
	}
}