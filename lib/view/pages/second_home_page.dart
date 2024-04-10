import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:salorify/controller/dashboard_controller.dart';
import 'package:salorify/controller/verification_controller.dart';

import '../../constant/responsive.dart';

class SecondHomePage extends StatefulWidget {
  final String number;
  const SecondHomePage({super.key, required this.number});

  @override
  State<SecondHomePage> createState() => _SecondHomePageState();
}

class _SecondHomePageState extends State<SecondHomePage> {


  final DashBoardController dashBoardController = Get.put(DashBoardController());
  final VerificationController verificationController = Get.put(VerificationController());
@override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Responsive(
      child: Column(
        children: [
          Expanded(
            child: Scaffold(
                backgroundColor: Colors.transparent,
                body: Column(
                  children: <Widget>[
                    Expanded(flex: 4, child: _buildQrView(context)),
                    Expanded(
                      flex: 1,
                      child: FittedBox(
                        fit: BoxFit.contain,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            if (verificationController.result != null)
                              Text(
                                  'Barcode Type: ${describeEnum(verificationController.result!.format)}   Data: ${verificationController.result!.code}')
                            else
                              const Text('Scan a code'),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Container(
                                  margin: const EdgeInsets.all(8),
                                  child: ElevatedButton(
                                      onPressed: () async {
                                        await verificationController.qrViewController?.toggleFlash();
                                        setState(() {});
                                      },
                                      child: FutureBuilder(
                                        future: verificationController.qrViewController?.getFlashStatus(),
                                        builder: (context, snapshot) {
                                          return Text('Flash: ${snapshot.data}');
                                        },
                                      )),
                                ),
                                Container(
                                  margin: const EdgeInsets.all(8),
                                  child: ElevatedButton(
                                      onPressed: () async {
                                        await verificationController.qrViewController?.flipCamera();
                                        setState(() {});
                                      },
                                      child: FutureBuilder(
                                        future: verificationController.qrViewController?.getCameraInfo(),
                                        builder: (context, snapshot) {
                                          if (snapshot.data != null) {
                                            return Text(
                                                'Camera facing ${describeEnum(snapshot.data!)}');
                                          } else {
                                            return const Text('loading');
                                          }
                                        },
                                      )),
                                )
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Container(
                                  margin: const EdgeInsets.all(8),
                                  child: ElevatedButton(
                                    onPressed: () async {
                                      await verificationController.qrViewController!.pauseCamera();
                                    },
                                    child: const Text('pause',
                                        style: TextStyle(fontSize: 20)),
                                  ),
                                ),
                                Container(
                                  margin: const EdgeInsets.all(8),
                                  child: ElevatedButton(
                                    onPressed: () async {
                                      await verificationController.qrViewController!.resumeCamera();
                                    },
                                    child: const Text('resume',
                                        style: TextStyle(fontSize: 20)),
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildQrView(BuildContext context) {
    // For this example we check how width or tall the device is and change the scanArea and overlay accordingly.
    var scanArea = (MediaQuery.of(context).size.width < 400 ||
        MediaQuery.of(context).size.height < 400)
        ? 150.0
        : 300.0;
    // To ensure the Scanner view is properly sizes after rotation
    // we need to listen for Flutter SizeChanged notification and update controller
    return QRView(
      key: verificationController.qrKey,
      onQRViewCreated: verificationController.onQRViewCreated,
      overlay: QrScannerOverlayShape(
          borderColor: Colors.red,
          borderRadius: 10,
          borderLength: 30,
          borderWidth: 10,
          cutOutSize: scanArea),
      onPermissionSet: (ctrl, p) => verificationController.onPermissionSet(context, ctrl, p),
    );
  }
}
