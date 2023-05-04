package com.syd.vehicle

import android.net.Uri
import io.flutter.embedding.android.FlutterActivity

import com.skt.Tmap.TMapTapi
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugins.GeneratedPluginRegistrant

class MainActivity : FlutterActivity() {
    private val mChannel: String = "mobile/parameters"

    @Override
    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        GeneratedPluginRegistrant.registerWith(flutterEngine)
        val channel = MethodChannel(flutterEngine.dartExecutor, mChannel)
        channel.setMethodCallHandler { call, result ->

            val tMapTapi = TMapTapi(this)

            if (call.method.equals("initTmapAPI")) {
                tMapTapi.setSKTMapAuthentication(BuildConfig.TMAP_API_KEY)
                tMapTapi.setOnAuthenticationListener(object :
                    TMapTapi.OnAuthenticationListenerCallback {
                    @Override

                    override fun SKTMapApikeySucceed() {
//                        TODO("Not yet implemented")
                        result.success("initTmapAPI")
                    }

                    override fun SKTMapApikeyFailed(p0: String?) {
//                        TODO("Not yet implemented")
                    }
                })

//                result.success("initTmapAPI")
            } else if (call.method.equals("isTmapApplicationInstalled")) {
                if (tMapTapi.isTmapApplicationInstalled) {
                    result.success("")
                } else {
                    val uri: Uri = Uri.parse(tMapTapi.tMapDownUrl[0])
                    result.success(uri.toString())
                }
            } else {
                result.notImplemented();
            }
        }

        super.configureFlutterEngine(flutterEngine)
    }
}
