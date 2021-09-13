import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant/deliverService/deliver.dart';
import 'package:restaurant/deliverService/deliverService.dart';
import 'package:restaurant/orders/orderList.dart';

class Order extends StatefulWidget {
  Order({Key? key}) : super(key: key);

  @override
  _OrderState createState() => _OrderState();
}

class _OrderState extends State<Order> {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<Deliver>?>.value(
      value: DeliverService().orders,
      initialData: [],
      child: Scaffold(
          appBar: AppBar(
            toolbarHeight: 80.0,
            backgroundColor: Colors.transparent,
            elevation: 0.0,
            iconTheme: IconThemeData(color: Colors.black),
            leading: IconButton(
              onPressed: () => Navigator.pop(context),
              icon: Icon(
                Icons.arrow_back_ios_new,
                size: 17.0,
              ),
            ),
            title: Text(
              "Cart",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w400,
                fontSize: 16.0,
              ),
            ),
            centerTitle: true,
          ),
          body: OrderList()),
    );
  }
}
