import 'package:flutter/material.dart';

class CalcButton extends StatelessWidget {

  final String text;
  final VoidCallback onTap;
  final bool isOperator;

  const CalcButton({
    super.key,
    required this.text,
    required this.onTap,
    this.isOperator = false,
  });

  @override
  Widget build(BuildContext context) {

    final bool isDark =
        Theme.of(context).brightness ==
            Brightness.dark;

    return Expanded(

      child: Padding(

        padding: const EdgeInsets.all(7),

        child: GestureDetector(

          onTap: onTap,

          child: AnimatedContainer(

            duration:
            const Duration(milliseconds: 120),

            height: 54,

            decoration: BoxDecoration(

              color: isDark

                  ? const Color(0xFF111827)

                  : Colors.white,

              borderRadius:
              BorderRadius.circular(18),

              border: Border.all(

                color: isOperator

                    ? Colors.cyanAccent

                    : Colors.transparent,

                width: 1.2,
              ),

              boxShadow: [

                BoxShadow(

                  color: isOperator

                      ? Colors.cyan.withOpacity(0.10)

                      : Colors.black.withOpacity(0.05),

                  blurRadius: 4,

                  offset: const Offset(0, 3),
                )
              ],
            ),

            child: Center(

              child: Text(

                text,

                style: TextStyle(

                  fontSize: 20,

                  fontWeight: FontWeight.w500,

                  color: isOperator

                      ? Colors.cyanAccent

                      : isDark
                      ? Colors.white
                      : Colors.black87,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}