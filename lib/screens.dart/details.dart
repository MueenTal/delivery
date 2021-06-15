import 'package:flutter/material.dart';

class DetailsOrders extends StatefulWidget {
  @override
  _DetailsOrdersState createState() => _DetailsOrdersState();
}

class _DetailsOrdersState extends State<DetailsOrders> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Row(
            children: [
              IconButton(
                icon: Icon(Icons.arrow_back_ios),
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(Icons.arrow_back_ios),
                onPressed: () {},
              ),
            ],
          ),
          Row(
            children: [
              Text("الطلب رقم"),
              Text("\$ number"),
            ],
          ),
          Container(
            child: Column(
              children: [
                Text("الاسم: "),
                Text("Burger"),
                Text("العنوان: "),
                Text("syria"),
                Text("المبلغ الاجمالي: "),
                Text("15000"),
              ],
            ),
          ),
          Center(
            child: TextButton(
              child: Text("تم"),
              onPressed: () {},
              style: TextButton.styleFrom(
                textStyle: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
