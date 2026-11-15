import 'dart:ui';
import 'package:flutter/material.dart';

class GlassDisplay extends StatelessWidget {

  final String expression;
  final String result;

  const GlassDisplay({
    super.key,
    required this.expression,
    required this.result,
  });

  @override
  Widget build(BuildContext context) {

    return ClipRRect(

      borderRadius: BorderRadius.circular(36),

      child: BackdropFilter(

        filter: ImageFilter.blur(
          sigmaX: 10,
          sigmaY: 10,
        ),

        child: Container(

          height: 250,

          width: double.infinity,

          padding: const EdgeInsets.all(24),

          decoration: BoxDecoration(

            color: Colors.white.withOpacity(0.05),

            borderRadius: BorderRadius.circular(36),

            border: Border.all(
              color: Colors.cyan.withOpacity(0.2),
            ),
          ),

          child: Column(

            crossAxisAlignment: CrossAxisAlignment.end,

            mainAxisAlignment: MainAxisAlignment.end,

            children: [

              Text(
                expression,

                style: const TextStyle(
                  fontSize: 34,
                  color: Colors.white70,
                ),
              ),

              const SizedBox(height: 20),

              Text(
                result,

                style: const TextStyle(
                  fontSize: 60,
                  color: Colors.cyanAccent,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}