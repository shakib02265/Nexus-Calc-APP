import 'package:flutter/material.dart';
import 'translator_mode.dart';
import 'basic_mode.dart';
import 'scientific_mode.dart';
import 'currency_mode.dart';
import 'graph_mode.dart';
import 'toolkit_mode.dart';
class HomeScreen extends StatefulWidget {

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() =>
      _HomeScreenState();
}

class _HomeScreenState
    extends State<HomeScreen> {

  int currentIndex = 0;

  final List<Widget> screens = [

    const BasicMode(),

    const ScientificMode(),

    const CurrencyMode(),

    const GraphMode(),

    const TranslatorMode(),

    const ToolkitMode(),
  ];

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      body: screens[currentIndex],

      bottomNavigationBar: Container(

        margin: const EdgeInsets.only(
          left: 16,
          right: 16,
          bottom: 14,
        ),

        decoration: BoxDecoration(

          color: const Color(0xFF0F172A),

          borderRadius:
          BorderRadius.circular(30),

          boxShadow: [

            BoxShadow(

              color:
              Colors.black.withOpacity(0.08),

              blurRadius: 12,
            ),
          ],
        ),

        child: NavigationBar(

          height: 58,

          backgroundColor:
          Colors.transparent,

          elevation: 0,

          selectedIndex: currentIndex,

          onDestinationSelected: (index) {

            setState(() {

              currentIndex = index;
            });
          },

          indicatorColor:
          Colors.cyan.withOpacity(0.18),

          labelBehavior:
          NavigationDestinationLabelBehavior
              .alwaysShow,

          destinations: [

            /// BASIC
            NavigationDestination(

              icon: Icon(

                Icons.calculate,

                color: currentIndex == 0
                    ? Colors.cyanAccent
                    : Colors.white70,
              ),

              label: 'Basic',
            ),

            /// SCIENTIFIC
            NavigationDestination(

              icon: Icon(

                Icons.science,

                color: currentIndex == 1
                    ? Colors.cyanAccent
                    : Colors.white70,
              ),

              label: 'Sci',
            ),

            /// CURRENCY
            NavigationDestination(

              icon: Icon(

                Icons.currency_exchange,

                color: currentIndex == 2
                    ? Colors.cyanAccent
                    : Colors.white70,
              ),

              label: 'Currency',
            ),
            NavigationDestination(

              icon: Icon(

                Icons.show_chart,

                color: currentIndex == 3
                    ? Colors.cyanAccent
                    : Colors.white70,
              ),

              label: 'Graph',
            ),

            NavigationDestination(

              icon: Icon(

                Icons.translate,

                color:
                currentIndex == 4

                    ? Colors.cyanAccent

                    : Colors.white70,
              ),

              label: 'Translate',
            ),

            NavigationDestination(
              icon: Icon(
                Icons.school,
                color: currentIndex == 5
                    ? Colors.cyanAccent
                    : Colors.white70,
              ),
              label: 'Toolkit',
            ),
          ],
        ),
      ),
    );
  }
}