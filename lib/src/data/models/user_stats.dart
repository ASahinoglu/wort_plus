// lib/src/data/models/user_stats.dart

/// Mappt auf Tabelle `user_stats`.
/// Enthält globale Statistiken pro User.
/// Synchronisiert (Cloud) laut Plan.
class UserStats {
  final String id; // PK (UUID)
  final String userId; // FK -> users.id
  final int totalPoints;
  final int diamonds;
  final int totalTime; // Sekunden
  final int streak; // aktueller Streak
  final int streakMax; // längster Streak
  final int hearts;
  final DateTime? lastActivity;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  const UserStats({
    required this.id,
    required this.userId,
    this.totalPoints = 0,
    this.diamonds = 0,
    this.totalTime = 0,
    this.streak = 0,
    this.streakMax = 0,
    this.hearts = 0,
    this.lastActivity,
    this.createdAt,
    this.updatedAt,
  });

  UserStats copyWith({
    String? id,
    String? userId,
    int? totalPoints,
    int? diamonds,
    int? totalTime,
    int? streak,
    int? streakMax,
    int? hearts,
    DateTime? lastActivity,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return UserStats(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      totalPoints: totalPoints ?? this.totalPoints,
      diamonds: diamonds ?? this.diamonds,
      totalTime: totalTime ?? this.totalTime,
      streak: streak ?? this.streak,
      streakMax: streakMax ?? this.streakMax,
      hearts: hearts ?? this.hearts,
      lastActivity: lastActivity ?? this.lastActivity,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  Map<String, dynamic> toMap() => {
    'id': id,
    'user_id': userId,
    'total_points': totalPoints,
    'diamonds': diamonds,
    'total_time': totalTime,
    'streak': streak,
    'streak_max': streakMax,
    'hearts': hearts,
    'last_activity': lastActivity?.toIso8601String(),
    'created_at': createdAt?.toIso8601String(),
    'updated_at': updatedAt?.toIso8601String(),
  };

  factory UserStats.fromMap(Map<String, dynamic> map) {
    DateTime? parseDT(dynamic v) =>
        v == null ? null : DateTime.tryParse(v.toString());
    return UserStats(
      id: map['id'] as String,
      userId: map['user_id'] as String,
      totalPoints: map['total_points'] as int? ?? 0,
      diamonds: map['diamonds'] as int? ?? 0,
      totalTime: map['total_time'] as int? ?? 0,
      streak: map['streak'] as int? ?? 0,
      streakMax: map['streak_max'] as int? ?? 0,
      hearts: map['hearts'] as int? ?? 0,
      lastActivity: parseDT(map['last_activity']),
      createdAt: parseDT(map['created_at']),
      updatedAt: parseDT(map['updated_at']),
    );
  }
}
