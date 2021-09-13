import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DishContainer extends StatelessWidget {
  final int? index;
  final int? i;

  const DishContainer({Key? key, this.index, this.i}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance.collection("Restaurant").snapshots(),
      builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (!snapshot.hasData) {
          return Center(
            child: CupertinoActivityIndicator(),
          );
        } else {
          return Stack(
            children: [
              Positioned(
                bottom: 0,
                child: Container(
                  alignment: Alignment.center,
                  height: 230,
                  width: 180,
                  // padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(height: 100),
                          Text(
                            snapshot.data!.docs[index!]['ism1'],
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            snapshot.data!.docs[index!]['ism2'],
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                 child: Transform.scale(
                  scale: index == i ? 1 : 0.9,
                ),
                width: 110,
                height: 110,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(
                        snapshot.data!.docs[i!]['rasm'],
                      ),
                      fit: BoxFit.cover),
                  // Transform.scale(
                  // scale: index == i ? 1 : 0.9,
                  // child: Image.network(snapshot.data!.docs[i!]['rasm']),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      offset: Offset(2, 2),
                      spreadRadius: 3,
                      blurRadius: 3,
                    ),
                  ],
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(55),
                ),
               
              ),
            ],
          );
        }
      },
    );
  }
}
