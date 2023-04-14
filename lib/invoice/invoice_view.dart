import 'package:flutter/material.dart';

class Invoice_View extends StatefulWidget {
  const Invoice_View({Key? key}) : super(key: key);

  @override
  State<Invoice_View> createState() => _Invoice_ViewState();
}

class _Invoice_ViewState extends State<Invoice_View> {
  Color green = Colors.green;
  Color c2 = Color(0xff292931);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey.shade500,
        title: Text("Invoice",
            style: TextStyle(fontSize: 30, color: Colors.white)),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [

                Container(
                    width: 180,
                    height: 100,
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.only(topRight: Radius.circular(10),bottomRight: Radius.circular(25)),color: green),
                    ),
                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: Container(width: 140, height: 100, color: c2),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    alignment: Alignment.topLeft,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'INVOICE TO:',
                          style: TextStyle(color: green),
                        ),
                        Text(
                          "Client Name.",
                          style: TextStyle(fontSize: 20, color: c2),
                        ),
                        Text(
                          "Address",
                          style: TextStyle(fontSize: 13),
                        ),
                        Text(
                          "Phone Number",
                          style: TextStyle(fontSize: 13),
                        ),
                        Text(
                          "Email Id",
                          style: TextStyle(fontSize: 13),
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 10),
                  Container(
                    alignment: Alignment.topLeft,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Dear Client,",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 5),
                        Text(
                          "I hope you are well.Please see attached the invoice [number] for [completed project].The invoice is due by [date].Please don't hesitate to get in touch if you have any questions or need clarifications.",
                          style: TextStyle(fontSize: 10),
                          textAlign: TextAlign.justify,
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 15),
                  Container(
                    height: 40,
                    decoration: BoxDecoration(
                        color: green, borderRadius: BorderRadius.circular(8)),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Container(
                            width: 26,
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "No.",
                              style: TextStyle(
                                  color: Colors.white, fontSize: 11.5),
                            ),
                          ),
                          Container(
                            width: 150,
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Product Description",
                              style: TextStyle(
                                  color: Colors.white, fontSize: 11.5),
                            ),
                          ),
                          Container(
                            width: 50,
                            alignment: Alignment.center,
                            child: Text(
                              "Price",
                              style: TextStyle(
                                  color: Colors.white, fontSize: 11.5),
                            ),
                          ),
                          Container(
                            width: 45,
                            alignment: Alignment.center,
                            child: Text(
                              "Quantity",
                              style: TextStyle(
                                  color: Colors.white, fontSize: 11.5),
                            ),
                          ),
                          Container(
                            width: 50,
                            alignment: Alignment.centerRight,
                            child: Text(
                              "Total",
                              style: TextStyle(
                                  color: Colors.white, fontSize: 11.5),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Bill_Items(Colors.white70),
                  Bill_Items(Colors.white70),
                  Bill_Items(Colors.white60),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 20.0),
                        child: Container(
                          height: 80,
                          width: 155,
                          decoration: BoxDecoration(
                              color: green,
                              borderRadius: BorderRadius.circular(10)),
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Payment Method",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 11,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(height: 10),
                                Row(
                                  children: [
                                    Container(
                                      child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Account No:",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 9),
                                            ),
                                            Text(
                                              "Account Name:",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 9),
                                            ),
                                            Text(
                                              "Branch Name",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 9),
                                            ),
                                          ]),
                                    ),
                                    SizedBox(width: 5),
                                    Container(
                                      child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "1234 5678 9109",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 9),
                                            ),
                                            Text(
                                              "Jhone Doe.",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 9),
                                            ),
                                            Text(
                                              "XYZ",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 9),
                                            ),
                                          ]),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Container(
                        height: 135,
                        width: 120,
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 10, left: 10, right: 10),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "SubTotal:",
                                    style: TextStyle(fontSize: 9),
                                  ),
                                  Text(
                                    "₹ 5000.00",
                                    style: TextStyle(
                                        fontSize: 9,
                                        fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 10, left: 10, right: 10),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Discount:",
                                    style: TextStyle(fontSize: 9),
                                  ),
                                  Text(
                                    "00.00",
                                    style: TextStyle(
                                        fontSize: 9,
                                        fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Tax (10%):",
                                    style: TextStyle(fontSize: 9),
                                  ),
                                  Text(
                                    "₹ 500.00",
                                    style: TextStyle(
                                        fontSize: 9,
                                        fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                            ),
                            Container(
                              height: 30,
                              decoration: BoxDecoration(
                                  color: green,
                                  borderRadius: BorderRadius.circular(5)),
                              child: Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Total",
                                      style: TextStyle(
                                          fontSize: 11, color: Colors.white),
                                    ),
                                    Text(
                                      "₹ 5500.00",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 11,
                                          color: Colors.white),
                                    )
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 180,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Terms & Condition:",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 11,
                                  color: green),
                            ),
                            SizedBox(height: 8),
                            Text(
                              "Use of simple, polite, and straightforward language. Mentioning the complete details of the firm and the client. Complete details of the product or service, including taxes or discounts.",
                              style:
                                  TextStyle(fontSize: 9, color: Colors.black45),
                              textAlign: TextAlign.justify,
                            )
                          ],
                        ),
                      ),
                      Container(
                        width: 150,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              height: 40,
                              width: 130,
                              child: Image.asset("assets/images/radiation.png"),
                            ),
                            Divider(color: Colors.black26),
                            Text(
                              "Your Name & Signature",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 11),
                            ),
                            Text(
                              "Account Manager",
                              style: TextStyle(fontSize: 9),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 15),
                  Text(
                    "😃 Thank You For Shopping 😃\n😎...ફરી મુલાકાત લેશોજી....😎",
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
            Row(
              // crossAxisAlignment: CrossAxisAlignment.end,
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Stack(
                  alignment: Alignment(1, 1),
                  children: [
                    Container(width: 360, height: 25, color: green),
                    Container(
                      width: 200,
                      height: 40,
                      decoration: BoxDecoration(
                          color: c2,
                          borderRadius:
                              BorderRadius.only(topLeft: Radius.circular(90))),
                    ),
                  ],
                ),
                // Container(width: 150, height: 30, color: green),
                // Container(width: 200, height: 50,
                //   decoration: BoxDecoration(color: c2,
                //       borderRadius: BorderRadius.only(topLeft:Radius.circular(90))),),
              ],
            ),
            SizedBox(height: 15),
          ],
        ),
      ),
    );
  }

  Widget Bill_Items(Color change) {
    return Container(
      height: 45,
      decoration:
          BoxDecoration(color: change, borderRadius: BorderRadius.circular(8)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Container(
              width: 26,
              alignment: Alignment.centerLeft,
              child: Text(
                "No.",
                style: TextStyle(fontSize: 11.5),
              ),
            ),
            Container(
              width: 150,
              alignment: Alignment.centerLeft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Product Name",
                    style: TextStyle(fontSize: 11.5),
                  ),
                  Text(
                    "Product Description",
                    style: TextStyle(fontSize: 11.5, color: Colors.black38),
                  ),
                ],
              ),
            ),
            Container(
              width: 50,
              alignment: Alignment.center,
              child: Text(
                "Price",
                style: TextStyle(fontSize: 11.5),
              ),
            ),
            Container(
              width: 45,
              alignment: Alignment.center,
              child: Text(
                "Quantity",
                style: TextStyle(fontSize: 11.5),
              ),
            ),
            Container(
              width: 50,
              alignment: Alignment.centerRight,
              child: Text(
                "Total",
                style: TextStyle(fontSize: 11.5),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
