//user_repository.dart
import '../models/app_user.dart';

/// Repository für User-Daten.
/// Kapselt Zugriff auf lokale DB oder Remote-Service.
abstract class UserRepository {
  Future<void> addUser(AppUser user);
  Future<AppUser?> getUserById(String id);
  Future<List<AppUser>> getAllUsers();
  Future<void> updateUser(AppUser user);
  Future<void> deleteUser(String id);
}
