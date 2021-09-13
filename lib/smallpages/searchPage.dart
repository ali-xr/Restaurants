import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:restaurant/indexed/indexed.dart';

class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  List list1 = [];

  // TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FirebaseFirestore.instance.collection("Restaurant").snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return Scaffold(
              backgroundColor: Color(0xFFF2F2F2),
              resizeToAvoidBottomInset: false,
              appBar: AppBar(
                leading: Padding(
                  padding: const EdgeInsets.only(left: 40, top: 10),
                  child: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(Icons.arrow_back_ios)),
                ),
                iconTheme: IconThemeData(color: Colors.black),
                backgroundColor: Color(0xFFEEEEEE),
                elevation: 0,
                title: Container(
                  padding: EdgeInsets.symmetric(horizontal: 40),
                  alignment: Alignment.center,
                  height: 100,
                  // color: Color(0xFFF2F2F2),
                  child: TextFormField(
                    autofocus: true,
                    // controller: _controller,
                    decoration: InputDecoration(border: InputBorder.none),
                    cursorColor: Colors.black,
                    cursorHeight: 30,

                    onChanged: (e) {
                      var list_a = [];
                      for (var i = 0; i < snapshot.data!.docs.length; i++) {
                        list_a.add(snapshot.data!.docs[i]["ism1"] +
                            "\n" +
                            snapshot.data!.docs[i]["ism2"]);
                      }
                      var listsearch2 = list_a;
                      setState(() {
                        if (e.toString().length == 0 && e.isEmpty) {
                          list1 = listsearch2;
                        } else {
                          List<String> list2 = [];
                          for (var i = 0; i < listsearch2.length; i++) {
                            if (listsearch2[i]
                                .toLowerCase()
                                .contains(e.toString().toLowerCase())) {
                              list2.add(listsearch2[i]);
                            }
                          }
                          list1 = list2;
                        }
                      });
                    },
                  ),
                ),
              ),
              body: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                  color: Color(0xFFFFFFFF),
                ),
                child: list1.length != 0
                    ? Column(
                        children: [
                          Container(
                            height: 50,
                            width: MediaQuery.of(context).size.width,
                            alignment: Alignment.center,
                            child: Text(
                              "Found ${list1.length * 5} results",
                              style: TextStyle(fontSize: 28),
                            ),
                          ),
                          Container(
                            height: MediaQuery.of(context).size.height - 150,
                            child: GridView.builder(
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount:
                                    MediaQuery.of(context).orientation ==
                                            Orientation.landscape
                                        ? 3
                                        : 2,
                                crossAxisSpacing: 8,
                                mainAxisSpacing: 15,
                                childAspectRatio: (0.7),
                              ),
                              itemCount: list1.length * 5,
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
                                    alignment: Alignment.center,
                                    child: Container(
                                      width: 150,
                                      child: Stack(
                                        children: [
                                          Positioned(
                                            bottom: 10,
                                            child: Container(
                                              height: 220,
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
                                                    list1[index % list1.length],
                                                    // snapshot.data!.docs[index]
                                                    //     ['ism1'],
                                                    style:
                                                        TextStyle(fontSize: 22),
                                                    textAlign: TextAlign.center,
                                                  ),
                                                  SizedBox(height: 15),
                                                  Text(
                                                    // snapshot.data!.docs[index]
                                                    //     ['narxi'],
                                                   snapshot.data!.docs[index % list1.length]
                                                          ['narxi'],
                                                    style: TextStyle(
                                                        color: Colors.red),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          Positioned(
                                            top: 20,
                                            left: 20,
                                            child: Container(
                                              width: 110,
                                              height: 110,
                                              decoration: BoxDecoration(
                                                image: DecorationImage(
                                                  image: NetworkImage(snapshot
                                                              .data!.docs[
                                                          index % list1.length]
                                                      ['rasm']),
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
                        ],
                      )
                    : Center(
                        child: Container(
                          height: 400,
                          child: Column(children: [
                            Container(
                              height: 91,
                              child: Image.asset("assets/images/search.png"),
                            ),
                            SizedBox(height: 53.25),
                            Text(
                              "Item not found",
                              style:
                                  TextStyle(color: Colors.black, fontSize: 28),
                            ),
                            SizedBox(height: 16),
                            Text(
                              "Try searching the item with\na different keyword.",
                              textAlign: TextAlign.center,
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 17),
                            )
                          ]),
                        ),
                      ),
              ),
            );
          }
        });
  }
}
