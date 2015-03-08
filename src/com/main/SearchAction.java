package com.main;

import java.net.UnknownHostException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.apache.struts2.interceptor.SessionAware;

import com.TO.ResultTO;
import com.google.api.client.http.HttpTransport;
import com.google.api.client.http.javanet.NetHttpTransport;
import com.google.api.client.json.JsonFactory;
import com.google.api.client.json.jackson2.JacksonFactory;
import com.google.api.client.util.ArrayMap;
import com.google.api.services.customsearch.Customsearch;
import com.google.api.services.customsearch.model.Result;
import com.google.api.services.customsearch.model.Search;
import com.google.gson.Gson;
import com.mongodb.BasicDBObject;
import com.mongodb.DB;
import com.mongodb.DBCollection;
import com.mongodb.DBCursor;
import com.mongodb.DBObject;
import com.mongodb.MongoClient;
import com.mongodb.MongoClientURI;
import com.opensymphony.xwork2.ActionSupport;

public class SearchAction extends ActionSupport implements SessionAware {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String fbString;
	private String linString;
	private String pinString;
	private String instaString;
	private String twitString;
	private String googString;
	private String searchText;
	private String userName;
	private String password;
	private String fName;
	private String lName;
	Map<String, Object> session;

	@Override
	public void setSession(Map<String, Object> session) {
		this.session = session;
	}

	final private String GOOGLE_SEARCH_URL = "https://www.googleapis.com/customsearch/v1?";
	// api key
	final private String API_KEY = "AIzaSyB8sw41AAazfbjRs0debg59OUr-Oy80pNY";
	// final private String API_KEY = "AIzaSyB8DIS_XUkixfmQYgzPsH2zIZpM7TawzJE";
	// custom search engine ID
	final private String SEARCH_ENGINE_ID = "015281246062486861492:xgdzdeqtxeg";

	final private String FINAL_URL = GOOGLE_SEARCH_URL + "key=" + API_KEY
			+ "&cx=" + SEARCH_ENGINE_ID;

	public String login() throws UnknownHostException {
		String ret = SUCCESS;
		// Standard URI format: mongodb://[dbuser:dbpassword@]host:port/dbname

		MongoClientURI uri = new MongoClientURI(
				"mongodb://abhiverma:abhiverma@ds053251.mongolab.com:53251/logindata");
		MongoClient client = new MongoClient(uri);
		DB db = client.getDB(uri.getDatabase());
		DBCollection users = db.getCollection("Users");
		DBCursor cursor = users.find();
		BasicDBObject findQuery = new BasicDBObject("name", userName).append(
				"password", password);
		DBObject user;
		try {
			while (cursor.hasNext()) {
				user = cursor.next();
				BasicDBObject retrieve = (BasicDBObject) user;
				fName = retrieve.getString("fname");
				lName = retrieve.getString("lname");
				session.put("fullname", fName+" "+lName);
			}
		} finally {
			cursor.close();
		}
		return ret;
	}

	public String getVal() {
		String ret = SUCCESS;
		HttpTransport httpTransport = new NetHttpTransport();
		JsonFactory jsonFactory = new JacksonFactory();
		Customsearch customsearch = new Customsearch(httpTransport,
				jsonFactory, null);
		Long count = 10L;
		List<Result> resultList = null;
		List<ResultTO> fblist = new ArrayList<ResultTO>();
		List<ResultTO> twitlist = new ArrayList<ResultTO>();
		List<ResultTO> instalist = new ArrayList<ResultTO>();
		List<ResultTO> pinlist = new ArrayList<ResultTO>();
		List<ResultTO> linlist = new ArrayList<ResultTO>();
		List<ResultTO> googlist = new ArrayList<ResultTO>();
		ResultTO resultTO;
		List<Result> completeList = new ArrayList<Result>();
		try {
			Customsearch.Cse.List list = customsearch.cse().list(searchText);
			list.setKey(API_KEY);
			list.setCx(SEARCH_ENGINE_ID);
			list.setUserIp("172.31.103.252");
			// list.se
			// num results per page
			// list.setNum(2L);
			list.setStart(1L);
			Search results = list.execute();
			resultList = results.getItems();
			for (Result res : resultList) {
				completeList.add(res);
			}
			/*
			 * while (count < 91) { // for pagination list.setStart(count);
			 * results = list.execute(); resultList = results.getItems(); for
			 * (Result res : resultList) { completeList.add(res); } count += 10;
			 * }
			 */

			String patternString = "View the profiles";
			Matcher matcher;

			Pattern pattern = Pattern.compile(patternString,
					Pattern.CASE_INSENSITIVE);

			for (Result part : completeList) {
				resultTO = new ResultTO();
				matcher = pattern.matcher(part.getHtmlSnippet());
				if (matcher.find()) {
					continue;
				}
				resultTO.setPartUrl(part.getDisplayLink());
				resultTO.setCompleteUrl(part.getFormattedUrl());
				resultTO.setContent(part.getHtmlSnippet());
				resultTO.setTitle(part.getHtmlTitle());
				resultTO.setImgUrl((String) ((ArrayMap) ((ArrayList) (((ArrayMap) part
						.getPagemap()).getValue(0))).get(0)).getValue(0));
				if (part.getDisplayLink().matches("(.*)facebook(.*)")) {
					fblist.add(resultTO);
					// resultTO.setImgUrl();
				} else if (part.getDisplayLink().matches("(.*)twitter(.*)")) {
					twitlist.add(resultTO);
					// resultTO.setImgUrl();
				} else if (part.getDisplayLink().matches("(.*)pinterest(.*)")) {
					pinlist.add(resultTO);
					// resultTO.setImgUrl();
				} else if (part.getDisplayLink().matches("(.*)instagram(.*)")) {
					instalist.add(resultTO);
					// resultTO.setImgUrl();
				} else if (part.getDisplayLink().matches("(.*)linkedin(.*)")) {
					linlist.add(resultTO);
					// resultTO.setImgUrl();
				} else if (part.getDisplayLink().matches("(.*)google(.*)")) {
					googlist.add(resultTO);
					// resultTO.setImgUrl();
				}
			}
			Gson gson = new Gson();
			this.fbString = gson.toJson(fblist);
			this.googString = gson.toJson(googlist);
			this.instaString = gson.toJson(instalist);
			this.pinString = gson.toJson(pinlist);
			this.twitString = gson.toJson(twitlist);
			this.linString = gson.toJson(linlist);

			// System.out.println(fblist.toString());
			System.out.println(fbString);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return ret;
	}

	public String getFbString() {
		return fbString;
	}

	public void setFbString(String fbString) {
		this.fbString = fbString;
	}

	public String getSearchText() {
		return searchText;
	}

	public void setSearchText(String searchText) {
		this.searchText = searchText;
	}

	public String getLinString() {
		return linString;
	}

	public void setLinString(String linString) {
		this.linString = linString;
	}

	public String getPinString() {
		return pinString;
	}

	public void setPinString(String pinString) {
		this.pinString = pinString;
	}

	public String getInstaString() {
		return instaString;
	}

	public void setInstaString(String instaString) {
		this.instaString = instaString;
	}

	public String getTwitString() {
		return twitString;
	}

	public void setTwitString(String twitString) {
		this.twitString = twitString;
	}

	public String getGoogString() {
		return googString;
	}

	public void setGoogString(String googString) {
		this.googString = googString;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getfName() {
		return fName;
	}

	public void setfName(String fName) {
		this.fName = fName;
	}

	public String getlName() {
		return lName;
	}

	public void setlName(String lName) {
		this.lName = lName;
	}

}
