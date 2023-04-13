import 'package:flutter/material.dart';
import 'package:invoice_built/business/business_modal.dart';

import '../homescreen.dart';

Business_Data bd = Business_Data();


class Business extends StatefulWidget {
  const Business({Key? key}) : super(key: key);

  @override
  State<Business> createState() => _BusinessState();
}

class _BusinessState extends State<Business> {

  TextEditingController bname = TextEditingController();
  TextEditingController baddress = TextEditingController();
  TextEditingController bphone = TextEditingController();
  TextEditingController bemail = TextEditingController();
  TextEditingController bwebsite = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.blueGrey.shade500,
        title: Text("Business Page",style: TextStyle(fontSize: 30,color: Colors.white)),),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 15),


            Info(hint: "Enter Business Name....",kboard: TextInputType.text,controller: bname),
            Info(hint: "Enter Proper Address....",kboard: TextInputType.text,controller: baddress),
            Info(hint: "Enter 10 digit contact number....",kboard: TextInputType.text,controller: bphone),
            Info(hint: "Enter proper email id....",kboard: TextInputType.text,controller: bemail),
            Info(hint: "Enter website....",kboard: TextInputType.text,controller: bwebsite),
            SizedBox(height: 15),
            ElevatedButton(onPressed: () {


              bd = Business_Data(bname: bname.text,baddress: baddress.text,bemail: bemail.text,bphone: bphone.text,bwebsite: bwebsite.text);

              ScaffoldMessenger.of(context)!.showSnackBar(SnackBar(behavior:SnackBarBehavior.floating,content: Text("Your Information is Collected"),backgroundColor: Colors.green.shade400,));

            },child: Text("Create"),),

          ],
        ),
      ),

    );
  }



}
//   Invoice From--
//   Name,Address,Phone,Email