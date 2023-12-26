import 'package:calculator/buttons.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: MyHomePage(title: 'Flutter Demo Home Page'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void buttonTapped(String x) {
    if (x == "C") {
      setState(() {
        userQuestion = "";
        userAnswer = "0";
      });
    } else if (x == "DEL") {
      setState(() {
        if (userQuestion == "Enter an expression") {
          userQuestion = "";
        }
        userQuestion = userQuestion.substring(0, userQuestion.length - 1);
        userAnswer = "0";
      });
    } else if (x == "=") {
      setState(() {
        userAnswer = evaluateExp(userQuestion);
      });
    } else {
      setState(() {
        userQuestion += x;
      });
    }
  }

  var userQuestion = "";
  var userAnswer = "0";
  final List<String> buttons = [
    "C",
    "DEL",
    "",
    "%",
    "9",
    "8",
    "7",
    "/",
    "6",
    "5",
    "4",
    "X",
    "3",
    "2",
    "1",
    "+",
    "0",
    ".",
    "=",
    "-"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const SizedBox(
                  height: 20,
                ),
                Container(
                  padding: const EdgeInsets.all(20),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    userQuestion,
                    style: const TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(20),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    userAnswer,
                    style: TextStyle(
                      fontSize: 60,
                      color: (userAnswer == "0")
                          ? const Color.fromARGB(255, 119, 119, 119)
                          : Colors.black,
                    ),
                  ),
                )
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              color: Colors.white,
              padding: EdgeInsets.all(5),
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
                child: GridView.builder(
                  itemCount: buttons.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4),
                  itemBuilder: (BuildContext context, int index) {
                    return Button(
                      buttonText: buttons[index],
                      buttonTapped: () {
                        buttonTapped(buttons[index]);
                      },
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

String evaluateExp(String x) {
  x = x.replaceAll("X", "*");
  x = x.replaceAll("ANS", x);
  Parser p = Parser();
  Expression exp = p.parse(x);
  ContextModel cm = ContextModel();

  double eval = exp.evaluate(EvaluationType.REAL, cm);

  return eval.toString();
}
