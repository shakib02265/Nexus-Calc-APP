import 'dart:ui';

import 'package:flutter/material.dart';

import '../services/calculator_service.dart';
import '../widgets/calc_button.dart';

class CalculatorScreen extends StatefulWidget {

  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() =>
      _CalculatorScreenState();
}

class _CalculatorScreenState
    extends State<CalculatorScreen> {

  String input = '';
  String result = '0';

  bool isDeg = true;

  void onButtonClick(String value) {

    setState(() {

      if (value == 'AC') {

        input = '';
        result = '0';

      } else if (value == 'DEL') {

        if (input.isNotEmpty) {

          input =
              input.substring(0, input.length - 1);
        }

      } else if (value == '=') {

        result =
            CalculatorService.calculate(input);

      } else if (value == 'DEG') {

        isDeg = true;

      } else if (value == 'RAD') {

        isDeg = false;

      } else {

        input += value;
      }
    });
  }

  Widget buildRow(List<String> buttons) {

    return Row(

      children: buttons.map<Widget>((button) {

        bool isOperator = [

          '/',
          '*',
          '-',
          '+',
          '=',
          '^',
          '√',

        ].contains(button);

        return CalcButton(

          text: button,

          isOperator: isOperator,

          onTap: () =>
              onButtonClick(button),
        );

      }).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      body: Container(

        decoration: const BoxDecoration(

          gradient: LinearGradient(

            colors: [

              Color(0xFF050A14),
              Color(0xFF09111F),
              Color(0xFF020611),

            ],

            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),

        child: SafeArea(

          child: SingleChildScrollView(

            child: Padding(

              padding: const EdgeInsets.all(18),

              child: Column(

                children: [

                  /// TOP BAR
                  Row(

                    mainAxisAlignment:
                    MainAxisAlignment.spaceBetween,

                    children: const [

                      Icon(
                        Icons.menu,
                        color: Colors.white,
                      ),

                      Text(

                        'NEXUS CALC',

                        style: TextStyle(

                          color: Colors.cyanAccent,

                          fontSize: 24,

                          fontWeight: FontWeight.bold,

                          letterSpacing: 3,
                        ),
                      ),

                      Icon(
                        Icons.settings,
                        color: Colors.white,
                      ),
                    ],
                  ),

                  const SizedBox(height: 30),

                  /// GLASS DISPLAY
                  ClipRRect(

                    borderRadius:
                    BorderRadius.circular(36),

                    child: BackdropFilter(

                      filter: ImageFilter.blur(
                        sigmaX: 12,
                        sigmaY: 12,
                      ),

                      child: Container(

                        height: 260,

                        width: double.infinity,

                        padding:
                        const EdgeInsets.all(24),

                        decoration: BoxDecoration(

                          color:
                          Colors.white.withOpacity(0.05),

                          borderRadius:
                          BorderRadius.circular(36),

                          border: Border.all(

                            color:
                            Colors.cyan.withOpacity(0.2),
                          ),

                          boxShadow: [

                            BoxShadow(

                              color:
                              Colors.cyan.withOpacity(0.1),

                              blurRadius: 20,

                              spreadRadius: 2,
                            ),
                          ],
                        ),

                        child: Column(

                          crossAxisAlignment:
                          CrossAxisAlignment.end,

                          children: [

                            /// DEG RAD
                            Row(

                              mainAxisAlignment:
                              MainAxisAlignment.end,

                              children: [

                                GestureDetector(

                                  onTap: () =>
                                      onButtonClick('DEG'),

                                  child: Container(

                                    padding:
                                    const EdgeInsets.symmetric(

                                      horizontal: 14,
                                      vertical: 8,
                                    ),

                                    decoration: BoxDecoration(

                                      borderRadius:
                                      BorderRadius.circular(10),

                                      border: Border.all(

                                        color: isDeg
                                            ? Colors.cyanAccent
                                            : Colors.grey,
                                      ),
                                    ),

                                    child: Text(

                                      'DEG',

                                      style: TextStyle(

                                        color: isDeg
                                            ? Colors.cyanAccent
                                            : Colors.grey,
                                      ),
                                    ),
                                  ),
                                ),

                                const SizedBox(width: 14),

                                GestureDetector(

                                  onTap: () =>
                                      onButtonClick('RAD'),

                                  child: Text(

                                    'RAD',

                                    style: TextStyle(

                                      color: !isDeg
                                          ? Colors.cyanAccent
                                          : Colors.grey,
                                    ),
                                  ),
                                ),
                              ],
                            ),

                            const Spacer(),

                            /// EXPRESSION
                            Text(

                              input,

                              style: const TextStyle(

                                fontSize: 36,

                                color: Colors.white70,
                              ),
                            ),

                            const SizedBox(height: 20),

                            /// RESULT
                            Text(

                              result,

                              style: const TextStyle(

                                fontSize: 64,

                                color: Colors.cyanAccent,

                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 24),

                  /// SCIENTIFIC ROWS
                  buildRow([
                    'sin',
                    'cos',
                    'tan',
                    '√'
                  ]),

                  buildRow([
                    'log',
                    'ln',
                    '^',
                    '%'
                  ]),

                  buildRow([
                    'π',
                    'e',
                    '(',
                    ')'
                  ]),

                  const SizedBox(height: 10),

                  /// MAIN CALCULATOR
                  buildRow([
                    'AC',
                    'DEL',
                    '%',
                    '/'
                  ]),

                  buildRow([
                    '7',
                    '8',
                    '9',
                    '*'
                  ]),

                  buildRow([
                    '4',
                    '5',
                    '6',
                    '-'
                  ]),

                  buildRow([
                    '1',
                    '2',
                    '3',
                    '+'
                  ]),

                  buildRow([
                    '0',
                    '.',
                    '=',
                  ]),

                  const SizedBox(height: 30),

                  /// BOTTOM NAV
                  Container(

                    padding:
                    const EdgeInsets.symmetric(
                      vertical: 14,
                    ),

                    decoration: BoxDecoration(

                      color:
                      Colors.white.withOpacity(0.05),

                      borderRadius:
                      BorderRadius.circular(40),

                      border: Border.all(

                        color:
                        Colors.white.withOpacity(0.08),
                      ),
                    ),

                    child: const Row(

                      mainAxisAlignment:
                      MainAxisAlignment.spaceEvenly,

                      children: [

                        Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [

                            Icon(
                              Icons.calculate,
                              color: Colors.cyanAccent,
                            ),

                            SizedBox(height: 4),

                            Text(
                              'Basic',
                              style: TextStyle(
                                color: Colors.cyanAccent,
                              ),
                            ),
                          ],
                        ),

                        Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [

                            Icon(Icons.science),

                            SizedBox(height: 4),

                            Text('Sci'),
                          ],
                        ),

                        Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [

                            Icon(Icons.show_chart),

                            SizedBox(height: 4),

                            Text('Graph'),
                          ],
                        ),

                        Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [

                            Icon(Icons.functions),

                            SizedBox(height: 4),

                            Text('Solver'),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}