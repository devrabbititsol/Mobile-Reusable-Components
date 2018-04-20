package com.example.bhargavigattumedi.retrofitsample.mvp.views;

import com.example.bhargavigattumedi.retrofitsample.mvp.model.SampleResponse;

/**
 * Created by bhargavi.gattumedi on 4/19/2018.
 */

public interface SampleView extends BaseMvpView {

    void onResponseSuccess(SampleResponse response);

    void onResponseFail(String message);
}
