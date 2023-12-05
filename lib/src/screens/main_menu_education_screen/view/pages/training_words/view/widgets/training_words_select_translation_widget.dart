import 'package:one_minute_english/src/repo/model/word.dart';
import 'package:one_minute_english/src/screens/main_menu_education_screen/view/pages/select_words_to_learn_page/view/widgets/my_word_container.dart';
import 'package:one_minute_english/src/screens/main_menu_education_screen/view/pages/training_words/controller/training_words_controller.dart';
import 'package:one_minute_english/src/utils/library.dart';
import 'package:one_minute_english/src/utils/my_colors.dart';
import 'package:one_minute_english/src/utils/my_parameters.dart';
import 'package:one_minute_english/src/utils/my_widgets/my_text_widget.dart';

class TrainingWordsSelectTranslationWidget extends ConsumerStatefulWidget {
  final String text;
  final List<Word> listOfWords;
  final int currentWordIndex;
  const TrainingWordsSelectTranslationWidget(
      {super.key,
      required this.listOfWords,
      required this.text,
      required this.currentWordIndex});

  @override
  ConsumerState createState() => _TrainingWordsSelectTranslationWidgetState();
}

class _TrainingWordsSelectTranslationWidgetState
    extends ConsumerState<TrainingWordsSelectTranslationWidget> {
  @override
  Widget build(BuildContext context) {
    final myParameters = MyParameters(context);

    return Padding(
      padding: EdgeInsets.only(
          top: myParameters.pixelHeight * 55,
          left: myParameters.pixelWidth * 20,
          right: myParameters.pixelWidth * 20),
      child: Column(
        children: [
          MyTextWidget(
            text: widget.text,
            fontSize: 18,
          ),
          Padding(
            padding:
                EdgeInsets.symmetric(vertical: myParameters.pixelHeight * 32),
            child: MyWordContainer(
                height: 305,
                width: 232,
                colorContainerHeight: 116,
                imgPadding: 30,
                word: widget.listOfWords[widget.currentWordIndex],
                color: MyColors.greenColor,
                onlyWord: true),
          ),
          SizedBox(
            height: myParameters.pixelHeight * 160,
            child: GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                padding: EdgeInsets.zero,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: 195 / 70,
                    crossAxisCount: 2,
                    mainAxisSpacing: myParameters.pixelWidth * 14,
                    crossAxisSpacing: myParameters.pixelWidth * 14),
                itemCount: 4,
                itemBuilder: (BuildContext context, int index) {
                  return InkWell(
                    onTap: () {
                      TrainingWordsController.onTapTranslation(
                          context, index, widget.currentWordIndex, ref);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: MyColors.greyColor!),
                          borderRadius: BorderRadius.circular(
                              myParameters.pixelWidth * 10)),
                      child: Center(
                        child: Text(widget.listOfWords[index].translation),
                      ),
                    ),
                  );
                }),
          )
        ],
      ),
    );
  }
}
