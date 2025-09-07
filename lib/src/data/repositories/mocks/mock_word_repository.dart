// mock_word_repository.dart
import '../word_repository.dart';
import '../../models/word.dart';
import '../../models/word_translation.dart';

class MockWordRepository implements WordRepository {
  final List<Word> _words = [];
  final List<WordTranslation> _translations = [];

  // --- Wörter ---
  @override
  Future<void> addWord(Word word) async {
    await Future.delayed(const Duration(seconds: 1));
    _words.add(word);
  }

  @override
  Future<Word?> getWordById(int id) async {
    await Future.delayed(const Duration(seconds: 1));
    try {
      return _words.firstWhere((w) => w.id == id);
    } catch (e) {
      return null;
    }
  }

  @override
  Future<List<Word>> getAllWords() async {
    await Future.delayed(const Duration(seconds: 1));
    return List.unmodifiable(_words);
  }

  @override
  Future<void> updateWord(Word word) async {
    await Future.delayed(const Duration(seconds: 1));
    _words.removeWhere((w) => w.id == word.id);
    _words.add(word);
  }

  @override
  Future<void> deleteWord(int id) async {
    await Future.delayed(const Duration(seconds: 1));
    _words.removeWhere((w) => w.id == id);
  }

  // --- Übersetzungen ---
  @override
  Future<void> addTranslation(WordTranslation translation) async {
    await Future.delayed(const Duration(seconds: 1));
    _translations.add(translation);
  }

  @override
  Future<List<WordTranslation>> getTranslationsForWord(int wordId) async {
    await Future.delayed(const Duration(seconds: 1));
    return _translations.where((t) => t.wordId == wordId).toList();
  }

  @override
  Future<void> updateTranslation(WordTranslation translation) async {
    await Future.delayed(const Duration(seconds: 1));
    _translations.removeWhere((t) => t.id == translation.id);
    _translations.add(translation);
  }

  @override
  Future<void> deleteTranslation(int id) async {
    await Future.delayed(const Duration(seconds: 1));
    _translations.removeWhere((t) => t.id == id);
  }

  // --- Nicht im Interface, nur intern ---
  Future<List<WordTranslation>> getAllTranslations() async {
    await Future.delayed(const Duration(seconds: 1));
    return List.unmodifiable(_translations);
  }

  void initMockData() {
    for (int i = 1; i <= 60; i++) {
      // Wörter
      _words.add(
        Word(id: i, wordLevelId: 1, wordTypeId: 1, definition: 'Word $i'),
      );

      // Übersetzungen für jede Karte
      _translations.addAll([
        // Foreign Word (Target Language, z.B. Deutsch)
        WordTranslation(
          id: i * 2 - 1,
          wordId: i,
          languageId: 2,
          baseWord: 'Wort $i',
          exampleSentence: 'Beispielsatz $i auf Deutsch',
        ),
        // Native Word (App Language, z.B. Englisch)
        WordTranslation(
          id: i * 2,
          wordId: i,
          languageId: 1,
          baseWord: 'Word $i',
          exampleSentence: 'Example sentence $i in English',
        ),
      ]);
    }
  }
}
