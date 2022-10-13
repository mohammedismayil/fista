package com.example.flutterdemo

import io.flutter.embedding.android.FlutterActivity
import android.os.Bundle 
import android.util.Log;

class MainActivity: FlutterActivity() {

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
       
       Log.i("TAG", "Hello World from main activity")
       
       


    }
}
