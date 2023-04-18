import 'package:flutter/material.dart';
import 'package:invoice_built/Splash_Screen/splash_screen.dart';
import 'package:invoice_built/business/business.dart';
import 'package:invoice_built/client/client.dart';
import 'package:invoice_built/invoice/invoice_view.dart';
import 'package:invoice_built/items/additem.dart';

import 'homescreen.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(

      appBarTheme: AppBarTheme(
        backgroundColor:Color(0xff292931),
        titleTextStyle: TextStyle(fontSize: 25,color: Color(0xffBFDB38),),
        elevation: 10,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(style: ElevatedButton.styleFrom(backgroundColor: Color(0xff292931),shadowColor: Color(0xffB6C9FD),textStyle: TextStyle(fontSize: 25,color:Colors.amber),alignment: Alignment.center,elevation: 8,)),



    ),
    routes: {
      "/": (context) => Splash(),
      "home":(context) => HomeScreen(),
      "business":(context) => Business(),
      "client":(context) => Clients(),
      "additem":(context) => AddItems(),
      "invoice":(context) => Invoice_View()

    },
  ),);
}


/*

Datas ---

Invoice--
Date,Invoice number

Invoice From--                                     ✔
Name,Address,Phone,Email

Invoice To---                                     ✔
Name,Address,Phone,Email

Items                                     ✔
Name, Description, Price, Quantity, Total Price, listVIEW

Invoice-
Total, Tax, Final Amount,
Terms & Condition ,
Signature Company Logo

Payment Method-
AccountNumber, AccountName, Branch Name



alert add item ma totol amount delete nai thatu......

* */
