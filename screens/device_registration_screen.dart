import 'package:flutter/material.dart';

class DeviceRegistrationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Device Registration'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              decoration: InputDecoration(labelText: 'Device Name'),
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Serial Number'),
            ),
            // Add more form inputs as required
            ElevatedButton(
              onPressed: () {
                // Handle QR code generation and storage
              },
              child: Text('Register Device'),
            ),
          ],
        ),
      ),
    );
  }
}