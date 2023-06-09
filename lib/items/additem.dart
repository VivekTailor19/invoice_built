import 'package:flutter/material.dart';
import 'package:invoice_built/homescreen.dart';

import 'item_modal.dart';

List<Items_Modal> products = [];

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
  String total = "";
  String price = "0";
  String qty = "1";

  TextEditingController uid = TextEditingController();
  TextEditingController uname = TextEditingController();
  TextEditingController udata = TextEditingController();
  TextEditingController uprice = TextEditingController();
  TextEditingController uqty = TextEditingController();
  String uptotal = "";
  String upprice = "0";
  String upqty = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        label: Text(
          "Go to Invoice",
          style: TextStyle(fontSize: 25,color: Colors.greenAccent.shade400
          //Color(0xffBFDB38)
          ),
        ),
        backgroundColor: Color(0xff292931),
        onPressed: () {
          //setState(() {

          double subtotal = 0;
          int tax = 8;
          double total = 0;
          double length = 1;

          for (int i = 0; i < products.length; i++) {
            setState(() {
              subtotal = subtotal + int.parse(products[i].itotal!);
              length = products.length * 50;
            });
            print(products[i].itotal);
          }
          setState(() {
            total = subtotal + (subtotal * tax) / 100;


          print("$subtotal * $tax%  == $total");

          List data = [subtotal, tax, total, length];

          Navigator.pushNamed(context, "invoice", arguments: data);
          print(products.length);
          });

          //});
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      // floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
      appBar: AppBar(
        title: Text("Products"),
      ),

      body: Column(
        children: [
          SizedBox(height: 15),
          ElevatedButton(
            onPressed: () {

              alertAddProduct().then((value) => (value) {
                    setState(() {});
                  });
            },
            child: Text("Add",style: TextStyle(color: Color(0xffBFDB38)),),
          ),
          SizedBox(height: 15),
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              itemBuilder: (context, index) {
                return InkWell(
                  child: Items(products[index], index),
                  onTap: () {
                    uid = TextEditingController(text: "${products[index].iid}");
                    uname = TextEditingController(text: "${products[index].iname}");
                    udata = TextEditingController(text: "${products[index].idata}");
                    uprice = TextEditingController(text: "${products[index].iprice}");
                    uqty = TextEditingController(text: "${products[index].iqty}");

                    uptotal = (int.parse(upprice) * int.parse(upqty)).toString();

                    alertUpdateProduct(index);
                  },
                );
              },
              itemCount: products.length,
            ),
          ),
        ],
      ),
    );
  }

  Future<void> alertAddProduct() // alert dialog
  async {
    await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Add Product"),
          content: StatefulBuilder(
            // Dialog ma data refresh kari live update jova
            builder: (context, setState) => SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Info(
                      hint: "Product Id....",
                      kboard: TextInputType.text,
                      controller: pid),
                  Info(
                      hint: "Product Name....",
                      kboard: TextInputType.text,
                      controller: pname),
                  Info(
                      hint: "Description....",
                      kboard: TextInputType.text,
                      controller: pdata),
                  SizedBox(height: 55,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 10, left: 10),
                      child: TextFormField(
                        onChanged: (value) {
                          // if(mounted)
                          //   {
                          setState(() {
                            price = value;
                            total = '${int.parse(qty) * int.parse(price)}';
                          });
                          // }
                        },
                        controller: pprice,
                        keyboardType: TextInputType.number,
                        style: TextStyle(
                            color: Colors.blueGrey.shade800, fontSize: 20),
                        scrollPhysics: BouncingScrollPhysics(),
                        decoration: InputDecoration(
                          labelText: "Price",

                          labelStyle: TextStyle(fontSize: 18,color: Color(0xaa292931),wordSpacing: 3),

                          filled: true,
                          fillColor: Colors.white,
                          enabled: true,
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(15)),
                              borderSide:
                                  BorderSide(width:1.5,color: Color(0x9900425A))),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(15)),
                              borderSide:
                                  BorderSide(width:2,color: Color(0xff00425A))),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 55,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 8, right: 10, left: 10),
                      child: TextFormField(
                        onChanged: (value) {
                          setState(() {
                            qty = value;
                            total = '${int.parse(qty) * int.parse(price)}';
                          });
                        },
                        controller: pqty,
                        keyboardType: TextInputType.number,
                        style: TextStyle(
                            color: Colors.blueGrey.shade800, fontSize: 20),
                        scrollPhysics: BouncingScrollPhysics(),
                        decoration: InputDecoration(
                          labelText: "QTY",
                          labelStyle: TextStyle(fontSize: 18,color: Color(0xaa292931),wordSpacing: 3),
                          filled: true,
                          fillColor: Colors.white,
                          enabled: true,
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(15)),
                              borderSide:
                                  BorderSide(width:1.5,color: Color(0x9900425A))),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(15)),
                              borderSide:
                                  BorderSide(width:2,color: Color(0xff00425A))),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 5),
                  Container(
                      width: 150,
                      height: 30,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        //    border: Border.all(color: Colors.indigo.shade200)
                      ),
                      child: Text(
                        "$total",
                        style: TextStyle(
                            color: Colors.blueGrey.shade800, fontSize: 25),
                      )),
                  SizedBox(height: 5),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        Items_Modal item = Items_Modal(
                            iid: pid.text,
                            iname: pname.text,
                            idata: pdata.text,
                            iprice: pprice.text,
                            iqty: pqty.text,
                            itotal: total);
                        products.add(item);
                        print(products);
                        pid.clear();
                        pname.clear();
                        pdata.clear();
                        pprice.clear();
                        pqty.clear();
                        total = '';
                      });

                      Navigator.pop(context);
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(duration: Duration(seconds: 2),
                        behavior: SnackBarBehavior.floating,
                        content: Text("Thanks for Adding Product in List"),
                        backgroundColor: Colors.green.shade400,
                      ));
                    },
                    child: Text("Add",style: TextStyle(color: Color(0xffBFDB38)),),
                  ),
                  SizedBox(height: 15),
                ],
              ),
            ),
          ),
        );
      },
    );
    setState(() {});
  }

  Widget Items(Items_Modal im, int index) {
    return Padding(
      padding: EdgeInsets.only(top: 8.0, left: 10, right: 10),
      child: Container(
        height: 100,
        width: double.infinity,
        decoration: BoxDecoration(
            border: Border.all(color: Colors.indigo.shade700),
            borderRadius: BorderRadius.all(Radius.circular(20))),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Row(
            children: [
              Text(
                "${im.iid}",
                style: TextStyle(fontSize: 17, color: Color(0xff4474fa)),
              ),
              SizedBox(width: 10),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${im.iname}",
                    style: TextStyle(fontSize: 15, color: Color(0xff4474fa)),
                  ),
                  Text(
                    "${im.idata}",
                    style: TextStyle(fontSize: 13, color: Color(0xffB6C9FD)),
                  ),
                ],
              ),
              Spacer(),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    "Price",
                    style: TextStyle(fontSize: 15, color: Color(0xff4474fa)),
                  ),
                  Text(
                    "${im.iprice}",
                    style: TextStyle(fontSize: 12, color: Color(0xff2a62f9)),
                  ),
                ],
              ),
              SizedBox(width: 15),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    "Qty",
                    style: TextStyle(fontSize: 15, color: Color(0xff4474fa)),
                  ),
                  Text(
                    "${im.iqty}",
                    style: TextStyle(fontSize: 12, color: Color(0xff2a62f9)),
                  ),
                ],
              ),
              SizedBox(width: 20),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    "Total",
                    style: TextStyle(fontSize: 15, color: Color(0xff4474fa)),
                  ),
                  Text(
                    "${im.itotal}",
                    style: TextStyle(fontSize: 12, color: Color(0xff2a62f9)),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> alertUpdateProduct(int index) // alert dialog
  async{
   await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Product"),
          content: StatefulBuilder(
            builder: (context, setState) => SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  UpdateItem(
                    controller: uid,
                  ),
                  UpdateItem(
                      controller: uname,
                      kboard: TextInputType.text),
                  UpdateItem(
                      controller: udata,
                      kboard: TextInputType.text),
                  SizedBox(height: 55,
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: TextFormField(
                        onChanged: (value) {
                          setState(() {
                            upprice = value;
                            uptotal = '${int.parse(upqty) * int.parse(upprice)}';
                          });
                        },
                        controller: uprice,
                        keyboardType: TextInputType.number,
                        style: TextStyle(
                            color: Colors.blueGrey.shade800, fontSize: 20),
                        scrollPhysics: BouncingScrollPhysics(),
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          enabled: true,
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(15)),
                              borderSide:
                                  BorderSide(width: 1.5,color: Colors.indigo.shade200)),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(15)),
                              borderSide:
                                  BorderSide(width:2,color: Colors.indigo.shade700)),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 55,
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: TextFormField(
                        onChanged: (value) {
                          setState(() {
                            upqty = value;
                            uptotal = '${int.parse(upqty) * int.parse(upprice)}';
                          });
                        },
                        controller: uqty,
                        keyboardType: TextInputType.number,
                        style: TextStyle(
                            color: Colors.blueGrey.shade800, fontSize: 20),
                        scrollPhysics: BouncingScrollPhysics(),
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          enabled: true,
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(15)),
                              borderSide:
                                  BorderSide(color: Colors.indigo.shade200)),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(15)),
                              borderSide:
                                  BorderSide(color: Colors.indigo.shade700)),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      "$uptotal",
                      style: TextStyle(
                          color: Colors.blueGrey.shade800, fontSize: 25),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        products[index] = Items_Modal(
                            iid: uid.text,
                            iname: uname.text,
                            idata: udata.text,
                            iprice: uprice.text,
                            iqty: uqty.text,
                            itotal: uptotal
                        );

                        print(products);

                      });
                      uid.clear();
                      uname.clear();
                      udata.clear();
                      uprice.clear();
                      uqty.clear();
                      uptotal = "";


                      Navigator.pop(context);
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(duration: Duration(seconds: 2),
                        behavior: SnackBarBehavior.floating,
                        content: Text("Products is Updated"),
                        backgroundColor: Colors.green.shade400,
                      ));
                    },
                    child: Text("Update",style: TextStyle(color: Color(0xffBFDB38)),),
                  ),
                  SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () {
                      products.removeAt(index);
                      Navigator.pop(context);
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        behavior: SnackBarBehavior.floating,
                        content: Text("Product List is Updated"),
                        backgroundColor: Colors.green.shade400,
                      ));
                    },
                    child: Text("Delete",style: TextStyle(color: Color(0xffBFDB38)),),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
    setState(() {

    });
  }

  Widget UpdateItem(
      {TextEditingController? controller,
      TextInputType? kboard,
      String? preinput}) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(10),
          child: TextFormField(
            controller: controller,
            keyboardType: kboard,
            style: TextStyle(color: Colors.blueGrey.shade800, fontSize: 20),
            scrollPhysics: BouncingScrollPhysics(),
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              enabled: true,
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  borderSide: BorderSide(color: Colors.indigo.shade200)),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  borderSide: BorderSide(color: Colors.indigo.shade700)),
            ),
          ),
        ),
      ],
    );
  }

// Widget Item_Tile(Items_Modal im,int index)
// {
//   return Padding(
//     padding: EdgeInsets.only(top: 8.0,left: 10,right: 10),
//     child: Container(height: 75,width:double.infinity,
//       decoration: BoxDecoration(
//           border: Border.all(color: Colors.indigo.shade700),
//           borderRadius: BorderRadius.all(Radius.circular(20))),
//       child: ExpansionTile(
//         leading: Text("${im.iid}",style: TextStyle(fontSize: 17,color: Color(0xff4474fa)),),
//         title: Row(
//           children: [
//             Column(
//               mainAxisAlignment: MainAxisAlignment.spaceAround,
//               children: [
//                 Text("${im.iname}",style: TextStyle(fontSize: 15,color: Color(0xff4474fa)),),
//                 Text("${im.idata}",style: TextStyle(fontSize: 13,color: Color(0xffB6C9FD)),),
//               ],
//             ),
//             //SizedBox(width: 10),
//             Column(mainAxisAlignment: MainAxisAlignment.spaceAround,
//               children: [
//                 Text("Price",style: TextStyle(fontSize: 15,color: Color(0xff4474fa)),),
//                 Text("${im.iprice}",style: TextStyle(fontSize: 12,color: Color(0xff2a62f9)),),
//               ],
//             ),
//             //SizedBox(width: 10),
//             Column(mainAxisAlignment: MainAxisAlignment.spaceAround,
//               children: [
//                 Text("Qty",style: TextStyle(fontSize: 15,color: Color(0xff4474fa)),),
//                 Text("${im.iqty}",style: TextStyle(fontSize: 12,color: Color(0xff2a62f9)),),
//               ],
//             ),
//            //SizedBox(width: 10),
//             Column(mainAxisAlignment: MainAxisAlignment.spaceAround,
//               children: [
//                 Text("Total",style: TextStyle(fontSize: 15,color: Color(0xff4474fa)),),
//                 Text("${im.itotal}",style: TextStyle(fontSize: 12,color: Color(0xff2a62f9)),),
//               ],
//             ),
//           ],
//         ),
//         trailing: Icon(Icons.more_vert_rounded),
//
//
//
//       ),),
//   );
// }
}

// Items
// Name, Description, Price, Quantity, Total Price
