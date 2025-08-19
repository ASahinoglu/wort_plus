// lib/src/data/models/app_user.dart

/// Mappt auf Tabelle `users`.
/// Synchronisiert (Cloud) laut Plan.
class AppUser {
  final String id; // PK (UUID)
  final String authProvider; // z.B. 'google', 'apple', 'email'
  final String authProviderId; // Provider-spezifische ID
  final String? displayName;
  final String? email; // UNIQUE, optional (bei Apple/Anon)
  final String? profilePhoto; // URL
  final DateTime? createdAt; // aus DB (optional)
  final DateTime? updatedAt; // aus DB (optional)

  const AppUser({
    required this.id,
    required this.authProvider,
    required this.authProviderId,
    this.displayName,
    this.email,
    this.profilePhoto,
    this.createdAt,
    this.updatedAt,
  });

  AppUser copyWith({
    String? id,
    String? authProvider,
    String? authProviderId,
    String? displayName,
    String? email,
    String? profilePhoto,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return AppUser(
      id: id ?? this.id,
      authProvider: authProvider ?? this.authProvider,
      authProviderId: authProviderId ?? this.authProviderId,
      displayName: displayName ?? this.displayName,
      email: email ?? this.email,
      profilePhoto: profilePhoto ?? this.profilePhoto,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  /// Für SQLite/REST – speichert Timestamps als ISO8601 String.
  Map<String, dynamic> toMap() => {
    'id': id,
    'auth_provider': authProvider,
    'auth_provider_id': authProviderId,
    'display_name': displayName,
    'email': email,
    'profile_photo': profilePhoto,
    'created_at': createdAt?.toIso8601String(),
    'updated_at': updatedAt?.toIso8601String(),
  };

  factory AppUser.fromMap(Map<String, dynamic> map) {
    DateTime? parseDT(dynamic v) =>
        v == null ? null : DateTime.tryParse(v.toString());
    return AppUser(
      id: map['id'] as String,
      authProvider: map['auth_provider'] as String,
      authProviderId: map['auth_provider_id'] as String,
      displayName: map['display_name'] as String?,
      email: map['email'] as String?,
      profilePhoto: map['profile_photo'] as String?,
      createdAt: parseDT(map['created_at']),
      updatedAt: parseDT(map['updated_at']),
    );
  }
}
