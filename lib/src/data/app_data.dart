class AppData {
  static String targetLanguageCode = 'de';

  static int streakDays = 7;
  static bool isTodayStreakActive = false;

  static int diamonds = 500;

  static int hearts = 2;
  static const int maxHearts = 5;

  // Temporäre Methoden für Veränderung
  static void changeLanguage(String code) {
    targetLanguageCode = code;
  }

  static void incrementStreak() {
    streakDays++;
    isTodayStreakActive = true;
  }

  static void resetStreak() {
    streakDays = 0;
    isTodayStreakActive = false;
  }

  static void addDiamonds(int amount) {
    diamonds += amount;
  }

  static void spendDiamonds(int amount) {
    if (diamonds >= amount) {
      diamonds -= amount;
    }
  }

  static void loseHeart() {
    if (hearts > 0) {
      hearts--;
    }
  }

  static void gainHeart() {
    if (hearts < maxHearts) {
      hearts++;
    }
  }
}
