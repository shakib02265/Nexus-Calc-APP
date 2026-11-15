import 'dart:math';
import 'package:flutter/material.dart';

class ComplexNumberScreen extends StatefulWidget {
  const ComplexNumberScreen({super.key});

  @override
  State<ComplexNumberScreen> createState() =>
      _ComplexNumberScreenState();
}

class _ComplexNumberScreenState
    extends State<ComplexNumberScreen> {

  final TextEditingController aController =
  TextEditingController();

  final TextEditingController bController =
  TextEditingController();

  final TextEditingController cController =
  TextEditingController();

  final TextEditingController dController =
  TextEditingController();

  String operation = "Addition";

  String result = "";

  void calculate() {

    double a =
        double.tryParse(
          aController.text,
        ) ??
            0;

    double b =
        double.tryParse(
          bController.text,
        ) ??
            0;

    double c =
        double.tryParse(
          cController.text,
        ) ??
            0;

    double d =
        double.tryParse(
          dController.text,
        ) ??
            0;

    if (operation == "Addition") {

      double real = a + c;
      double imag = b + d;

      setState(() {

        result =
        "${real.toStringAsFixed(2)} "
            "+ "
            "${imag.toStringAsFixed(2)}i";
      });
    }

    else if (operation == "Subtraction") {

      double real = a - c;
      double imag = b - d;

      setState(() {

        result =
        "${real.toStringAsFixed(2)} "
            "+ "
            "${imag.toStringAsFixed(2)}i";
      });
    }

    else if (operation == "Multiplication") {

      double real =
          (a * c) -
              (b * d);

      double imag =
          (a * d) +
              (b * c);

      setState(() {

        result =
        "${real.toStringAsFixed(2)} "
            "+ "
            "${imag.toStringAsFixed(2)}i";
      });
    }

    else if (operation == "Division") {

      double denominator =
          (c * c) +
              (d * d);

      if (denominator == 0) {

        setState(() {
          result =
          "Cannot divide by zero";
        });

        return;
      }

      double real =
          ((a * c) +
              (b * d)) /
              denominator;

      double imag =
          ((b * c) -
              (a * d)) /
              denominator;

      setState(() {

        result =
        "${real.toStringAsFixed(2)} "
            "+ "
            "${imag.toStringAsFixed(2)}i";
      });
    }

    else if (operation == "Magnitude") {

      double mag =
      sqrt(
        a * a +
            b * b,
      );

      setState(() {

        result =
            mag.toStringAsFixed(4);
      });
    }
    else if (
    operation ==
        "Argument"
    ) {

      double angle =

          atan2(
            b,
            a,
          ) *
              180 /
              pi;

      setState(() {

        result =

        "θ = "

            "${angle.toStringAsFixed(2)}°";
      });
    }
    else if (
    operation ==
        "Polar Form"
    ) {

      double r =

      sqrt(
        a * a +
            b * b,
      );

      double theta =

          atan2(
            b,
            a,
          ) *
              180 /
              pi;

      setState(() {

        result =

        "r = ${r.toStringAsFixed(4)}\n\n"

            "θ = ${theta.toStringAsFixed(2)}°";
      });
    }

    else if (operation == "Conjugate") {

      setState(() {

        result =
        "${a.toStringAsFixed(2)} "
            "- "
            "${b.toStringAsFixed(2)}i";
      });
    }
  }

  Widget buildField(
      TextEditingController controller,
      String label,
      ) {

    return TextField(

      controller: controller,

      keyboardType:
      TextInputType.number,

      style: const TextStyle(
        color: Colors.white,
      ),

      decoration: InputDecoration(

        labelText: label,

        labelStyle:
        const TextStyle(
          color: Colors.white70,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      backgroundColor:
      const Color(0xFF050A14),

      appBar: AppBar(

        backgroundColor:
        const Color(0xFF050A14),

        title: const Text(

          "Complex Number",

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

            const Text(
              "Complex A",
              style: TextStyle(
                color:
                Colors.cyanAccent,
                fontSize: 18,
              ),
            ),

            buildField(
              aController,
              "Real Part (a)",
            ),

            buildField(
              bController,
              "Imaginary Part (b)",
            ),

            const SizedBox(
              height: 20,
            ),

            const Text(
              "Complex B",
              style: TextStyle(
                color:
                Colors.cyanAccent,
                fontSize: 18,
              ),
            ),

            buildField(
              cController,
              "Real Part (c)",
            ),

            buildField(
              dController,
              "Imaginary Part (d)",
            ),

            const SizedBox(
              height: 20,
            ),

            DropdownButtonFormField<String>(

              value: operation,

              dropdownColor:
              const Color(
                0xFF08111F,
              ),

              items: const [

                DropdownMenuItem(
                  value: "Addition",
                  child:
                  Text("Addition"),
                ),

                DropdownMenuItem(
                  value: "Subtraction",
                  child:
                  Text("Subtraction"),
                ),

                DropdownMenuItem(
                  value:
                  "Multiplication",
                  child: Text(
                    "Multiplication",
                  ),
                ),

                DropdownMenuItem(
                  value: "Division",
                  child:
                  Text("Division"),
                ),

                DropdownMenuItem(
                  value:
                  "Magnitude",
                  child:
                  Text("Magnitude"),
                ),


                DropdownMenuItem(
                  value: "Argument",
                  child: Text(
                    "Argument (θ)",
                  ),
                ),
                DropdownMenuItem(
                  value: "Polar Form",
                  child: Text(
                    "Polar Form",
                  ),
                ),
                DropdownMenuItem(
                  value:
                  "Conjugate",
                  child:
                  Text("Conjugate"),
                ),
              ],

              onChanged: (value) {

                setState(() {

                  operation =
                  value!;
                });
              },
            ),

            const SizedBox(
              height: 20,
            ),

            ElevatedButton(

              onPressed:
              calculate,

              child:
              const Text(
                "Calculate",
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
              ),

              child: Text(

                result.isEmpty
                    ? "Result"
                    : result,

                style:
                const TextStyle(

                  color:
                  Colors.cyanAccent,

                  fontSize: 22,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}