package com.kongkong.mail.web;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kongkong.mail.sevice.MailSendService;


@Controller
public class MailController {

	@Autowired
	MailSendService mailsendService;
	
	@ResponseBody
	@RequestMapping("/email/sendEmail.wow")
	public String sendEmail(String memMail) {
		
		return mailsendService.sendnumMail(memMail);
	}

	
	@ResponseBody
	@RequestMapping("/email/sendSingoEmail.wow")
	public String sendSingoEmail(String memMail, String memId) {
		
		return mailsendService.sendStringMail(memMail, memId);
	}
	
}
