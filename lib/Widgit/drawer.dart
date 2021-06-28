
import 'package:delivery/screens.dart/homeScreen.dart';
import 'package:delivery/screens.dart/loginScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Drawerr extends StatefulWidget {

  @override
  _DrawerrState createState() => _DrawerrState();
}

class _DrawerrState extends State<Drawerr> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        DrawerHeader(
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: <Color>[
                  Colors.red[900],
                  Colors.red[900],
                ])),
            child: Container(
                child: Column(
                  children: <Widget>[

                    Padding(
                      padding: const EdgeInsets.all(3),
                      child: Text(
                        'عامل التوصيل',
                        style: TextStyle(color: Colors.black, fontSize: 18),
                      ),
                    )
                  ],
                ))),

        // اذا كان مسجل دخول سيظهر زر تسجيل الخروج والعكس

        CustomListTitle(
            Icons.logout,"تسجيل الخروج",
                 () async {
              await FirebaseAuth.instance.signOut();
              Fluttertoast.showToast(
                  msg: "تم تسجيل الخروج بنجاح",
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.BOTTOM,
                  timeInSecForIosWeb: 1,
                  backgroundColor: Colors.green,
                  textColor: Colors.white,
                  fontSize: 16.0);
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (BuildContext context) => Login()));
            }
               ),

        SizedBox(
          height: 50,
        ),
        SizedBox(
          height: 10,
        ),
      ],
    );
  }
}

class CustomListTitle extends StatelessWidget {
  final IconData icon;
  final String text;
  final Function onTap;

  CustomListTitle(this.icon, this.text, this.onTap);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
            border: Border(bottom: BorderSide(color: Colors.grey.shade300))),
        child: InkWell(
          splashColor: Colors.red[700],
          onTap: onTap,
          child: Container(
            height: 50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(children: <Widget>[
                  Icon(
                    icon,
                    size: 35,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      text,
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                ]),
                Icon(
                  Icons.arrow_right,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
