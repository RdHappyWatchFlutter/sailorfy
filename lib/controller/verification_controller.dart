import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:salorify/api_function.dart';
import 'package:salorify/model/active_training_list_model.dart';
import 'package:salorify/model/certificate_list_model.dart';
import 'package:salorify/model/top_employers_list_model.dart';
import 'package:salorify/model/training_list_data_model.dart';
import 'package:salorify/model/user_data_model.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart' as path;

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