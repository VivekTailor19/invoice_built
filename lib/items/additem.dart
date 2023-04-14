import 'package:flutter/material.dart';
import 'package:invoice_built/homescreen.dart';

import 'item_modal.dart';

class AddItems extends StatefulWidget {
  const AddItems({Key? key}) : super(key: key);

  @override
  State<AddItems> createState() => _AddItemsState();
}

class _AddItemsState extends State<AddItems> {

  TextEditingController pid = TextEditingController();
  TextEditingController pname = TextEditingController();
  TextEditingController pdata = TextEditingController();
  TextEditingController pprice = TextEditingController();
  TextEditingController pqty = TextEditingController();
  String  total =  "";
  String price = "0";
  String qty = "1";


  List<Items_Modal> products = [Items_Modal(iid: '101',iname: 'Happiness',idata: '1 cr',iprice: '0',iqty: '1000',itotal: '0')];



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
              alertAddProduct();
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

  void alertAddProduct()
  {
    showDialog(context: context, builder: (context) {
      return AlertDialog(
        title: Text("Add Product"),
        content: SingleChildScrollView(
          child: Column(mainAxisSize: MainAxisSize.min,
          children: [
              Info(hint: "Product Id....",kboard: TextInputType.text,controller: pid),
              Info(hint: "Product Name....",kboard: TextInputType.text,controller: pname),
              Info(hint: "Description....",kboard: TextInputType.text,controller: pdata),
                Padding(
                padding: const EdgeInsets.all(10),
                child: TextFormField(
                  onChanged: (value) {
                  if(mounted)
                    {
                      setState(() {
                        price = value;
                        //total = '${int.parse(qty)*int.parse(price)}';
                      });
                    }
                  },
                  controller: pprice,
                  keyboardType: TextInputType.number,
                  style: TextStyle(color: Colors.blueGrey.shade800,fontSize: 20),
                  scrollPhysics: BouncingScrollPhysics(),
                  decoration: InputDecoration(
                    hintText: "Price.....",
                    hintStyle: TextStyle(fontSize: 20,color: Colors.blueGrey.shade100,wordSpacing: 3),
                    filled: true,
                    fillColor: Colors.white,
                    enabled: true,
                    enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(20)),borderSide: BorderSide(color: Colors.indigo.shade200)),
                    focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(20)),borderSide: BorderSide(color: Colors.indigo.shade700)),


                  ),
                ),
              ),
                Padding(
                padding: const EdgeInsets.all(10),
                child: TextFormField(
                  onChanged: (value) {
                    setState(() {
                      qty = value;
                      total = '${int.parse(qty)*int.parse(price)}';

                    });
                  },
                  controller: pqty,
                  keyboardType: TextInputType.number,
                  style: TextStyle(color: Colors.blueGrey.shade800,fontSize: 20),
                  scrollPhysics: BouncingScrollPhysics(),
                  decoration: InputDecoration(
                    hintText: "QTY.....",
                    hintStyle: TextStyle(fontSize: 20,color: Colors.blueGrey.shade100,wordSpacing: 3),
                    filled: true,
                    fillColor: Colors.white,
                    enabled: true,
                    enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(20)),borderSide: BorderSide(color: Colors.indigo.shade200)),
                    focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(20)),borderSide: BorderSide(color: Colors.indigo.shade700)),


                  ),
                ),
              ),
              // Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
              //   children: [
              //     Container(width: 115,child: Info(hint: "Price...",kboard: TextInputType.number,controller: pprice)),
              //     Container(width: 115,child: Info(hint: "Qty...",kboard: TextInputType.number,controller: pqty))
              //   ],),
              Text("$total",style: TextStyle(color: Colors.red,fontSize: 20),),

              SizedBox(height: 15),

              ElevatedButton(onPressed: () {


                setState(() {
                  Items_Modal item = Items_Modal(iid: pid.text,iname: pname.text,idata: pdata.text,iprice: pprice.text,iqty: pqty.text,itotal: total);
                  products.add(item);
                  pid.text = '';
                  pname.text = '';
                  pdata.text= '';
                  pprice.text = '';
                  pqty.text = '';
                  total = '';

                });


                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(behavior:SnackBarBehavior.floating,content: Text("Thanks for Adding Product in List"),backgroundColor: Colors.green.shade400,));

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
                  Text("${im.iid}",style: TextStyle(fontSize: 17,color: Color(0xff4474fa)),),
                  SizedBox(width: 10),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text("${im.iname}",style: TextStyle(fontSize: 15,color: Color(0xff4474fa)),),
                      Text("${im.idata}",style: TextStyle(fontSize: 13,color: Color(0xffB6C9FD)),),
                    ],
                  ),
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
