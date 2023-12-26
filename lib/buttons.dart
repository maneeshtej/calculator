import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final String buttonText;
  final buttonTapped;

  const Button({required this.buttonText, this.buttonTapped});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: buttonTapped,
      child: Container(
        decoration: BoxDecoration(
          color: whatButtonColor(buttonText),
        ),
        child: Center(
          child: Text(
            buttonText,
            style: TextStyle(
              color: whatTextColor(buttonText),
            ),
          ),
        ),
      ),
    );
  }
}

Color whatButtonColor(String x) {
  if (x == "+" || x == "-" || x == "X" || x == "/" || x == "%") {
    return Colors.red;
  }
  // else if (x == "C" || x == "DEL") {
  //   return Colors.orange;
  // }
  // else if (x == "ANS" || x == "=") {
  //   return Colors.blue;
  // }
  else {
    return Colors.black;
  }
}

Color whatTextColor(String x) {
  if (x == "C" || x == "DEL") {
    return Colors.orange;
  } else if (x == "ANS") {
    return Colors.blue;
  } else {
    return Colors.white;
  }
}
