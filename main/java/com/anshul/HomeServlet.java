/**
 * Copyright 2012 Google Inc. All Rights Reserved.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

package com.anshul;

//import com.google.appengine.api.users.User;
//import com.google.appengine.api.users.UserService;
//import com.google.appengine.api.users.UserServiceFactory;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.appengine.api.datastore.DatastoreService;
import com.google.appengine.api.datastore.DatastoreServiceFactory;
import com.google.appengine.api.datastore.Entity;
import com.google.appengine.api.datastore.FetchOptions;
import com.google.appengine.api.datastore.Query;
import com.google.appengine.api.datastore.Query.Filter;
import com.google.appengine.api.datastore.Query.FilterOperator;

import twitter4j.Twitter;
import twitter4j.TwitterException;
import twitter4j.TwitterFactory;
import twitter4j.User;
import twitter4j.auth.AccessToken;

@SuppressWarnings("serial")
public class HomeServlet extends HttpServlet {
	@Override
	public void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws IOException, ServletException {

		Twitter twitter = (Twitter) req.getSession().getAttribute("twitter");
		
		if (twitter != null) {
			String oauth_verifier = req.getParameter("oauth_verifier");
			if(oauth_verifier != null) {
				try {
					AccessToken accessToken;
					accessToken = twitter.getOAuthAccessToken(oauth_verifier);
					twitter.setOAuthAccessToken(accessToken);
					
					statusCheck(twitter, req, resp);

				} catch (TwitterException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			} else {
				try {
					statusCheck(twitter, req, resp);
				} catch (TwitterException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			

		}
	}
	
	private void statusCheck(Twitter twitter, HttpServletRequest req, HttpServletResponse resp) throws IOException, TwitterException {
		User user = twitter.verifyCredentials();
		
		
		String username = user.getName();
		String latestTweet = user.getStatus().getText();
		TweetWrapper tweetWrapper = TweetWrapper.feel(latestTweet);
		String emotion = tweetWrapper.getStrongestEmotion();

		DatastoreService datastore = DatastoreServiceFactory
				.getDatastoreService();
		Query query = new Query("Station");
		query.setFilter(FilterOperator.EQUAL.of("mood", emotion));
		List<Entity> stations = datastore.prepare(query).asList(
				FetchOptions.Builder.withLimit(1));
		Entity station = stations.get(0);

		req.getSession().setAttribute("user", username);
		req.getSession().setAttribute("userId", user.getId());
		req.getSession().setAttribute("latestTweet", latestTweet);
		req.getSession().setAttribute("emotion", emotion);
		req.getSession().setAttribute("stationName",
				station.getProperty("name"));
		req.getSession()
				.setAttribute("url", station.getProperty("url"));
		req.getSession()
		.setAttribute("profileImage", user.getBiggerProfileImageURL());
		req.removeAttribute("oauth_token");
		req.removeAttribute("oauth_verifier");
		resp.sendRedirect("login.jsp");
	}

}
