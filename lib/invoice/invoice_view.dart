import 'package:flutter/material.dart';

class Invoice_View extends StatefulWidget {
  const Invoice_View({Key? key}) : super(key: key);

  @override
  State<Invoice_View> createState() => _Invoice_ViewState();
}

class _Invoice_ViewState extends State<Invoice_View> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.blueGrey.shade500,
        title: Text("Invoice",style: TextStyle(fontSize: 30,color: Colors.white)),),
    );
  }
}
