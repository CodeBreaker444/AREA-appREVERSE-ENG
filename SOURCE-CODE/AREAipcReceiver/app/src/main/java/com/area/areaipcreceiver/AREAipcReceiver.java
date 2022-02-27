package com.area.areaipcreceiver;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.content.SharedPreferences;
import android.util.Log;
import android.widget.TextView;
import android.widget.Toast;

public class AREAipcReceiver extends BroadcastReceiver {
    public static boolean wasScreenOn = true;
    public int cb_area_counter = 0;
    private AREAipcLISTENER listener;
    public AREAipcReceiver(AREAipcLISTENER listener){
        this.listener=listener;

    }

    @Override
    public void onReceive(Context context, Intent intent) {
        // TODO: This method is called when the BroadcastReceiver is receiving
        // an Intent broadcast.
        // Storing data into SharedPreferences
        String data;
        data=intent.getStringExtra("package_name");
        data=data+","+intent.getStringExtra("activity_name");
        listener.doSomething(data);



        Log.i("BroadCastData", "Broadcast message codebreaker");
        //Toast.makeText(context, "CB:"+data, Toast.LENGTH_SHORT).show();
    }



}