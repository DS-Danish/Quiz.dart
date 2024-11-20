import 'package:flutter/material.dart';
<<<<<<< HEAD
import 'dart:convert';
import 'package:http/http.dart' as http;
=======
>>>>>>> be3a0c434e6c95395cf25fd10db0d067cbbca0d4

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
<<<<<<< HEAD
      title: 'Quiz and Weather App',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: HomePage(),
      routes: {
        '/quiz': (context) => QuizPage(),
        '/weather': (context) => WeatherPage(),
=======
      title: 'Quiz App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(), // Set the initial page to HomePage
      routes: {
        '/quiz': (context) => QuizPage(),
        '/result': (context) => ResultPage(),
>>>>>>> be3a0c434e6c95395cf25fd10db0d067cbbca0d4
      },
    );
  }
}

<<<<<<< HEAD
// Home Page
=======
// Home Page - Start Page
>>>>>>> be3a0c434e6c95395cf25fd10db0d067cbbca0d4
class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
<<<<<<< HEAD
        title: Text('Home'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // Center buttons vertically
          crossAxisAlignment: CrossAxisAlignment.center, // Center buttons horizontally
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/quiz');
              },
              child: Text('Go to Quiz'),
            ),
            SizedBox(height: 20), // Add space between buttons
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/weather');
              },
              child: Text('Check Weather'),
=======
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
>>>>>>> be3a0c434e6c95395cf25fd10db0d067cbbca0d4
            ),
          ],
        ),
      ),
    );
  }
}

<<<<<<< HEAD
// Weather Page
class WeatherPage extends StatelessWidget {
  final List<String> cities = ['Karachi', 'Lahore', 'Islamabad', 'Quetta', 'Peshawar'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Weather'),
      ),
      body: ListView.builder(
        itemCount: cities.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(cities[index]),
            trailing: Icon(Icons.arrow_forward),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CityWeatherPage(city: cities[index]),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

// City Weather Page
class CityWeatherPage extends StatefulWidget {
  final String city;

  CityWeatherPage({required this.city});

  @override
  _CityWeatherPageState createState() => _CityWeatherPageState();
}

class _CityWeatherPageState extends State<CityWeatherPage> {
  String weatherInfo = "Loading...";

  @override
  void initState() {
    super.initState();
    fetchWeather(widget.city);
  }

  Future<void> fetchWeather(String city) async {
    try {
      final url = "https://geocoding-api.open-meteo.com/v1/search?name=$city";
      final geoResponse = await http.get(Uri.parse(url));

      if (geoResponse.statusCode == 200) {
        final geoData = jsonDecode(geoResponse.body);
        if (geoData['results'] != null && geoData['results'].isNotEmpty) {
          final lat = geoData['results'][0]['latitude'];
          final lon = geoData['results'][0]['longitude'];

          final weatherUrl =
              "https://api.open-meteo.com/v1/forecast?latitude=$lat&longitude=$lon&current_weather=true";
          final weatherResponse = await http.get(Uri.parse(weatherUrl));

          if (weatherResponse.statusCode == 200) {
            final weatherData = jsonDecode(weatherResponse.body);
            setState(() {
              weatherInfo =
              "Temperature: ${weatherData['current_weather']['temperature']}°C\n"
                  "Wind Speed: ${weatherData['current_weather']['windspeed']} km/h";
            });
          } else {
            setState(() {
              weatherInfo = "Unable to fetch weather data.";
            });
          }
        } else {
          setState(() {
            weatherInfo = "City not found.";
          });
        }
      } else {
        setState(() {
          weatherInfo = "Error fetching location data.";
        });
      }
    } catch (error) {
      setState(() {
        weatherInfo = "Error: $error";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.city),
      ),
      body: Center(
        child: Text(
          weatherInfo,
          style: TextStyle(fontSize: 18),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}

// Quiz Page
=======
// Quiz Page - Where Questions are displayed
>>>>>>> be3a0c434e6c95395cf25fd10db0d067cbbca0d4
class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
<<<<<<< HEAD
  int currentQuestionIndex = 0;
  int score = 0;

  final List<Map<String, Object>> quizQuestions = [
    {
      'questionText': 'What is the capital of Pakistan?',
      'answers': [
        {'text': 'Islamabad', 'score': 1},  // Correct answer
        {'text': 'Lahore', 'score': 0},
        {'text': 'Karachi', 'score': 0},
        {'text': 'Peshawar', 'score': 0},
      ],
    },
    {
      'questionText': 'Who wrote "Harry Potter"?',
      'answers': [
        {'text': 'William Shakespeare', 'score': 0},
        {'text': 'Mark Twain', 'score': 0},
        {'text': 'J.K. Rowling', 'score': 1},  // Correct answer
=======
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
>>>>>>> be3a0c434e6c95395cf25fd10db0d067cbbca0d4
        {'text': 'Charles Dickens', 'score': 0},
      ],
    },
    {
<<<<<<< HEAD
      'questionText': 'Most expensive Car in the World?',
      'answers': [
        {'text': 'BMW', 'score': 0},
        {'text': 'Mercedes', 'score': 0},
        {'text': 'Ferrari', 'score': 0},
        {'text': 'Bugatti Chiron', 'score': 1},  // Correct answer
      ],
    },
    {
      'questionText': 'What does NASA stand for?',
      'answers': [
        {'text': 'National Aeronautics and Space Administration', 'score': 1},  // Correct answer
        {'text': 'National Association of Space Aerospace', 'score': 0},
        {'text': 'North American Space Agency', 'score': 0},
        {'text': 'National Aeronautical Science Association', 'score': 0},
      ],
    },
    {
      'questionText': 'Who wrote "Romeo and Juliet"?',
      'answers': [
        {'text': 'Shakespeare', 'score': 1},  // Correct answer
        {'text': 'Dickens', 'score': 0},
        {'text': 'Austen', 'score': 0},
        {'text': 'Hemingway', 'score': 0},
=======
      'questionText': 'What is the hardest natural substance on Earth?',
      'answers': [
        {'text': 'Diamond', 'score': 1},
        {'text': 'Gold', 'score': 0},
        {'text': 'Iron', 'score': 0},
        {'text': 'Platinum', 'score': 0},
>>>>>>> be3a0c434e6c95395cf25fd10db0d067cbbca0d4
      ],
    },
  ];

<<<<<<< HEAD
  void answerQuestion(int score) {
    this.score += score;

    if (currentQuestionIndex < quizQuestions.length - 1) {
      setState(() {
        currentQuestionIndex++;
      });
    } else {
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: Text('Quiz Completed'),
          content: Text('Your score is $score out of ${quizQuestions.length}.'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                setState(() {
                  score = 0;
                  currentQuestionIndex = 0;
                });
                Navigator.of(ctx).pop();
              },
              child: Text('Restart Quiz'),
            )
          ],
        ),
=======
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
>>>>>>> be3a0c434e6c95395cf25fd10db0d067cbbca0d4
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quiz'),
      ),
<<<<<<< HEAD
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center, // Center the content vertically
            crossAxisAlignment: CrossAxisAlignment.center, // Center the content horizontally
            children: <Widget>[
              Text(
                quizQuestions[currentQuestionIndex]['questionText'] as String,
                style: TextStyle(fontSize: 24),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20), // Add space between question and options
              ...(quizQuestions[currentQuestionIndex]['answers'] as List<Map<String, Object>>)
                  .map((answer) {
                return ElevatedButton(
                  onPressed: () => answerQuestion(answer['score'] as int),
                  child: Text(answer['text'] as String),
                );
              }).toList(),
            ],
          ),
=======
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
>>>>>>> be3a0c434e6c95395cf25fd10db0d067cbbca0d4
        ),
      ),
    );
  }
}
