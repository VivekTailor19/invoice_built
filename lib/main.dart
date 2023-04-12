import 'package:flutter/material.dart';
import 'package:invoice_built/Splash_Screen/splash_screen.dart';
import 'package:invoice_built/business/business.dart';
import 'package:invoice_built/client/client.dart';
import 'package:invoice_built/invoice/invoice_view.dart';
import 'package:invoice_built/items/additem.dart';


import 'invoice_data.dart';


void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    routes: {
      "/": (context) => Splash(),
      "data":(context) => Invoice_Datas(),
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
