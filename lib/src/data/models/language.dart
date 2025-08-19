// lib/src/data/models/language.dart

/// Mappt auf Tabelle `languages`.
/// Hält alle verfügbaren Sprachen für App & Wörter.
/// Synchronisiert (Cloud).
class Language {
  final int id; // PK (Auto-Increment)
  final String name; // Anzeigename (z. B. "English")
  final String isoCode; // ISO-Code (z. B. "en", "de", "es")
  final DateTime? createdAt;
  final DateTime? updatedAt;

  const Language({
    required this.id,
    required this.name,
    required this.isoCode,
    this.createdAt,
    this.updatedAt,
  });

  Language copyWith({
    int? id,
    String? name,
    String? isoCode,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return Language(
      id: id ?? this.id,
      name: name ?? this.name,
      isoCode: isoCode ?? this.isoCode,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  Map<String, dynamic> toMap() => {
    'id': id,
    'name': name,
    'iso_code': isoCode,
    'created_at': createdAt?.toIso8601String(),
    'updated_at': updatedAt?.toIso8601String(),
  };

  factory Language.fromMap(Map<String, dynamic> map) {
    DateTime? parseDT(dynamic v) =>
        v == null ? null : DateTime.tryParse(v.toString());
    return Language(
      id: map['id'] as int,
      name: map['name'] as String,
      isoCode: map['iso_code'] as String,
      createdAt: parseDT(map['created_at']),
      updatedAt: parseDT(map['updated_at']),
    );
  }
}
