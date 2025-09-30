package com.example.access_native_code

import io.flutter.embedding.android.FlutterActivity
import android.os.Build
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

class MainActivity : FlutterActivity(){
    private val CHANNEL = "com.example/platform"

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler { call, result ->
            if (call.method == "getPlatformVersion") {
                val version = getPlatformVersion()
                result.success(version)
            } else {
                result.notImplemented()
            }
        }
    }

    private fun getPlatformVersion(): String {
        return "Android ${Build.VERSION.RELEASE}"
    }
}
