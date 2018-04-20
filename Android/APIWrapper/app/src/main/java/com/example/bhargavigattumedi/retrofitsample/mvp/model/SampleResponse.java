package com.example.bhargavigattumedi.retrofitsample.mvp.model;

import com.squareup.moshi.Json;

/**
 * Created by bhargavi.gattumedi on 4/19/2018.
 */

public class SampleResponse {

    @Json(name = "api_status")
    private String apiStatus;
    @Json(name = "api_message")
    private String apiMessage;

    public String getApiStatus() {
        return apiStatus;
    }

    public void setApiStatus(String apiStatus) {
        this.apiStatus = apiStatus;
    }

    public String getApiMessage() {
        return apiMessage;
    }

    public void setApiMessage(String apiMessage) {
        this.apiMessage = apiMessage;
    }
}
