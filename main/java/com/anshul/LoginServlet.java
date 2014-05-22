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

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.appengine.api.datastore.DatastoreService;
import com.google.appengine.api.datastore.DatastoreServiceFactory;
import com.google.appengine.api.datastore.Entity;

import twitter4j.Twitter;
import twitter4j.TwitterException;
import twitter4j.TwitterFactory;
import twitter4j.auth.RequestToken;
//import twitter4j.conf.ConfigurationBuilder;

@SuppressWarnings("serial")
public class LoginServlet extends HttpServlet {
  @Override
  public void doGet(HttpServletRequest req, HttpServletResponse resp)
      throws IOException {
	try {
		Twitter twitter = new TwitterFactory().getInstance();
		
		try {
		twitter.setOAuthConsumer("dyHSJLTZhh2eSSw2RVpqMIKyJ",
				  "jW22uPPA54DOMNicfFJWzf4jB7nKHbdi7L6VuPFlfWEPAOt5Ai");
		} catch (IllegalStateException e) {
			e.printStackTrace();
		}
		
		
		StringBuffer callbackURL = req.getRequestURL();
        int index = callbackURL.lastIndexOf("/");
        callbackURL.replace(index, callbackURL.length(), "").append("/home");
		  
		  RequestToken requestToken;
		  requestToken = twitter.getOAuthRequestToken(callbackURL.toString());
		  String token = requestToken.getToken();
		  String tokenSecret = requestToken.getTokenSecret(); 
		  
		  HttpSession session = req.getSession();
		  session.setAttribute("twitter", twitter);
		  String authUrl = requestToken.getAuthorizationURL();
//		  session.setAttribute("authUrl", authUrl);
		  req.setAttribute("authUrl", authUrl);
		  RequestDispatcher rd = req.getRequestDispatcher("index.jsp");
		  rd.forward(req, resp);
	} catch (TwitterException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	} catch (ServletException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	   
	  
  }
}
