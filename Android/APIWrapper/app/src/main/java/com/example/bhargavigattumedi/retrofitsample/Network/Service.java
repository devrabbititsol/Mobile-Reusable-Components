package com.example.bhargavigattumedi.retrofitsample.Network;

import com.example.bhargavigattumedi.retrofitsample.mvp.model.SampleResponse;
import com.example.bhargavigattumedi.retrofitsample.mvp.model.SampleRequest;

import java.io.IOException;
import java.util.concurrent.TimeUnit;

import io.reactivex.Observable;
import okhttp3.Interceptor;
import okhttp3.OkHttpClient;
import okhttp3.Request;
import okhttp3.logging.HttpLoggingInterceptor;
import retrofit2.Retrofit;
import retrofit2.adapter.rxjava2.RxJava2CallAdapterFactory;
import retrofit2.converter.moshi.MoshiConverterFactory;

/**
 * Created by Administrator on 11/14/2017.
 */

public class Service {

    private static Service instance;

    private Retrofit retrofit;

    private Api sampleApi;

    private static final int TIMEOUT = 30;

    public static Service getInstance() {
        if (instance == null) {
            instance = new Service();
        }
        return instance;
    }

    private Service() {
        if (retrofit == null || sampleApi == null) {
            retrofit = new Retrofit.Builder()
                    .baseUrl("")//base url
                    .client(createOkHttpClientInterceptor())
                    .addCallAdapterFactory(RxJava2CallAdapterFactory.create())
                    .addConverterFactory(MoshiConverterFactory.create())
                    .build();

            sampleApi = retrofit.create(Api.class);
        }
    }

    private OkHttpClient createOkHttpClientInterceptor() {
        HttpLoggingInterceptor interceptor = new HttpLoggingInterceptor();
        interceptor.setLevel(HttpLoggingInterceptor.Level.BODY);

        Interceptor headerInterceptor = new Interceptor() {
            @Override
            public okhttp3.Response intercept(Chain chain) throws IOException {
                Request original = chain.request();

                Request.Builder builder = original.newBuilder();

                //http headers goes here
               /* builder.header(Constants.X_APP_VER, Constants.MOBILE_ANDROID + LegionUtils.getAppVersion());
                if (sessionId != null) {
                    builder.header(Constants.SESSION_ID, sessionId);
                    Log.d("sessionId", ""+sessionId);
                }*/

                builder.method(original.method(), original.body());

                Request request = builder.build();

                return chain.proceed(request);
            }
        };

        return new OkHttpClient.Builder().connectTimeout(TIMEOUT, TimeUnit.SECONDS).readTimeout(TIMEOUT,
                TimeUnit.SECONDS).addInterceptor(interceptor)
                .addNetworkInterceptor(headerInterceptor).build();
    }

    public Observable<SampleResponse> doSampleRequest(SampleRequest params) {
        return sampleApi.doRequest(params);
    }
}
