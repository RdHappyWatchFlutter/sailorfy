import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:salorify/api_function.dart';

class VerificationController extends GetxController {
  final ApiFunction apiFunction = Get.put(ApiFunction());
  Barcode? result;
  QRViewController? qrViewController;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

  void onQRViewCreated(QRViewController controller) {
    qrViewController = controller;
    update();
    controller.scannedDataStream.listen((scanData) {
        result = scanData;
/*        print('result!.code');
        print(result!.code);
        print(result!.format.formatName);*/
        update();
    });
  }

  void onPermissionSet(BuildContext context, QRViewController ctrl, bool p) {
    log('${DateTime.now().toIso8601String()}_onPermissionSet $p');
    if (!p) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('no Permission')),
      );
    }
  }
}