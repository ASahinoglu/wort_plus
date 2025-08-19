//mock_stats_repository.dart
import '../stats_repository.dart';
import '../../models/user_stats.dart';
import '../../models/user_stats_detail.dart';

class MockStatsRepository implements StatsRepository {
  final List<UserStats> _stats = [];
  final List<UserStatsDetail> _details = [];

  @override
  Future<UserStats?> getUserStats(String userId) async {
    try {
      return _stats.firstWhere((s) => s.userId == userId);
    } catch (e) {
      return null;
    }
  }

  @override
  Future<List<UserStatsDetail>> getUserStatsDetails(String userId) async {
    return _details.where((d) => d.userId == userId).toList();
  }

  @override
  Future<void> saveUserStats(UserStats stats) async {
    _stats.removeWhere((s) => s.userId == stats.userId);
    _stats.add(stats);
  }

  @override
  Future<void> saveUserStatsDetail(UserStatsDetail detail) async {
    _details.removeWhere(
      (d) =>
          d.userId == detail.userId &&
          d.targetLanguageId == detail.targetLanguageId &&
          d.wordLevel == detail.wordLevel,
    );
    _details.add(detail);
  }
}
