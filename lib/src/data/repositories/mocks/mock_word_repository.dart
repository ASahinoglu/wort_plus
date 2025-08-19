//mock_word_repository.dart
import '../word_repository.dart';
import '../../models/word.dart';
import '../../models/word_translation.dart';

class MockWordRepository implements WordRepository {
  final List<Word> _words = [];
  final List<WordTranslation> _translations = [];

  // --- Wörter ---
  @override
  Future<void> addWord(Word word) async {
    _words.add(word);
  }

  @override
  Future<Word?> getWordById(int id) async {
    try {
      return _words.firstWhere((w) => w.id == id);
    } catch (e) {
      return null;
    }
  }

  @override
  Future<List<Word>> getAllWords() async => List.unmodifiable(_words);

  @override
  Future<void> updateWord(Word word) async {
    _words.removeWhere((w) => w.id == word.id);
    _words.add(word);
  }

  @override
  Future<void> deleteWord(int id) async {
    _words.removeWhere((w) => w.id == id);
  }

  // --- Übersetzungen ---
  @override
  Future<void> addTranslation(WordTranslation translation) async {
    _translations.add(translation);
  }

  @override
  Future<List<WordTranslation>> getTranslationsForWord(int wordId) async {
    return _translations.where((t) => t.wordId == wordId).toList();
  }

  @override
  Future<void> updateTranslation(WordTranslation translation) async {
    _translations.removeWhere((t) => t.id == translation.id);
    _translations.add(translation);
  }

  @override
  Future<void> deleteTranslation(int id) async {
    _translations.removeWhere((t) => t.id == id);
  }
}
