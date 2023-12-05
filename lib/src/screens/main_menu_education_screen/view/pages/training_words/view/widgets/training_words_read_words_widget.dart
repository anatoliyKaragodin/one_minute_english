import 'package:one_minute_english/src/repo/model/word.dart';
import 'package:one_minute_english/src/utils/library.dart';
import 'package:one_minute_english/src/utils/my_colors.dart';
import 'package:one_minute_english/src/utils/my_parameters.dart';
import 'package:one_minute_english/src/utils/my_widgets/my_text_widget.dart';

class TrainingWordsReadWordsWidget extends StatelessWidget {
  final String text;
  final List<Word> listOfWords;
  const TrainingWordsReadWordsWidget(
      {super.key, required this.text, required this.listOfWords});

  @override
  Widget build(BuildContext context) {
    final myParameters = MyParameters(context);

    return SizedBox(
      height: myParameters.pixelHeight * 675,
      child: Padding(
        padding: EdgeInsets.only(
          top: myParameters.pixelHeight * 70,
          left: myParameters.pixelWidth * 20,
          right: myParameters.pixelWidth * 20,
        ),
        child: Column(
          children: [
            MyTextWidget(
              text: text,
              fontSize: 18,
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: listOfWords.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: EdgeInsets.only(
                          bottom: myParameters.pixelHeight * 20),
                      child: Container(
                        height: myParameters.pixelHeight * 70,
                        decoration: BoxDecoration(
                            color: listOfWords[index].color,
                            borderRadius: BorderRadius.circular(
                                myParameters.pixelWidth * 10)),
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: myParameters.pixelHeight*10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              MyTextWidget(
                                text: listOfWords[index].word,
                                fontSize: 18,
                                fontWeight: FontWeight.w900,
                              ),
                              MyTextWidget(text: listOfWords[index].translation)
                            ],
                          ),
                        ),
                      ),
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}
