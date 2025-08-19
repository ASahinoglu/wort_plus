// lib/src/data/models/word_translation.dart

/// Repräsentiert die Tabelle `word_trans`.
/// Enthält die Übersetzungen eines Basis-Wortes in einer bestimmten Sprache.
/// Diese Tabelle ist groß und bleibt lokal gespeichert.
/// Über `user_progress` wird der Lernstatus pro User verwaltet.
class WordTranslation {
  final int id; // PK
  final int wordId; // FK -> words.id
  final int languageId; // FK -> languages.id
  final String? baseWord; // z. B. "Haus"
  final String? article; // z. B. "das" (optional für DE)
  final String? plural; // Pluralform
  final String? exampleSentence; // Beispielsatz
  final String? participle2; // Für Verben (Partizip II)
  final String? conjugation; // JSON oder String mit Konjugationen
  final String? notes; // Zusatzinfos
  final DateTime? createdAt;
  final DateTime? updatedAt;

  const WordTranslation({
    required this.id,
    required this.wordId,
    required this.languageId,
    this.baseWord,
    this.article,
    this.plural,
    this.exampleSentence,
    this.participle2,
    this.conjugation,
    this.notes,
    this.createdAt,
    this.updatedAt,
  });

  WordTranslation copyWith({
    int? id,
    int? wordId,
    int? languageId,
    String? baseWord,
    String? article,
    String? plural,
    String? exampleSentence,
    String? participle2,
    String? conjugation,
    String? notes,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return WordTranslation(
      id: id ?? this.id,
      wordId: wordId ?? this.wordId,
      languageId: languageId ?? this.languageId,
      baseWord: baseWord ?? this.baseWord,
      article: article ?? this.article,
      plural: plural ?? this.plural,
      exampleSentence: exampleSentence ?? this.exampleSentence,
      participle2: participle2 ?? this.participle2,
      conjugation: conjugation ?? this.conjugation,
      notes: notes ?? this.notes,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  Map<String, dynamic> toMap() => {
    'id': id,
    'word_id': wordId,
    'language_id': languageId,
    'base_word': baseWord,
    'article': article,
    'plural': plural,
    'example_sentence': exampleSentence,
    'participle2': participle2,
    'conjugation': conjugation,
    'notes': notes,
    'created_at': createdAt?.toIso8601String(),
    'updated_at': updatedAt?.toIso8601String(),
  };

  factory WordTranslation.fromMap(Map<String, dynamic> map) {
    DateTime? parseDT(dynamic v) =>
        v == null ? null : DateTime.tryParse(v.toString());
    return WordTranslation(
      id: map['id'] as int,
      wordId: map['word_id'] as int,
      languageId: map['language_id'] as int,
      baseWord: map['base_word'] as String?,
      article: map['article'] as String?,
      plural: map['plural'] as String?,
      exampleSentence: map['example_sentence'] as String?,
      participle2: map['participle2'] as String?,
      conjugation: map['conjugation'] as String?,
      notes: map['notes'] as String?,
      createdAt: parseDT(map['created_at']),
      updatedAt: parseDT(map['updated_at']),
    );
  }
}
