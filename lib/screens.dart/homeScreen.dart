import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:delivery/Widgit/drawer.dart';
import 'package:delivery/screens.dart/detailsOrders.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {
    return Directionality(
        textDirection: TextDirection.rtl,
        child: SafeArea(
            child: Scaffold(
              drawer: Drawer(
                child: Drawerr(

                ),
              ),
              appBar: AppBar(

                centerTitle: true,
                backgroundColor: Colors.red[800],
                title: Text(
                  "الطلبات",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              body: Container(
                child: StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance
                      .collection('orders')
                      .where('DId',
                      isEqualTo: FirebaseAuth.instance.currentUser.uid).where('delevery',isEqualTo: false)
                      .snapshots(),
                  builder: (BuildContext context,
                      AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (snapshot.hasError) {
                      return Text('Something went wrong');
                    }

                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(child: CircularProgressIndicator());
                    }

                    return new ListView(
                      children:
                      snapshot.data.documents.map((DocumentSnapshot document) {
                        return item(
                          document.data()['Caddress'],
                          document.data()['Cid'],
                          document.data()['Cname'],
                          document.id,
                          document.data()['DId'],
                          document.data()['Daddress'],
                          document.data()['Dname'],
                          document.data()['date'],
                          document.data()['Mname'],
                          document.data()['price'],
                          document.data()['delevery'],

                        );
                      }).toList(),
                    );
                  },
                ),
              ),
            )));
  }

  Widget item(Caddress, Cid, Cname, id,DId, Daddress, Dname,date,Mname,price,delevery) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (BuildContext context) => DetailsOrders(
              Caddress: Caddress,
              Cid: Cid,
              Cname: Cname,
              id:id,
              DId: DId,
              Daddress: Daddress,
              Dname: Dname,
              date: date,
              Mname:Mname,
              price:price,
              delevery:delevery,

            )));
      },
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Colors.red[800],
              ),
              height: 150,
              width: MediaQuery.of(context).size.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(children: [
                    SizedBox(
                      width: 15,
                    ),
                    Text(
                      "اسم العميل",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                      child: Center(
                        child: Text(
                          Cname,
                          style: TextStyle(color: Colors.white, fontSize: 20),
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
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                      child: Center(
                        child: Text(
                          Caddress,
                          style: TextStyle(color: Colors.white, fontSize: 20),
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
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                      child: Center(
                        child: Text(
                          date,
                          style: TextStyle(color: Colors.white, fontSize: 20),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                  ]),

                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
