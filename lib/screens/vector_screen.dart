import 'dart:math';
import 'package:flutter/material.dart';

class VectorScreen extends StatefulWidget {
  const VectorScreen({super.key});

  @override
  State<VectorScreen> createState() =>
      _VectorScreenState();
}

class _VectorScreenState
    extends State<VectorScreen> {

  final TextEditingController axController =
  TextEditingController();

  final TextEditingController ayController =
  TextEditingController();

  final TextEditingController bxController =
  TextEditingController();

  final TextEditingController byController =
  TextEditingController();

  final TextEditingController azController =
  TextEditingController();

  final TextEditingController bzController =
  TextEditingController();

  String operation = 'Addition';

  String result = '';

  void calculate() {

    double ax =
        double.tryParse(
          axController.text,
        ) ??
            0;

    double ay =
        double.tryParse(
          ayController.text,
        ) ??
            0;

    double bx =
        double.tryParse(
          bxController.text,
        ) ??
            0;

    double by =
        double.tryParse(
          byController.text,
        ) ??
            0;
    double az =
        double.tryParse(
          azController.text,
        ) ??
            0;

    double bz =
        double.tryParse(
          bzController.text,
        ) ??
            0;

    if (operation == 'Addition') {

      setState(() {

        result =

        "A + B\n\n"

            "(${(ax + bx).toStringAsFixed(4)}, "

            "${(ay + by).toStringAsFixed(4)}, "

            "${(az + bz).toStringAsFixed(4)})";
      });
    }

    else if (
    operation ==
        'Subtraction'
    ) {

      setState(() {

        result =

        "A - B\n\n"

            "(${(ax - bx).toStringAsFixed(4)}, "

            "${(ay - by).toStringAsFixed(4)}, "

            "${(az - bz).toStringAsFixed(4)})";
      });
    }

    else if (
    operation ==
        'Dot Product'
    ) {

      double dot =
          (ax * bx) +
              (ay * by) +
              (az * bz);

      setState(() {

        result =
            dot.toStringAsFixed(
              4,
            );
      });
    }

    else if (
    operation ==
        'Cross Product'
    ) {

      double cx =
          (ay * bz) -
              (az * by);

      double cy =
          (az * bx) -
              (ax * bz);

      double cz =
          (ax * by) -
              (ay * bx);

      setState(() {

        result =

        "A × B\n\n"

            "(${cx.toStringAsFixed(4)}, "

            "${cy.toStringAsFixed(4)}, "

            "${cz.toStringAsFixed(4)})";
      });

    }

    else if (
    operation ==
        'Magnitude A'
    ) {

      double mag =

      sqrt(
        ax * ax +
            ay * ay +
            az * az,
      );

      setState(() {

        result =
            mag.toStringAsFixed(
              4,
            );
      });
    }

    else if (
    operation ==
        'Magnitude B'
    ) {

      double mag =

      sqrt(
        bx * bx +
            by * by +
            bz * bz,
      );

      setState(() {

        result =
            mag.toStringAsFixed(
              4,
            );
      });
    }
    else if (
    operation ==
        'Resultant Magnitude'
    ) {

      double rx = ax + bx;
      double ry = ay + by;
      double rz = az + bz;

      double magnitude =

      sqrt(
        rx * rx +
            ry * ry +
            rz * rz,
      );

      setState(() {

        result =

        "|A + B| = "

            "${magnitude.toStringAsFixed(4)}";
      });
    }


    else if (
    operation ==
        'Unit Vector A'
    ) {

      double mag =

      sqrt(
        ax * ax +
            ay * ay +
            az * az,
      );

      if (mag == 0) {

        setState(() {

          result =
          "Undefined";
        });

        return;
      }

      setState(() {

        result =

        "Unit Vector A\n\n"

            "(${(ax / mag).toStringAsFixed(4)}, "

            "${(ay / mag).toStringAsFixed(4)}, "

            "${(az / mag).toStringAsFixed(4)})";
      });
    }
    else if (
    operation ==
        'Angle'
    ) {

      double dot =

          (ax * bx) +
              (ay * by) +
              (az * bz);

      double magA =

      sqrt(
        ax * ax +
            ay * ay +
            az * az,
      );

      double magB =

      sqrt(
        bx * bx +
            by * by +
            bz * bz,
      );

      if (
      magA == 0 ||
          magB == 0
      ) {

        setState(() {

          result =
          "Undefined";
        });

        return;
      }

      double cosTheta =
          dot /
              (magA * magB);

      cosTheta =
          cosTheta.clamp(
            -1.0,
            1.0,
          );

      double angle =

          acos(cosTheta) *
              180 /
              pi;

      setState(() {

        result =

        "Angle Between Vectors\n\n"

            "${angle.toStringAsFixed(2)}°";
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

          "Vector Calculator",

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

              "Vector A",

              style: TextStyle(
                color:
                Colors.cyanAccent,
                fontSize: 18,
              ),
            ),

            const SizedBox(
              height: 10,
            ),

            Row(
              children: [

                Expanded(
                  child: TextField(
                    controller: axController,
                    decoration: const InputDecoration(
                      labelText: "Ax",
                    ),
                  ),
                ),

                const SizedBox(width: 10),

                Expanded(
                  child: TextField(
                    controller: ayController,
                    decoration: const InputDecoration(
                      labelText: "Ay",
                    ),
                  ),
                ),

                const SizedBox(width: 10),

                Expanded(
                  child: TextField(
                    controller: azController,
                    decoration: const InputDecoration(
                      labelText: "Az",
                    ),
                  ),
                ),
              ],
            ),

            const Text(

              "Vector B",

              style: TextStyle(
                color:
                Colors.cyanAccent,
                fontSize: 18,
              ),
            ),

            const SizedBox(
              height: 10,
            ),

            Row(
              children: [

                Expanded(
                  child: TextField(
                    controller: bxController,
                    decoration: const InputDecoration(
                      labelText: "Bx",
                    ),
                  ),
                ),

                const SizedBox(width: 10),

                Expanded(
                  child: TextField(
                    controller: byController,
                    decoration: const InputDecoration(
                      labelText: "By",
                    ),
                  ),
                ),

                const SizedBox(width: 10),

                Expanded(
                  child: TextField(
                    controller: bzController,
                    decoration: const InputDecoration(
                      labelText: "Bz",
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(
              height: 20,
            ),

            DropdownButtonFormField<String>(

              value:
              operation,

              items: const [

                DropdownMenuItem(
                  value:
                  "Addition",
                  child:
                  Text(
                    "Addition",
                  ),
                ),

                DropdownMenuItem(
                  value:
                  "Subtraction",
                  child:
                  Text(
                    "Subtraction",
                  ),
                ),

                DropdownMenuItem(
                  value:
                  "Dot Product",
                  child:
                  Text(
                    "Dot Product",
                  ),
                ),

                DropdownMenuItem(
                  value:
                  "Magnitude A",
                  child:
                  Text(
                    "Magnitude A",
                  ),
                ),

                DropdownMenuItem(
                  value:
                  "Magnitude B",
                  child:
                  Text(
                    "Magnitude B",
                  ),
                ),
                DropdownMenuItem(
                  value: "Resultant Magnitude",
                  child: Text(
                    "Resultant Magnitude",
                  ),
                ),
                DropdownMenuItem(
                  value: "Unit Vector A",
                  child: Text(
                    "Unit Vector A",
                  ),
                ),
                DropdownMenuItem(
                  value: "Cross Product",
                  child: Text(
                    "Cross Product",
                  ),
                ),

                DropdownMenuItem(
                  value:
                  "Angle",
                  child:
                  Text(
                    "Angle Between",
                  ),
                ),
              ],

              onChanged:
                  (value) {

                setState(() {

                  operation =
                  value!;
                });
              },
            ),

            const SizedBox(
              height: 20,
            ),

            SizedBox(

              width:
              double.infinity,

              child:
              ElevatedButton(

                onPressed:
                calculate,

                child:
                const Text(
                  "Calculate",
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