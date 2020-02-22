import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:nipat/src/components/custom_container.dart';
import 'package:nipat/src/services/logging_service.dart';
import 'package:nipat/src/utils/constant.dart';
import 'package:qrcode_reader/qrcode_reader.dart';

class CameraPage extends StatefulWidget {
  @override
  _CameraPageState createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {
  String readText = '';
  DocumentReference docRef;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Constant.CAMERA),
        centerTitle: true,
        backgroundColor: Constant.BG_COLOR,
      ),
      body: Column(
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width,
            height: 200.0,
            child: Center(
              child: Text(readText),
            ),
          ),
          CustomContainer(
            text: 'Check',
            color: Constant.BG_COLOR,
            icon: Icons.check,
            onPressed: () async {
              bool done = await sendToCheck(readText);
              if (done) Navigator.pop(context);
            },
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => qrScan(),
        tooltip: 'Scan QR',
        child: Icon(Icons.camera_front),
      ),
    );
  }

  Future qrScan() async {
    Future<String> futureString = QRCodeReader()
        .setAutoFocusIntervalInMs(200) // default 5000
        .setForceAutoFocus(true) // default false
        .setTorchEnabled(true) // default false
        .setHandlePermissions(true) // default true
        .setExecuteAfterPermissionGranted(true) // default true
        .scan();

    futureString.then(
      (text) => setState(() {
        readText = text;
      }),
    );
  }

  Future<bool> sendToCheck(String identification) async {
    if (identification.isEmpty) return false;
    try {
      Firestore.instance
          .collection('students')
          .where('identificationNumber', isEqualTo: identification)
          .snapshots()
          .listen(
        (data) {
          print(data.documents[0].documentID);
          Firestore.instance
              .collection('students')
              .document(data.documents[0].documentID)
              .updateData(
            {
              'cheked': true,
            },
          );
        },
      );
    } catch (e) {
      logger.e(e.toString());
      return false;
    }
    return true;
  }
}
