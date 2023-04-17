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
              SizedBox(height: 160),
              Image.asset("assets/images/receipt.png",height: 200,width: 200,fit: BoxFit.fill,),
              SizedBox(height: 55),


              SizedBox(height: 20,),

              LinearProgressIndicator(color: Colors.indigo,backgroundColor: Colors.indigo.shade50,)
            ],
          ),
        ),

      ),
    );
  }
}
// Dark   color: Color(0xffB6C9FD)
// Light  color: Color(0xffE5EDFC)