// lib/src/data/models/word_type_translation.dart

/// Mappt auf Tabelle `word_type_trans`.
/// Enthält die Übersetzungen für eine Wortart (z. B. "Nomen" für "noun").
/// Bleibt lokal gespeichert.
class WordTypeTranslation {
  final int id; // PK
  final int wordTypeId; // FK -> word_types.id
  final int languageId; // FK -> languages.id
  final String transName; // z. B. "Nomen" für Deutsch
  final DateTime? createdAt;
  final DateTime? updatedAt;

  const WordTypeTranslation({
    required this.id,
    required this.wordTypeId,
    required this.languageId,
    required this.transName,
    this.createdAt,
    this.updatedAt,
  });

  WordTypeTranslation copyWith({
    int? id,
    int? wordTypeId,
    int? languageId,
    String? transName,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return WordTypeTranslation(
      id: id ?? this.id,
      wordTypeId: wordTypeId ?? this.wordTypeId,
      languageId: languageId ?? this.languageId,
      transName: transName ?? this.transName,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  Map<String, dynamic> toMap() => {
    'id': id,
    'word_type_id': wordTypeId,
    'language_id': languageId,
    'trans_name': transName,
    'created_at': createdAt?.toIso8601String(),
    'updated_at': updatedAt?.toIso8601String(),
  };

  factory WordTypeTranslation.fromMap(Map<String, dynamic> map) {
    DateTime? parseDT(dynamic v) =>
        v == null ? null : DateTime.tryParse(v.toString());
    return WordTypeTranslation(
      id: map['id'] as int,
      wordTypeId: map['word_type_id'] as int,
      languageId: map['language_id'] as int,
      transName: map['trans_name'] as String,
      createdAt: parseDT(map['created_at']),
      updatedAt: parseDT(map['updated_at']),
    );
  }
}
