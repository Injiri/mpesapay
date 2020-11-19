/**
 * This Source Code Form is subject to the terms of the Mozilla Public License,
 * v. 2.0. If a copy of the MPL was not distributed with this file, You can
 * obtain one at http://mozilla.org/MPL/2.0/. OpenMRS is also distributed under
 * the terms of the Healthcare Disclaimer located at http://openmrs.org/license.
 * <p>
 * Copyright (C) OpenMRS Inc. OpenMRS is a registered trademark and the OpenMRS
 * graphic logo is a trademark of OpenMRS Inc.
 */
package org.openmrs.module.mpesapay.api.impl;

import okhttp3.*;
import org.json.JSONArray;
import org.json.JSONObject;
import org.openmrs.api.APIException;
import org.openmrs.api.UserService;
import org.openmrs.api.impl.BaseOpenmrsService;
import org.openmrs.module.mpesapay.Item;
import org.openmrs.module.mpesapay.api.MpesapayService;
import org.openmrs.module.mpesapay.api.dao.MpesapayDao;

import java.io.IOException;
import java.util.Base64;

public class MpesapayServiceImpl extends BaseOpenmrsService implements MpesapayService {
	
	MpesapayDao dao;
	
	UserService userService;
	
	/**
	 * Injected in moduleApplicationContext.xml
	 */
	public void setDao(MpesapayDao dao) {
		this.dao = dao;
	}
	
	/**
	 * Injected in moduleApplicationContext.xml
	 */
	public void setUserService(UserService userService) {
		this.userService = userService;
	}
	
	@Override
	public Item getItemByUuid(String uuid) throws APIException {
		return dao.getItemByUuid(uuid);
	}
	
	@Override
	public Item saveItem(Item item) throws APIException {
		if (item.getOwner() == null) {
			item.setOwner(userService.getUser(1));
		}
		
		return dao.saveItem(item);
	}
	
	/**
	 * First do an authentication if successful proceed to do a C2B transaction All parameters for
	 * the implemented mpesa services be configurable in the global properties file.
	 */
	
	@Override
	public String MpesaPayAuthenticate(String appKey, String appSecret) throws IOException {
		String appKeySecret = appKey + ":" + appSecret;
		byte[] bytes = appKeySecret.getBytes("ISO-8859-1");
		String encoded = Base64.getEncoder().encodeToString(bytes);
		
		OkHttpClient client = new OkHttpClient();
		
		Request request = new Request.Builder()
		        .url("https://sandbox.safaricom.co.ke/oauth/v1/generate?grant_type=client_credentials").get()
		        .addHeader("authorization", "Basic " + encoded).addHeader("cache-control", "no-cache")
		        
		        .build();
		
		Response response = client.newCall(request).execute();
		JSONObject jsonObject = new JSONObject(response.body().string());
		System.out.println(jsonObject.getString("access_token"));
		return jsonObject.getString("access_token");
	}
	
	@Override
	public String MpesaPayC2BSimulation(String shortCode, String commandID, String amount, String MSISDN,
	        String billRefNumber, String authenticationAcessToken) throws IOException {
		JSONArray jsonArray = new JSONArray();
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("ShortCode", shortCode);
		jsonObject.put("CommandID", commandID);
		jsonObject.put("Amount", amount);
		jsonObject.put("Msisdn", MSISDN);
		jsonObject.put("BillRefNumber", billRefNumber);
		
		jsonArray.put(jsonObject);
		
		String requestJson = jsonArray.toString().replaceAll("[\\[\\]]", "");
		System.out.println(requestJson);
		OkHttpClient client = new OkHttpClient();
		
		MediaType mediaType = MediaType.parse("application/json");
		RequestBody body = RequestBody.create(mediaType, requestJson);
		Request request = new Request.Builder().url("https://sandbox.safaricom.co.ke/safaricom/c2b/v1/simulate").post(body)
		        .addHeader("content-type", "application/json")
		        .addHeader("authorization", "Bearer " + authenticationAcessToken).addHeader("cache-control", "no-cache")
		        .build();
		
		Response response = client.newCall(request).execute();
		System.out.println(response.body().string());
		return response.body().toString();
	}
}
