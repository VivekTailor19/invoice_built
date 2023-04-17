import 'package:flutter/material.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {


  @override
  Widget build(BuildContext context) {

    Future.delayed(Duration(seconds: 3),() {
      Navigator.pushReplacementNamed(context, "home");
    },);

    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            children: [
              SizedBox(height: 150),
              Image.asset("assets/images/checklist.png",height: 160,width: 160,fit: BoxFit.fill,),
              SizedBox(height: 55),
              LinearProgressIndicator(color: Color(0xff3EC3A4),backgroundColor: Color(0xff6FD7A3),)
            ],
          ),
        ),

      ),
    );
  }
}
// Dark   color: Color(0xffB6C9FD)
// Light  color: Color(0xffE5EDFC)