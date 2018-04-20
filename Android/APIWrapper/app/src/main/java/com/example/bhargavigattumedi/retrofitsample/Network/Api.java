package com.example.bhargavigattumedi.retrofitsample.Network;

import com.example.bhargavigattumedi.retrofitsample.mvp.model.SampleRequest;
import com.example.bhargavigattumedi.retrofitsample.mvp.model.SampleResponse;

import io.reactivex.Observable;
import retrofit2.http.Body;
import retrofit2.http.POST;

/**
 * Created by Administrator on 11/14/2017.
 */

public interface Api {

    @POST("")// url
    Observable<SampleResponse> doRequest(@Body SampleRequest request);
}
