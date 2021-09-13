import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class ProfilePage2 extends StatefulWidget {
  @override
  _ProfilePage2State createState() => _ProfilePage2State();
}

class _ProfilePage2State extends State<ProfilePage2> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(
          top: 80,
          bottom: 30,
          left: 50,
          right: 50,
        ),
        child: Container(
          // color: Colors.green,
          width: size.width - 100,
          height: size.height - 110,
          child: Stack(
            children: [
              Positioned(
                child: IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.arrow_back_ios_new_rounded),
                  color: Colors.black,
                  iconSize: 28,
                ),
              ),
              Positioned(
                top: 80,
                left: 15,
                child: Text(
                  "My profile",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 32,
                      fontWeight: FontWeight.w400),
                ),
              ),
              Positioned(
                top: 160,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  width: size.width - 100,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Personal details",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      Text(
                        "change",
                        style: TextStyle(
                          color: Color(0xFFFA4A0C),
                          fontSize: 14,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                top: 195,
                child: Container(
                  padding: EdgeInsets.all(16),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 90,
                        height: 100,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("assets/images/profile.png"),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Container(
                        width: size.width - 106 - 32 - 90,
                        // color: Colors.yellow,
                        child: Column(
                          children: [
                            Container(
                              padding:
                                  EdgeInsets.only(right: 5, top: 5, bottom: 10),
                              decoration: BoxDecoration(
                                border: Border(
                                  bottom:
                                      BorderSide(color: Colors.grey, width: 2),
                                ),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Thelma Sara-bear",
                                    style: TextStyle(
                                        color: Colors.grey, fontSize: 13),
                                  ),
                                  Text(
                                     FirebaseAuth.instance.currentUser!.email
                                            .toString(),
                                    style: TextStyle(
                                        color: Colors.grey, fontSize: 13),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              width: size.width - 106 - 32 - 90 - 30,
                              margin: EdgeInsets.symmetric(horizontal: 15),
                              padding: EdgeInsets.only(
                                  right: 5, top: 10, bottom: 10),
                              decoration: BoxDecoration(
                                border: Border(
                                  bottom:
                                      BorderSide(color: Colors.grey, width: 2),
                                ),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "+233 54138989",
                                    style: TextStyle(
                                        color: Colors.grey, fontSize: 13),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              width: size.width - 106 - 32 - 90 - 30,
                              margin: EdgeInsets.symmetric(horizontal: 15),
                              padding: EdgeInsets.only(top: 10, bottom: 10),
                              decoration: BoxDecoration(
                                border: Border(
                                  bottom:
                                      BorderSide(color: Colors.grey, width: 2),
                                ),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Trasaco hotel,behind navrongo campus",
                                    style: TextStyle(
                                        color: Colors.grey, fontSize: 13),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  width: size.width - 106,
                  margin: EdgeInsets.symmetric(horizontal: 3),
                  height: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        offset: Offset(1, 1),
                        spreadRadius: 2,
                        blurRadius: 2,
                      ),
                    ],
                  ),
                ),
              ),
              four("Orders", size.width, 440),
              four("Pending reviews", size.width, 500),
              four("Faq", size.width, 560),
              four("Help", size.width, 620),
              Positioned(
                  bottom: 1,
                  child: Container(
                    width: size.width - 100,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              primary: Color(0xFFFA4A0C),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              )),
                          onPressed: () {},
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 20, horizontal: 112),
                            child: Text(
                              "Update",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }

  four(String soz, double width, double top) {
    return Positioned(
      top: top,
      child: Container(
        width: width - 106,
        margin: EdgeInsets.symmetric(horizontal: 3),
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              offset: Offset(1, 1),
              spreadRadius: 2,
              blurRadius: 2,
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              soz,
              style: TextStyle(fontSize: 17),
            ),
            Icon(
              Icons.arrow_forward_ios_outlined,
              color: Colors.black,
              size: 22,
            )
          ],
        ),
      ),
    );
  }
}
