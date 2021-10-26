package com.ntc.atome;

import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.util.Base64;

import androidx.annotation.NonNull;

import com.ntc.atome.utils.BluetoothUtil;
import com.ntc.atome.utils.SunmiPrintHelper;

import io.flutter.embedding.android.FlutterActivity;
import io.flutter.embedding.engine.FlutterEngine;
import io.flutter.plugin.common.MethodChannel;

public class MainActivity extends FlutterActivity {
    private static final String CHANNEL = "SunmiEDC";
    private void init(){
        SunmiPrintHelper.getInstance().initSunmiPrinterService(this);
    }

    Bitmap qrBitmap;

    @Override
    public void configureFlutterEngine(@NonNull FlutterEngine flutterEngine) {
        super.configureFlutterEngine(flutterEngine);
        init();

        new MethodChannel(flutterEngine.getDartExecutor().getBinaryMessenger(), CHANNEL)
            .setMethodCallHandler((call, result) -> {
                if (call.method.equals("printQR")) {
                    String qrBase64 = call.argument("qrBase64");
                    byte[] decodeQR = Base64.decode(qrBase64, Base64.DEFAULT);
                    qrBitmap = BitmapFactory.decodeByteArray(decodeQR, 0, decodeQR.length);
                    printQR(qrBitmap);
                }
                if (call.method.equals("printReceipt")){
                }

            });
    }

    public void printQR(Bitmap qrBitmap) {
        Bitmap bitmap = Bitmap.createScaledBitmap(qrBitmap,400,400,false);

        if (!BluetoothUtil.isBlueToothPrinter) {
            SunmiPrintHelper.getInstance().printBitmap(bitmap, 0);
            SunmiPrintHelper.getInstance().feedPaper();
        }
    }
}
