import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:restaurant/introduction/introduction.dart';
import 'package:restaurant/size_config.dart';

class Internet extends StatefulWidget {
  const Internet({Key? key}) : super(key: key);

  @override
  _InternetState createState() => _InternetState();
}

class _InternetState extends State<Internet> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 250),
              height: 160,
              width: 160,
              child: Image.asset("assets/images/internet.png"),
            ),
            Container(
              child: Text(
                "No internet Connection",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 16),
              child: Text(
                "Your internet connection is currently not available please check or try again.",
                style: TextStyle(fontSize: 17),
                textAlign: TextAlign.center,
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 55),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Color(0xFFFA4A0C),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  fixedSize: Size(
                    getProportionScreenHeight(314.0),
                    getProportionScreenHeight(70.0),
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => First(),
                    ),
                  );
                },
                child: Text(
                  "Try again",
                  style: TextStyle(
                    fontSize: getProportionScreenHeight(17.0),
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
