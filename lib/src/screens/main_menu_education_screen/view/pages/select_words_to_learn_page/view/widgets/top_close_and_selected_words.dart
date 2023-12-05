import 'package:one_minute_english/src/screens/main_menu_education_screen/view/pages/select_words_to_learn_page/controller/select_words_controller.dart';
import 'package:one_minute_english/src/utils/app_language/app_language.dart';
import 'package:one_minute_english/src/utils/library.dart';
import 'package:one_minute_english/src/utils/my_colors.dart';
import 'package:one_minute_english/src/utils/my_parameters.dart';
import 'package:one_minute_english/src/utils/my_widgets/my_text_widget.dart';

class TopCloseAndSelectWords extends StatelessWidget {
  final int wordsCount;
  final int allWordsCount;
  final Map<LangKey, String> lang;
  const TopCloseAndSelectWords(
      {super.key,
      required this.lang,
      required this.wordsCount,
      required this.allWordsCount});

  @override
  Widget build(BuildContext context) {
    final myParameters = MyParameters(context);

    final text = '${lang[LangKey.selected]} $wordsCount из $allWordsCount';
    return Padding(
      padding: EdgeInsets.only(top: myParameters.pixelHeight * 50),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
              onPressed: () {
                SelectWordsController.onTapCloseButton(context);
              },
              icon: Icon(Icons.close_rounded, color: MyColors.greyColor,)),
          MyTextWidget(
            text: text,
            fontSize: myParameters.pixelWidth * 14,
          ),
          SizedBox(
            width: myParameters.pixelWidth * 56,
          )
        ],
      ),
    );
  }
}
