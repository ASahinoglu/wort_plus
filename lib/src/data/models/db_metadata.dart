// lib/src/data/models/db_metadata.dart

/// Mappt auf Tabelle `db_metadata`.
/// Wird primär für die Datenbank-Migration und Versionskontrolle genutzt.
/// Bleibt lokal und wird nicht synchronisiert.
class DbMetadata {
  final int id;
  final int schemaVersion;
  final int dataVersion;
  final DateTime? updatedAt;

  const DbMetadata({
    required this.id,
    required this.schemaVersion,
    required this.dataVersion,
    this.updatedAt,
  });

  DbMetadata copyWith({
    int? id,
    int? schemaVersion,
    int? dataVersion,
    DateTime? updatedAt,
  }) {
    return DbMetadata(
      id: id ?? this.id,
      schemaVersion: schemaVersion ?? this.schemaVersion,
      dataVersion: dataVersion ?? this.dataVersion,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  Map<String, dynamic> toMap() => {
    'id': id,
    'schema_version': schemaVersion,
    'data_version': dataVersion,
    'updated_at': updatedAt?.toIso8601String(),
  };

  factory DbMetadata.fromMap(Map<String, dynamic> map) {
    DateTime? parseDT(dynamic v) =>
        v == null ? null : DateTime.tryParse(v.toString());
    return DbMetadata(
      id: map['id'] as int,
      schemaVersion: map['schema_version'] as int,
      dataVersion: map['data_version'] as int,
      updatedAt: parseDT(map['updated_at']),
    );
  }
}
