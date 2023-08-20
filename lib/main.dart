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
      debugShowCheckedModeBanner: false,
      home: Homepage(),
    );
  }
}

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  var userquestion = '';
  var useranswer = '';
  final List<String> buttons = [
    'c',
    'DEL',
    '%',
    '/',
    '9',
    '7',
    '8',
    'x',
    '6',
    '5',
    '4',
    '-',
    '3',
    '2',
    '1',
    '+',
    '0',
    '.',
    'ANS',
    '=',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          Expanded(
            child: Container(
              child: Column(
                children: [
                  SizedBox(
                    height: 50,
                  ),
                  Container(
                    padding: EdgeInsets.all(20),
                    alignment: Alignment.centerLeft,
                    child: Text(
                      userquestion,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 40,
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(20),
                    alignment: Alignment.centerRight,
                    child: Text(
                      useranswer,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 43,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              child: GridView.builder(
                itemCount: buttons.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4),
                itemBuilder: (context, index) {
                  if (index == 0) {
                    return Mybutton(
                      buttontapped: () {
                        setState(() {
                          userquestion = '';
                          useranswer = '';
                        });
                      },
                      color: Colors.grey,
                      textcolor: Colors.white,
                      buttontext: buttons[index],
                    );
                  } else if (index == 1) {
                    return Mybutton(
                      buttontapped: () {
                        setState(() {
                          userquestion = userquestion.substring(
                              0, userquestion.length - 1);
                        });
                      },
                      color: Colors.grey,
                      textcolor: Colors.white,
                      buttontext: buttons[index],
                    );
                  } else if (index == 2) {
                    return Mybutton(
                      buttontapped: () {
                        setState(() {
                          userquestion += buttons[index];
                        });
                      },
                      color: Colors.grey,
                      textcolor: Colors.white,
                      buttontext: buttons[index],
                    );
                  } else if (index == buttons.length - 1) {
                    return Mybutton(
                      buttontapped: () {
                        setState(() {
                          equalpressed();
                        });
                      },
                      color: Colors.orange,
                      textcolor: Colors.white,
                      buttontext: buttons[index],
                    );
                  } else {
                    return Mybutton(
                      buttontapped: () {
                        setState(() {
                          userquestion += buttons[index];
                        });
                      },
                      color: isoperator(buttons[index])
                          ? Colors.orange
                          : Colors.grey[900],
                      textcolor: Colors.white,
                      buttontext: buttons[index],
                    );
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  bool isoperator(String x) {
    if (x == '/' || x == 'x' || x == '-' || x == '+' || x == '=') {
      return true;
    }
    return false;
  }

  void equalpressed() {
    String finalquestion = userquestion;
    finalquestion = finalquestion.replaceAll('x', '*');
    Parser p = Parser();
    Expression exp = p.parse(finalquestion);
    ContextModel cm = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cm);
    useranswer = eval.toString();
  }
}
