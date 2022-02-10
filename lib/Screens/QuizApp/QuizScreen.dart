import 'package:flutter/material.dart';
import 'package:flutterdemo/Screens/QuizApp/QuestionsModel.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({Key? key}) : super(key: key);

  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  QuestionsModel _questionsModel = QuestionsModel.fromJson(jsonModel);

  int currentQuestion = 0;

  int total = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    print(_questionsModel.questions.length);
  }

  moveToNextQuestion() {
    setState(() {
      if (currentQuestion < _questionsModel.questions.length) {
        currentQuestion = currentQuestion + 1;
      }
    });
  }
  moveToPreviousQuestion() {
    setState(() {
      if (currentQuestion < _questionsModel.questions.length) {
        currentQuestion = currentQuestion - 1;
      }
    });
  }
  selectAnswer(int index) {
    setState(() {
      if (currentQuestion < _questionsModel.questions.length) {
        _questionsModel.questions[currentQuestion].answeredQN = index;
        _questionsModel.questions[currentQuestion].isAnswered = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Quiz App"),
      ),
      body: SafeArea(
          child: currentQuestion < _questionsModel.questions.length
              ? QuestionAndAnswers(
                  questionsModel: _questionsModel,
                  currentQuestion: currentQuestion,
                  callback: moveToNextQuestion,
                  moveToPrevious: moveToPreviousQuestion,
                  selectAnswer: selectAnswer,
                )
              : YourScore(
                  total: total,
                  currentQuestion: currentQuestion,
                  questionsModel: _questionsModel,
                )),
    );
  }
}

class YourScore extends StatefulWidget {
  YourScore({
    Key? key,
    required this.questionsModel,
    required this.currentQuestion,
    required this.total,
  }) : super(key: key);

  int total;
  final QuestionsModel questionsModel;

  final int currentQuestion;
  @override
  State<YourScore> createState() => _YourScoreState();
}

class _YourScoreState extends State<YourScore> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    calculateTotal();
  }

  calculateTotal() {
    setState(() {
      for (int i = 0; i < widget.questionsModel.questions.length; i++) {
        widget.total = (widget.total +
            widget.questionsModel.questions[i]
                .answers[widget.questionsModel.questions[i].answeredQN!].score);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
          child: Text("your score is ${widget.total}",
              style: TextStyle(fontSize: 25))),
    );
  }
}

class QuestionAndAnswers extends StatefulWidget {
  QuestionAndAnswers(
      {Key? key,
      required this.questionsModel,
      required this.currentQuestion,
      required this.callback,
      required this.moveToPrevious,
      
      required this.selectAnswer})
      : super(key: key);

  final QuestionsModel questionsModel;

  final int currentQuestion;
  final Function callback;
  final Function moveToPrevious;
  final Function selectAnswer;
  @override
  _QuestionAndAnswersState createState() => _QuestionAndAnswersState();
}

class _QuestionAndAnswersState extends State<QuestionAndAnswers> {
  bool checkisFirstQuestion() {
    if (widget.currentQuestion != 0) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            padding: EdgeInsets.only(top: 30, left: 10, right: 10),
            child: Center(
              child: Text(
                widget.questionsModel.questions[widget.currentQuestion]
                    .questionText,
                style: TextStyle(fontSize: 25),
              ),
            )),
        Container(
          margin: EdgeInsets.all(25),
          child: ListView.builder(
              itemCount: widget.questionsModel.questions[widget.currentQuestion]
                  .answers.length,
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              itemBuilder: (BuildContext context, int index) {
                return InkWell(
                  onTap: () => {widget.selectAnswer(index)},
                  child: Container(
                      margin: EdgeInsets.all(25),
                      height: 50,
                      color: index ==
                              widget.questionsModel
                                  .questions[widget.currentQuestion].answeredQN
                          ? Colors.green
                          : Colors.blue,
                      child: Center(
                        child: Text(widget
                            .questionsModel
                            .questions[widget.currentQuestion]
                            .answers[index]
                            .text),
                      )),
                );
              }),
        ),
        ElevatedButton(
            onPressed: widget
                    .questionsModel.questions[widget.currentQuestion].isAnswered
                ? () => {widget.callback()}
                : null,
            child: Text("Next")),
        checkisFirstQuestion()
            ? ElevatedButton(
                onPressed: () => {widget.moveToPrevious()},
                child: Text("Previous"))
            : Container(),
      ],
    );
  }
}
