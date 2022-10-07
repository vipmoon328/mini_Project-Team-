package service.Jiwoong;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONException;

import service.CommandProcess;

public class mgrBrdDeleteProAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, JSONException {
		
		response.setContentType("text/html; charset=utf-8");
		request.setCharacterEncoding("utf-8");
		
		System.out.println("mgrBrdDeleteProAction Start...");
		
		// 체크박스 배열값 파라미터 가져오기
		String 
		
		
		
		return null;
	}

}
