import 'package:flutter/material.dart';

class StatisticsScreen extends StatefulWidget {
  const StatisticsScreen({super.key});

  @override
  State<StatisticsScreen> createState() =>
      _StatisticsScreenState();
}

class _StatisticsScreenState
    extends State<StatisticsScreen> {

  final TextEditingController
  inputController =
  TextEditingController();

  String result = '';

  void calculateStatistics() {

    try {

      List<double> numbers =
      inputController.text
          .split(',')
          .map(
            (e) => double.parse(
          e.trim(),
        ),
      )
          .toList();

      if (numbers.isEmpty) return;

      numbers.sort();

      double mean =
          numbers.reduce(
                (a, b) => a + b,
          ) /
              numbers.length;

      double median;

      if (numbers.length % 2 == 0) {

        median =
            (numbers[
            numbers.length ~/ 2 -
                1] +
                numbers[
                numbers.length ~/ 2]) /
                2;
      } else {

        median = numbers[
        numbers.length ~/ 2];
      }

      double min =
          numbers.first;

      double max =
          numbers.last;

      double range =
          max - min;

      Map<double, int> frequency =
      {};

      for (var n in numbers) {

        frequency[n] =
            (frequency[n] ?? 0) + 1;
      }

      // মোড বের করার অংশটি এভাবে আপডেট করুন
      double? mode;
      int highest = 0;
      bool hasMode = false;

      frequency.forEach((key, value) {
        if (value > highest && value > 1) { // শুধুমাত্র ১-এর বেশিবার থাকলে মোড ধরবে
          highest = value;
          mode = key;
          hasMode = true;
        }
      });

      String modeText = hasMode ? mode!.toStringAsFixed(2) : "No mode";



      setState(() {

        result =

        "Count : ${numbers.length}\n\n"

            "Mean : ${mean.toStringAsFixed(2)}\n"

            "Median : ${median.toStringAsFixed(2)}\n"

            "Mode : $modeText\n"

            "Minimum : ${min.toStringAsFixed(2)}\n"

            "Maximum : ${max.toStringAsFixed(2)}\n"

            "Range : ${range.toStringAsFixed(2)}";
      });
    }

    catch (e) {

      setState(() {

        result =
        "Invalid input.\n\nExample:\n10,20,30,40";
      });
    }
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      backgroundColor:
      const Color(0xFF050A14),

      appBar: AppBar(

        backgroundColor:
        const Color(
          0xFF050A14,
        ),

        title: const Text(

          "Statistics",

          style: TextStyle(
            color:
            Colors.cyanAccent,
          ),
        ),
      ),

      body: SingleChildScrollView(

        padding:
        const EdgeInsets.all(16),

        child: Column(

          children: [

            Container(

              padding:
              const EdgeInsets.all(
                16,
              ),

              decoration:
              BoxDecoration(

                color:
                const Color(
                  0xFF08111F,
                ),

                borderRadius:
                BorderRadius.circular(
                  20,
                ),
              ),

              child: TextField(

                controller:
                inputController,

                maxLines: 4,

                style:
                const TextStyle(
                  color:
                  Colors.white,
                ),

                decoration:
                const InputDecoration(

                  border:
                  InputBorder.none,

                  hintText:

                  "Enter numbers separated by commas\n\nExample:\n10,20,30,40,50",

                  hintStyle:
                  TextStyle(
                    color:
                    Colors.white54,
                  ),
                ),
              ),
            ),

            const SizedBox(
              height: 20,
            ),

            SizedBox(

              width:
              double.infinity,

              height: 55,

              child:
              ElevatedButton(

                style:
                ElevatedButton
                    .styleFrom(

                  backgroundColor:
                  Colors
                      .cyanAccent,

                  foregroundColor:
                  Colors.black,
                ),

                onPressed:
                calculateStatistics,

                child: const Text(

                  "Calculate",

                  style: TextStyle(
                    fontSize: 16,
                    fontWeight:
                    FontWeight.bold,
                  ),
                ),
              ),
            ),

            const SizedBox(
              height: 20,
            ),

            Container(

              width:
              double.infinity,

              padding:
              const EdgeInsets.all(
                20,
              ),

              decoration:
              BoxDecoration(

                color:
                const Color(
                  0xFF08111F,
                ),

                borderRadius:
                BorderRadius.circular(
                  20,
                ),

                border: Border.all(
                  color:
                  Colors.cyanAccent,
                ),
              ),

              child: Text(

                result.isEmpty

                    ? "Results will appear here"

                    : result,

                style:
                const TextStyle(

                  color:
                  Colors.white,

                  fontSize: 18,

                  height: 1.6,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}