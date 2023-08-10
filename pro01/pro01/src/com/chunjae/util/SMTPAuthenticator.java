package com.chunjae.util;

import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;

public class SMTPAuthenticator extends Authenticator {
    @Override
    protected PasswordAuthentication getPasswordAuthentication() {
        return new PasswordAuthentication("tlsdpdms789", "password");    // git push 전 비밀번호 지우기!!
    }
}
