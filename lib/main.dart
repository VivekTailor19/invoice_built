import 'package:flutter/material.dart';
import 'package:invoice_built/Splash/splash_screen.dart';

import 'invoice_data.dart';


void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    routes: {
      "/": (context) => Splash(),
      "data":(context) => Invoice_Datas(),

    },
  ),);
}
