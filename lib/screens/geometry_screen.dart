import 'dart:math';
import 'package:flutter/material.dart';

class GeometryScreen extends StatefulWidget {
  const GeometryScreen({super.key});

  @override
  State<GeometryScreen> createState() =>
      _GeometryScreenState();
}

class _GeometryScreenState
    extends State<GeometryScreen> {
  String category = "2D Geometry";

  String shape = "Square";

  final Map<String, List<String>> shapes = {
    "2D Geometry": [
      "Square",
      "Rectangle",
      "Triangle",
      "Circle",
    ],

    "3D Geometry": [
      "Cube",
      "Cuboid",
      "Sphere",
      "Cylinder",
      "Cone",
    ],

    "Coordinate Geometry": [
      "Distance",
      "Midpoint",
      "Slope",
    ],
  };


  final TextEditingController c1 =
  TextEditingController();

  final TextEditingController c2 =
  TextEditingController();

  final TextEditingController c3 =
  TextEditingController();
  final TextEditingController c4 =
  TextEditingController();

  String result = "";

  void calculate() {

    double a =
        double.tryParse(
          c1.text,
        ) ??
            0;

    double b =
        double.tryParse(
          c2.text,
        ) ??
            0;

    double h =
        double.tryParse(
          c3.text,
        ) ??
            0;

    if (shape == "Square") {

      double area = a * a;
      double perimeter = 4 * a;
      double diagonal =
          a * sqrt(2);

      result =
      "Area = ${area.toStringAsFixed(4)}\n\n"
          "Perimeter = ${perimeter.toStringAsFixed(4)}\n\n"
          "Diagonal = ${diagonal.toStringAsFixed(4)}";
    }

    else if (
    shape == "Rectangle"
    ) {

      double area = a * b;

      double perimeter =
          2 * (a + b);

      double diagonal =
      sqrt(
        a * a +
            b * b,
      );

      result =
      "Area = ${area.toStringAsFixed(4)}\n\n"
          "Perimeter = ${perimeter.toStringAsFixed(4)}\n\n"
          "Diagonal = ${diagonal.toStringAsFixed(4)}";
    }

    else if (
    shape == "Triangle"
    ) {

      double area =
          0.5 * a * b;

      result =
      "Area = ${area.toStringAsFixed(4)}";
    }

    else if (
    shape == "Circle"
    ) {

      double area =
          pi * a * a;

      double circumference =
          2 * pi * a;

      double diameter =
          2 * a;

      result =
      "Area = ${area.toStringAsFixed(4)}\n\n"
          "Circumference = ${circumference.toStringAsFixed(4)}\n\n"
          "Diameter = ${diameter.toStringAsFixed(4)}";
    }

    else if (
    shape == "Cube"
    ) {

      double volume =
          a * a * a;

      double surface =
          6 * a * a;

      double diagonal =
          a * sqrt(3);

      result =
      "Volume = ${volume.toStringAsFixed(4)}\n\n"
          "Surface Area = ${surface.toStringAsFixed(4)}\n\n"
          "Diagonal = ${diagonal.toStringAsFixed(4)}";
    }
    else if (shape == "Cuboid") {

      double volume =
          a * b * h;

      double area =
          2 *
              ((a * b) +
                  (a * h) +
                  (b * h));

      double diagonal =
      sqrt(
        a * a +
            b * b +
            h * h,
      );

      result =
      "Volume = ${volume.toStringAsFixed(4)}\n\n"
          "Surface Area = ${area.toStringAsFixed(4)}\n\n"
          "Diagonal = ${diagonal.toStringAsFixed(4)}";
    }
    else if (shape == "Distance") {

      double x1 =
          double.tryParse(c1.text) ?? 0;

      double y1 =
          double.tryParse(c2.text) ?? 0;

      double x2 =
          double.tryParse(c3.text) ?? 0;

      double y2 =
          double.tryParse(c4.text) ?? 0;

      double distance =

      sqrt(

        pow(x2 - x1, 2) +

            pow(y2 - y1, 2),
      );

      result =

      "Distance = "

          "${distance.toStringAsFixed(4)}";
    }
    else if (shape == "Midpoint") {

      double x1 =
          double.tryParse(c1.text) ?? 0;

      double y1 =
          double.tryParse(c2.text) ?? 0;

      double x2 =
          double.tryParse(c3.text) ?? 0;

      double y2 =
          double.tryParse(c4.text) ?? 0;

      double mx =
          (x1 + x2) / 2;

      double my =
          (y1 + y2) / 2;

      result =

      "Midpoint = "

          "(${mx.toStringAsFixed(4)}, "

          "${my.toStringAsFixed(4)})";
    }
    else if (shape == "Slope") {

      double x1 =
          double.tryParse(c1.text) ?? 0;

      double y1 =
          double.tryParse(c2.text) ?? 0;

      double x2 =
          double.tryParse(c3.text) ?? 0;

      double y2 =
          double.tryParse(c4.text) ?? 0;

      if (x2 - x1 == 0) {

        result =
        "Undefined Slope";

        return;
      }

      double slope =

          (y2 - y1) /

              (x2 - x1);

      result =

      "Slope = "

          "${slope.toStringAsFixed(4)}";
    }
    else if (
    shape == "Sphere"
    ) {

      double volume =
          (4 / 3) *
              pi *
              a *
              a *
              a;

      double area =
          4 *
              pi *
              a *
              a;

      result =
      "Volume = ${volume.toStringAsFixed(4)}\n\n"
          "Surface Area = ${area.toStringAsFixed(4)}";
    }

    else if (
    shape == "Cylinder"
    ) {

      double volume =
          pi *
              a *
              a *
              b;

      double area =
          2 *
              pi *
              a *
              (a + b);

      result =
      "Volume = ${volume.toStringAsFixed(4)}\n\n"
          "Total Area = ${area.toStringAsFixed(4)}";
    }

    else if (
    shape == "Cone"
    ) {

      double slant =
      sqrt(
        a * a +
            b * b,
      );

      double volume =
          (1 / 3) *
              pi *
              a *
              a *
              b;

      double area =
          pi *
              a *
              (a + slant);

      result =
      "Volume = ${volume.toStringAsFixed(4)}\n\n"
          "Slant Height = ${slant.toStringAsFixed(4)}\n\n"
          "Total Area = ${area.toStringAsFixed(4)}";
    }

    setState(() {});
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

          "Geometry Calculator",

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

            DropdownButtonFormField<String>(
              value: category,
              dropdownColor: const Color(0xFF08111F),

              items: const [

                DropdownMenuItem(
                  value: "2D Geometry",
                  child: Text("2D Geometry"),
                ),

                DropdownMenuItem(
                  value: "3D Geometry",
                  child: Text("3D Geometry"),
                ),

                DropdownMenuItem(
                  value: "Coordinate Geometry",
                  child: Text("Coordinate Geometry"),
                ),
              ],

              onChanged: (value) {

                setState(() {

                  category = value!;

                  shape = shapes[category]![0];
                });
              },
            ),

            const SizedBox(height: 15),

            DropdownButtonFormField<String>(

              value: shape,

              dropdownColor:
              const Color(0xFF08111F),

              items:
              shapes[category]!
                  .map(
                    (e) =>
                    DropdownMenuItem(
                      value: e,
                      child: Text(e),
                    ),
              )
                  .toList(),

              onChanged: (value) {

                setState(() {

                  shape = value!;
                });
              },
            ),
            const SizedBox(height: 20),

            if (shape == "Square")
              TextField(
                controller: c1,
                decoration: const InputDecoration(
                  labelText: "Side",
                ),
              ),

            if (shape == "Rectangle")
              Column(
                children: [

                  TextField(
                    controller: c1,
                    decoration: const InputDecoration(
                      labelText: "Length",
                    ),
                  ),

                  const SizedBox(height: 12),

                  TextField(
                    controller: c2,
                    decoration: const InputDecoration(
                      labelText: "Width",
                    ),
                  ),
                ],
              ),

            if (shape == "Triangle")
              Column(
                children: [

                  TextField(
                    controller: c1,
                    decoration: const InputDecoration(
                      labelText: "Base",
                    ),
                  ),

                  const SizedBox(height: 12),

                  TextField(
                    controller: c2,
                    decoration: const InputDecoration(
                      labelText: "Height",
                    ),
                  ),
                ],
              ),

            if (shape == "Circle")
              TextField(
                controller: c1,
                decoration: const InputDecoration(
                  labelText: "Radius",
                ),
              ),

            if (shape == "Cube")
              TextField(
                controller: c1,
                decoration: const InputDecoration(
                  labelText: "Side",
                ),
              ),

            if (shape == "Cuboid")
              Column(
                children: [

                  TextField(
                    controller: c1,
                    decoration: const InputDecoration(
                      labelText: "Length",
                    ),
                  ),

                  const SizedBox(height: 12),

                  TextField(
                    controller: c2,
                    decoration: const InputDecoration(
                      labelText: "Width",
                    ),
                  ),

                  const SizedBox(height: 12),

                  TextField(
                    controller: c3,
                    decoration: const InputDecoration(
                      labelText: "Height",
                    ),
                  ),
                ],
              ),

            if (shape == "Sphere")
              TextField(
                controller: c1,
                decoration: const InputDecoration(
                  labelText: "Radius",
                ),
              ),
            if (
            shape == "Distance" ||
                shape == "Midpoint" ||
                shape == "Slope"
            )
              Column(
                children: [

                  TextField(
                    controller: c1,
                    decoration: const InputDecoration(
                      labelText: "x1",
                    ),
                  ),

                  const SizedBox(height: 12),

                  TextField(
                    controller: c2,
                    decoration: const InputDecoration(
                      labelText: "y1",
                    ),
                  ),

                  const SizedBox(height: 12),

                  TextField(
                    controller: c3,
                    decoration: const InputDecoration(
                      labelText: "x2",
                    ),
                  ),

                  const SizedBox(height: 12),

                  TextField(
                    controller: c4,
                    decoration: const InputDecoration(
                      labelText: "y2",
                    ),
                  ),
                ],
              ),
            if (
            shape == "Cylinder" ||
                shape == "Cone"
            )
              Column(
                children: [

                  TextField(
                    controller: c1,
                    decoration: const InputDecoration(
                      labelText: "Radius",
                    ),
                  ),

                  const SizedBox(height: 12),


                  TextField(
                    controller: c2,
                    decoration: const InputDecoration(
                      labelText: "Height",
                    ),
                  ),
                ],
              ),
            const SizedBox(height: 20),

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

            const SizedBox(height: 20),

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

                  fontSize: 20,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}