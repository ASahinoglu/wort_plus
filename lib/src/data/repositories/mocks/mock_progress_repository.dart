//mock_progress_repository.dart
import '../progress_repository.dart';
import '../../models/user_progress.dart';

class MockProgressRepository implements ProgressRepository {
  final List<UserProgress> _progress = [];

  @override
  Future<void> addProgress(UserProgress progress) async {
    await Future.delayed(const Duration(seconds: 2)); // ⏳ Simulierte Wartezeit
    _progress.add(progress);
  }

  @override
  Future<UserProgress?> getProgressById(int id) async {
    await Future.delayed(const Duration(seconds: 2)); // ⏳ Simulierte Wartezeit
    try {
      return _progress.firstWhere((p) => p.id == id);
    } catch (e) {
      return null;
    }
  }

  @override
  Future<List<UserProgress>> getProgressForUser(String userId) async {
    await Future.delayed(const Duration(seconds: 2)); // ⏳ Simulierte Wartezeit
    return _progress.where((p) => p.userId == userId).toList();
  }

  @override
  Future<void> updateProgress(UserProgress progress) async {
    await Future.delayed(const Duration(seconds: 2)); // ⏳ Simulierte Wartezeit
    _progress.removeWhere((p) => p.id == progress.id);
    _progress.add(progress);
  }

  @override
  Future<void> deleteProgress(int id) async {
    await Future.delayed(const Duration(seconds: 2)); // ⏳ Simulierte Wartezeit
    _progress.removeWhere((p) => p.id == id);
  }
}
