//mock_progress_repository.dart
import '../progress_repository.dart';
import '../../models/user_progress.dart';

class MockProgressRepository implements ProgressRepository {
  final List<UserProgress> _progress = [];

  @override
  Future<void> addProgress(UserProgress progress) async {
    _progress.add(progress);
  }

  @override
  Future<UserProgress?> getProgressById(int id) async {
    try {
      return _progress.firstWhere((p) => p.id == id);
    } catch (e) {
      return null;
    }
  }

  @override
  Future<List<UserProgress>> getProgressForUser(String userId) async {
    return _progress.where((p) => p.userId == userId).toList();
  }

  @override
  Future<void> updateProgress(UserProgress progress) async {
    _progress.removeWhere((p) => p.id == progress.id);
    _progress.add(progress);
  }

  @override
  Future<void> deleteProgress(int id) async {
    _progress.removeWhere((p) => p.id == id);
  }
}
