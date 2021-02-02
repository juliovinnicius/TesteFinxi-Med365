import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 4)).then((_) async {
      Get.offAllNamed('/home');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
          children: [
            AnimatedContainer(
              color: Colors.black,
              duration: Duration(seconds: 2),
              curve: Curves.easeIn,
            ),
            Center(
              child: Image.asset(
                "assets/images/darth_vader.png",
                height: 180,
                width: 180,
              ),
            ),
          ],
        )
    );
  }
}
