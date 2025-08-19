//word_repository.dart
import '../models/word.dart';
import '../models/word_translation.dart';

/// Repository für Wörter und Übersetzungen.
abstract class WordRepository {
  // Wörter
  Future<void> addWord(Word word);
  Future<Word?> getWordById(int id);
  Future<List<Word>> getAllWords();
  Future<void> updateWord(Word word);
  Future<void> deleteWord(int id);

  // Übersetzungen
  Future<void> addTranslation(WordTranslation translation);
  Future<List<WordTranslation>> getTranslationsForWord(int wordId);
  Future<void> updateTranslation(WordTranslation translation);
  Future<void> deleteTranslation(int id);
}
