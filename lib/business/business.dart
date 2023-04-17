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
      appBar: AppBar(
        title: Text("Business Page",style: TextStyle(fontSize: 30,color: Colors.white)),),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 15),


            Info(hint: "Owner Name",kboard: TextInputType.text,controller: bname),
            Info(hint: "Address",kboard: TextInputType.streetAddress,controller: baddress),
            Info(hint: "Contact number",kboard: TextInputType.number,controller: bphone),
            Info(hint: "Email id",kboard: TextInputType.emailAddress,controller: bemail),
            Info(hint: "Website",kboard: TextInputType.url,controller: bwebsite),
            SizedBox(height: 15),
            ElevatedButton(onPressed: () {


              bd = Business_Data(bname: bname.text,baddress: baddress.text,bemail: bemail.text,bphone: bphone.text,bwebsite: bwebsite.text);

              ScaffoldMessenger.of(context)!.showSnackBar(SnackBar(behavior:SnackBarBehavior.floating,content: Text("Your Information is Collected"),backgroundColor: Colors.green.shade400,));

            },
              child: Text("Create"),),

          ],
        ),
      ),

    );
  }



}
//   Invoice From--
//   Name,Address,Phone,Email