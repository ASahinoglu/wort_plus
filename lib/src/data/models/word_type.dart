// lib/src/data/models/word_type.dart

/// Mappt auf Tabelle `word_types`.
/// Enthält die Basis-Info zu einer Wortart (z. B. "noun").
/// Bleibt lokal gespeichert (nicht synchronisiert), da es Teil der statischen Daten ist.
class WordType {
  final int id; // PK
  final String typeCode; // z. B. "noun", "verb"
  final DateTime? createdAt;
  final DateTime? updatedAt;

  const WordType({
    required this.id,
    required this.typeCode,
    this.createdAt,
    this.updatedAt,
  });

  WordType copyWith({
    int? id,
    String? typeCode,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return WordType(
      id: id ?? this.id,
      typeCode: typeCode ?? this.typeCode,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  Map<String, dynamic> toMap() => {
    'id': id,
    'type_code': typeCode,
    'created_at': createdAt?.toIso8601String(),
    'updated_at': updatedAt?.toIso8601String(),
  };

  factory WordType.fromMap(Map<String, dynamic> map) {
    DateTime? parseDT(dynamic v) =>
        v == null ? null : DateTime.tryParse(v.toString());
    return WordType(
      id: map['id'] as int,
      typeCode: map['type_code'] as String,
      createdAt: parseDT(map['created_at']),
      updatedAt: parseDT(map['updated_at']),
    );
  }
}
