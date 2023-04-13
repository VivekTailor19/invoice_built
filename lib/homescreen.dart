import 'package:flutter/material.dart';
import 'package:invoice_built/business/business.dart';
import 'package:invoice_built/client/client.dart';
import 'package:invoice_built/invoice/invoice_view.dart';

import 'items/additem.dart';


Widget Info({TextInputType? kboard,TextEditingController? controller, String? hint})
{
  return Padding(
    padding: const EdgeInsets.all(10),
    child: TextFormField(
      controller: controller,
      keyboardType: kboard,
      style: TextStyle(color: Colors.blueGrey.shade800,fontSize: 20),
      scrollPhysics: BouncingScrollPhysics(),
      decoration: InputDecoration(
        hintText: "$hint",
        hintStyle: TextStyle(fontSize: 20,color: Colors.blueGrey.shade100,wordSpacing: 3),
        filled: true,
        fillColor: Colors.white,
        enabled: true,
        enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(20)),borderSide: BorderSide(color: Colors.indigo.shade200)),
        focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(20)),borderSide: BorderSide(color: Colors.indigo.shade700)),




      ),
    ),
  );
}


class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  int i =0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Colors.indigo.shade700,
          unselectedItemColor: Colors.indigo.shade200,
          currentIndex: i,
          type: BottomNavigationBarType.shifting,
          onTap: (value) {
            setState(() {
              i=value;
            });},
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.local_convenience_store_rounded),label: "",),
            BottomNavigationBarItem(icon: Icon(Icons.person_outline_rounded),label: "",),
            BottomNavigationBarItem(icon: Icon(Icons.local_mall_rounded),label: "",),
            BottomNavigationBarItem(icon: Icon(Icons.receipt_long_rounded),label: "",),
          ],

        ),
        body: IndexedStack(
          index: i,
          children: [
            Business(),
            Clients(),
            AddItems(),
            Invoice_View(),
          ],
        ),
      ),
    );
  }
}
