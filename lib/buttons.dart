import 'dart:ffi';

import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final String buttonText;
  final buttonTapped;

  const Button({required this.buttonText, this.buttonTapped});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: buttonTapped,
      child: Padding(
        padding: howMuchPadding(buttonText),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          decoration: BoxDecoration(
            color: whatButtonColor(buttonText),
            borderRadius: whatCurved(buttonText),
          ),
          child: Center(
            child: Text(
              buttonText,
              style: TextStyle(
                color: whatTextColor(buttonText),
                fontSize: 20,
                fontWeight: (buttonText == "+" ||
                        buttonText == "-" ||
                        buttonText == "X" ||
                        buttonText == "/" ||
                        buttonText == "%")
                    ? FontWeight.bold
                    : FontWeight.normal,
              ),
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
  else {
    return Colors.black;
  }
}

Color whatTextColor(String x) {
  if (x == "C" || x == "DEL") {
    return Colors.orange;
  } else if (x == "ANS") {
    return Colors.blue;
  } else if (x == "+" || x == "-" || x == "X" || x == "/" || x == "%") {
    return Colors.black;
  } else if (x == "=") {
    return Colors.blue;
  } else {
    return Colors.white;
  }
}

EdgeInsetsGeometry howMuchPadding(String x) {
  // if (x == "C") {
  //   return const EdgeInsets.only(top: 10, bottom: 10, left: 10, right: 1);
  // }
  // else if (x == "DEL") {
  //   return const EdgeInsets.only(top: 10, right: 10, bottom: 10, left: 1);
  // }
  if (x == "%") {
    return const EdgeInsets.only(top: 10, right: 10);
  } else if (x == "-") {
    return const EdgeInsets.only(bottom: 10, right: 10, top: 2);
  } else if (x == "/" || x == "X" || x == "+") {
    return const EdgeInsets.only(right: 10, top: 2);
  } else {
    return const EdgeInsets.all(0);
  }
}

BorderRadiusGeometry whatCurved(String x) {
  // if (x == "C") {
  //   return const BorderRadius.only(
  //     bottomLeft: Radius.circular(20),
  //     bottomRight: Radius.zero,
  //     topLeft: Radius.circular(20),
  //     topRight: Radius.circular(0),
  //   );
  // } else if (x == "DEL") {
  //   return const BorderRadius.only(
  //     bottomLeft: Radius.circular(0),
  //     bottomRight: Radius.circular(20),
  //     topLeft: Radius.circular(0),
  //     topRight: Radius.circular(20),
  //   );
  if (x == "%") {
    return const BorderRadius.only(
      topLeft: Radius.circular(20),
      topRight: Radius.circular(20),
    );
  } else if (x == "-") {
    return const BorderRadius.only(
      bottomLeft: Radius.circular(20),
      bottomRight: Radius.circular(20),
    );
  } else {
    return const BorderRadius.all(Radius.zero);
  }
}
