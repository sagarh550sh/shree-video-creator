import 'dart:async';

import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    unawaited(
      Future<void>.delayed(const Duration(milliseconds: 1800)).then((_) {
        if (mounted) {
          Navigator.pushReplacementNamed(context, '/');
        }
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 110,
              height: 110,
              decoration: BoxDecoration(
                color: const Color(0xFFFFF1EB),
                borderRadius: BorderRadius.circular(28),
              ),
              child: const Icon(
                Icons.videocam_rounded,
                color: Color(0xFFEA6B2E),
                size: 58,
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              'Shree Video Creator',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'Create • Edit • Share',
              style: TextStyle(
                fontSize: 18,
                letterSpacing: 0.3,
                color: Colors.black54,
              ),
            ),
            const SizedBox(height: 30),
            const SizedBox(
              width: 180,
              child: LinearProgressIndicator(
                minHeight: 7,
                borderRadius: BorderRadius.all(Radius.circular(12)),
                backgroundColor: Color(0xFFF1E6E0),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
