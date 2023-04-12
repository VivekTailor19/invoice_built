import 'package:flutter/material.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {


  @override
  Widget build(BuildContext context) {

    Future.delayed(Duration(seconds: 2),() {
      Navigator.pushReplacementNamed(context, "data");
    },);

    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            children: [
              SizedBox(height: 150),
              Image.asset("assets/images/invoice (2).png",height: 200,width: 200,fit: BoxFit.fill,),
              SizedBox(height: 40),
              LinearProgressIndicator(color: Color(0xffB6C9FD),backgroundColor: Color(0xffE5EDFC),)
            ],
          ),
        ),

      ),
    );
  }
}
// Dark   color: Color(0xffB6C9FD)
// Light  color: Color(0xffE5EDFC)