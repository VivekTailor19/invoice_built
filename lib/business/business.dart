import 'package:flutter/material.dart';

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
              
              ScaffoldMessenger.of(context)!.showSnackBar(SnackBar(behavior:SnackBarBehavior.floating,content: Text("Your Information is Collected"),backgroundColor: Colors.green.shade400,));

            },child: Text("Create"),),

          ],
        ),
      ),

    );
  }

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

}
//   Invoice From--
//   Name,Address,Phone,Email