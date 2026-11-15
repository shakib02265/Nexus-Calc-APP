import 'dart:async';
import 'package:flutter/material.dart';
import 'home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() =>
      _SplashScreenState();
}

class _SplashScreenState
    extends State<SplashScreen>
    with SingleTickerProviderStateMixin {

  late AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(
        seconds: 2,
      ),
    )..repeat(reverse: true);

    Timer(
      const Duration(seconds: 2),
          () {
        if (!mounted) return;

        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (_) => const HomeScreen(),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      backgroundColor:
      const Color(0xFF050A14),

      body: Center(

        child: AnimatedBuilder(

          animation: _controller,

          builder: (
              context,
              child,
              ) {

            return Transform.scale(

              scale:
              1 +
                  (_controller.value *
                      0.1),

              child: child,
            );
          },

          child: Column(

            mainAxisSize:
            MainAxisSize.min,

            children: [

              Container(

                decoration:
                BoxDecoration(

                  boxShadow: [

                    BoxShadow(

                      color:
                      Colors.redAccent
                          .withOpacity(
                        0.8,
                      ),

                      blurRadius:
                      40,

                      spreadRadius:
                      5,
                    ),
                  ],
                ),

                child: ClipRRect(

                  borderRadius:
                  BorderRadius.circular(
                    25,
                  ),

                  child: Image.asset(

                    "assets/logo.png",

                    height: 170,
                    width: 170,
                  ),
                ),
              ),

              const SizedBox(
                height: 30,
              ),

              const Text(

                "NEXUS CALC",

                style: TextStyle(

                  color:
                  Colors.redAccent,

                  fontSize: 32,

                  fontWeight:
                  FontWeight.bold,

                  letterSpacing: 3,
                ),
              ),

              const SizedBox(
                height: 10,
              ),

              const Text(

                "Calculate Beyond Limits",

                style: TextStyle(

                  color:
                  Colors.white70,

                  fontSize: 15,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}