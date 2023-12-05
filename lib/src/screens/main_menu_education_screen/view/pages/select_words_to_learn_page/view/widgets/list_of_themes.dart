import 'package:one_minute_english/src/repo/model/my_theme.dart';
import 'package:one_minute_english/src/utils/app_language/app_language.dart';
import 'package:one_minute_english/src/utils/library.dart';
import 'package:one_minute_english/src/utils/my_colors.dart';
import 'package:one_minute_english/src/utils/my_parameters.dart';
import 'package:one_minute_english/src/utils/my_widgets/my_text_widget.dart';

class ListOfThemes extends StatelessWidget {
  final int wordsCount;
  final int allWordsCount;
  final Map<LangKey, String> lang;
  final List<MyTheme> listOfThemes;
  final List<int> listOfUsedThemes;
  const ListOfThemes(
      {super.key,
      required this.lang,
      required this.wordsCount,
      required this.allWordsCount,
      required this.listOfThemes,
      required this.listOfUsedThemes});

  @override
  Widget build(BuildContext context) {
    final myParameters = MyParameters(context);
    final text = '${lang[LangKey.selected]} $wordsCount из $allWordsCount';

    return SizedBox(
      height: myParameters.pixelHeight * 80,
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.only(
                  left: myParameters.pixelWidth * 20,
                  bottom: myParameters.pixelHeight * 20),
              child: MyTextWidget(
                text: text,
                fontSize: myParameters.pixelWidth * 14,
              ),
            ),
          ),
          SizedBox(
            width: myParameters.width,
            height: myParameters.pixelHeight * 41,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: listOfThemes.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: myParameters.pixelWidth * 6),
                    child: Container(
                      decoration: BoxDecoration(
                          color: listOfUsedThemes.contains(index + 5)
                              ? MyColors.mainColor
                              : MyColors.whiteColor,
                          borderRadius: BorderRadius.circular(
                              myParameters.pixelWidth * 20)),
                      child: Center(
                          child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: myParameters.pixelWidth * 30),
                        child: MyTextWidget(
                          text: listOfThemes[index].label ?? '',
                          color: listOfUsedThemes.contains(index + 5)
                              ? MyColors.whiteColor
                              : MyColors.blackColor87,
                        ),
                      )),
                    ),
                  );
                }),
          )
        ],
      ),
    );
  }
}
