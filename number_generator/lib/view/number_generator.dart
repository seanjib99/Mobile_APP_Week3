import 'dart:math';

import 'package:flutter/material.dart';

class NumberGeneratorView extends StatefulWidget {
  const NumberGeneratorView({super.key});

  @override
  State<NumberGeneratorView> createState() => _NumberGeneratorViewState();
}

class _NumberGeneratorViewState extends State<NumberGeneratorView> {
  int num1 = 0;
  int num2 = 0;
  int _tapcount = 0;
  int correct = 0;
  int incorrect = 0;
  bool isButtonActive = true;
  void genrateRandom() {
    setState(() {
      num1 = Random().nextInt(101);
      num2 = Random().nextInt(101);
      if (num1 == num2) {
        num2 = Random().nextInt(101);
      }
      _tapcount++;
      if (_tapcount == 10) {
        isButtonActive = false;
      }
    });
  }

  void getResult1(int num1, int num2) {
    setState(() {
      if (num1 > num2) {
        correct++;
      } else {
        incorrect++;
      }
    });
  }

  void getResult2(int num1, int num2) {
    setState(() {
      if (num2 > num1) {
        correct++;
      } else {
        incorrect++;
      }
    });
  }

  void _checkAnswer(int selectedNumber) {
    if (num1 > num2 && selectedNumber == 1) {
      setState(() {
        correct++;
      });
    } else if (num2 > num1 && selectedNumber == 2) {
      setState(() {
        correct++;
      });
    } else {
      setState(() {
        incorrect++;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Number Generators'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Select the greater Number ',
              style: TextStyle(fontSize: 20),
            ),
            Row(
              children: [
                SizedBox(
                  height: 70,
                  width: 100,
                  child: ElevatedButton(
                    onPressed: isButtonActive
                        ? () {
                            genrateRandom();
                            // getResult1(num1, num2);
                            _checkAnswer(1);
                          }
                        : null,
                    child: Text('$num1'),
                  ),
                ),
                const Spacer(),
                SizedBox(
                  height: 70,
                  width: 100,
                  child: ElevatedButton(
                    onPressed: isButtonActive
                        ? () {
                            genrateRandom();
                            // getResult2(num1, num2);
                            _checkAnswer(2);
                          }
                        : null,
                    child: Text('$num2'),
                  ),
                ),
              ],
            ),
            Text('$_tapcount'),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  isButtonActive = true;
                  _tapcount = 0;
                  correct = 0;
                  incorrect = 0;
                });
              },
              child: const Text('Restart'),
            ),
            Text('Correct: $correct,'),
            Text('Incorrect: $incorrect'),
          ],
        ),
      ),
    );
  }
}
