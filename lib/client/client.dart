import 'package:flutter/material.dart';

class Clients extends StatefulWidget {
  const Clients({Key? key}) : super(key: key);

  @override
  State<Clients> createState() => _ClientsState();
}

class _ClientsState extends State<Clients> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.blueGrey.shade500,
        title: Text("Client Info",style: TextStyle(fontSize: 30,color: Colors.white)),),

    );
  }
}
