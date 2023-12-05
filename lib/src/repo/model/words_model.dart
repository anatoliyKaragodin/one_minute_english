import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:one_minute_english/src/repo/db/db_helper.dart';
import 'package:one_minute_english/src/repo/model/my_theme.dart';
import 'package:one_minute_english/src/repo/model/word.dart';
import 'package:one_minute_english/src/repo/model/words.dart';
import 'package:one_minute_english/src/repo/model/words_constants.dart';
import 'package:one_minute_english/src/repo/shared_preferences/shared_preferences.dart';
import 'package:one_minute_english/src/utils/app_language/app_language.dart';

class WordsModel extends StateNotifier<Words> {
  WordsModel() : super(WordsConstants().initState) {
    initState();
  }

  void initState() async {
    initAllThemes();
    var wordsByTheme = await DatabaseHelper.instance
        .getWordsByTheme(theme: 'Beginner', language: 'russian');
    state = state.copyWith(words: wordsByTheme);
  }

  void addAlreadyKnownWord(Word word) {
    List<Word> alreadyKnownWords = List.from(state.alreadyKnown);
    alreadyKnownWords.add(word);
    state = state.copyWith(alreadyKnown: alreadyKnownWords);
    setNextCurrentWordIndex();
  }

  void addToLearnWord(Word word, isLastWord) {
    List<Word> toLearnWords = List.from(state.selectedToLearn);
    toLearnWords.add(word);
    state = state.copyWith(selectedToLearn: toLearnWords);
    if (!isLastWord) {
      setNextCurrentWordIndex();
    }
  }

  void setNextCurrentWordIndex() {
    if (state.currentWord < state.words.length) {
      state = state.copyWith(currentWord: state.currentWord + 1);
    }
  }

  void setNextPageIndex() {
    if (state.currentTrainingPage < 3) {
      state =
          state.copyWith(currentTrainingPage: state.currentTrainingPage + 1);
    }
  }

  void setThemesLabels(int langIndex) {
    final lang = AppLanguage.listOfLanguages[langIndex];
    final themesLabels = [
      lang[LangKey.selectAll],
      'Beginner',
      'Elementary',
      'Intermediate',
      'Upper-Intermediate',
      lang[LangKey.foodAndDrinks],
      lang[LangKey.professions],
      lang[LangKey.cloth],
      lang[LangKey.sport],
      lang[LangKey.familyAndFriends],
      lang[LangKey.home],
      lang[LangKey.city],
      lang[LangKey.colors],
      lang[LangKey.trips],
      lang[LangKey.countries],
      lang[LangKey.weather],
      lang[LangKey.months],
      lang[LangKey.animals],
    ];
    List<MyTheme> allThemesList = List.from(state.allThemes);

    for (int i = 0; i < allThemesList.length; i++) {
      allThemesList[i] = allThemesList[i].copyWith(label: themesLabels[i]);
    }
    state = state.copyWith(allThemes: allThemesList);
  }

  void loadThemesLabel() async {
    int langIndex = await SharPrefs().loadSelectedLanguage();
    setThemesLabels(langIndex);
  }

  void initAllThemes() {
    var list = List<MyTheme>.generate(18, (index) {
      return MyTheme(
        label: WordsConstants().themesLabels[index],
        color: WordsConstants().themeColors[index],
        imgPath: WordsConstants.themesImgs[index],
        allWordsCount: 200,
        learnedWords: 0,
      );
    });
    state = state.copyWith(allThemes: list);
    loadThemesLabel();
  }

  void resetNextPageIndexToOne() {
    state = state.copyWith(currentTrainingPage: 1);
  }

  void setNextCurrentLearningWordIndex() {
    if (state.currentLearningWordIndex < state.selectedToLearn.length - 1) {
      state = state.copyWith(
          currentLearningWordIndex: state.currentLearningWordIndex + 1);
    }
  }

  void resetSelectedToLearnWordsList() {
    state = state.copyWith(selectedToLearn: []);
  }

  void resetCurrentPageIndex() {
    state = state.copyWith(currentTrainingPage: 0);
  }

  void resetCurrentWord() {
    state = state.copyWith(currentWord: 0);
  }

  void resetCurrentWordToLearnIndex() {
    state = state.copyWith(currentLearningWordIndex: 0);
  }

  void setSelectedWordIndex(int index) {
    state = state.copyWith(selectedWordIndex: index);
    debugPrint(state.selectedWordIndex.toString());
  }

  void setWordIsLearnedFlag(bool isLearnedFlag) {
    List<Word> learningWordsList = List.from(state.selectedToLearn);
    learningWordsList[state.currentLearningWordIndex]
        .copyWith(isLearned: isLearnedFlag);
    debugPrint(
        learningWordsList[state.currentLearningWordIndex].isLearned.toString());
  }
}
