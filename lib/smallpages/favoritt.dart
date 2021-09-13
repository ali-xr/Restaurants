import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
// class Orders extends StatelessWidget {
//   // const Orders({Key? key}) : super(key: key);

class Orders extends StatefulWidget {
  // const Orders({ Key? key }) : super(key: key);
  var list1 = [];
  @override
  _OrdersState createState() => _OrdersState();
}

class _OrdersState extends State<Orders> {
  void getInfo() async {
    for (var i = 0; i < 5; i++) {
      var a = (await SharedPreferences.getInstance()).getInt(i.toString());
      widget.list1.add(a);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.list1.length == 0
          ? Container(
              padding: EdgeInsets.only(left: 40, right: 40, top: 60),
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              color: Colors.white,
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Icon(
                            Icons.arrow_back_ios,
                            color: Colors.black,
                          ),
                        ),
                        Center(
                          widthFactor: 5.0,
                          child: Text(
                            "Orders",
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 190,
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
                                    fontSize: 17, color: Colors.grey.shade500),
                              ),
                              Text(
                                "below to Create an order",
                                style: TextStyle(
                                    fontSize: 17, color: Colors.grey.shade500),
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
              ),
            )
          : StreamBuilder(
              stream: FirebaseFirestore.instance.collection("Restaurant").snapshots(),
              builder: (context, snapshot) {
                return ListView.builder(
                  itemCount: widget.list1.length,
                  itemBuilder: (context, index) {
                    if (widget.list1[index] == 1) {
                      return Card(
                        child: ListTile(
                          leading: CircleAvatar(),
                          // title: Text(
                          //   // snapshot.data!.docs[index]['ism'],
                          // ),
                        ),
                      );
                    } else {
                      return Container();
                    }
                  },
                );
              },
            ),
    );
  }
}
