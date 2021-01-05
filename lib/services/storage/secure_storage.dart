import 'package:flutter_secure_storage/flutter_secure_storage.dart';

// Secured local device storage helper
class SecureStorage {
// Create storage
  final storage = new FlutterSecureStorage();

// Adding a new value
  Future<void> setStorageValue({
    String id,
    String value,
  }) async {
    // Write value
    await storage.write(
      key: id,
      value: value,
    );
  }

  // Read value
  Future<String> getStorageValue({
    String id,
  }) async {
    // Write value
    String value = await storage.read(
      key: id,
    );
    return value;
  }
}
