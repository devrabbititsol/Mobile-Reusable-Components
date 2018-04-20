package com.example.bhargavigattumedi.retrofitsample.mvp.presenter;

import com.chachapps.initialclasses.mvp.presenter.BasePresenter;
import com.example.bhargavigattumedi.retrofitsample.Network.CustomDisposableObserver;
import com.example.bhargavigattumedi.retrofitsample.Network.Service;
import com.example.bhargavigattumedi.retrofitsample.mvp.model.SampleRequest;
import com.example.bhargavigattumedi.retrofitsample.mvp.model.SampleResponse;
import com.example.bhargavigattumedi.retrofitsample.mvp.views.SampleView;

import io.reactivex.android.schedulers.AndroidSchedulers;
import io.reactivex.disposables.Disposable;
import io.reactivex.schedulers.Schedulers;

/**
 * Created by bhargavi.gattumedi on 4/19/2018.
 */

public class SamplePresenter extends BasePresenter<SampleView>{

    public void doRequest(SampleRequest request){
        Disposable disposable = Service.getInstance().doSampleRequest(request)
                .subscribeOn(Schedulers.io())
                .observeOn(AndroidSchedulers.mainThread())
                .subscribeWith(new CustomDisposableObserver<SampleResponse>(){
                    @Override
                    public void onNext(SampleResponse value) {
                        if (getMvpView() != null){
                            if (value.getApiStatus().equalsIgnoreCase("success")){
                                getMvpView().onResponseSuccess(value);
                            }else if (value.getApiStatus().equalsIgnoreCase("error")){
                                getMvpView().onResponseFail("error");
                            }
                        }
                    }

                    @Override
                    public void onConnectionLost() {
                        if (getMvpView() != null) {
                            getMvpView().onNoInternetConnection();
                        }
                    }

                    @Override
                    public void onServerError() {
                        if (getMvpView() != null) {
                            getMvpView().onServerError();
                        }
                    }

                    @Override
                    public void onError(Throwable t) {
                        if (getMvpView() != null) {
                            getMvpView().onError(t);
                        }
                    }
                });
        compositeSubscription.add(disposable);
    }
}
