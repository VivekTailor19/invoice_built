import 'package:flutter/material.dart';

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
            
            
          ],
        ),
      ),
    );
  }
}
