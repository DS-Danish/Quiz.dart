import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final int resultScore = ModalRoute.of(context)!.settings.arguments as int;

    String get resultPhrase {
      if (resultScore == 3) {
        return 'You did it! Perfect score!';
      } else if (resultScore == 2) {
        return 'Good job! You got most of them right!';
      } else {
        return 'Better luck next time!';
      }
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
