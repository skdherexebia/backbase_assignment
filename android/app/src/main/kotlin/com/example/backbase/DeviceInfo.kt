package com.example.backbase

import android.os.Build
import java.util.Locale

object DeviceInfo {
    fun getDeviceName(): String {
        val manufacturer = Build.MANUFACTURER.capitalize(Locale.getDefault())
        val deviceName = Build.MODEL
        val osVersion = Build.VERSION.RELEASE;

        val model = Build.MODEL
        return if (model.startsWith(manufacturer, ignoreCase = true)) {
            model
        } else {
            "$manufacturer $deviceName Android $osVersion"
        }
    }
}