import 'package:flutter/material.dart';

class History extends StatelessWidget {
  const History({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
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
                      "History",
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
                      "assets/images/history.png",
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
                  "No history yet ",
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
      ),
    );
  }
}
