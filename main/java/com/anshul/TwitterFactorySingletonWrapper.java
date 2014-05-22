package com.anshul;

import java.util.concurrent.locks.Lock;

import twitter4j.Twitter;
import twitter4j.TwitterFactory;

public class TwitterFactorySingletonWrapper {
	private static TwitterFactorySingletonWrapper obj;
	private static Object syncroot =new Object();
	private Twitter twitter;
	private TwitterFactorySingletonWrapper() {
		twitter = TwitterFactory.getSingleton();
		twitter.setOAuthConsumer("dyHSJLTZhh2eSSw2RVpqMIKyJ",
				  "jW22uPPA54DOMNicfFJWzf4jB7nKHbdi7L6VuPFlfWEPAOt5Ai");
	}
	
	public static Twitter getSingleton(){
		if(obj==null)
		{
	
	
			obj=new TwitterFactorySingletonWrapper();
		}
		return obj.twitter;
	}
}
