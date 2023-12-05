import 'dart:io';
import 'package:csv/csv.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:one_minute_english/src/repo/db/db_constants.dart';
import 'package:one_minute_english/src/repo/model/word.dart';
import 'package:one_minute_english/src/utils/my_colors.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';

class DatabaseHelper {
  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDatabase();
    return _database!;
  }

  /// INIT DB
  _initDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, DbConstants.databaseName);
    return await openDatabase(path,
        version: DbConstants.databaseVersion, onCreate: _onCreate);
  }

  ///

  /// ON CREATE
  Future _onCreate(Database db, int version) async {
    // ENGLISH WORDS
    await db.execute('''
      CREATE TABLE ${DbConstants.table} (
        ${DbConstants.columnId} INTEGER PRIMARY KEY,
        ${DbConstants.columnName} TEXT NOT NULL,
        ${DbConstants.columnPronunciation} TEXT NOT NULL,
        ${DbConstants.columnLevel} TEXT NOT NULL,
        ${DbConstants.columnCategory} TEXT NOT NULL,
        ${DbConstants.columnIsLearned} BOOLEAN NOT NULL,
        ${DbConstants.columnIsRepeating} BOOLEAN NOT NULL,
        ${DbConstants.columnIsDifficult} BOOLEAN NOT NULL,
        ${DbConstants.columnReadyToLearn} BOOLEAN NOT NULL,
        ${DbConstants.columnRepeatingCount} INTEGER NO NULL
      )
    ''');
    //
    // TRANSLATIONS
    await db.execute('''
      CREATE TABLE ${DbConstants.tableTranslations} (
        ${DbConstants.columnId} INTEGER PRIMARY KEY,
        ${DbConstants.columnTranslation} TEXT NOT NULL,
        ${DbConstants.columnLanguage} TEXT NOT NULL,
        ${DbConstants.columnEnglishId} INTEGER NOT NULL
      )
    ''');
    //
    await _addWordsToWordsTable(db);

    await _addTranslationsToTranslationsTable(db);
  }

  ///
  /// ADD WORDS
  Future<void> _addWordsToWordsTable(Database db) async {
    // Read and insert data from the CSV file
    final String csvString =
        await rootBundle.loadString('assets/for_db/text_for_db/words.csv');

    List<List<dynamic>> csvTable =
        const CsvToListConverter().convert(csvString, fieldDelimiter: ':');
    // debugPrint('cvsTable: $csvTable');

    Batch batch = db.batch();
    for (var row in csvTable) {
      batch.insert(DbConstants.table, {
        DbConstants.columnName: row[1],
        DbConstants.columnPronunciation: row[2],
        DbConstants.columnCategory: row[3],
        DbConstants.columnLevel: row[4],
        DbConstants.columnIsLearned: 0,
        DbConstants.columnIsRepeating: 0,
        DbConstants.columnIsDifficult: 0,
        DbConstants.columnReadyToLearn: 1,
        DbConstants.columnRepeatingCount: 0
      });
    }
    await batch.commit();
  }

  ///
  /// ADD TRANSLATIONS
  Future<void> _addTranslationsToTranslationsTable(Database db) async {
    final String csvStringTranslations = await rootBundle
        .loadString('assets/for_db/text_for_db/translations.csv');

    List<List<dynamic>> csvTableTranslations = const CsvToListConverter()
        .convert(csvStringTranslations, fieldDelimiter: ':');

    Batch batch = db.batch();

    for (var row in csvTableTranslations) {
      batch.insert(DbConstants.tableTranslations, {
        DbConstants.columnTranslation: row[1], // Name
        DbConstants.columnLanguage: row[2], // Pronunciation
        DbConstants.columnEnglishId: row[3], // Level
      });
    }
    await batch.commit();
  }

  ///
  /// GET WORDS BY THEME
  Future<List<Word>> getWordsByTheme(
      {required String theme, required String language}) async {
    final db = await database;
    var words = <Word>[];
    var englishWords = await db.query(DbConstants.table,
        where: '${DbConstants.columnCategory} = ? AND ${DbConstants.columnReadyToLearn} = ?',
        whereArgs: [theme, 1]);
    var translationWords = await db.query(DbConstants.tableTranslations,
        where: '${DbConstants.columnLanguage} = ?', whereArgs: [language]);

    for (var englishWord in englishWords) {
      var englishId = englishWord[DbConstants.columnId] as int;

      var translationWord = translationWords.firstWhere(
          (element) => element[DbConstants.columnEnglishId] == englishId);
      var wordString = englishWord[DbConstants.columnName] as String;
      var word = Word(
          englishId: englishId,
          word: wordString,
          transcription: englishWord[DbConstants.columnPronunciation] as String,
          theme: englishWord[DbConstants.columnCategory] as String,
          level: englishWord[DbConstants.columnLevel] as String,
          translation: translationWord[DbConstants.columnTranslation] as String,
          language: translationWord[DbConstants.columnLanguage] as String,
          soundPath: 'for_db/words_sounds/${wordString.trim()}.mp3',
          imgPath: 'assets/for_db/words_images/${wordString.trim()}.svg',
          color: MyColors.wordsColors[englishId % MyColors.wordsColors.length],
          isLearned: englishWord[DbConstants.columnIsLearned] == 1,
          isRepeating: englishWord[DbConstants.columnIsRepeating] == 1,
          isDifficult: englishWord[DbConstants.columnIsDifficult] == 1,
          repeatedCount: englishWord[DbConstants.columnRepeatingCount] as int);
      words.add(word);
    }
    return words;
  }

  ///
}
