import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:restaurant/SingInUp/sign_up.dart';
import 'package:restaurant/personal/person.dart';
import 'package:restaurant/personal/profile1.dart';

class MenuScreen extends StatefulWidget {
  @override
  _MenuScreenState createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFA4A0C),
      body: Padding(
        padding: EdgeInsets.only(left: 60, bottom: 80, top: 260),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  child: Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ProfilePage2()));
                        },
                        child: Row(
                          children: [
                            Container(
                              alignment: Alignment.centerLeft,
                              width: 40,
                              height: 60,
                              child: Icon(
                                Icons.account_circle_outlined,
                                color: Colors.white,
                                size: 28,
                              ),
                              decoration: BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(
                                      width: 2, color: Colors.transparent),
                                ),
                              ),
                            ),
                            Container(
                              alignment: Alignment.centerLeft,
                              width: 140,
                              height: 60,
                              child: Text(
                                "Profile",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                              decoration: BoxDecoration(
                                border: Border(
                                  bottom:
                                      BorderSide(width: 2, color: Colors.white),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          Container(
                            alignment: Alignment.centerLeft,
                            width: 40,
                            height: 60,
                            child: Icon(
                              Icons.add_shopping_cart_outlined,
                              color: Colors.white,
                              size: 28,
                            ),
                            decoration: BoxDecoration(
                              border: Border(
                                bottom: BorderSide(
                                    width: 2, color: Colors.transparent),
                              ),
                            ),
                          ),
                          Container(
                            alignment: Alignment.centerLeft,
                            width: 140,
                            height: 60,
                            child: Text(
                              "orders",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                            decoration: BoxDecoration(
                              border: Border(
                                bottom:
                                    BorderSide(width: 2, color: Colors.white),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Container(
                            alignment: Alignment.centerLeft,
                            width: 40,
                            height: 60,
                            child: Icon(
                              Icons.local_offer,
                              size: 28,
                              color: Colors.white,
                            ),
                            decoration: BoxDecoration(
                              border: Border(
                                bottom: BorderSide(
                                    width: 2, color: Colors.transparent),
                              ),
                            ),
                          ),
                          Container(
                            alignment: Alignment.centerLeft,
                            width: 140,
                            height: 60,
                            child: Text(
                              "offer and promo",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                            decoration: BoxDecoration(
                              border: Border(
                                bottom:
                                    BorderSide(width: 2, color: Colors.white),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Container(
                            alignment: Alignment.centerLeft,
                            width: 40,
                            height: 60,
                            child: Icon(
                              Icons.sticky_note_2_outlined,
                              color: Colors.white,
                              size: 28,
                            ),
                            decoration: BoxDecoration(
                              border: Border(
                                bottom: BorderSide(
                                    width: 2, color: Colors.transparent),
                              ),
                            ),
                          ),
                          Container(
                            alignment: Alignment.centerLeft,
                            width: 140,
                            height: 60,
                            child: Text(
                              "Privace policy",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                            decoration: BoxDecoration(
                              border: Border(
                                bottom:
                                    BorderSide(width: 2, color: Colors.white),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Container(
                            alignment: Alignment.centerLeft,
                            width: 40,
                            height: 60,
                            child: Icon(
                              Icons.security_outlined,
                              color: Colors.white,
                              size: 28,
                            ),
                            decoration: BoxDecoration(
                              border: Border(
                                bottom: BorderSide(
                                    width: 2, color: Colors.transparent),
                              ),
                            ),
                          ),
                          Container(
                            alignment: Alignment.centerLeft,
                            width: 140,
                            height: 60,
                            child: Text(
                              "Security",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                            decoration: BoxDecoration(
                              border: Border(
                                bottom: BorderSide(
                                    width: 2, color: Colors.transparent),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                InkWell(
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  child: Container(
                    width: 95,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "sign-out",
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                        Icon(
                          Icons.arrow_forward,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ),
                  onTap: () async {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => SingInUp()));
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
