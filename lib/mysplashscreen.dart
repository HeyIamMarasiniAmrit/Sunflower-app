// lib/mysplashscreen.dart
import 'dart:async';
import 'package:flutter/material.dart';
import 'homepage.dart';

class Mysplashscreen extends StatefulWidget {
  const Mysplashscreen({super.key});

  @override
  State<Mysplashscreen> createState() => _MysplashscreenState();
}

class _MysplashscreenState extends State<Mysplashscreen>
    with SingleTickerProviderStateMixin {
  late final Timer _timer;
  late final AnimationController _animController;
  late final Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();

    // Fade animation for the logo/text
    _animController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 900),
    );
    _fadeAnimation = CurvedAnimation(
      parent: _animController,
      curve: Curves.easeIn,
    );

    // Start the animation
    _animController.forward();

    // After 4 seconds navigate to HomePage and remove splash from stack
    _timer = Timer(const Duration(seconds: 4), () {
      if (!mounted) return;
      Navigator.of(
        context,
      ).pushReplacement(MaterialPageRoute(builder: (_) => const HomePage()));
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    _animController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Use a simple gradient background
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFFFFFDE7),
              Color(0xFFFFF9C4),
            ], // soft sunflower-ish
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: FadeTransition(
          opacity: _fadeAnimation,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Image asset - make sure this path matches pubspec.yaml
              Image.asset(
                'assets/img/149071.png',
                width: 140,
                height: 140,
                fit: BoxFit.contain,
              ),
              const SizedBox(height: 24),
              const Text(
                'SunFlower App',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 12),
              const Text(
                'Loading... Please wait',
                style: TextStyle(fontSize: 14, color: Colors.black54),
              ),
              const SizedBox(height: 28),
              const SizedBox(
                width: 40,
                height: 40,
                child: CircularProgressIndicator(
                  strokeWidth: 3.0,
                  // color will adapt to theme; use Theme or keep default
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
