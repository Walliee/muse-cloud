package com.anshul;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.appengine.api.datastore.DatastoreService;
import com.google.appengine.api.datastore.DatastoreServiceFactory;
import com.google.appengine.api.datastore.Entity;
import com.google.appengine.api.datastore.FetchOptions;
import com.google.appengine.api.datastore.Query;
import com.google.gson.Gson;

@SuppressWarnings("serial")
public class ListStationsServlet extends HttpServlet {
	@Override
	  public void doGet(HttpServletRequest req, HttpServletResponse resp)
	      throws IOException {
		DatastoreService datastore = DatastoreServiceFactory.getDatastoreService();
		Query query = new Query("Station");
		List<Entity> stations = datastore.prepare(query).asList(FetchOptions.Builder.withLimit(20));
		Gson gson = new Gson();
		
		resp.setContentType("application/json");
		String callback = req.getParameter("callback");

		if (callback != null) {
			resp.getWriter().print(callback + "(");
		}
		resp.getWriter().print(gson.toJson(stations));
		if (callback != null) {
			resp.getWriter().print(");");
		}
	}
}