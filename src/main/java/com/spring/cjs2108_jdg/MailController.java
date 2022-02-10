package com.spring.cjs2108_jdg;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.FileSystemResource;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/mail")
public class MailController {
	@Autowired
	JavaMailSender mailSender;
	
	@RequestMapping(value="/mailForm")
	public String mailFormGet() {
		return "mail/mailForm";
	}
	
	@RequestMapping(value="/pwdSearchSend/{toMail}/{content}", method = RequestMethod.GET)
	public String pwdSearchPost(@PathVariable String toMail, @PathVariable String content) {
		try {
			String fromMail = "milleBook@gmail.com";
			String title = "임시 비밀번호 발송.";
			String pwd = content;
			content = "밀리의 서제에서 발송한 메일입니다. \n 아래 임시 비밀번호로 접속후 마이페이지에서 비밀번호를 변경하시기 바랍니다.";
			
			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");
			
			messageHelper.setTo(fromMail);
			messageHelper.setTo(toMail);
			messageHelper.setSubject(title);
			
			content = content.replace("\n", "<br>");
			content += "<br><hr><h3>임시비밀번호 : <font color='red'>"+pwd+"</font></h3><hr><br>";
			content += "<p><img src='cid:mille4.png' width='600px'></p><hr>";
			content += "<font size: 18px;><i>새해에도 밀리와 함께 독서와 무제한 친해지리</i></font>";
			content += "<p>접속주소 : <a href='http://218.236.203.153:9090/cjs2108'>밀리의 서재</a></p><hr>";
			messageHelper.setText(content, true);
			FileSystemResource file = new FileSystemResource("D:\\JavaCourse\\SpringFramework\\project\\cjs2108_jdg\\src\\main\\webapp\\resources\\images\\mille7.jpg");
			messageHelper.addInline("mille7.jpg", file);
			
			mailSender.send(message);
		} catch (MessagingException e) {
			e.printStackTrace();
		}
		return "redirect:/msg/pwdSearchOk";
	}
}
