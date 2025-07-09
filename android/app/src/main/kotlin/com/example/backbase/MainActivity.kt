package com.example.backbase
import android.content.Context
import android.hardware.camera2.CameraManager
import android.os.Build
import androidx.annotation.RequiresApi
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

class MainActivity: FlutterActivity() {
    private val CHANNEL = "backbase/channels"
    private val FLASHLIGHT_CHANNEL = "backbase/flashlight/channel"

    @RequiresApi(Build.VERSION_CODES.M)
    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler { call, result ->
            if (call.method == "getBatteryLevel") {
                val batteryLevel = BatteryInfo.getBatteryLevel(this)

                if (batteryLevel != -1) {
                    result.success(batteryLevel)
                } else {
                    result.error("UNAVAILABLE", "Battery level not available.", null)
                }
            } else if (call.method == "getDeviceName") {
                val deviceName = DeviceInfo.getDeviceName()
                result.success(deviceName)
            } else {
                result.notImplemented()
            }

        }


        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, FLASHLIGHT_CHANNEL).setMethodCallHandler { call, result ->
            val cameraManager = getSystemService(Context.CAMERA_SERVICE) as CameraManager
            val cameraId = cameraManager.cameraIdList.firstOrNull { id ->
                cameraManager.getCameraCharacteristics(id)
                    .get(android.hardware.camera2.CameraCharacteristics.FLASH_INFO_AVAILABLE) == true
            }
            
            if (call.method == "turnOn") {
                cameraId?.let { cameraManager.setTorchMode(it, true) }
                result.success(null)

            } else if (call.method == "turnOff") {
                cameraId?.let { cameraManager.setTorchMode(it, false) }
                result.success(null)
            } else {
                result.notImplemented()
            }

        }
    }

}

