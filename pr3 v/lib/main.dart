import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final Color _primarySwatch = Colors.orange;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(primaryColor: _primarySwatch),
        debugShowCheckedModeBanner: false,
        home: Kalkulator());
  }
}

class Kalkulator extends StatefulWidget {
  const Kalkulator({super.key});

  @override
  State<Kalkulator> createState() => _KalkulatorState();
}

class _KalkulatorState extends State<Kalkulator> {
  final double _padding = 16.0;
  final Color _titleColorAppBar = Colors.white;

  @override
  dynamic num1;
  String? num2;
  String opr = "";
  dynamic output = "";
  dynamic _output = "";

  buttonPress(String butontext) {
    if (butontext == "C") {
      dynamic num1 = "0";
      String num2 = "0";
      String opr = "";
      dynamic output = "0";
    } else if (butontext == '+' ||
        butontext == '-' ||
        butontext == 'x' ||
        butontext == '/') {
      num1 = double.parse(output);

      opr = butontext;
      _output = '0';
    } else if (butontext == '.') {
      if (_output.contains('.')) {
        print('already decimals');
        return;
      } else {
        _output = _output + butontext;
      }
    } else if (butontext == '=') {
      num1 = double.parse(output);

      if (opr == '+') {
        _output = (num1 + num2).toString();
      }
      if (opr == '-') {
        _output = (num1 - num2).toString();
      }
      if (opr == 'x') {
        _output = (num1 * num2).toString();
      }
      if (opr == '/') {
        _output = (num1 ~/ num2).toString();
      }
    } else {
      _output = _output + butontext;
    }
    print(_output);

    setState(() {
      output = double.parse(_output);
    });
  }

  Widget _buttoncalc(int _flex, String butontext, Color warnatxt) {
    return Expanded(
      flex: _flex,
      child: ElevatedButton(
        onPressed: () {},
        style: ButtonStyle(
            backgroundColor:
                MaterialStateColor.resolveWith((states) => MyColor(states))),
        child: Text(
          butontext,
          style: TextStyle(
            color: warnatxt,
          ),
        ),
      ),
    );
  }

  static int _noPressed = 0xcafefeed;
  static int _onPressed = 0xdeadbeef;

  Color MyColor(Set<MaterialState> states) {
    if (states.contains(MaterialState.pressed)) {
      return Color(_onPressed);
    }
    return Color(_noPressed);
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("kalkulator"),
        backgroundColor: _titleColorAppBar,
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Expanded(
              key: Key("exp_bagian_atas"),
              flex: 1,
              child: Container(
                key: Key("exp_container_bagian_atas"),
                width: double.infinity,
                height: double.infinity,
              ),
            ),
            Expanded(
              key: Key("exp_bagian_bawah"),
              flex: 1,
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      _buttoncalc(2, 'C', Colors.orange),
                      _buttoncalc(1, '.', Colors.grey),
                      _buttoncalc(1, '/', Colors.grey),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      _buttoncalc(1, '7', Colors.grey),
                      _buttoncalc(1, '8', Colors.grey),
                      _buttoncalc(1, '9', Colors.grey),
                      _buttoncalc(1, 'x', Colors.grey)
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      _buttoncalc(1, '4', Colors.grey),
                      _buttoncalc(1, '5', Colors.grey),
                      _buttoncalc(1, '6', Colors.grey),
                      _buttoncalc(1, '+', Colors.grey)
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      _buttoncalc(1, '1', Colors.grey),
                      _buttoncalc(1, '2', Colors.grey),
                      _buttoncalc(1, '3', Colors.grey),
                      _buttoncalc(1, '-', Colors.grey)
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      _buttoncalc(3, '0', Colors.grey),
                      _buttoncalc(1, '=', Colors.grey),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
