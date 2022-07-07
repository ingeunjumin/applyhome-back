package com.ingeunjumin.project.service;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.InputStreamReader;
import java.io.StringReader;
import java.net.URL;

import javax.json.Json;
import javax.json.JsonObject;
import javax.json.JsonReader;
import javax.net.ssl.HttpsURLConnection;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.ingeunjumin.project.mapper.UsersMapper;
import com.ingeunjumin.project.utils.CaptchaSettings;
import com.ingeunjumin.project.vo.UsersVO;

@Service
public class AuthService implements UserDetailsService{

	@Autowired
	private UsersMapper usersMapper;
	
	@Autowired
	private CaptchaSettings captchaSettings;
	
	@Override
	public UserDetails loadUserByUsername(String userId) throws UsernameNotFoundException {
		UsersVO userVO  = usersMapper.selectUserInfo(userId);
		if(userVO == null) throw new UsernameNotFoundException("User Not Found"+userId);
		
		return userVO; 
	}
	
	public boolean verifyRecaptcha(String recaptcha) {
      	
    	final String SECRET_KEY = captchaSettings.getSecret(); // 비밀키 호출
    	final String RE_URL = captchaSettings.getUrl(); // 인증할 URL
    	
		try {
			URL obj = new URL(RE_URL);
			HttpsURLConnection con = (HttpsURLConnection) obj.openConnection();
			con.setRequestMethod("POST");
			
			String postParams = "secret=" + SECRET_KEY + "&response=" + recaptcha;
			con.setDoOutput(true);
			
			DataOutputStream wr = new DataOutputStream(con.getOutputStream());
			wr.writeBytes(postParams);
			wr.flush();
			wr.close();

			BufferedReader in = new BufferedReader(new InputStreamReader(con.getInputStream()));
			String inputLine;
			StringBuffer response = new StringBuffer();

			while ((inputLine = in.readLine()) != null) {
				response.append(inputLine);
			}
			in.close();

			JsonReader jsonReader = Json.createReader(new StringReader(response.toString()));
			JsonObject jsonObject = jsonReader.readObject();
			jsonReader.close();
			return jsonObject.getBoolean("success"); //최종 Return 값 : true or false
			
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}

	}

}
