// lib/src/data/models/user_session.dart

/// Mappt auf Tabelle `user_sessions`.
/// Speichert eine abgeschlossene Session (z. B. Quiz, Lernen).
/// Synchronisiert (Cloud) laut Plan.
class UserSession {
  final int id; // PK (UUID)
  final String userId; // FK -> users.id
  final int appLanguageId; // FK -> languages.id
  final String sessionType; // z. B. "quiz", "learn"
  final String? wordLevel; // optional (z. B. "A1")
  final String? wordType; // optional (z. B. "verb")
  final int? numWords; // Anzahl Wörter in Session
  final int? durationSeconds; // Dauer der Session
  final int? amountLearned; // wie viele neu gelernt
  final int? amountCorrect; // wie viele korrekt beantwortet
  final int? totalPoints; // Punkte
  final DateTime? createdAt;
  final DateTime? updatedAt;

  const UserSession({
    required this.id,
    required this.userId,
    required this.appLanguageId,
    required this.sessionType,
    this.wordLevel,
    this.wordType,
    this.numWords,
    this.durationSeconds,
    this.amountLearned,
    this.amountCorrect,
    this.totalPoints,
    this.createdAt,
    this.updatedAt,
  });

  UserSession copyWith({
    int? id,
    String? userId,
    int? appLanguageId,
    String? sessionType,
    String? wordLevel,
    String? wordType,
    int? numWords,
    int? durationSeconds,
    int? amountLearned,
    int? amountCorrect,
    int? totalPoints,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return UserSession(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      appLanguageId: appLanguageId ?? this.appLanguageId,
      sessionType: sessionType ?? this.sessionType,
      wordLevel: wordLevel ?? this.wordLevel,
      wordType: wordType ?? this.wordType,
      numWords: numWords ?? this.numWords,
      durationSeconds: durationSeconds ?? this.durationSeconds,
      amountLearned: amountLearned ?? this.amountLearned,
      amountCorrect: amountCorrect ?? this.amountCorrect,
      totalPoints: totalPoints ?? this.totalPoints,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  Map<String, dynamic> toMap() => {
    'id': id,
    'user_id': userId,
    'app_language_id': appLanguageId,
    'session_type': sessionType,
    'word_level': wordLevel,
    'word_type': wordType,
    'num_words': numWords,
    'duration_seconds': durationSeconds,
    'amount_learned': amountLearned,
    'amount_correct': amountCorrect,
    'total_points': totalPoints,
    'created_at': createdAt?.toIso8601String(),
    'updated_at': updatedAt?.toIso8601String(),
  };

  factory UserSession.fromMap(Map<String, dynamic> map) {
    DateTime? parseDT(dynamic v) =>
        v == null ? null : DateTime.tryParse(v.toString());
    return UserSession(
      id: map['id'] as int,
      userId: map['user_id'] as String,
      appLanguageId: map['app_language_id'] as int,
      sessionType: map['session_type'] as String,
      wordLevel: map['word_level'] as String?,
      wordType: map['word_type'] as String?,
      numWords: map['num_words'] as int?,
      durationSeconds: map['duration_seconds'] as int?,
      amountLearned: map['amount_learned'] as int?,
      amountCorrect: map['amount_correct'] as int?,
      totalPoints: map['total_points'] as int?,
      createdAt: parseDT(map['created_at']),
      updatedAt: parseDT(map['updated_at']),
    );
  }
}
