abstract class StorageService {
  Future<void> write();

  Future<String?> read();
}
