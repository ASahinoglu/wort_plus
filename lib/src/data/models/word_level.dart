// lib/src/data/models/word_level.dart

/// Mappt auf Tabelle `word_levels`.
/// Enthält die Basis-Info zu einem Wortniveau (z. B. "A1").
/// Bleibt lokal gespeichert.
class WordLevel {
  final int id; // PK
  final String levelCode; // z. B. "A1", "B2"
  final DateTime? createdAt;
  final DateTime? updatedAt;

  const WordLevel({
    required this.id,
    required this.levelCode,
    this.createdAt,
    this.updatedAt,
  });

  WordLevel copyWith({
    int? id,
    String? levelCode,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return WordLevel(
      id: id ?? this.id,
      levelCode: levelCode ?? this.levelCode,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  Map<String, dynamic> toMap() => {
    'id': id,
    'level_code': levelCode,
    'created_at': createdAt?.toIso8601String(),
    'updated_at': updatedAt?.toIso8601String(),
  };

  factory WordLevel.fromMap(Map<String, dynamic> map) {
    DateTime? parseDT(dynamic v) =>
        v == null ? null : DateTime.tryParse(v.toString());
    return WordLevel(
      id: map['id'] as int,
      levelCode: map['level_code'] as String,
      createdAt: parseDT(map['created_at']),
      updatedAt: parseDT(map['updated_at']),
    );
  }
}
