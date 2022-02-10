// To parse this JSON data, do
//
//     final QuestionsModel = QuestionsModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

QuestionsModel QuestionsModelFromJson(String str) =>
    QuestionsModel.fromJson(json.decode(str));

String QuestionsModelToJson(QuestionsModel data) => json.encode(data.toJson());

class QuestionsModel {
  QuestionsModel({
    required this.questions,
  });

  List<Question> questions;

  factory QuestionsModel.fromJson(Map<String, dynamic> json) => QuestionsModel(
        questions: List<Question>.from(
            json["questions"].map((x) => Question.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "questions": List<dynamic>.from(questions.map((x) => x.toJson())),
      };
}

class Question {
  Question({
    required this.questionText,
    required this.answers,
    required this.answeredQN,
  
  });

  String questionText;
  int? answeredQN;
  bool isAnswered = false;
  List<Answer> answers;

  factory Question.fromJson(Map<String, dynamic> json) => Question(
        questionText: json["questionText"],
        answeredQN: json["answeredQN"],
        
        answers:
            List<Answer>.from(json["answers"].map((x) => Answer.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "questionText": questionText,
        "answeredQN": answeredQN,
        
        "answers": List<dynamic>.from(answers.map((x) => x.toJson())),
      };
}

class Answer {
  Answer({
    required this.text,
    required this.score,
  });

  String text;
  int score;

  factory Answer.fromJson(Map<String, dynamic> json) => Answer(
        text: json["text"],
        score: json["score"],
      );

  Map<String, dynamic> toJson() => {
        "text": text,
        "score": score,
      };
}

var jsonModel = {
  "questions": [
    {
      "questionText": "Q1. Who created Flutter?",
      "answers": [
        {"text": "Facebook", "score": -2},
        {"text": "Adobe", "score": -2},
        {"text": "Google", "score": 10},
        {"text": "Microsoft", "score": -2}
      ],
      "answeredQN": null
    },
    {
      "questionText": "Q2. What is Flutter?",
      "answers": [
        {"text": "Android Development Kit", "score": -2},
        {"text": "IOS Development Kit", "score": -2},
        {"text": "Web Development Kit", "score": -2},
        {
          "text":
              "SDK to build beautiful IOS, Android, Web & Desktop Native Apps",
          "score": 10
        }
      ],
      "answeredQN": null
    },
    {
      "questionText": " Q3. Which programing language is used by Flutter",
      "answers": [
        {"text": "Ruby", "score": -2},
        {"text": "Dart", "score": 10},
        {"text": "C++", "score": -2},
        {"text": "Kotlin", "score": -2}
      ],
      "answeredQN": null
    },
    {
      "questionText": "Q4. Who created Dart programing language?",
      "answers": [
        {"text": "Lars Bak and Kasper Lund", "score": 10},
        {"text": "Brendan Eich", "score": -2},
        {"text": "Bjarne Stroustrup", "score": -2},
        {"text": "Jeremy Ashkenas", "score": -2}
      ],
      "answeredQN": null
    },
    {
      "questionText":
          "Q5. Is Flutter for Web and Desktop available in stable version?",
      "answers": [
        {"text": "Yes", "score": -2},
        {"text": "No", "score": 10}
      ],
      "answeredQN": null
    }
  ]
};
