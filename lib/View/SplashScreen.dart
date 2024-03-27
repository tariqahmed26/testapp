import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'Auth/SignUpScreen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  moveto() async {
    Future.delayed(
        const Duration(seconds: 4), () => {Get.to(() => SignUpScreen())});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    moveto();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff0E0223),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Center(
            child: Text(
              'My App',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.blue,
                fontSize: 52,
                // height: 0.09,
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.03,
          ),
          const Text(
            'Welcome',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.green,
              fontSize: 24,
              // height: 0.09,
            ),
          )
        ],
      ),
    );
  }
}
