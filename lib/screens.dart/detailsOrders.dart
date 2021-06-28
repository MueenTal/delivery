import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class DetailsOrders extends StatefulWidget {
  final String DId;
  final String Dname;
  final String Daddress;
  final String Cname;
  final String Caddress;
  final String Cid;
  final String date;
  final String Mname;
  final int price;
  final bool delevery;
  final String id;


  DetailsOrders(
      {
        this.DId,
        this.Dname,
        this.Daddress,
        this.Cname,
        this.Caddress,
        this.Cid,
        this.date,
        this.Mname,
        this.price,
        this.delevery,
        this.id,
      });
  @override
  _DetailsOrdersState createState() => _DetailsOrdersState();
}

class _DetailsOrdersState extends State<DetailsOrders> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            backgroundColor: Colors.red[800],
            title: Text(
              "تفاصيل الطلب",
              style: TextStyle(color: Colors.white),
            ),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                  Row(children: [
                    SizedBox(
                      width: 15,
                    ),
                    Text(
                      "اسم العميل",
                      style: TextStyle(color: Colors.black, fontSize: 20),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                      child: Center(
                        child: Text(
                          widget.Cname,
                          style: TextStyle(color: Colors.black, fontSize: 20),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                  ]),
                  Row(children: [
                    SizedBox(
                      width: 15,
                    ),
                    Text(
                      "العنوان",
                      style: TextStyle(color: Colors.black, fontSize: 20),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                      child: Center(
                        child: Text(
                          widget.Caddress,
                          style: TextStyle(color: Colors.black, fontSize: 20),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                  ]),
                  Row(children: [
                    SizedBox(
                      width: 15,
                    ),
                    Text(
                      "التوقيت",
                      style: TextStyle(color: Colors.black, fontSize: 20),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                      child: Center(
                        child: Text(
                          widget.date,
                          style: TextStyle(color: Colors.black, fontSize: 20),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                  ]),
                    Row(children: [
                      SizedBox(
                        width: 15,
                      ),
                      Text(
                        "اسم الوجبة",
                        style: TextStyle(color: Colors.black, fontSize: 20),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Container(
                        child: Center(
                          child: Text(
                            widget.Mname,
                            style: TextStyle(color: Colors.black, fontSize: 20),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                    ]),
                    Row(children: [
                      SizedBox(
                        width: 15,
                      ),
                      Text(
                        "السعر",
                        style: TextStyle(color: Colors.black, fontSize: 20),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Container(
                        child: Center(
                          child: Text(
                            widget.price.toString(),
                            style: TextStyle(color: Colors.black, fontSize: 20),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                    ]),
                    Padding(
                      padding: const EdgeInsets.all(50.0),
                      child: Container(
                          height: 50,
                          width: MediaQuery.of(context).size.width / 1.5,
                          decoration: BoxDecoration(
                              borderRadius:
                              BorderRadius.all(Radius.circular(20.0)),
                              gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                    Colors.red[700],
                                    Colors.red[700],
                                  ])),
                          child: FlatButton(
                              splashColor: Colors.red[300],
                              child: Text(
                                "تم",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              onPressed: ()
                              async {
                                String id=widget.id;
                                await FirebaseFirestore.instance
                                    .collection('card')
                                    .doc(id)
                                    .update({
                                  "confirm": true,
                                });

                              }

                          )),)
                  ]),),),),
     ),);
  }
}

