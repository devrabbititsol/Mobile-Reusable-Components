package com.example.bhargavigattumedi.retrofitsample.mvp.model;

import com.squareup.moshi.Json;

/**
 * Created by bhargavi.gattumedi on 4/19/2018.
 */

public class SampleRequest {

    @Json(name = "authentication_token")
    private String authenticationToken;
    @Json(name = "session_id")
    private String sessionId;
    @Json(name = "user_id")
    private String userId;
    @Json(name = "account_id")
    private String accountId;

    public String getAuthenticationToken() {
        return authenticationToken;
    }

    public void setAuthenticationToken(String authenticationToken) {
        this.authenticationToken = authenticationToken;
    }

    public String getSessionId() {
        return sessionId;
    }

    public void setSessionId(String sessionId) {
        this.sessionId = sessionId;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getAccountId() {
        return accountId;
    }

    public void setAccountId(String accountId) {
        this.accountId = accountId;
    }
}
