import 'package:flutter/material.dart';
import 'package:function_tree/function_tree.dart';

import '../widgets/calc_button.dart';
import 'settings_screen.dart';
class ScientificMode extends StatefulWidget {
  const ScientificMode({super.key});

  @override
  State<ScientificMode> createState() =>
      _ScientificModeState();
}

class _ScientificModeState
    extends State<ScientificMode> {

  String expression = '';
  String result = '0';

  bool isDeg = true;

  /// HISTORY
  List<String> history = [];

  void onButtonPressed(String value) {

    setState(() {

      /// CLEAR
      if (value == 'AC') {

        expression = '';
        result = '0';
      }

      /// DELETE
      else if (value == 'DEL') {

        if (expression.isNotEmpty) {

          expression = expression.substring(
            0,
            expression.length - 1,
          );
        }
      }

      /// CALCULATE
      else if (value == '=') {

        try {

          String exp = expression;

          exp = exp.replaceAll('×', '*');
          exp = exp.replaceAll('÷', '/');

          exp = exp.replaceAll(
            'π',
            '3.1415926535',
          );

          exp = exp.replaceAll(
            '√',
            'sqrt',
          );

          exp = exp.replaceAll(
            'x²',
            '^2',
          );

          /// DEG MODE
          if (isDeg) {

            exp = exp.replaceAllMapped(

              RegExp(r'sin\((.*?)\)'),

                  (match) {

                double value =
                double.parse(
                  match.group(1)!,
                );

                double radians =
                    value *
                        3.1415926535 /
                        180;

                return 'sin($radians)';
              },
            );

            exp = exp.replaceAllMapped(

              RegExp(r'cos\((.*?)\)'),

                  (match) {

                double value =
                double.parse(
                  match.group(1)!,
                );

                double radians =
                    value *
                        3.1415926535 /
                        180;

                return 'cos($radians)';
              },
            );

            exp = exp.replaceAllMapped(

              RegExp(r'tan\((.*?)\)'),

                  (match) {

                double value =
                double.parse(
                  match.group(1)!,
                );

                double radians =
                    value *
                        3.1415926535 /
                        180;

                return 'tan($radians)';
              },
            );
          }

          num eval =
          exp.interpret();

          if (eval
              .toString()
              .endsWith('.0')) {

            result = eval
                .toString()
                .replaceAll('.0', '');
          }

          else {

            result =
                eval.toString();
          }

          /// SAVE HISTORY
          history.insert(
            0,
            '$expression = $result',
          );

        } catch (e) {

          result = 'Error';
        }
      }

      /// SCIENTIFIC FUNCTIONS
      else if (value == 'sin') {

        expression += 'sin(';
      }

      else if (value == 'cos') {

        expression += 'cos(';
      }

      else if (value == 'tan') {

        expression += 'tan(';
      }

      else if (value == 'log') {

        expression += 'log(';
      }

      else if (value == 'ln') {

        expression += 'log(';
      }

      else if (value == '√') {

        expression += 'sqrt(';
      }

      else if (value == 'x²') {

        expression += '^2';
      }

      else {

        expression += value;
      }
    });
  }

  Widget buildRow(List<String> buttons) {

    return Row(

      children: buttons.map<Widget>((btn) {

        return CalcButton(

          text: btn,

          isOperator: [

            '/',
            '*',
            '-',
            '+',
            '=',
            '^',
            '√',

          ].contains(btn),

          onTap: () =>
              onButtonPressed(btn),
        );

      }).toList(),
    );
  }

  Widget section({

    required String title,
    required List<String> buttons,

  }) {

    return Container(

      margin:
      const EdgeInsets.only(
        bottom: 18,
      ),

      padding:
      const EdgeInsets.all(16),

      decoration:
      BoxDecoration(

        color: Colors.black,

        borderRadius:
        BorderRadius.circular(24),

        boxShadow: [

          BoxShadow(

            color:
            Colors.black.withOpacity(0.04),

            blurRadius: 8,
          ),
        ],
      ),

      child: Column(

        children: [

          const SizedBox(height: 12),

          Align(

            alignment:
            Alignment.centerLeft,

            child: Padding(

              padding:
              const EdgeInsets.only(

                left: 6,
                bottom: 14,
              ),

              child: Text(

                title,

                style: TextStyle(


                  color: Colors.cyanAccent,

                  fontSize: 13,

                  letterSpacing: 2,
                ),
              ),
            ),
          ),

          buildRow(buttons),
        ],
      ),
    );
  }

  void openHistorySheet() {

    showModalBottomSheet(

      context: context,

      backgroundColor:
      Colors.transparent,

      isScrollControlled: true,

      builder: (context) {

        return Container(

          height:
          MediaQuery.of(context)
              .size
              .height * 0.65,

          padding:
          const EdgeInsets.all(20),

          decoration:
          const BoxDecoration(

            color: Color(0xFF08111F),

            borderRadius:
            BorderRadius.vertical(

              top: Radius.circular(32),
            ),
          ),

          child: Column(

            children: [

              /// HEADER
              Row(

                mainAxisAlignment:
                MainAxisAlignment.spaceBetween,

                children: [

                  const Text(

                    'Calculation History',

                    style: TextStyle(

                      color:
                      Colors.cyanAccent,

                      fontSize: 22,

                      fontWeight:
                      FontWeight.bold,
                    ),
                  ),

                  IconButton(

                    onPressed: () {

                      setState(() {

                        history.clear();
                      });

                      Navigator.pop(context);
                    },

                    icon: const Icon(

                      Icons.delete_outline,

                      color:
                      Colors.white,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 20),

              /// HISTORY LIST
              Expanded(

                child: history.isEmpty

                    ? const Center(

                  child: Text(

                    'No calculations yet',

                    style: TextStyle(

                      color:
                      Colors.white54,
                    ),
                  ),
                )

                    : ListView.builder(

                  physics:
                  const BouncingScrollPhysics(),

                  itemCount:
                  history.length,

                  itemBuilder:
                      (context, index) {

                    final item =
                    history[index];

                    return GestureDetector(

                      onTap: () {

                        setState(() {

                          expression =
                              item
                                  .split('=')
                                  .first
                                  .trim();
                        });

                        Navigator.pop(context);
                      },

                      child: Container(

                        margin:
                        const EdgeInsets.only(
                          bottom: 14,
                        ),

                        padding:
                        const EdgeInsets.all(18),

                        decoration:
                        BoxDecoration(

                          color:
                          Colors.white
                              .withOpacity(
                            0.05,
                          ),

                          borderRadius:
                          BorderRadius.circular(
                            22,
                          ),

                            border: Border.all(
                              color: Colors.cyanAccent.withOpacity(0.35),
                              width: 1.5,
                            ),
                        ),

                        child: Row(

                          children: [

                            Container(

                              padding:
                              const EdgeInsets.all(
                                12,
                              ),

                              decoration:
                              BoxDecoration(

                                color:
                                Colors.cyanAccent
                                    .withOpacity(
                                  0.12,
                                ),

                                borderRadius:
                                BorderRadius.circular(
                                  14,
                                ),
                              ),

                              child: const Icon(

                                Icons.history,

                                color:
                                Colors.cyanAccent,
                              ),
                            ),

                            const SizedBox(width: 16),

                            Expanded(

                              child: Column(

                                crossAxisAlignment:
                                CrossAxisAlignment.start,

                                children: [

                                  Text(

                                    item,

                                    style:
                                    const TextStyle(

                                      color:
                                      Colors.white,

                                      fontSize: 15,

                                      fontWeight:
                                      FontWeight.w600,
                                    ),
                                  ),

                                  const SizedBox(
                                    height: 4,
                                  ),

                                  const Text(

                                    'Tap to reuse',

                                    style: TextStyle(

                                      color:
                                      Colors.white38,

                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {

    final height =
        MediaQuery.of(context)
            .size
            .height;

    final width =
        MediaQuery.of(context)
            .size
            .width;

    return Scaffold(

      backgroundColor:
      const Color(0xFF050A14),

      body: SafeArea(

        child: Column(

          children: [

            /// TOP
            Padding(

              padding:
              const EdgeInsets.all(16),

              child: Column(

                children: [

                  /// HEADER
                  Row(

                    mainAxisAlignment:
                    MainAxisAlignment
                        .spaceBetween,

                    children: [

                      IconButton(

                        onPressed:
                        openHistorySheet,

                        splashRadius: 28,

                        icon: Container(

                          padding:
                          const EdgeInsets.all(10),

                          decoration: BoxDecoration(


                            color: const Color(0xFF08111F),

                            borderRadius:
                            BorderRadius.circular(14),

                            boxShadow: [

                              BoxShadow(

                                color:
                                Colors.cyanAccent.withOpacity(0.18),

                                blurRadius: 12,

                                spreadRadius: 1,
                              ),
                            ],
                          ),

                          child: const Icon(

                            Icons.history_rounded,

                            color:
                            Colors.cyanAccent,

                            size: 22,
                          ),
                        ),
                      ),

                      Text(
                        'SCIENTIFIC CALC',
                        style: TextStyle(
                          color: Colors.cyanAccent,
                          fontSize: width * 0.055,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 2,
                        ),
                      ),

                      const Icon(
                        Icons.settings,
                      ),
                    ],
                  ),

                  const SizedBox(
                    height: 18,
                  ),

                  /// DISPLAY
                  Container(

                    height: 210,

                    width:
                    double.infinity,

                    padding:
                    const EdgeInsets.all(
                      20,
                    ),

                    decoration:
                    BoxDecoration(

                      color: const Color(0xFF08111F),

                      borderRadius:
                      BorderRadius.circular(
                        28,
                      ),

                      border: Border.all(
                        color: Colors
                            .cyan
                            .shade100,
                      ),
                    ),

                    child: Column(

                      crossAxisAlignment:
                      CrossAxisAlignment
                          .end,

                      children: [

                        /// DEG RAD
                        Row(

                          mainAxisAlignment:
                          MainAxisAlignment.end,

                          children: [

                            GestureDetector(

                              onTap: () {

                                setState(() {

                                  isDeg = true;
                                });
                              },

                              child: Container(

                                padding:
                                const EdgeInsets.symmetric(

                                  horizontal: 12,
                                  vertical: 6,
                                ),

                                decoration:
                                BoxDecoration(

                                  borderRadius:
                                  BorderRadius.circular(
                                    10,
                                  ),

                                  color: isDeg

                                      ? Colors.cyan
                                      .withOpacity(
                                    0.15,
                                  )

                                      : Colors.transparent,

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

                                    fontSize: 12,
                                  ),
                                ),
                              ),
                            ),

                            const SizedBox(width: 8),

                            GestureDetector(

                              onTap: () {

                                setState(() {

                                  isDeg = false;
                                });
                              },

                              child: Container(

                                padding:
                                const EdgeInsets.symmetric(

                                  horizontal: 12,
                                  vertical: 6,
                                ),

                                decoration:
                                BoxDecoration(

                                  borderRadius:
                                  BorderRadius.circular(
                                    10,
                                  ),

                                  color: !isDeg

                                      ? Colors.cyan
                                      .withOpacity(
                                    0.15,
                                  )

                                      : Colors.transparent,

                                  border: Border.all(

                                    color: !isDeg

                                        ? Colors.cyanAccent

                                        : Colors.grey,
                                  ),
                                ),

                                child: Text(

                                  'RAD',

                                  style: TextStyle(

                                    color: !isDeg

                                        ? Colors.cyanAccent

                                        : Colors.grey,

                                    fontSize: 12,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),

                        const Spacer(),

                        /// EXPRESSION
                        SingleChildScrollView(

                          scrollDirection:
                          Axis.horizontal,

                          reverse: true,

                          child: Text(

                            expression.isEmpty
                                ? '0'
                                : expression,

                            style: TextStyle(

                              fontSize:
                              width * 0.07,

                              color:
                              Colors.cyanAccent,
                            ),
                          ),
                        ),

                        const SizedBox(height: 12),

                        /// RESULT
                        SizedBox(

                          height: 70,

                          child: Align(

                            alignment:
                            Alignment.bottomRight,

                            child: FittedBox(

                              fit:
                              BoxFit.scaleDown,

                              child: Text(

                                result,

                                maxLines: 1,

                                overflow:
                                TextOverflow
                                    .ellipsis,

                                style: TextStyle(

                                  fontSize:
                                  width * 0.11,

                                  fontWeight:
                                  FontWeight.bold,

                                  color:
                                  Colors.cyanAccent,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            /// BUTTON AREA
            Expanded(

              child:
              SingleChildScrollView(

                padding:
                const EdgeInsets.symmetric(
                  horizontal: 16,
                ),

                child: Column(

                  children: [

                    section(

                      title:
                      'TRIGONOMETRIC',

                      buttons: [
                        'sin',
                        'cos',
                        'tan',
                        'deg',
                      ],
                    ),

                    section(

                      title:
                      'FUNCTIONS & LOGS',

                      buttons: [
                        'log',
                        'ln',
                        'sinh',
                        'cosh',
                      ],
                    ),

                    section(

                      title:
                      'CONSTANTS & ROOTS',

                      buttons: [
                        'π',
                        'e',
                        '√',
                        '^',
                      ],
                    ),

                    section(

                      title:
                      'BRACKETS & POWER',

                      buttons: [
                        '(',
                        ')',
                        'x²',
                        '!',
                      ],
                    ),

                    buildRow([
                      'AC',
                      'DEL',
                      '%',
                      '/',
                    ]),

                    buildRow([
                      '7',
                      '8',
                      '9',
                      '*',
                    ]),

                    buildRow([
                      '4',
                      '5',
                      '6',
                      '-',
                    ]),

                    buildRow([
                      '1',
                      '2',
                      '3',
                      '+',
                    ]),

                    buildRow([
                      '0',
                      '.',
                      '=',
                    ]),

                    SizedBox(
                      height:
                      height * 0.12,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}