//mock_user_repository.dart
import '../user_repository.dart';
import '../../models/app_user.dart';

class MockUserRepository implements UserRepository {
  final List<AppUser> _users = [];

  @override
  Future<void> addUser(AppUser user) async {
    _users.add(user);
  }

  @override
  Future<AppUser?> getUserById(String id) async {
    try {
      return _users.firstWhere((u) => u.id == id);
    } catch (e) {
      return null;
    }
  }

  @override
  Future<List<AppUser>> getAllUsers() async => List.unmodifiable(_users);

  @override
  Future<void> updateUser(AppUser user) async {
    _users.removeWhere((u) => u.id == user.id);
    _users.add(user);
  }

  @override
  Future<void> deleteUser(String id) async {
    _users.removeWhere((u) => u.id == id);
  }
}
