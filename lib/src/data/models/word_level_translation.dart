// lib/src/data/models/word_level_translation.dart

/// Mappt auf Tabelle `word_levels_trans`.
/// Enthält die Übersetzungen und Beschreibungen für ein Wortniveau.
/// Bleibt lokal gespeichert.
class WordLevelTranslation {
  final int id; // PK
  final int levelId; // FK -> word_levels.id
  final int languageId; // FK -> languages.id
  final String? levelLabel; //A1 (Anfänger) A2 (Beginner) B1... title
  final String? levelDesc; // description, subtitle
  final DateTime? createdAt;
  final DateTime? updatedAt;

  const WordLevelTranslation({
    required this.id,
    required this.levelId,
    required this.languageId,
    this.levelLabel,
    this.levelDesc,
    this.createdAt,
    this.updatedAt,
  });

  WordLevelTranslation copyWith({
    int? id,
    int? levelId,
    int? languageId,
    String? levelLabel,
    String? levelDesc,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return WordLevelTranslation(
      id: id ?? this.id,
      levelId: levelId ?? this.levelId,
      languageId: languageId ?? this.languageId,
      levelLabel: levelLabel ?? this.levelLabel,
      levelDesc: levelDesc ?? this.levelDesc,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  Map<String, dynamic> toMap() => {
    'id': id,
    'level_id': levelId,
    'language_id': languageId,
    'level_label': levelLabel,
    'level_desc': levelDesc,
    'created_at': createdAt?.toIso8601String(),
    'updated_at': updatedAt?.toIso8601String(),
  };

  factory WordLevelTranslation.fromMap(Map<String, dynamic> map) {
    DateTime? parseDT(dynamic v) =>
        v == null ? null : DateTime.tryParse(v.toString());
    return WordLevelTranslation(
      id: map['id'] as int,
      levelId: map['level_id'] as int,
      languageId: map['language_id'] as int,
      levelLabel: map['level_label'] as String?,
      levelDesc: map['level_desc'] as String?,
      createdAt: parseDT(map['created_at']),
      updatedAt: parseDT(map['updated_at']),
    );
  }
}
