//progress_repository.dart
import '../models/user_progress.dart';

/// Repository für Lernfortschritt.
abstract class ProgressRepository {
  Future<void> addProgress(UserProgress progress);
  Future<UserProgress?> getProgressById(int id);
  Future<List<UserProgress>> getProgressForUser(String userId);
  Future<void> updateProgress(UserProgress progress);
  Future<void> deleteProgress(int id);
}
