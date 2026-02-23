import 'package:flutter/material.dart';

class DevicesListScreen extends StatelessWidget {
  final List<String> devices = ["Stethoscope", "Nebulizer", "Glucose Monitor"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('قائمة الأجهزة الطبية'),
      ),
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: ListView.builder(
          itemCount: devices.length,
          itemBuilder: (context, index) {
            return Card(
              margin: EdgeInsets.all(8),
              child: ListTile(
                title: Text(devices[index]),
                trailing: IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () {
                    _showDeleteConfirmationDialog(context, devices[index]);
                  },
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  void _showDeleteConfirmationDialog(BuildContext context, String deviceName) {
    showDialog(
      context: context,
      builder: (BuildContext context) { 
        return AlertDialog(
          title: Text('تأكيد الحذف'),
          content: Text('هل أنت متأكد أنك تريد حذف الجهاز $deviceName؟'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              }, 
              child: Text('إلغاء'),
            ),
            TextButton(
              onPressed: () {
                // Logic to delete the device goes here.
                Navigator.of(context).pop();
              }, 
              child: Text('حذف'),
            ),
          ],
        );
      },
    );
  }
}