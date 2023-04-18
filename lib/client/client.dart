import 'package:flutter/material.dart';

import '../homescreen.dart';
import 'client_modal.dart';

Client_Data cd = Client_Data();

class Clients extends StatefulWidget {
  const Clients({Key? key}) : super(key: key);

  @override
  State<Clients> createState() => _ClientsState();
}

class _ClientsState extends State<Clients> {

  TextEditingController cid = TextEditingController();
  TextEditingController cname = TextEditingController();
  TextEditingController caddress = TextEditingController();
  TextEditingController cphone = TextEditingController();
  TextEditingController cemail = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Client Info"),),

      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 15),

            Info(hint: "Client Unique Id",kboard: TextInputType.number,controller: cid),
            Info(hint: "Client Name....",kboard: TextInputType.text,controller: cname),
            Info(hint: "Address....",kboard: TextInputType.streetAddress,controller: caddress),
            Info(hint: "Contact number....",kboard: TextInputType.number,controller: cphone),
            Info(hint: "Email id....",kboard: TextInputType.emailAddress,controller: cemail),

            SizedBox(height: 15),
            ElevatedButton(onPressed: () {


              cd = Client_Data(cid: cid.text,cname: cname.text,caddress: caddress.text,cemail: cemail.text,cphone: cphone.text);

              ScaffoldMessenger.of(context)!.showSnackBar(SnackBar(behavior:SnackBarBehavior.floating,content: Text("Your Information is Collected"),backgroundColor: Colors.green.shade400,));

            },child: Text("Create",style: TextStyle(color: Color(0xffBFDB38)),),),

          ],
        ),
      ),

    );
  }


}
