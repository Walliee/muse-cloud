package com.anshul;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import twitter4j.Status;
import twitter4j.Twitter;
import twitter4j.TwitterException;

@SuppressWarnings("serial")
public class Tweet extends HttpServlet {
	
	@Override
	public void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws IOException, ServletException {
		Twitter twitter = (Twitter) req.getSession().getAttribute("twitter");
		String latestStatus = (String) req.getParameter("tweet");
//		System.out.println(latestStatus);
		if (twitter != null) {
			try {
				Status status = twitter.updateStatus(latestStatus);
			} catch (TwitterException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
}
