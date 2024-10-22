import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quiz App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(), // Set the initial page to HomePage
      routes: {
        '/quiz': (context) => QuizPage(),
        '/result': (context) => ResultPage(),
      },
    );
  }
}

// Home Page - Start Page
class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quiz App'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Welcome to the Quiz!',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/quiz'); // Navigate to Quiz Page
              },
              child: Text('Start Quiz', style: TextStyle(fontSize: 20)),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Quiz Page - Where Questions are displayed
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
      // Navigate to result page after quiz
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

// Question Widget
class Question extends StatelessWidget {
  final String questionText;

  Question(this.questionText);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.all(20),
      child: Text(
        questionText,
        style: TextStyle(fontSize: 28),
        textAlign: TextAlign.center,
      ),
    );
  }
}

// Answer Widget
class Answer extends StatelessWidget {
  final VoidCallback selectHandler;
  final String answerText;

  Answer(this.selectHandler, this.answerText);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
      child: ElevatedButton(
        onPressed: selectHandler,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blue,
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        ),
        child: Text(answerText, style: TextStyle(fontSize: 20)),
      ),
    );
  }
}

// Result Page - Displays the result of the quiz
class ResultPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final int resultScore = ModalRoute.of(context)!.settings.arguments as int;

    String get resultPhrase {
      String resultText;
      if (resultScore == 3) {
        resultText = 'You did it! Perfect score!';
      } else if (resultScore == 2) {
        resultText = 'Good job! You got most of them right!';
      } else {
        resultText = 'Better luck next time!';
      }
      return resultText;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Result'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              resultPhrase,
              style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Restart the quiz by navigating back to the home page
                Navigator.pushReplacementNamed(context, '/quiz');
              },
              child: Text('Restart Quiz'),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
