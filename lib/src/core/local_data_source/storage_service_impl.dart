// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'package:challenge/src/core/local_data_source/storage_service.dart';

class StorageServiceImpl implements StorageService {
  final FlutterSecureStorage storage;
  StorageServiceImpl({
    required this.storage,
  });

  static const String key = 'key';

  @override
  Future<String?> read() async {
    String? readValue = await storage.read(key: key);
    throw UnimplementedError();
  }

  @override
  Future<void> write() async {
    await storage.write(key: key, value: 'value');

    throw UnimplementedError();
  }
}
