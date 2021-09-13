import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';
import 'package:restaurant/deliverService/deliver.dart';
import 'package:restaurant/deliverService/deliverService.dart';
import 'package:restaurant/favorite/favar.dart';
import 'package:restaurant/favorite/favoriteService.dart';

class FavoriteList extends StatefulWidget {
  const FavoriteList({Key? key}) : super(key: key);

  @override
  _FavoriteListState createState() => _FavoriteListState();
}

class _FavoriteListState extends State<FavoriteList> {
  SlidableController _slidableController = SlidableController();
  int son = 1;

  @override
  Widget build(BuildContext context) {
    final orders = Provider.of<List<Favorit>>(context);

    orders.forEach((element) {
      print(element.rasm);
      print(element.narxi);
      print(element.ism1);
      print(element.ism2);
      print(element.raqam);
    });

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        StreamBuilder<QuerySnapshot>(
            stream:
                FirebaseFirestore.instance.collection("Favorite").snapshots(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                if (orders.length != 0) {
                  return ListView.builder(
                    itemCount: orders.length,
                    itemBuilder: (context, index) {
                      final item = orders[index];
                      return Slidable(
                        actionPane: SlidableDrawerActionPane(),
                        key: Key(snapshot.data!.docs[index].id.toString()),
                        controller: _slidableController,
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 20.0, right: 20.0, top: 15.0),
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            height: 110.0,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(30.0)),
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(top: 20.0, left: 10.0),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Image.network(
                                    item.rasm.toString(),
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 10.0,
                                            top: 10.0,
                                            bottom: 10.0),
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
                                          // Text(
                                          //   snapshot.data!.docs[index]["narxi"]
                                          //       .toString(),
                                          //   style: TextStyle(
                                          //       fontSize: 16.0,
                                          //       color: Colors.red),
                                          // ),
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
                            //  await FavoriteService()
                            //      .deleteFirestore(snapshot.data!.docs[index]["raqam"].toString());
                          },
                        ),
                      );
                    },
                  );
                } else {
                  return Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 140,
                        ),
                        Center(
                          child: Expanded(
                            child: Container(
                              height: 118.33,
                              width: 106.5,
                              child: Image.asset(
                                "assets/images/shopping_car.png",
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 26,
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: Text(
                            "No orders yet ",
                            style: TextStyle(fontSize: 28),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20, top: 16),
                          child: Center(
                            child: Container(
                              width: 233,
                              height: 57,
                              child: Column(
                                children: [
                                  Text(
                                    "Hit the orange button down ",
                                    style: TextStyle(
                                        fontSize: 17,
                                        color: Colors.grey.shade500),
                                  ),
                                  Text(
                                    "below to Create an order",
                                    style: TextStyle(
                                        fontSize: 17,
                                        color: Colors.grey.shade500),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 277,
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 10),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(25)),
                          height: 70,
                          width: 400,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                primary: Colors.orange.shade800,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30))),
                            onPressed: () {
                              // Navigator.push(context,   
                              //     MaterialPageRoute(builder: (context) => LoginPage()));
                            },
                            child: Text(
                              "Start ordering",
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                }
              } else {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            }),
      ],
    );
  }
}
