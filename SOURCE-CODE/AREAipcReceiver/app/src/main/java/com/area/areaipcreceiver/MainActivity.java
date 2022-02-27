package com.area.areaipcreceiver;

import androidx.appcompat.app.AppCompatActivity;
import com.area.areaipcreceiver.AREAipcReceiver;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.content.SharedPreferences;
import android.os.Bundle;
import android.util.Log;
import android.widget.TextView;
import android.widget.Toast;

import java.lang.reflect.Field;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;

public class MainActivity extends AppCompatActivity implements AREAipcLISTENER {
    public int cb_area_counter=0;
    protected BroadcastReceiver receiver;
    public String target_data[];
 @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        final TextView cb_area_counter_data = (TextView) findViewById(R.id.cb_text);
        final TextView cb_area_package = (TextView) findViewById(R.id.package_name);
        final TextView cb_area_activity = (TextView) findViewById(R.id.activity_name);
        final TextView cb_area_status= (TextView) findViewById(R.id.status);
        final TextView cb_area_update=(TextView) findViewById(R.id.updated_time);
        final TextView cb_area_info=(TextView) findViewById(R.id.info);
        SharedPreferences sharedPreferences = getSharedPreferences("C0deBreak3r", MODE_PRIVATE);
        String s1 = sharedPreferences.getString("counter_data", null);
        String s2=sharedPreferences.getString("package_name","oops no package name!");
        String s3=sharedPreferences.getString("activity_name","oops no activity!");
        String s4=sharedPreferences.getString("upd_data",null);
        String s5=sharedPreferences.getString("status_data",null);
        String error_msg="Target APK is Not Opened!";

     Field[] fields = R.string.class.getFields();
        for(final Field field : fields) {
            String name = field.getName(); //name of string

            Log.i("data",name);


            try{
                int id = field.getInt(R.string.class); //id of string
                String str_data=getResources().getString(id);
                Log.i("data",str_data);

            }catch (Exception ex) {
                //do smth
            }
        }
        if (s1 != null ) {
            cb_area_counter_data.setText(s1);
            if(s4!=null && s5!=null) {
                cb_area_update.setText(s4);
                cb_area_status.setText(s5);

            }
        } else {
            cb_area_counter_data.setText("No data");
            cb_area_info.setText(error_msg);


        }
        cb_area_package.setText(s2);
        cb_area_activity.setText(s3);
        receiver = new AREAipcReceiver(this);
        IntentFilter intentFilter = new IntentFilter("com.AREA.reverseeng");
        this.registerReceiver(receiver, intentFilter);

    }
    public void UPDATEdata(String value) {
        final TextView cb_area_counter_data = (TextView) findViewById(R.id.cb_text);
        final TextView cb_area_package = (TextView) findViewById(R.id.package_name);
        final TextView cb_area_activity = (TextView) findViewById(R.id.activity_name);
        final TextView cb_area_status= (TextView) findViewById(R.id.status);
        final TextView cb_area_update=(TextView) findViewById(R.id.updated_time);
        final TextView cb_area_info=(TextView) findViewById(R.id.info);

        SharedPreferences sharedPreferences = getSharedPreferences("C0deBreak3r", MODE_PRIVATE);
        String s1 = sharedPreferences.getString("counter_data", null);
        String s2=sharedPreferences.getString("package_name",null);
        String s3=sharedPreferences.getString("activity_name",null);
        SharedPreferences.Editor myEdit = sharedPreferences.edit();
        String error_msg="Target APK is Not Opened!";

        if (s1 != null) {
            String currentDate = new SimpleDateFormat("dd-MM-yyyy", Locale.getDefault()).format(new Date());
            String currentTime = new SimpleDateFormat("HH:mm:ss", Locale.getDefault()).format(new Date());
            String upd_data="Last Update:"+currentDate+","+currentTime;
            cb_area_update.setText(upd_data);
            myEdit.putString("upd_data",upd_data);
            myEdit.putString("status_data","Active 🟢");
            myEdit.apply();

            cb_area_counter_data.setText(s1);
            cb_area_status.setText("Active 🟢");
        } else {
            cb_area_counter_data.setText("no data is present");
            cb_area_info.setText(error_msg);

        }
        cb_area_counter_data.setText(s1);
        cb_area_package.setText(s2);
        cb_area_activity.setText(s3);


    }
    @Override
    public void doSomething(String value) {
        SharedPreferences sharedPreferences = this.getSharedPreferences("C0deBreak3r", Context.MODE_PRIVATE);
        String s1 = sharedPreferences.getString("counter_data", null);

        if (s1 == null) {
            cb_area_counter = cb_area_counter + 1;
            Log.i("Counter", "Counter Null");

        } else {
            cb_area_counter = Integer.parseInt(s1) + 1;
            Log.i("Counter", "Counter add to shared");
        }
// Creating an Editor object to edit(write to the file)
        SharedPreferences.Editor myEdit = sharedPreferences.edit();

// Storing the key and its value as the data fetched from edittext
        myEdit.putString("counter_data", Integer.toString(cb_area_counter));

        String target_data[]=value.split(",");


        myEdit.putString("package_name",target_data[0]);
        myEdit.putString("activity_name",target_data[1]);


// Once the changes have been made,
// we need to commit to apply those changes made,
// otherwise, it will throw an error
        myEdit.apply();
        UPDATEdata(value);
    }
}
