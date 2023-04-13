import 'package:flutter/material.dart';
import 'package:invoice_built/homescreen.dart';

class AddItems extends StatefulWidget {
  const AddItems({Key? key}) : super(key: key);

  @override
  State<AddItems> createState() => _AddItemsState();
}

class _AddItemsState extends State<AddItems> {

  TextEditingController iid = TextEditingController();
  TextEditingController iname = TextEditingController();
  TextEditingController iprice = TextEditingController();
  TextEditingController iqty = TextEditingController();

  int total = 0;



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.blueGrey.shade500,
        title: Text("Products",style: TextStyle(fontSize: 30,color: Colors.white)),),

      body: Column(
        children: [
          Info(hint: "Product Id....",kboard: TextInputType.text,controller: iname),
          Info(hint: "Product Name....",kboard: TextInputType.text,controller: iname),
          Info(hint: "Product Description....",kboard: TextInputType.text,controller: iname),
          Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
            Container(width: 150,child: Info(hint: "Price....",kboard: TextInputType.number,controller: iname)),
            Container(width: 150,child: Info(hint: "Quantity....",kboard: TextInputType.number,controller: iname))
          ],),
          Container(width: 180,height: 75,alignment: Alignment.center,
              child:Text("Total Pay",style:TextStyle(color: Colors.blueGrey.shade800,fontSize: 20)),
              decoration: BoxDecoration(
              border: Border.all(color: Colors.indigo.shade700),
              borderRadius: BorderRadius.all(Radius.circular(20)),)),


        ],
      ),
    );
  }
}

// Items
// Name, Description, Price, Quantity, Total Price
