import 'package:flutter/material.dart';
import 'number_system_screen.dart';
import 'unit_converter_screen.dart';
import 'matrix_screen.dart';
import 'statistics_screen.dart';
import 'equation_solver_screen.dart';
import 'vector_screen.dart';
import 'complex_number_screen.dart';
import 'geometry_screen.dart';
class ToolkitMode extends StatelessWidget {
  const ToolkitMode({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF050A14),

      appBar: AppBar(
        backgroundColor: const Color(0xFF050A14),
        title: const Text(
          'Student Toolkit',
          style: TextStyle(
            color: Colors.cyanAccent,
          ),
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),

        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,

          children: [

            _toolCard(
              context,
              "🔄",
              "Number System",
              const NumberSystemScreen(),
            ),
            _toolCard(
              context,
              "🧠",
              "Complex Number",
              const ComplexNumberScreen(),
            ),
            _toolCard(
              context,
              "📐",
              "Geometry",
              const GeometryScreen(),
            ),
            _toolCard(
              context,
              "📏",
              "Unit Converter",
              const UnitConverterScreen(),
            ),

            _toolCard(
              context,
              "🔢",
              "Matrix Calc",
              const MatrixScreen(),
            ),

            _toolCard(
              context,
              "📊",
              "Statistics",
              const StatisticsScreen(),
            ),
            _toolCard(
              context,
              "➡️",
              "Vector Calc",
              const VectorScreen(),
            ),

            _toolCard(
              context,
              "🧮",
              "Equation Solver",
                const EquationSolverScreen(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _toolCard(
      BuildContext context,
      String emoji,
      String title,
      Widget page,
      ) {
    return GestureDetector(

      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => page,
          ),
        );
      },

      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xFF08111F),
          borderRadius:
          BorderRadius.circular(20),
        ),

        child: Center(
          child: Column(
            mainAxisAlignment:
            MainAxisAlignment.center,

            children: [

              Text(
                emoji,
                style: const TextStyle(
                  fontSize: 40,
                ),
              ),

              const SizedBox(
                height: 12,
              ),

              Text(
                title,
                textAlign:
                TextAlign.center,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight:
                  FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PlaceholderScreen extends StatelessWidget {
  final String title;

  const PlaceholderScreen({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
      const Color(0xFF050A14),

      appBar: AppBar(
        backgroundColor:
        const Color(0xFF050A14),
        title: Text(
          title,
          style: const TextStyle(
            color: Colors.cyanAccent,
          ),
        ),
      ),

      body: Center(
        child: Text(
          '$title Coming Soon',
          style: const TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}