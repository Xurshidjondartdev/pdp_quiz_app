import 'package:flutter/material.dart';
import 'package:pdp_quiz_app/UI/pages/auth/auth_page/email_otp_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    _navigateToNextPage();
    super.initState();
  }

  ////splash page dan keyin bowqa page ga otadi
  void _navigateToNextPage() {
    Future.delayed(const Duration(seconds: 5), () {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) => const EmailOtpPage(),
        ),
        (route) => false, // Barcha oldingi o`chadi
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Image.asset('assets/images/Logo.png'),
      ),
    );
  }
}
