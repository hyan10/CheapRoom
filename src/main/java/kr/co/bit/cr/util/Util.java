package kr.co.bit.cr.util;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.io.InputStream;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.Resource;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;


public class Util {
	
	public static String jsonParse(String key){
		JSONParser parser = new JSONParser();
		Object obj;
		String str="";
		try {
			Resource resource = new ClassPathResource("config/db_config.json");
			FileReader fr = new FileReader(resource.getFile());
			
			obj = parser.parse(fr);
		    JSONObject jsonObject = (JSONObject) obj;
			
			str = (String) jsonObject.get(key);
			System.out.println(str);
		} catch (FileNotFoundException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		} catch (IOException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		} catch (ParseException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		return str;
	}
	public static File multipartToFile(MultipartFile multipart) throws IllegalStateException, IOException 
	{
	    File convFile = new File( multipart.getOriginalFilename());
	    multipart.transferTo(convFile);
	    return convFile;
	}

}
