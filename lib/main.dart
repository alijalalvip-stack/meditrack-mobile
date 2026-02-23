import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:scanner/scanner.dart'; // You would need to implement QR code scanning functionality
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MediTrackApp());
}

class MediTrackApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MediTrack App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      localizationsDelegates: GlobalMaterialLocalizations.delegates,
      supportedLocales: [
        Locale('en', ''),
        Locale('ar', ''),
      ],
      home: DeviceRegistrationScreen(),
    );
  }
}

class DeviceRegistrationScreen extends StatefulWidget {
  @override
  _DeviceRegistrationScreenState createState() => _DeviceRegistrationScreenState();
}

class _DeviceRegistrationScreenState extends State<DeviceRegistrationScreen> {
  final TextEditingController _controller = TextEditingController();
  String _qrData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('تسجيل الجهاز'), // "Device Registration" in Arabic
      ),
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextField(
                controller: _controller,
                decoration: InputDecoration(labelText: 'أدخل بيانات الجهاز'), // "Enter device data" in Arabic
              ),
              ElevatedButton(
                onPressed: _generateQRCode,
                child: Text('إنشاء QR كود'), // "Generate QR Code" in Arabic
              ),
              if (_qrData != null) ...[
                QrImage(
                  data: _qrData,
                  version: QrVersions.auto,
                  size: 200.0,
                ),
              ],
              ElevatedButton(
                onPressed: _scanQRCode,
                child: Text('المسح ضوئي QR كود'), // "Scan QR Code" in Arabic
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _generateQRCode() {
    setState(() {
      _qrData = _controller.text;
    });
  }

  void _scanQRCode() async {
    // Implement QR code scanning logic here
  }
}