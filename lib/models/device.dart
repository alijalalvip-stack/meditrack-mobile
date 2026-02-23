import 'package:shared_preferences/shared_preferences.dart';

class Device {
  final String id;
  final String name;

  Device({required this.id, required this.name});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
    };
  }

  static Device fromMap(Map<String, dynamic> map) {
    return Device(
      id: map['id'],
      name: map['name'],
    );
  }
}

class DeviceStorage {
  // Save device to local storage
  Future<void> saveDevice(Device device) async {
    final prefs = await SharedPreferences.getInstance();
    List<String> devices = prefs.getStringList('devices') ?? [];
    devices.add(device.toMap().toString());
    await prefs.setStringList('devices', devices);
  }

  // Get all devices from local storage
  Future<List<Device>> getDevices() async {
    final prefs = await SharedPreferences.getInstance();
    List<String>? devicesMap = prefs.getStringList('devices');
    return devicesMap?.map((device) => Device.fromMap(device as Map<String, dynamic>)).toList() ?? [];
  }

  // Clear all devices
  Future<void> clearDevices() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('devices');
  }
}