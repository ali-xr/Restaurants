import 'package:flutter/material.dart';
import 'package:restaurant/payment/pay.dart';
import 'package:restaurant/size_config.dart';

class CheckOutPage extends StatefulWidget {
  @override
  _CheckOutPageState createState() => _CheckOutPageState();
}

class _CheckOutPageState extends State<CheckOutPage> {
  String pay = "Card";
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: Color.fromRGBO(245, 245, 248, 1),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color.fromRGBO(245, 245, 248, 1),
        leading: Padding(
          padding: EdgeInsets.only(left: getProportionScreenWidth(15.0)),
          child: IconButton(
            onPressed: (){
              Navigator.of(context).pop();
            },
            icon: Icon(Icons.arrow_back_ios, size: 20.0,color: Colors.black,),
          ),
        ),
        title: Text("Checkout",style: TextStyle(fontSize: getProportionScreenWidth(18.0), fontWeight: FontWeight.w400, color: Colors.black),),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.only(left: getProportionScreenWidth(42.0)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: getProportionScreenHeight(20.0),),
            Text(
              "Delivery",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 32,
                  fontWeight: FontWeight.w400),
            ),
            SizedBox(height: getProportionScreenHeight(35.0),),
            Padding(
              padding: const EdgeInsets.only(right: 58.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Adress details",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: getProportionScreenWidth(17.0),
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Text(
                    "change",
                    style: TextStyle(
                      color: Color(0xFFFA4A0C),
                      fontSize: getProportionScreenWidth(15.0),
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: getProportionScreenHeight(20.0)),
              padding: EdgeInsets.only(
                top: getProportionScreenHeight(10.0),
                left: getProportionScreenWidth(15.0),
                right: getProportionScreenWidth(15.0),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: getProportionScreenWidth(260.0),
                    alignment: Alignment.centerLeft,
                    child: Column(
                      children: [
                        Container(
                          width: getProportionScreenWidth(280.0),
                          margin: EdgeInsets.symmetric(horizontal: 10),
                          padding: EdgeInsets.only(top: 15, bottom: 5),
                          decoration: BoxDecoration(
                            border: Border(
                              bottom:
                              BorderSide(color: Colors.grey.shade300, width: 2),
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Thelma Sara-bear",
                                style: TextStyle(
                                    color: Colors.black, fontSize: getProportionScreenWidth(18.0),fontWeight: FontWeight.w400),
                              ),

],
                          ),
                        ),
                        Container(
                          width: getProportionScreenWidth(280.0),
                          margin: EdgeInsets.symmetric(horizontal: 10),
                          padding: EdgeInsets.only(top: getProportionScreenHeight(10.0), bottom: getProportionScreenHeight(22.0)),
                          decoration: BoxDecoration(
                            border: Border(
                              bottom:
                              BorderSide(color: Colors.grey.shade300, width: 2),
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Trasaco hotel,behind navrongo campus",
                                style: TextStyle(
                                    color: Colors.black, fontSize: getProportionScreenWidth(13.0), fontWeight: FontWeight.w400),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: getProportionScreenWidth(280.0),
                          margin: EdgeInsets.symmetric(horizontal: 10),
                          padding: EdgeInsets.only(top: getProportionScreenHeight(10.0)),
                          decoration: BoxDecoration(),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "+233 54138989",
                                style: TextStyle(
                                    color: Colors.black, fontSize: getProportionScreenWidth(15.0), fontWeight: FontWeight.w400),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              width: getProportionScreenWidth(315.0),
              height: getProportionScreenHeight(156.0),
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
            Padding(
              padding: EdgeInsets.only(top: getProportionScreenHeight(37.0),left: getProportionScreenWidth(5.0), bottom:getProportionScreenHeight(20.0)),
              child: Text(
                "Delivery method.",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: getProportionScreenWidth(17.0),
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: getProportionScreenWidth(10.0), top: getProportionScreenHeight(7.0)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RadioListTile(
                    value: "Card",
                    groupValue: pay,
                    onChanged: (String? sel) {
                      setState(() {
                        pay = sel!;
                      });
                    },
                    title: Text(
                      "Door delivery",
                      style: TextStyle(
                          fontSize: getProportionScreenWidth(17.0),
                          color: Colors.black,
                          fontWeight: FontWeight.w400
                      ),
                    )
                  ),

Padding(
                    padding:
                    const EdgeInsets.only(left: 70.0, right: 20.0),
                    child: Divider(
                      thickness: 1.5,
                    ),
                  ),
                  RadioListTile(
                    value: "Mobile",
                    groupValue: pay,
                    onChanged: (String? sel) {
                      setState(() {
                        pay = sel!;
                      });
                    },
                    title: Text(
                      "Pick up",
                      style: TextStyle(
                        fontSize: getProportionScreenWidth(17.0),
                        color: Colors.black,
                        fontWeight: FontWeight.w400
                      ),
                    )
                  ),
                ],
              ),
              width: getProportionScreenWidth(315.0),
              margin: EdgeInsets.symmetric(horizontal: 3),
              height: getProportionScreenHeight(156.0),
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
            Container(
              margin: EdgeInsets.only(top: getProportionScreenHeight(60.0),left: getProportionScreenWidth(8.0), right: getProportionScreenWidth(10.0), bottom: getProportionScreenHeight(45.0)),
              width: getProportionScreenWidth(300.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Total",style: TextStyle(fontSize: getProportionScreenWidth(17.0), fontWeight: FontWeight.w400, color: Colors.black),),
                  Text("23,000",style: TextStyle(fontSize: getProportionScreenWidth(22.0), fontWeight: FontWeight.w400, color: Colors.black),),
                ],
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                fixedSize: Size(getProportionScreenWidth(314.0), getProportionScreenHeight(70.0)),
                  primary: Color(0xFFFA4A0C),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  )),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => CheckOutPage2()));
              },
              child: Text(
                "Process to payment",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}