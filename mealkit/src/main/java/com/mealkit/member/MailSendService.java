package com.mealkit.member;

import java.util.Random;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;



@Component
public class MailSendService {

	@Autowired
	private JavaMailSenderImpl mailSender;
	private String VerificationCode; 

		public void makeRandomKey() {

			Random rnd = new Random();
			StringBuffer temp = new StringBuffer();
			for (int i = 0; i < 10; i++) {
    			int rIndex = rnd.nextInt(3);
    			switch (rIndex) {
    			case 0:
    				// a-z
    				temp.append((char) ((int) (rnd.nextInt(26)) + 97));
    				break;
    			case 1:
    				// A-Z
    				temp.append((char) ((int) (rnd.nextInt(26)) + 65));
    				break;
    			case 2:
    				// 0-9
    				temp.append((rnd.nextInt(10)));
    				break;
    			}	
    		}
    		System.out.println(temp);
    		VerificationCode = temp.toString();
		}

		//메일 양식
		public String setMail(String email) {
			makeRandomKey();
			String setFrom = "kh361team1@gmail.com"; 
			String toMail = email;
			String title = "[인증코드 확인] 안녕하세요! 밀키트 쇼핑몰 밀슐랭입니다";  
			String content = "인증코드: " + VerificationCode;  
			sendMail(setFrom, toMail, title, content);
			return VerificationCode;
		}

		//전송 메소드
		public void sendMail(String setFrom, String toMail, String title, String content) { 

			MimeMessage message = mailSender.createMimeMessage();

			try {
				MimeMessageHelper helper = new MimeMessageHelper(message,true,"utf-8");
				helper.setFrom(setFrom);
				helper.setTo(toMail);
				helper.setSubject(title);
				helper.setText(content,true);
				mailSender.send(message);
			} catch (MessagingException e) {
				e.printStackTrace();
			}
		}

}
