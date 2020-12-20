package com.vscanner

import android.annotation.SuppressLint
import android.content.pm.PackageInfo
import android.content.pm.PackageManager
import android.content.pm.Signature
import android.os.Bundle
import android.os.PersistableBundle
import android.util.Base64
import android.util.Log
import androidx.annotation.NonNull
import java.security.MessageDigest
import java.security.NoSuchAlgorithmException
import io.flutter.embedding.android.FlutterActivity

class MainActivity: FlutterActivity() {

//    override fun onCreate(savedInstanceState: Bundle?) {
//        super.onCreate(savedInstanceState)
//        generateFBKeyHash();
//    }

    @SuppressLint("PackageManagerGetSignatures")
    fun generateFBKeyHash() {
        try {
            var info: PackageInfo? = null
            try {
                info = getPackageManager().getPackageInfo(
                        "com.vscanner",
                        PackageManager.GET_SIGNATURES)
            } catch (e: PackageManager.NameNotFoundException) {
                e.printStackTrace()
            }
            if (info != null) {
                for (signature in info.signatures) {
                    val md: MessageDigest = MessageDigest.getInstance("SHA")
                    md.update(signature.toByteArray())
                    Log.i("KeyHash:", android.util.Base64.encodeToString(md.digest(), android.util.Base64.DEFAULT))
                }
            }
        } catch (e: NoSuchAlgorithmException) {
        }
    }
}
