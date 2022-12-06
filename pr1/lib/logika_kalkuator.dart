import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class Kalkulus extends StatefulWidget {
  const Kalkulus({super.key});

  @override
  State<Kalkulus> createState() => _KalkulusState();
}

class _KalkulusState extends State<Kalkulus> {
  @override
  int? num1;
  int? num2;
  String input = "";
  String output = "";
  String operand = "";

  onClickButton(value) {
    if (value == 'AC') {
      input = "";
      output = "";
    } else if (value == '<=') {
      if (input.isNotEmpty) {
        input = input.substring(0, input.length - 1);
      }
    } else if (value == '=') {
      var userInput = input;
      userInput = input.replaceAll('x', '*');
      Parser p = Parser();
      Expression expression = p.parse(userInput);
      ContextModel cm = ContextModel();
      var finalValue = expression.evaluate(EvaluationType.REAL, cm);
      output = finalValue.toString();
      if (output.endsWith(".0")) {
        output = output.substring(0, output.length - 2);
      }
      output = input;
    } else {
      input = input + value;
    }
    setState(() {});
  }

  static int nopress = 0xcafefeed;
  static int onpressed = 0xdeadbeef;

  @override
  Color resolv(Set<MaterialState> states) {
    if (states.contains(MaterialState.pressed)) {
      return Color(onpressed);
    }
    return Color(nopress);
  }

  Widget Buttonaseli(int fle, String value, Color txt) {
    return Expanded(
      flex: fle,
      child: ElevatedButton(
        onPressed: () {
          onClickButton(value);
        },
        child: Text(
          value,
          style: TextStyle(
            color: txt,
          ),
        ),
        style: ButtonStyle(
            backgroundColor:
                MaterialStateColor.resolveWith((states) => resolv(states))),
      ),
    );
  }

  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          body: Column(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Container(
                width: double.infinity,
                height: double.infinity,
                alignment: Alignment.bottomRight,
                child: Column(
                  children: <Widget>[
                    Text(
                      input,
                      style: TextStyle(
                        fontSize: 35,
                      ),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Text(
                      output,
                      style: TextStyle(fontSize: 30),
                    )
                  ],
                )),
          ),
          Expanded(
            flex: 1,
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Buttonaseli(2, "AC", Colors.orange),
                    Buttonaseli(1, "<=", Colors.grey),
                    Buttonaseli(1, "/", Colors.grey),
                  ],
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Buttonaseli(1, "7", Colors.grey),
                    Buttonaseli(1, "8", Colors.grey),
                    Buttonaseli(1, "9", Colors.grey),
                    Buttonaseli(1, "x", Colors.grey),
                  ],
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Buttonaseli(1, "4", Colors.grey),
                    Buttonaseli(1, "5", Colors.grey),
                    Buttonaseli(1, "6", Colors.grey),
                    Buttonaseli(1, "-", Colors.grey),
                  ],
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Buttonaseli(1, "1", Colors.grey),
                    Buttonaseli(1, "2", Colors.grey),
                    Buttonaseli(1, "3", Colors.grey),
                    Buttonaseli(1, "+", Colors.grey),
                  ],
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Buttonaseli(3, "0", Colors.grey),
                    Buttonaseli(1, "=", Colors.black),
                  ],
                ),
              ],
            ),
          )
        ],
      )),
    );
  }
}
