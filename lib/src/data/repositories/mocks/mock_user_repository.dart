//mock_user_repository.dart
import '../user_repository.dart';
import '../../models/app_user.dart';

class MockUserRepository implements UserRepository {
  final List<AppUser> _users = [];

  @override
  Future<void> addUser(AppUser user) async {
    await Future.delayed(const Duration(seconds: 2)); // ⏳ Simulierte Wartezeit
    _users.add(user);
  }

  @override
  Future<AppUser?> getUserById(String id) async {
    await Future.delayed(const Duration(seconds: 2)); // ⏳ Simulierte Wartezeit
    try {
      return _users.firstWhere((u) => u.id == id);
    } catch (e) {
      return null;
    }
  }

  @override
  Future<List<AppUser>> getAllUsers() async {
    await Future.delayed(const Duration(seconds: 2)); // ⏳ Simulierte Wartezeit
    return List.unmodifiable(_users);
  }

  @override
  Future<void> updateUser(AppUser user) async {
    await Future.delayed(const Duration(seconds: 2)); // ⏳ Simulierte Wartezeit
    _users.removeWhere((u) => u.id == user.id);
    _users.add(user);
  }

  @override
  Future<void> deleteUser(String id) async {
    await Future.delayed(const Duration(seconds: 2)); // ⏳ Simulierte Wartezeit
    _users.removeWhere((u) => u.id == id);
  }
}
