import 'package:flutter/material.dart';
import 'package:invoice_built/homescreen.dart';

import 'item_modal.dart';

class AddItems extends StatefulWidget {
  const AddItems({Key? key}) : super(key: key);

  @override
  State<AddItems> createState() => _AddItemsState();
}

class _AddItemsState extends State<AddItems> {

  TextEditingController iid = TextEditingController();
  TextEditingController iname = TextEditingController();
  TextEditingController idata = TextEditingController();
  TextEditingController iprice = TextEditingController();
  TextEditingController iqty = TextEditingController();
  TextEditingController itotal = TextEditingController();

  int total = 0;

  List<Items_Modal> products = [];



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.blueGrey.shade500,
        title: Text("Products",style: TextStyle(fontSize: 30,color: Colors.white)),),

      body:  Center(
        child: Column(
          children: [
            SizedBox(height: 15),
            ElevatedButton(onPressed: () {
              alertproduct();
            },child: Text("Add"),),
            SizedBox(height: 15),
            Expanded(
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: products.length,
                itemBuilder: (context, index) {
                return Items(products[index],index);
              },
              ),
            )
          ],
        ),
      ),

    );
  }

  void alertproduct()
  {
    showDialog(context: context, builder: (context) {
      return AlertDialog(
        title: Text("Add Product"),
        content: SingleChildScrollView(
          child: Column(mainAxisSize: MainAxisSize.min,
            children: [
              Info(hint: "Product Id....",kboard: TextInputType.text,controller: iid),
              Info(hint: "Product Name....",kboard: TextInputType.text,controller: iname),
              Info(hint: "Product Description....",kboard: TextInputType.text,controller: idata),
              Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(width: 115,child: Info(hint: "Price...",kboard: TextInputType.number,controller: iprice)),
                  Container(width: 115,child: Info(hint: "Qty...",kboard: TextInputType.number,controller: iqty))
                ],),
              Info(hint: "Total Amount",kboard: TextInputType.number,controller: itotal),
              SizedBox(height: 15),
              ElevatedButton(onPressed: () {

                Items_Modal item = Items_Modal(iid: iid.text,iname: iname.text,idata: idata.text,iprice: iprice.text,iqty: iqty.text,itotal: itotal.text);
                setState(() {
                  products.add(item);
                });


                Navigator.pop(context);
                ScaffoldMessenger.of(context)!.showSnackBar(SnackBar(behavior:SnackBarBehavior.floating,content: Text("Thanks for Adding Product in List"),backgroundColor: Colors.green.shade400,));
              },child: Text("Add"),),
              SizedBox(height: 15),




            ],
          ),
        ),
      );
    },);
  }

  Widget Items(Items_Modal im,int index)
  {
    return Padding(
            padding: EdgeInsets.only(top: 8.0,left: 10,right: 10),
            child: Container(height: 75,width:double.infinity,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.indigo.shade700),
                borderRadius: BorderRadius.all(Radius.circular(20))),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Row(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text("${im.iname}",style: TextStyle(fontSize: 15,color: Color(0xff4474fa)),),
                      Text("${im.idata}",style: TextStyle(fontSize: 12,color: Color(0xffB6C9FD)),),
                    ],
                  ),
                  SizedBox(width: 15),
                  Spacer(),
                  Column(mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text("Price",style: TextStyle(fontSize: 15,color: Color(0xff4474fa)),),
                      Text("${im.iprice}",style: TextStyle(fontSize: 12,color: Color(0xff2a62f9)),),
                    ],
                  ),
                  SizedBox(width: 15),
                  Column(mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text("Qty",style: TextStyle(fontSize: 15,color: Color(0xff4474fa)),),
                      Text("${im.iqty}",style: TextStyle(fontSize: 12,color: Color(0xff2a62f9)),),
                    ],
                  ),
                  SizedBox(width: 20),
                  Column(mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text("Total",style: TextStyle(fontSize: 15,color: Color(0xff4474fa)),),
                      Text("${im.itotal}",style: TextStyle(fontSize: 12,color: Color(0xff2a62f9)),),
                    ],
                  ),



                ],
            ),
              ),),
          );
  }
}

// Items
// Name, Description, Price, Quantity, Total Price
