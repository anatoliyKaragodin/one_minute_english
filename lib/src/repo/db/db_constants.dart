class DbConstants {
  static const databaseName = "words_database.db";
  static const databaseVersion = 1;

  /// English words table
  static const table = 'words';
  static const columnId = 'id';
  static const columnName = 'word';
  static const columnPronunciation = 'transcription';
  static const columnLevel = 'level';
  static const columnCategory = 'theme';
  static const columnIsLearned = 'is_learned';
  static const columnIsRepeating = 'is_repeating';
  static const columnIsDifficult = 'is_difficult';
  static const columnRepeatingCount = 'repeating_count';
  static const columnReadyToLearn = 'ready_to_learn';


  /// Translations table
  static const tableTranslations = 'translations';
  static const columnTranslation = 'translation';
  static const columnLanguage = 'language';
  static const columnEnglishId = 'english_id';
}