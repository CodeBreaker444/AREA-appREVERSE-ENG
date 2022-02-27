package com.AREA.reverseeng;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.Toast;

public class MainActivity extends AppCompatActivity {
    public static String PACKAGE_NAME;
    public static String ACTIVITY_NAME;


    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
    }
    public void onBroadcastsend(View v){
        PACKAGE_NAME = getApplicationContext().getPackageName();
        ACTIVITY_NAME=this.getClass().getSimpleName();
        Intent intent = new Intent();
        //Toast.makeText(this, PACKAGE_NAME+ACTIVITY_NAME, Toast.LENGTH_SHORT).show();
        intent.setAction("com.AREA.reverseeng");
        intent.setFlags(Intent.FLAG_INCLUDE_STOPPED_PACKAGES);
        intent.putExtra("package_name",PACKAGE_NAME);
        intent.putExtra("activity_name",ACTIVITY_NAME);

        sendBroadcast(intent);
    }
}