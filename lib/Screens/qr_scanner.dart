import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class MyScanQr extends StatefulWidget {
  const MyScanQr({super.key});

  @override
  State<MyScanQr> createState() => _MyScanQrState();
}

class _MyScanQrState extends State<MyScanQr> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QrCode');
  QRViewController? _qrcontroller; 
  String results = "";
  @override
  void dispose(){
_qrcontroller?.dispose();
super.dispose();
  }

  void onQrViewCreated(QRViewController qrcontroller){
    _qrcontroller=qrcontroller;
    qrcontroller.scannedDataStream.listen((scanData){
setState(() {
  results=scanData.code!;
});
    });
  }
  @override
  Widget build(BuildContext context) {
    return  const Scaffold(body: Center(child: Text('Scan Qr'),));
  }
}