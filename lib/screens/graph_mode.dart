import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:function_tree/function_tree.dart';
import 'dart:math';
class GraphMode extends StatefulWidget {
  const GraphMode({super.key});

  @override
  State<GraphMode> createState() => _GraphModeState();
}

class _GraphModeState extends State<GraphMode> {
  final TextEditingController equationController =
  TextEditingController(text: 'x*x');

  List<FlSpot> points = [];

  double minY = -10;
  double maxY = 10;

  @override
  void initState() {
    super.initState();
    generateGraph();
  }

  void generateGraph() {

    points.clear();

    double smallest = double.infinity;
    double largest = -double.infinity;

    try {

      String equation =
      equationController.text
          .trim()
          .toLowerCase();

      for (
      double x = -10;
      x <= 10;
      x += 0.05
      ) {

        try {

          double y;

          if (equation == 'sin(x)') {

            y = sin(x);
          }

          else if (equation == 'cos(x)') {

            y = cos(x);
          }

          else if (equation == 'tan(x)') {

            y = tan(x);
          }

          else if (
          equation ==
              'sin(x)+cos(x)'
          ) {

            y =
                sin(x) +
                    cos(x);
          }

          else if (
          equation ==
              'sin(x)-cos(x)'
          ) {

            y =
                sin(x) -
                    cos(x);
          }

          else if (
          equation ==
              'x*sin(x)'
          ) {

            y =
                x * sin(x);
          }

          else {

            String exp =
            equation.replaceAll(
              'x',
              '($x)',
            );

            y =
                exp
                    .interpret()
                    .toDouble();
          }

          if (
          y.isFinite &&
              y.abs() < 10000
          ) {

            points.add(
              FlSpot(x, y),
            );

            if (y < smallest) {
              smallest = y;
            }

            if (y > largest) {
              largest = y;
            }
          }

        } catch (_) {}
      }

      minY = smallest - 1;
      maxY = largest + 1;

      setState(() {});

    } catch (e) {

      debugPrint(
        e.toString(),
      );
    }
  }

  Widget functionChip(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 8,
      ),
      decoration: BoxDecoration(
        color: Colors.cyanAccent.withOpacity(0.08),
        borderRadius: BorderRadius.circular(30),
        border: Border.all(
          color: Colors.cyanAccent.withOpacity(0.25),
        ),
      ),
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.white70,
          fontWeight: FontWeight.w500,
          fontSize: 13,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF050A14),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              const SizedBox(height: 10),

              const Text(
                "GRAPH MAKER",
                style: TextStyle(
                  color: Colors.cyanAccent,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1,
                ),
              ),

              const SizedBox(height: 20),

              TextField(
                controller: equationController,
                style: const TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  hintText: 'Example: x*x+2*x-5',
                  hintStyle:
                  const TextStyle(color: Colors.white54),
                  filled: true,
                  fillColor: const Color(0xFF08111F),
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 18,
                    vertical: 16,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(
                      color:
                      Colors.cyanAccent.withOpacity(0.15),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 15),

              SizedBox(
                width: double.infinity,
                height: 55,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.cyanAccent,
                    foregroundColor: Colors.black,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius:
                      BorderRadius.circular(16),
                    ),
                  ),
                  onPressed: generateGraph,
                  child: const Text(
                    "Generate Graph",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 20),

              /// PROFESSIONAL SUPPORTED FUNCTIONS CARD
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: const Color(0xFF08111F),
                  borderRadius: BorderRadius.circular(18),
                  border: Border.all(
                    color:
                    Colors.cyanAccent.withOpacity(0.15),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color:
                      Colors.cyanAccent.withOpacity(0.04),
                      blurRadius: 12,
                      spreadRadius: 1,
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment:
                  CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: const [
                        Icon(
                          Icons.functions_rounded,
                          color: Colors.cyanAccent,
                          size: 22,
                        ),
                        SizedBox(width: 8),
                        Text(
                          "Supported Functions",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 6),

                    const Text(
                      "Enter any mathematical expression using x",
                      style: TextStyle(
                        color: Colors.white54,
                        fontSize: 12,
                      ),
                    ),

                    const SizedBox(height: 14),

                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: [
                        functionChip("x*x"),
                        functionChip("x*x+2*x-5"),
                        functionChip("sin(x)"),
                        functionChip("cos(x)"),
                        functionChip("tan(x)"),
                        functionChip("sin(x)+cos(x)"),
                        functionChip("x*sin(x)"),
                        functionChip("sqrt(x*x)"),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: const Color(0xFF08111F),
                    borderRadius:
                    BorderRadius.circular(20),
                  ),
                  child: LineChart(
                    LineChartData(
                      minX: -10,
                      maxX: 10,
                      minY: minY,
                      maxY: maxY,

                      gridData: const FlGridData(
                        show: true,
                      ),

                      borderData: FlBorderData(
                        show: true,
                      ),

                      titlesData: const FlTitlesData(
                        show: true,
                      ),

                      lineBarsData: [
                        LineChartBarData(
                          spots: points,
                          isCurved: false,
                          color: Colors.cyanAccent,
                          barWidth: 3,
                          dotData: const FlDotData(
                            show: false,
                          ),
                        ),
                      ],
                    ),
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