import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:restaurant/favorite/favar.dart';
import 'package:restaurant/favorite/favorite.dart';
import 'package:restaurant/indexed/indexed.dart';
import 'package:restaurant/orders/order.dart';
import 'package:restaurant/personal/person.dart';
import 'package:restaurant/smallpages/history.dart';
import 'package:restaurant/smallpages/favoritt.dart';
import 'package:restaurant/smallpages/searchPage.dart';

class HomePage extends StatefulWidget {
  ZoomDrawerController? zoomcontroller;
  HomePage(this.zoomcontroller);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var items = ["Foods", "Drinks", "Snacks", "Sauces"];

  var ints = [1, 0, 0, 0];
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: StreamBuilder(
          stream:
              FirebaseFirestore.instance.collection("Restaurant").snapshots(),
          builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (!snapshot.hasData) {
              return Center(
                child: CupertinoActivityIndicator(),
              );
            } else {
              return Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 60,
                  ),
                  Container(
                    height: size.height - 80,
                    width: size.width,
                    child: Stack(
                      children: [
                        Positioned(
                          top: 0,
                          left: 0,
                          right: 0,
                          child: Container(
                            height: 50,
                            margin: EdgeInsets.symmetric(
                              horizontal: 30,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                IconButton(
                                  onPressed: () {
                                    widget.zoomcontroller!.open!();
                                  },
                                  icon: Icon(Icons.notes_outlined),
                                  color: Colors.black45,
                                  iconSize: 30,
                                ),
                                IconButton(
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => Order()));
                                  },
                                  icon: Icon(
                                    Icons.shopping_cart_outlined,
                                  ),
                                  color: Colors.black45,
                                  iconSize: 30,
                                ),
                              ],
                            ),
                          ),
                        ),
                        Positioned(
                          top: 100,
                          left: 40,
                          child: Text(
                            "Delicious",
                            style: TextStyle(fontSize: 38),
                          ),
                        ),
                        Positioned(
                          top: 155,
                          left: 40,
                          child: Text(
                            "food for you",
                            style: TextStyle(fontSize: 38),
                          ),
                        ),
                        Positioned(
                          top: 225,
                          child: Container(
                            margin: EdgeInsets.symmetric(horizontal: 50),
                            width: 314,
                            height: 60,
                            child: TextFormField(
                              cursorColor: Colors.black,
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => Search(),
                                    ));
                              },
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.black12,
                                border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(40),
                                  ),
                                ),
                                prefixIcon: Icon(
                                  Icons.search,
                                  size: 30,
                                  color: Colors.black,
                                ),
                                hintText: "  Searching...",
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          top: 350,
                          left: 0,
                          child: Container(
                            width: size.width,
                            height: 50,
                            child: ListView.builder(
                                physics: BouncingScrollPhysics(
                                    parent: AlwaysScrollableScrollPhysics()),
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                itemCount: items.length,
                                itemBuilder: (context, index) {
                                  return InkWell(
                                    splashColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () {
                                      setState(() {
                                        ints = [0, 0, 0, 0];
                                        ints[index] = 1;
                                      });
                                    },
                                    child: Container(
                                      alignment: Alignment.centerRight,
                                      width: 100,
                                      height: 45,
                                      child: Container(
                                        width: 87,
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                            border: Border(
                                                bottom: BorderSide(
                                                    width: 3,
                                                    color: ints[index] == 1
                                                        ? Color(0xFFFA4A0C)
                                                        : Colors.transparent))),
                                        child: Text(
                                          items[index],
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                }),
                          ),
                        ),
                        Positioned(
                          top: 420,
                          left: 0,
                          child: Container(
                            width: size.width,
                            height: 270,
                            child: ListView.builder(
                              physics: BouncingScrollPhysics(
                                  parent: AlwaysScrollableScrollPhysics()),
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemCount: snapshot.data!.docs.length,
                              itemBuilder: (context, index) {
                                return GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => Indexed(
                                            snapshot.data!.docs[index], index),
                                      ),
                                    );
                                  },
                                  child: Container(
                                    alignment: Alignment.centerRight,
                                    width: 200,
                                    child: Container(
                                      width: 150,
                                      child: Stack(
                                        children: [
                                          Positioned(
                                            bottom: 10,
                                            child: Container(
                                              height: 200,
                                              width: 150,
                                              decoration: BoxDecoration(
                                                  boxShadow: [
                                                    BoxShadow(
                                                      color: Colors.black26,
                                                      offset: Offset(2, 2),
                                                      spreadRadius: 3,
                                                      blurRadius: 3,
                                                    )
                                                  ],
                                                  color: Colors.white,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          15)),
                                              child: Column(
                                                children: [
                                                  SizedBox(height: 100),
                                                  Text(
                                                    snapshot.data!.docs[index]
                                                        ['ism1'],
                                                    style:
                                                        TextStyle(fontSize: 22),
                                                    textAlign: TextAlign.center,
                                                  ),
                                                  Text(
                                                    snapshot.data!.docs[index]
                                                        ['ism2'],
                                                    style:
                                                        TextStyle(fontSize: 22),
                                                    textAlign: TextAlign.center,
                                                  ),
                                                  SizedBox(height: 15),
                                                  Text(
                                                    snapshot.data!.docs[index]
                                                        ['narxi'],
                                                    style: TextStyle(
                                                        color: Colors.red),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          Positioned(
                                            top: 35,
                                            left: 20,
                                            child: Container(
                                              width: 110,
                                              height: 110,
                                              decoration: BoxDecoration(
                                                image: DecorationImage(
                                                  image: NetworkImage(snapshot
                                                      .data!
                                                      .docs[index]['rasm']),
                                                ),
                                                boxShadow: [
                                                  BoxShadow(
                                                    color: Colors.black26,
                                                    offset: Offset(2, 2),
                                                    spreadRadius: 3,
                                                    blurRadius: 3,
                                                  ),
                                                ],
                                                color: Colors.white,
                                                borderRadius:
                                                    BorderRadius.circular(55),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          child: Container(
                            width: size.width,
                            height: 50,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Container(
                                  alignment: Alignment.center,
                                  padding: EdgeInsets.all(5),
                                  child: Container(
                                    width: 40,
                                    height: 40,
                                    alignment: Alignment.center,
                                    child: Icon(
                                      Icons.home_rounded,
                                      color: Color(0xFFFA4A0C),
                                      size: 32,
                                    ),
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => Favorite(),
                                      ),
                                    );
                                  },
                                  child: Container(
                                    alignment: Alignment.center,
                                    padding: EdgeInsets.all(5),
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(25)),
                                    child: Container(
                                      width: 40,
                                      height: 40,
                                      alignment: Alignment.center,
                                      child: Icon(
                                        Icons.favorite_outline_outlined,
                                        color: Colors.black26,
                                        size: 32,
                                      ),
                                    ),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => Profile(),
                                      ),
                                    );
                                  },
                                  child: Container(
                                    alignment: Alignment.center,
                                    padding: EdgeInsets.all(5),
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(25)),
                                    child: Container(
                                      width: 40,
                                      height: 40,
                                      alignment: Alignment.center,
                                      child: Icon(
                                        Icons.person_outline_rounded,
                                        color: Colors.black26,
                                        size: 32,
                                      ),
                                    ),
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => History()),
                                    );
                                  },
                                  child: Container(
                                    alignment: Alignment.center,
                                    padding: EdgeInsets.all(5),
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(25)),
                                    child: Container(
                                      width: 40,
                                      height: 40,
                                      alignment: Alignment.center,
                                      child: Icon(
                                        Icons.history_rounded,
                                        color: Colors.black26,
                                        size: 32,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 20,
                  ),
                ],
              );
            }
          },
        ));
  }
}
