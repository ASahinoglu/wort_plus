// lib/src/data/models/word.dart

/// Repräsentiert die Tabelle `words`.
/// Hält die Basis-Info zu einem Wort (ohne Übersetzungen).
/// Nicht direkt synchronisiert (bleibt lokal, da große Datenmenge).
class Word {
  final int id; // PK
  final int wordTypeId; // FK -> word_types.id
  final int wordLevelId; // FK -> word_levels.id
  final String? definition; // kurze Definition oder Meta
  final DateTime? createdAt;
  final DateTime? updatedAt;

  const Word({
    required this.id,
    required this.wordTypeId,
    required this.wordLevelId,
    this.definition,
    this.createdAt,
    this.updatedAt,
  });

  Word copyWith({
    int? id,
    int? wordTypeId,
    int? wordLevelId,
    String? definition,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return Word(
      id: id ?? this.id,
      wordTypeId: wordTypeId ?? this.wordTypeId,
      wordLevelId: wordLevelId ?? this.wordLevelId,
      definition: definition ?? this.definition,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  Map<String, dynamic> toMap() => {
    'id': id,
    'word_type_id': wordTypeId,
    'word_level_id': wordLevelId,
    'definition': definition,
    'created_at': createdAt?.toIso8601String(),
    'updated_at': updatedAt?.toIso8601String(),
  };

  factory Word.fromMap(Map<String, dynamic> map) {
    DateTime? parseDT(dynamic v) =>
        v == null ? null : DateTime.tryParse(v.toString());
    return Word(
      id: map['id'] as int,
      wordTypeId: map['word_type_id'] as int,
      wordLevelId: map['word_level_id'] as int,
      definition: map['definition'] as String?,
      createdAt: parseDT(map['created_at']),
      updatedAt: parseDT(map['updated_at']),
    );
  }
}
