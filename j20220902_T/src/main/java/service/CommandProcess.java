package service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONException;

public interface CommandProcess {
   public String requestPro(HttpServletRequest  request,
		                    HttpServletResponse response)
		         throws ServletException , IOException, JSONException;
   
}
