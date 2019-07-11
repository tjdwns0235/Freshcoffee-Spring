package com.freshcoffee.service.email;

import com.freshcoffee.domain.email.EmailDTO;

public interface EmailService {
	public void sendMail(EmailDTO eDto);
}
