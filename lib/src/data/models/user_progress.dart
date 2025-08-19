// lib/src/data/models/user_progress.dart

/// Mappt auf Tabelle `user_progress`.
/// Speichert Lernstatus eines Users für ein bestimmtes Wort.
/// Synchronisiert (Cloud) laut Plan.
class UserProgress {
  final int id; // PK (UUID)
  final String userId; // FK -> users.id
  final int wordTransId; // FK -> word_trans.id
  final int appLanguageId; // FK -> languages.id
  final bool learned; // ob Wort gelernt wurde
  final int timesRepeated; // Wiederholungen
  final int timesWrong; // Fehler
  final bool correct; // ob zuletzt korrekt beantwortet
  final int timesShown; // wie oft gezeigt
  final DateTime? createdAt;
  final DateTime? updatedAt;

  const UserProgress({
    required this.id,
    required this.userId,
    required this.wordTransId,
    required this.appLanguageId,
    this.learned = false,
    this.timesRepeated = 0,
    this.timesWrong = 0,
    this.correct = false,
    this.timesShown = 0,
    this.createdAt,
    this.updatedAt,
  });

  UserProgress copyWith({
    int? id,
    String? userId,
    int? wordTransId,
    int? appLanguageId,
    bool? learned,
    int? timesRepeated,
    int? timesWrong,
    bool? correct,
    int? timesShown,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return UserProgress(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      wordTransId: wordTransId ?? this.wordTransId,
      appLanguageId: appLanguageId ?? this.appLanguageId,
      learned: learned ?? this.learned,
      timesRepeated: timesRepeated ?? this.timesRepeated,
      timesWrong: timesWrong ?? this.timesWrong,
      correct: correct ?? this.correct,
      timesShown: timesShown ?? this.timesShown,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  Map<String, dynamic> toMap() => {
    'id': id,
    'user_id': userId,
    'word_trans_id': wordTransId,
    'app_language_id': appLanguageId,
    'learned': learned ? 1 : 0,
    'times_repeated': timesRepeated,
    'times_wrong': timesWrong,
    'correct': correct ? 1 : 0,
    'times_shown': timesShown,
    'created_at': createdAt?.toIso8601String(),
    'updated_at': updatedAt?.toIso8601String(),
  };

  factory UserProgress.fromMap(Map<String, dynamic> map) {
    DateTime? parseDT(dynamic v) =>
        v == null ? null : DateTime.tryParse(v.toString());
    return UserProgress(
      id: map['id'] as int,
      userId: map['user_id'] as String,
      wordTransId: map['word_trans_id'] as int,
      appLanguageId: map['app_language_id'] as int,
      learned: (map['learned'] as int? ?? 0) == 1,
      timesRepeated: map['times_repeated'] as int? ?? 0,
      timesWrong: map['times_wrong'] as int? ?? 0,
      correct: (map['correct'] as int? ?? 0) == 1,
      timesShown: map['times_shown'] as int? ?? 0,
      createdAt: parseDT(map['created_at']),
      updatedAt: parseDT(map['updated_at']),
    );
  }
}
