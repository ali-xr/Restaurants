import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';
import 'package:restaurant/deliverService/deliver.dart';
import 'package:restaurant/deliverService/deliverService.dart';

class OrderList extends StatefulWidget {
  const OrderList({Key? key}) : super(key: key);

  @override
  _OrderListState createState() => _OrderListState();
}

class _OrderListState extends State<OrderList> {
  SlidableController _slidableController = SlidableController();
  int son = 1;

  @override
  Widget build(BuildContext context) {
    final orders = Provider.of<List<Deliver>>(context);

    orders.forEach((element) {
      print(element.rasm);
      print(element.narxi);
      print(element.ism1);
      print(element.raqam);
    });

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 100.0, top: 20.0),
          child: Row(
            children: [
              Image.asset(
                "assets/images/swipe.png",
                height: 25.0,
                width: 25.0,
              ),
              SizedBox(width: 5.0),
              Text(
                "swipe on an item to delete",
                style: TextStyle(fontSize: 15.0),
              )
            ],
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: orders.length,
            itemBuilder: (context, index) {
              final item = orders[index];
              return Slidable(
                actionPane: SlidableDrawerActionPane(),
                key: Key(item.toString()),
                controller: _slidableController,
                child: Padding(
                  padding:
                      const EdgeInsets.only(left: 20.0, right: 20.0, top: 15.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 110.0,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30.0)),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 15.0, right: 10.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 17),
                            height: 80,
                            width: 80,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(40),
                              image: DecorationImage(
                                  image: NetworkImage(
                                    item.rasm.toString(),
                                  ),
                                  fit: BoxFit.cover),
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 10.0, top: 10.0, bottom: 10.0),
                                child: Row(
                                  children: [
                                    Text(
                                      item.ism1.toString(),
                                      style: TextStyle(fontSize: 16.0),
                                    ),
                                    Text(
                                      item.narxi.toString(),
                                      style: TextStyle(fontSize: 16.0),
                                    ),
                                  ],
                                ),
                              ),
                              Row(
                                children: [
                                  Text(
                                    item.narxi.toString(),
                                    style: TextStyle(
                                        fontSize: 16.0, color: Colors.red),
                                  ),
                                  SizedBox(width: 70.0),
                                  Container(
                                    width: 50.0,
                                    height: 20.0,
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                        color: Colors.red),
                                    child: Row(
                                      children: [
                                        SizedBox(width: 10.0),
                                        GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              if (son >= 1) {
                                                son -= 1;
                                              }
                                            });
                                          },
                                          child: Text(
                                            "-",
                                            style: TextStyle(
                                                fontSize: 15.0,
                                                color: Colors.white),
                                          ),
                                        ),
                                        SizedBox(width: 5.0),
                                        Text(
                                          "$son",
                                          style: TextStyle(
                                              fontSize: 10.0,
                                              color: Colors.white),
                                        ),
                                        SizedBox(
                                          width: 5.0,
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              son += 1;
                                            });
                                          },
                                          child: Text(
                                            "+",
                                            style: TextStyle(
                                                fontSize: 13.0,
                                                color: Colors.white),
                                          ),
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                actions: [
                  IconSlideAction(
                    onTap: () {},
                    icon: Icons.archive,
                    iconWidget: Container(
                      width: 50.0,
                      height: 50.0,
                      decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(50.0)),
                      child: Icon(
                        Icons.delete,
                        color: Colors.white,
                      ),
                    ),
                    color: Colors.transparent,
                  ),
                  IconSlideAction(
                    onTap: () {},
                    icon: Icons.archive,
                    iconWidget: Container(
                      width: 50.0,
                      height: 50.0,
                      decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(50.0)),
                      child: Icon(Icons.favorite, color: Colors.white),
                    ),
                    color: Colors.transparent,
                  ),
                ],
                secondaryActions: [
                  IconSlideAction(
                    onTap: () {},
                    icon: Icons.archive,
                    iconWidget: Container(
                      width: 50.0,
                      height: 50.0,
                      decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(50.0)),
                      child: Icon(Icons.favorite, color: Colors.white),
                    ),
                    color: Colors.transparent,
                  ),
                  IconSlideAction(
                    onTap: () {},
                    icon: Icons.archive,
                    iconWidget: Container(
                      width: 50.0,
                      height: 50.0,
                      decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(50.0)),
                      child: Icon(
                        Icons.delete,
                        color: Colors.white,
                      ),
                    ),
                    color: Colors.transparent,
                  ),
                ],
                dismissal: SlidableDismissal(
                  child: SlidableDrawerDismissal(),
                  onDismissed: (action) async {
                    await DeliverService()
                        .deleteFirestore(item.raqam.toString());
                  },
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
