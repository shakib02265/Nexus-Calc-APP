import 'package:flutter/material.dart';
import 'dart:math';
class EquationSolverScreen extends StatefulWidget {
  const EquationSolverScreen({super.key});

  @override
  State<EquationSolverScreen> createState() =>
      _EquationSolverScreenState();
}

class _EquationSolverScreenState
    extends State<EquationSolverScreen> {

  final TextEditingController aController =
  TextEditingController();

  final TextEditingController bController =
  TextEditingController();

  final TextEditingController cController =
  TextEditingController();

  final TextEditingController dController =
  TextEditingController();

  final TextEditingController eController =
  TextEditingController();

  final TextEditingController fController =
  TextEditingController();

  String equationType = 'Linear';

  String result = '';

  void solveLinear() {

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

    if (a == 0) {

      setState(() {

        result =
        "a cannot be 0";
      });

      return;
    }

    double x =
        -b / a;

    setState(() {

      result =
      "x = ${x.toStringAsFixed(4)}";
    });
  }

  void solveQuadratic() {

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

    if (a == 0) {

      setState(() {

        result =
        "a cannot be 0";
      });

      return;
    }

    double d =
        (b * b) -
            (4 * a * c);

    if (d >= 0) {

      double x1 =
          (-b + sqrt(d)) /
              (2 * a);

      double x2 =
          (-b - sqrt(d)) /
              (2 * a);

      setState(() {

        result =

        "Real Roots\n\n"

            "x₁ = ${x1.toStringAsFixed(4)}\n"

            "x₂ = ${x2.toStringAsFixed(4)}";
      });
    }

    else {

      double real =
          -b / (2 * a);

      double imag =
          sqrt(-d) /
              (2 * a);

      setState(() {

        result =

        "Complex Roots\n\n"

            "x₁ = ${real.toStringAsFixed(4)} + ${imag.toStringAsFixed(4)}i\n\n"

            "x₂ = ${real.toStringAsFixed(4)} - ${imag.toStringAsFixed(4)}i";
      });
    }
  }

  void solveSimultaneous() {

    double a1 =
        double.tryParse(
          aController.text,
        ) ??
            0;

    double b1 =
        double.tryParse(
          bController.text,
        ) ??
            0;

    double c1 =
        double.tryParse(
          cController.text,
        ) ??
            0;

    double a2 =
        double.tryParse(
          dController.text,
        ) ??
            0;

    double b2 =
        double.tryParse(
          eController.text,
        ) ??
            0;

    double c2 =
        double.tryParse(
          fController.text,
        ) ??
            0;

    double det =
        (a1 * b2) -
            (a2 * b1);

    if (det == 0) {

      setState(() {

        result =
        "No Unique Solution";
      });

      return;
    }

    double x =
        ((c1 * b2) -
            (c2 * b1))
            /
            det;

    double y =
        ((a1 * c2) -
            (a2 * c1))
            /
            det;

    setState(() {

      result =

      "x = ${x.toStringAsFixed(4)}\n"

          "y = ${y.toStringAsFixed(4)}";
    });
  }

  void solveCubic() {

    double a =
        double.tryParse(aController.text) ?? 0;

    double b =
        double.tryParse(bController.text) ?? 0;

    double c =
        double.tryParse(cController.text) ?? 0;

    double d =
        double.tryParse(dController.text) ?? 0;

    if (a == 0) {

      setState(() {

        result =
        "Not a cubic equation";
      });

      return;
    }

    double realRoot = 0;

    bool found = false;

    for (
    double x = -100;
    x <= 100;
    x += 0.001
    ) {

      double y =
          a * x * x * x +
              b * x * x +
              c * x +
              d;

      if (y.abs() < 0.001) {

        realRoot = x;

        found = true;

        break;
      }
    }

    if (!found) {

      setState(() {

        result =
        "Root not found";
      });

      return;
    }

    double qa =
        a;

    double qb =
        b + a * realRoot;

    double qc =
        c +
            b * realRoot +
            a * realRoot * realRoot;

    double discriminant =
        (qb * qb) -
            (4 * qa * qc);

    if (discriminant >= 0) {

      double x2 =
          (-qb +
              sqrt(discriminant))
              /
              (2 * qa);

      double x3 =
          (-qb -
              sqrt(discriminant))
              /
              (2 * qa);

      setState(() {

        result =

        "Roots\n\n"

            "x₁ = ${realRoot.toStringAsFixed(6)}\n\n"

            "x₂ = ${x2.toStringAsFixed(6)}\n\n"

            "x₃ = ${x3.toStringAsFixed(6)}";
      });
    }

    else {

      double real =
          -qb /
              (2 * qa);

      double imag =
          sqrt(-discriminant) /
              (2 * qa);

      setState(() {

        result =

        "Roots\n\n"

            "x₁ = ${realRoot.toStringAsFixed(6)}\n\n"

            "x₂ = ${real.toStringAsFixed(6)} + ${imag.toStringAsFixed(6)}i\n\n"

            "x₃ = ${real.toStringAsFixed(6)} - ${imag.toStringAsFixed(6)}i";
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
        const Color(0xFF050A14),

        title: const Text(

          "Equation Solver",

          style: TextStyle(
            color:
            Colors.cyanAccent,
          ),
        ),
      ),

      body: Padding(

        padding:
        const EdgeInsets.all(16),

        child: Column(

          children: [

            DropdownButtonFormField<String>(

              value: equationType,

              dropdownColor:
              const Color(
                0xFF08111F,
              ),

              items: const [

                DropdownMenuItem(
                  value: 'Linear',
                  child: Text(
                    'Linear Equation',
                  ),
                ),

                DropdownMenuItem(
                  value: 'Quadratic',
                  child: Text(
                    'Quadratic Equation',
                  ),
                ),

                DropdownMenuItem(
                  value: 'Simultaneous',
                  child: Text(
                    'Simultaneous Equations',
                  ),
                ),

                DropdownMenuItem(
                  value: 'Cubic',
                  child: Text(
                    'Cubic Equation',
                  ),
                ),
              ],

              onChanged: (value) {

                setState(() {

                  equationType =
                  value!;
                });
              },
            ),

            const SizedBox(
              height: 20,
            ),

            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [

                    // LINEAR
                    if (equationType == 'Linear') ...[

                      TextField(
                        controller: aController,
                        decoration: const InputDecoration(
                          labelText: 'a (ax + b = 0)',
                        ),
                      ),

                      const SizedBox(height: 10),

                      TextField(
                        controller: bController,
                        decoration: const InputDecoration(
                          labelText: 'b',
                        ),
                      ),
                    ],

                    // QUADRATIC
                    if (equationType == 'Quadratic') ...[

                      TextField(
                        controller: aController,
                        decoration: const InputDecoration(
                          labelText: 'a (ax² + bx + c = 0)',
                        ),
                      ),

                      const SizedBox(height: 10),

                      TextField(
                        controller: bController,
                        decoration: const InputDecoration(
                          labelText: 'b',
                        ),
                      ),

                      const SizedBox(height: 10),

                      TextField(
                        controller: cController,
                        decoration: const InputDecoration(
                          labelText: 'c',
                        ),
                      ),
                    ],

                    // SIMULTANEOUS
                    if (equationType == 'Simultaneous') ...[

                      const Text(
                        "Equation 1",
                        style: TextStyle(
                          color: Colors.cyanAccent,
                        ),
                      ),

                      TextField(
                        controller: aController,
                        decoration: const InputDecoration(
                          labelText: 'a₁',
                        ),
                      ),

                      TextField(
                        controller: bController,
                        decoration: const InputDecoration(
                          labelText: 'b₁',
                        ),
                      ),

                      TextField(
                        controller: cController,
                        decoration: const InputDecoration(
                          labelText: 'c₁',
                        ),
                      ),

                      const SizedBox(height: 20),

                      const Text(
                        "Equation 2",
                        style: TextStyle(
                          color: Colors.cyanAccent,
                        ),
                      ),

                      TextField(
                        controller: dController,
                        decoration: const InputDecoration(
                          labelText: 'a₂',
                        ),
                      ),

                      TextField(
                        controller: eController,
                        decoration: const InputDecoration(
                          labelText: 'b₂',
                        ),
                      ),

                      TextField(
                        controller: fController,
                        decoration: const InputDecoration(
                          labelText: 'c₂',
                        ),
                      ),
                    ],

                    // CUBIC
                    if (equationType == 'Cubic') ...[

                      TextField(
                        controller: aController,
                        decoration: const InputDecoration(
                          labelText:
                          'a (ax³ + bx² + cx + d = 0)',
                        ),
                      ),

                      const SizedBox(height: 10),

                      TextField(
                        controller: bController,
                        decoration: const InputDecoration(
                          labelText: 'b',
                        ),
                      ),

                      const SizedBox(height: 10),

                      TextField(
                        controller: cController,
                        decoration: const InputDecoration(
                          labelText: 'c',
                        ),
                      ),

                      const SizedBox(height: 10),

                      TextField(
                        controller: dController,
                        decoration: const InputDecoration(
                          labelText: 'd',
                        ),
                      ),
                    ],

                    const SizedBox(height: 20),

                    ElevatedButton(

                      onPressed: () {

                        if (equationType == 'Linear') {

                          solveLinear();

                        } else if (equationType == 'Quadratic') {

                          solveQuadratic();

                        } else if (equationType == 'Simultaneous') {

                          solveSimultaneous();

                        } else if (equationType == 'Cubic') {

                          solveCubic();
                        }
                      },

                      child: const Text(
                        "Solve",
                      ),
                    ),

                    const SizedBox(height: 20),

                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: const Color(0xFF08111F),
                        borderRadius:
                        BorderRadius.circular(20),
                      ),
                      child: Text(
                        result.isEmpty
                            ? 'Result'
                            : result,
                        style: const TextStyle(
                          color: Colors.cyanAccent,
                          fontSize: 18,
                        ),
                      ),
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