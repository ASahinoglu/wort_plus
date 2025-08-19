//stats_repository.dart
import '../models/user_stats.dart';
import '../models/user_stats_detail.dart';

/// Repository für Statistik-Daten.
abstract class StatsRepository {
  Future<UserStats?> getUserStats(String userId);
  Future<List<UserStatsDetail>> getUserStatsDetails(String userId);

  Future<void> saveUserStats(UserStats stats);
  Future<void> saveUserStatsDetail(UserStatsDetail detail);
}
