import 'package:flutter/material.dart';
import 'package:invoice_built/Splash_Screen/splash_screen.dart';


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


/*

Datas ---

Invoice--
Date,Invoice number

Invoice From--
Name,Address,Phone,Email

Invoice To---
Name,Address,Phone,Email

Items
Name, Description, Price, Quantity, Total Price

Invoice-
Total, Tax, Final Amount,
Terms & Condition ,
Signature Company Logo

Payment Method-
AccountNumber, AccountName, Branch Name

* */
