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
  final int? wordCounts; // Anzahl Wörter in Session
  final int? sessionTime; // Dauer der Session
  final int? amountLearned; // wie viele neu gelernt
  final int? amountCorrect; // wie viele korrekt beantwortet
  final int? sessionPoints; // Punkte
  final DateTime? createdAt;
  final DateTime? updatedAt;

  const UserSession({
    required this.id,
    required this.userId,
    required this.appLanguageId,
    required this.sessionType,
    this.wordLevel,
    this.wordType,
    this.wordCounts,
    this.sessionTime,
    this.amountLearned,
    this.amountCorrect,
    this.sessionPoints,
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
    int? sessionTime,
    int? amountLearned,
    int? amountCorrect,
    int? sessionPoints,
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
      wordCounts: wordCounts ?? this.wordCounts,
      sessionTime: sessionTime ?? this.sessionTime,
      amountLearned: amountLearned ?? this.amountLearned,
      amountCorrect: amountCorrect ?? this.amountCorrect,
      sessionPoints: sessionPoints ?? this.sessionPoints,
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
    'word_counts': wordCounts,
    'session_time': sessionTime,
    'amount_learned': amountLearned,
    'amount_correct': amountCorrect,
    'session_points': sessionPoints,
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
      wordCounts: map['word_counts'] as int?,
      sessionTime: map['session_time'] as int?,
      amountLearned: map['amount_learned'] as int?,
      amountCorrect: map['amount_correct'] as int?,
      sessionPoints: map['session_points'] as int?,
      createdAt: parseDT(map['created_at']),
      updatedAt: parseDT(map['updated_at']),
    );
  }
}
