import 'package:flutter/material.dart';
import 'package:function_tree/function_tree.dart';

import '../widgets/calc_button.dart';
import 'settings_screen.dart';
import '../theme/theme_manager.dart';
class BasicMode extends StatefulWidget {

  const BasicMode({super.key});

  @override
  State<BasicMode> createState() =>
      _BasicModeState();
}

class _BasicModeState
    extends State<BasicMode> {

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
      else if (value == '⌫') {

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

          exp = exp.replaceAll('%', '/100');

          exp = exp.replaceAll(
            'π',
            '3.1415926535',
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

          /// CALCULATE
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

          ].contains(btn),

          onTap: () =>
              onButtonPressed(btn),
        );

      }).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {

    final width =
        MediaQuery.of(context)
            .size
            .width;

    return Scaffold(

      backgroundColor:
      const Color(0xFF050A14),

      /// HISTORY DRAWER
      drawer: Drawer(

        backgroundColor:
        const Color(0xFF08111F),

        child: SafeArea(

          child: Column(

            children: [

              Padding(

                padding:
                const EdgeInsets.all(20),

                child: Row(

                  mainAxisAlignment:
                  MainAxisAlignment
                      .spaceBetween,

                  children: [

                    const Text(

                      'History',

                      style: TextStyle(

                        color:
                        Colors.cyanAccent,

                        fontSize: 24,

                        fontWeight:
                        FontWeight.bold,
                      ),
                    ),

                    IconButton(

                      onPressed: () {

                        setState(() {

                          history.clear();
                        });
                      },

                      icon: const Icon(

                        Icons.delete,

                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),

              const Divider(
                color: Colors.white24,
              ),

              Expanded(

                child: history.isEmpty

                    ? const Center(

                  child: Text(

                    'No History',

                    style: TextStyle(

                      color:
                      Colors.white54,
                    ),
                  ),
                )

                    : ListView.builder(

                  itemCount:
                  history.length,

                  itemBuilder:
                      (context, index) {

                    return ListTile(

                      title: Text(

                        history[index],

                        style:
                        const TextStyle(

                          color:
                          Colors.white,
                        ),
                      ),

                      onTap: () {

                        String item =
                        history[index];

                        expression =
                            item
                                .split('=')
                                .first
                                .trim();

                        Navigator.pop(
                          context,
                        );

                        setState(() {});
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),

      body: SafeArea(

        child: Padding(

          padding:
          const EdgeInsets.symmetric(

            horizontal: 18,
            vertical: 10,
          ),

          child: Column(

            children: [

              /// TOP BAR
              Row(

                mainAxisAlignment:
                MainAxisAlignment
                    .spaceBetween,

                children: [

                  Builder(

                    builder: (context) {

                      return IconButton(

                        onPressed: () {

                          Scaffold.of(context)
                              .openDrawer();
                        },

                        icon: const Icon(

                          Icons.menu,

                          color: Colors.white,
                        ),
                      );
                    },
                  ),

                  ValueListenableBuilder<Color>(

                    valueListenable:
                    ThemeManager.primaryColor,

                    builder: (context, color, child) {

                      return Text(

                        'NEXUS CALC',

                        style: TextStyle(

                          color: color,

                          fontSize:
                          width * 0.055,

                          fontWeight:
                          FontWeight.bold,

                          letterSpacing: 2,
                        ),
                      );
                    },
                  ),
                  IconButton(

                    onPressed: () {

                      Navigator.push(

                        context,

                        MaterialPageRoute(

                          builder: (context) =>
                          const SettingsScreen(),
                        ),
                      );
                    },

                    icon: const Icon(

                      Icons.settings,

                      color: Colors.white,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 18),

              /// DISPLAY
              Container(

                height: 210,

                width: double.infinity,

                padding:
                const EdgeInsets.all(22),

                decoration:
                BoxDecoration(

                  gradient:
                  const LinearGradient(

                    colors: [

                      Color(0xFF0E1A2B),

                      Color(0xFF08111F),
                    ],

                    begin:
                    Alignment.topLeft,

                    end:
                    Alignment.bottomRight,
                  ),

                  borderRadius:
                  BorderRadius.circular(
                    28,
                  ),

                  border: Border.all(

                    color:
                    Colors.cyan
                        .withOpacity(0.2),

                    width: 1,
                  ),
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

                          onTap: () {

                            setState(() {

                              isDeg = true;
                            });
                          },

                          child: Container(

                            padding:
                            const EdgeInsets.symmetric(

                              horizontal: 14,
                              vertical: 7,
                            ),

                            decoration:
                            BoxDecoration(

                              borderRadius:
                              BorderRadius.circular(
                                10,
                              ),

                              color: isDeg

                                  ? Colors.cyan
                                  .withOpacity(0.15)

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

                                    ? ThemeManager.primaryColor.value

                                    : Colors.grey,
                              ),
                            ),
                          ),
                        ),

                        const SizedBox(width: 10),

                        GestureDetector(

                          onTap: () {

                            setState(() {

                              isDeg = false;
                            });
                          },

                          child: Container(

                            padding:
                            const EdgeInsets.symmetric(

                              horizontal: 14,
                              vertical: 7,
                            ),

                            decoration:
                            BoxDecoration(

                              borderRadius:
                              BorderRadius.circular(
                                10,
                              ),

                              color: !isDeg

                                  ? Colors.cyan
                                  .withOpacity(0.15)

                                  : Colors.transparent,

                              border: Border.all(

                                color: !isDeg

                                    ? ThemeManager.primaryColor.value

                                    : Colors.grey,
                              ),
                            ),

                            child: Text(

                              'RAD',

                              style: TextStyle(

                                color: !isDeg

                                    ? ThemeManager.primaryColor.value

                                    : Colors.grey,
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
                          width * 0.06,

                          color:
                          Colors.white70,
                        ),
                      ),
                    ),

                    const SizedBox(height: 14),

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

                            style: TextStyle(

                              fontSize:
                              width * 0.13,

                              color:
                              ThemeManager.primaryColor.value,
                              fontWeight:
                              FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 16),

              /// BUTTON AREA
              Expanded(

                child:
                SingleChildScrollView(

                  child: Column(

                    children: [

                      /// ROW 1
                      buildRow([
                        'AC',
                        '⌫',
                        '%',
                        '/',
                      ]),

                      /// ROW 2
                      buildRow([
                        '7',
                        '8',
                        '9',
                        '*',
                      ]),

                      /// ROW 3
                      buildRow([
                        '4',
                        '5',
                        '6',
                        '-',
                      ]),

                      /// ROW 4
                      buildRow([
                        '1',
                        '2',
                        '3',
                        '+',
                      ]),

                      const SizedBox(height: 14),

                      /// BOTTOM
                      Row(

                        children: [

                          Expanded(

                            child: CalcButton(

                              text: '0',

                              onTap: () =>
                                  onButtonPressed(
                                    '0',
                                  ),
                            ),
                          ),

                          const SizedBox(width: 12),

                          Expanded(

                            child: CalcButton(

                              text: '.',

                              onTap: () =>
                                  onButtonPressed(
                                    '.',
                                  ),
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 16),

                      /// EQUAL BUTTON
                      Container(

                        height: 74,

                        width:
                        double.infinity,

                        decoration:
                        BoxDecoration(

                          borderRadius:
                          BorderRadius.circular(
                            24,
                          ),

                          gradient:
                          const LinearGradient(

                            colors: [

                              Color(0xFF00E5FF),

                              Color(0xFF00B8D4),
                            ],
                          ),

                          boxShadow: [

                            BoxShadow(

                              color:
                              Colors.cyanAccent
                                  .withOpacity(
                                0.35,
                              ),

                              blurRadius: 20,

                              spreadRadius: 1,
                            ),
                          ],
                        ),

                        child: Material(

                          color:
                          Colors.transparent,

                          child: InkWell(

                            borderRadius:
                            BorderRadius.circular(
                              24,
                            ),

                            onTap: () =>
                                onButtonPressed(
                                  '=',
                                ),

                            child: const Center(

                              child: Text(

                                '=',

                                style: TextStyle(

                                  color:
                                  Colors.black,

                                  fontSize: 34,

                                  fontWeight:
                                  FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 90),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}