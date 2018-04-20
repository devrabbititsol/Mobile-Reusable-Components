package com.example.bhargavigattumedi.retrofitsample.activities;

import android.content.Context;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.Toast;

import com.example.bhargavigattumedi.retrofitsample.R;
import com.example.bhargavigattumedi.retrofitsample.mvp.model.SampleRequest;
import com.example.bhargavigattumedi.retrofitsample.mvp.model.SampleResponse;
import com.example.bhargavigattumedi.retrofitsample.mvp.presenter.SamplePresenter;
import com.example.bhargavigattumedi.retrofitsample.mvp.views.SampleView;

public class MainActivity extends AppCompatActivity implements SampleView{

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        final SamplePresenter presenter = new SamplePresenter();
        presenter.attachMvpView(this);

        Button button = (Button) findViewById(R.id.button);
        button.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Toast.makeText(MainActivity.this, "request started", Toast.LENGTH_SHORT).show();
                SampleRequest request = new SampleRequest();
                presenter.doRequest(request);
            }
        });

    }

    @Override
    public void onServerError() {

    }

    @Override
    public void onResponseSuccess(SampleResponse response) {
        Toast.makeText(this, "Success", Toast.LENGTH_SHORT).show();
    }

    @Override
    public void onResponseFail(String message) {
        Toast.makeText(this, "Fail", Toast.LENGTH_SHORT).show();
    }

    @Override
    public Context getMvpContext() {
        return MainActivity.this;
    }

    @Override
    public void onError(Throwable throwable) {

    }

    @Override
    public void onNoInternetConnection() {

    }

    @Override
    public void onErrorCode(String s) {

    }
}
