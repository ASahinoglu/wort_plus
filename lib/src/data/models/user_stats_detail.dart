// lib/src/data/models/user_stats_detail.dart

/// Mappt auf Tabelle `user_stats_details`.
/// Enthält Statistiken pro Sprache + Level.
/// Synchronisiert (Cloud) laut Plan.
class UserStatsDetail {
  final String id; // PK (UUID)
  final String userId; // FK -> users.id
  final int targetLanguageId; // FK -> languages.id
  final String? wordLevel; // z.B. "A1", "A2"
  final int points;
  final int learnedWords;
  final DateTime? lastActivity;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  const UserStatsDetail({
    required this.id,
    required this.userId,
    required this.targetLanguageId,
    this.wordLevel,
    this.points = 0,
    this.learnedWords = 0,
    this.lastActivity,
    this.createdAt,
    this.updatedAt,
  });

  UserStatsDetail copyWith({
    String? id,
    String? userId,
    int? targetLanguageId,
    String? wordLevel,
    int? points,
    int? learnedWords,
    DateTime? lastActivity,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return UserStatsDetail(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      targetLanguageId: targetLanguageId ?? this.targetLanguageId,
      wordLevel: wordLevel ?? this.wordLevel,
      points: points ?? this.points,
      learnedWords: learnedWords ?? this.learnedWords,
      lastActivity: lastActivity ?? this.lastActivity,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  Map<String, dynamic> toMap() => {
    'id': id,
    'user_id': userId,
    'target_language_id': targetLanguageId,
    'word_level': wordLevel,
    'points': points,
    'learned_words': learnedWords,
    'last_activity': lastActivity?.toIso8601String(),
    'created_at': createdAt?.toIso8601String(),
    'updated_at': updatedAt?.toIso8601String(),
  };

  factory UserStatsDetail.fromMap(Map<String, dynamic> map) {
    DateTime? parseDT(dynamic v) =>
        v == null ? null : DateTime.tryParse(v.toString());
    return UserStatsDetail(
      id: map['id'] as String,
      userId: map['user_id'] as String,
      targetLanguageId: map['target_language_id'] as int,
      wordLevel: map['word_level'] as String?,
      points: map['points'] as int? ?? 0,
      learnedWords: map['learned_words'] as int? ?? 0,
      lastActivity: parseDT(map['last_activity']),
      createdAt: parseDT(map['created_at']),
      updatedAt: parseDT(map['updated_at']),
    );
  }
}
