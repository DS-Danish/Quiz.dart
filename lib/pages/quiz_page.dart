import 'package:flutter/material.dart';
import '../widgets/question_widget.dart'; // Adjust import as needed
import '../widgets/answer_widget.dart';   // Adjust import as needed

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  int _questionIndex = 0;
  int _totalScore = 0;

  final List<Map<String, Object>> _questions = [
    {
      'questionText': 'What is the capital of France?',
      'answers': [
        {'text': 'Paris', 'score': 1},
        {'text': 'London', 'score': 0},
        {'text': 'Berlin', 'score': 0},
        {'text': 'Rome', 'score': 0},
      ],
    },
    {
      'questionText': 'Who wrote "Macbeth"?',
      'answers': [
        {'text': 'William Shakespeare', 'score': 1},
        {'text': 'Mark Twain', 'score': 0},
        {'text': 'J.K. Rowling', 'score': 0},
        {'text': 'Charles Dickens', 'score': 0},
      ],
    },
    {
      'questionText': 'What is the hardest natural substance on Earth?',
      'answers': [
        {'text': 'Diamond', 'score': 1},
        {'text': 'Gold', 'score': 0},
        {'text': 'Iron', 'score': 0},
        {'text': 'Platinum', 'score': 0},
      ],
    },
  ];

  void _answerQuestion(int score) {
    _totalScore += score;

    setState(() {
      _questionIndex += 1;
    });

    if (_questionIndex >= _questions.length) {
      Navigator.pushReplacementNamed(
        context,
        '/result',
        arguments: _totalScore,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quiz'),
      ),
      body: _questionIndex < _questions.length
          ? Column(
              children: [
                Question(
                  _questions[_questionIndex]['questionText'] as String,
                ),
                ...(_questions[_questionIndex]['answers']
                        as List<Map<String, Object>>)
                    .map((answer) {
                  return Answer(
                    () => _answerQuestion(answer['score'] as int),
                    answer['text'] as String,
                  );
                }).toList(),
              ],
            )
          : Center(child: Text("No more questions")),
    );
  }
}
